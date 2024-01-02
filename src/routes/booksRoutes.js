const express = require('express');
const booksRouter = express.Router();
const { dbQueryWithData } = require('../helper');

// GET /api/books - gauti visas knygas kurion neistrintos
booksRouter.get('/api/books', async (req, res) => {
  const sql = 'SELECT * FROM `books` WHERE isDeleted=0';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// gauti visas knygas su kategorijos pavadinimu ir kad jos butu ne istrintos
booksRouter.get('/api/books/category', async (req, res) => {
  const sql = `
  SELECT book_id, title, author, year, categories.category
  FROM books 
  INNER JOIN categories 
  ON books.cat_id=categories.cat_id
  WHERE isDeleted=0
  `;
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// POST /api/books - sukurti nauja knyga
booksRouter.post('/api/books', async (req, res) => {
  const sql = `INSERT INTO books (title, author, year, cat_id, isDeleted) VALUES (?, ?, ?, ?, ?)`;
  const { title, author, year, cat_id, isDeleted } = req.body;
  const [rez, error] = await dbQueryWithData(sql, [
    title,
    author,
    year,
    cat_id,
    isDeleted,
  ]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  if (rez.affectedRows === 1) {
    res.status(200).json({ msg: 'Your category was added' });
  } else {
    res.status(400).json({ msg: 'Something went wrong' });
  }
});

// GET /api/books/archive - gauti istrintu knygu archiva
booksRouter.get('/api/books/archive', async (req, res) => {
  const sql = 'SELECT * FROM `books` WHERE isDeleted=1';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// GET /api/books /2- gauti visa knyga id 2
booksRouter.get('/api/books/:id', async (req, res) => {
  const sql = 'SELECT * FROM `books` WHERE book_id=?;';
  const id = +req.params.id;
  const [rows, error] = await dbQueryWithData(sql, [id]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  if (rows.length === 0) {
    res.status(404).json({ msg: 'this id not exist' });
    return;
  }
  res.json(rows[0]);
});

// DELETE /api/books /2- istrinti viena knyga id 2
/* 
booksRouter.delete('/api/books/:id', async (req, res) => {
  const sql = 'DELETE FROM `books` WHERE book_id=? LIMIT 1';
  const id = +req.params.id;
  const [rows, error] = await dbQueryWithData(sql, [id]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  if (rows.affectedRows === 0) {
    res.status(404).json({ msg: 'This id does not exist' });
  } else {
    res.json({ msg: 'Book deleted' });
  }
}); 
*/

// GERIAUSIAS ISTRINIMAS
// DELETE /api/books /2- istrinti viena knyga id 2
booksRouter.delete('/api/books/:id', async (req, res) => {
  const sql = 'UPDATE books SET `isDeleted`=1 WHERE `book_id`=? LIMIT 1';
  const id = +req.params.id;
  const [rows, error] = await dbQueryWithData(sql, [id]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  if (rows.affectedRows === 0) {
    res.status(404).json({ msg: 'This id does not exist' });
  } else {
    res.json({ msg: 'Book deleted' });
  }
});

// isexportuoju booksRouter
module.exports = booksRouter;
