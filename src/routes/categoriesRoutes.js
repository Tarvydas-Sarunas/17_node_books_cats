const express = require('express');
const { dbQueryWithData } = require('../helper');
const categoriesRouter = express.Router();

// routes
// GET /api/categories - grazins kategorijas su id
categoriesRouter.get('/api/categories', async (req, res) => {
  const sql = 'SELECT * FROM `categories` WHERE 1';
  const [rows, error] = await dbQueryWithData(sql);
  console.log('error ===', error);
  res.json(rows);
});

// sukurti front end papke
// indexedDB.html sugeberuoti selekta su kategorijos kaiop pavadinimas ir id kaip value

// is exportuoju
module.exports = categoriesRouter;
