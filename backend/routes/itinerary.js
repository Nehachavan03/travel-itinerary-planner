const express = require("express");
const router = express.Router();
const db = require("../db");

// Create itinerary manually
router.post("/create", (req, res) => {
  const { user_id, start_date, end_date, budget, city_id } = req.body;
  const query = `
    INSERT INTO itineraries (user_id, start_date, end_date, budget, city_id)
    VALUES (?, ?, ?, ?, ?)
  `;
  db.query(query, [user_id, start_date, end_date, budget, city_id], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json({ message: "Itinerary created", itinerary_id: result.insertId });
    }
  });
});

// Generate itinerary automatically based on country and budget
router.post("/generate", (req, res) => {
  const { user_id, country_name, start_date, end_date, budget } = req.body;

  if (!user_id || !country_name || !start_date || !end_date || !budget) {
    return res.status(400).send("Missing required fields");
  }

  // 1. Find a city in the specified country
  const cityQuery = `
    SELECT c.city_id, c.name 
    FROM cities c 
    JOIN countries co ON c.country_code = co.country_code 
    WHERE co.country_name = ? 
    LIMIT 1
  `;

  db.query(cityQuery, [country_name], (err, cityResults) => {
    if (err || cityResults.length === 0) {
      return res.status(404).send("Country not found or no cities available");
    }

    const city = cityResults[0];
    const startDate = new Date(start_date);
    const endDate = new Date(end_date);
    const diffTime = Math.abs(endDate - startDate);
    const days = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

    // 2. Create the itinerary record
    const insertItinerary = `
      INSERT INTO itineraries (user_id, start_date, end_date, budget, city_id)
      VALUES (?, ?, ?, ?, ?)
    `;

    db.query(insertItinerary, [user_id, start_date, end_date, budget, city.city_id], (err, itinResult) => {
      if (err) return res.status(500).send("Database error creating itinerary");

      const itineraryId = itinResult.insertId;

      // 3. Fetch places in that city that fit the budget
      // Logic: Pick places where total cost is within budget, limit to 2 per day
      const placeQuery = `
        SELECT place_id, name, estimated_cost 
        FROM places 
        WHERE city_id = ? 
        ORDER BY estimated_cost ASC 
        LIMIT ?
      `;

      db.query(placeQuery, [city.city_id, days * 2], (err, places) => {
        if (err || places.length === 0) return res.json({ message: "Itinerary created but no places found", itinerary_id: itineraryId });

        // 4. Assign places to days
        const detailValues = [];
        let currentDay = 1;
        let placesInDay = 0;
        let totalCost = 0;

        for (const place of places) {
          if (totalCost + place.estimated_cost <= budget) {
            detailValues.push([itineraryId, currentDay, place.place_id]);
            totalCost += place.estimated_cost;
            placesInDay++;
            
            if (placesInDay >= 2) {
              currentDay++;
              placesInDay = 0;
            }
            if (currentDay > days) break;
          }
        }

        if (detailValues.length === 0) {
           return res.json({ message: "Itinerary created but budget too low for suggested places", itinerary_id: itineraryId });
        }

        const insertDetails = "INSERT INTO itinerary_details (itinerary_id, day_no, place_id) VALUES ?";
        db.query(insertDetails, [detailValues], (err) => {
          if (err) {
            console.error(err);
            return res.status(500).send("Error adding places to itinerary");
          }
          res.json({
            message: "Successfully generated a " + days + "-day trip to " + city.name,
            itinerary_id: itineraryId,
            city: city.name,
            total_places: detailValues.length
          });
        });
      });
    });
  });
});

// Add place to itinerary manually
router.post("/add-place", (req, res) => {
  const { itinerary_id, day_no, place_id } = req.body;
  const query = "INSERT INTO itinerary_details (itinerary_id, day_no, place_id) VALUES (?, ?, ?)";
  db.query(query, [itinerary_id, day_no, place_id], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json({ message: "Place added to itinerary" });
    }
  });
});

// Get itinerary details
router.get("/details/:itinerary_id", (req, res) => {
  const itineraryId = req.params.itinerary_id;
  const query = `
    SELECT id.day_no, p.name AS place, p.address, p.estimated_cost
    FROM itinerary_details id
    JOIN places p ON id.place_id = p.place_id
    WHERE id.itinerary_id = ?
    ORDER BY id.day_no
  `;
  db.query(query, [itineraryId], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json(results);
    }
  });
});

// Get itineraries of a user
router.get("/:user_id", (req, res) => {
  const userId = req.params.user_id;
  const query = `
    SELECT i.itinerary_id, i.start_date, i.end_date, i.budget, c.name AS city
    FROM itineraries i
    JOIN cities c ON i.city_id = c.city_id
    WHERE i.user_id = ?
  `;
  db.query(query, [userId], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json(results);
    }
  });
});

module.exports = router;