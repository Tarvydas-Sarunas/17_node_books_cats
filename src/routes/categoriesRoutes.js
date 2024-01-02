const express = require('express');
const { dbQueryWithData } = require('../helper');
const categoriesRouter = express.Router();

// routes
// GET /api/categories - grazins kategorijas su id
categoriesRouter.get('/api/categories', async (req, res) => {
  const sql = 'SELECT * FROM `categories` WHERE 1';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// POST /api/categories - sukuria nauja kategorija
categoriesRouter.post('/api/categories', async (req, res) => {
  const sql = `INSERT INTO categories (category) VALUES (?)`;
  const { category } = req.body;
  const [rez, error] = await dbQueryWithData(sql, [category]);
  console.log('error ===', error);
  if (rez.affectedRows === 1) {
    res.status(200).json({ msg: 'Your category was added' });
  } else {
    res.status(400).json({ msg: 'Something went wrong' });
  }
});
// sukurti front end papke
// indexedDB.html sugeberuoti selekta su kategorijos kaiop pavadinimas ir id kaip value

// is exportuoju
module.exports = categoriesRouter;
