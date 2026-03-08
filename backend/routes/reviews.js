const express = require("express");
const router = express.Router();
const db = require("../db");

// GET reviews by place id
router.get("/:place_id", (req, res) => {
  const placeId = req.params.place_id;

  const query = `
    SELECT u.name AS user_name, r.rating, r.comment, r.review_date
    FROM reviews r
    JOIN users u ON r.user_id = u.user_id
    WHERE r.place_id = ?
  `;

  db.query(query, [placeId], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.json(results);
    }
  });
});

// POST a new review
router.post("/", (req, res) => {
  const { user_id, place_id, rating, comment } = req.body;

  if (!user_id || !place_id || !rating) {
    return res.status(400).send("Missing required fields");
  }

  const query = "INSERT INTO reviews (user_id, place_id, rating, comment, review_date) VALUES (?, ?, ?, ?, CURRENT_DATE)";
  db.query(query, [user_id, place_id, rating, comment], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send("Database error");
    } else {
      res.status(201).json({ message: "Review added successfully", review_id: result.insertId });
    }
  });
});

module.exports = router;