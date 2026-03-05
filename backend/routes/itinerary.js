const express = require("express");
const router = express.Router();
const db = require("../db");


// -----------------------------
// Create itinerary
// POST /itinerary/create
// -----------------------------
router.post("/create", (req, res) => {
<<<<<<< HEAD

=======
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
  const { user_id, start_date, end_date, budget, city_id } = req.body;

  const query = `
    INSERT INTO itineraries (user_id, start_date, end_date, budget, city_id)
    VALUES (?, ?, ?, ?, ?)
  `;

  db.query(query, [user_id, start_date, end_date, budget, city_id], (err, result) => {
<<<<<<< HEAD

    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } 
    else {
=======
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
      res.json({
        message: "Itinerary created",
        itinerary_id: result.insertId
      });
    }
<<<<<<< HEAD

  });

});



=======
  });
});


>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
// -----------------------------
// Add place to itinerary
// POST /itinerary/add-place
// -----------------------------
router.post("/add-place", (req, res) => {
<<<<<<< HEAD

=======
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
  const { itinerary_id, day_no, place_id } = req.body;

  const query = `
    INSERT INTO itinerary_details (itinerary_id, day_no, place_id)
    VALUES (?, ?, ?)
  `;

  db.query(query, [itinerary_id, day_no, place_id], (err, result) => {
<<<<<<< HEAD

    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } 
    else {
=======
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
      res.json({
        message: "Place added to itinerary"
      });
    }
<<<<<<< HEAD

  });

});



=======
  });
});


>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
// -----------------------------
// Get itineraries of a user
// GET /itinerary/:user_id
// -----------------------------
router.get("/:user_id", (req, res) => {
<<<<<<< HEAD

  const user_id = req.params.user_id;

  const query = `
    SELECT 
      i.itinerary_id,
      i.start_date,
      i.end_date,
      i.budget,
      c.name AS city
=======
  const userId = req.params.user_id;

  const query = `
    SELECT i.itinerary_id, i.start_date, i.end_date, i.budget,
           c.name AS city
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
    FROM itineraries i
    JOIN cities c ON i.city_id = c.city_id
    WHERE i.user_id = ?
  `;

<<<<<<< HEAD
  db.query(query, [user_id], (err, result) => {

    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } 
    else {
      res.json(result);
    }

  });

});



// -----------------------------
// Get itinerary details
// GET /itinerary/details/:itinerary_id
// -----------------------------
router.get("/details/:itinerary_id", (req, res) => {

  const itinerary_id = req.params.itinerary_id;

  const query = `
    SELECT 
      id.day_no,
      p.name AS place,
      p.address
=======
  db.query(query, [userId], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json(results);
    }
  });
});

// Get itinerary details
router.get("/details/:itinerary_id", (req, res) => {

  const itineraryId = req.params.itinerary_id;

  const query = `
    SELECT id.day_no,
           p.name AS place,
           p.address
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
    FROM itinerary_details id
    JOIN places p ON id.place_id = p.place_id
    WHERE id.itinerary_id = ?
    ORDER BY id.day_no
  `;

<<<<<<< HEAD
  db.query(query, [itinerary_id], (err, result) => {

    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } 
    else {
      res.json(result);
    }

=======
  db.query(query, [itineraryId], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json(results);
    }
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
  });

});

<<<<<<< HEAD


=======
>>>>>>> 54981de13132937e490ee98eee5b5fd47f3d6958
module.exports = router;