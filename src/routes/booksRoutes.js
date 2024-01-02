const express = require('express');
const booksRouter = express.Router();
const { dbQueryWithData } = require('../helper');

// GET /api/books - gauti visas knygas
booksRouter.get('/api/books', async (req, res) => {
  const sql = 'SELECT * FROM `books` WHERE 1';
  const [rows, error] = await dbQueryWithData(sql);
  console.log('error ===', error);
  res.json(rows);
});

// GET /api/books /2- gauti visa knyga id 2
booksRouter.get('/api/books/:id', async (req, res) => {
  const sql = 'SELECT * FROM `books` WHERE book_id=?;';
  const id = req.params.id;
  const [rows, error] = await dbQueryWithData(sql, [id]);
  console.log('error ===', error);
  res.json(rows);
});

// DELETE /api/books /2- istrinti viena knyga id 2
booksRouter.delete('/api/books/:id', async (req, res) => {
  const sql = 'DELETE FROM `books` WHERE book_id=? LIMIT 1';
  const id = req.params.id;
  const [rows, error] = await dbQueryWithData(sql, [id]);
  console.log('error ===', error);
  res.json(rows);
});

// isexportuoju booksRouter
module.exports = booksRouter;
