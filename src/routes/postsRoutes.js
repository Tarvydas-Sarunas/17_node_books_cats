const express = require('express');
const { dbQueryWithData } = require('../helper');
const postsRouter = express.Router();

// routes
// parsiunciu poste pagal id
postsRouter.get('/api/posts/:id', async (req, res) => {
  const sql = 'SELECT * FROM `posts` WHERE post_id=?';
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

module.exports = postsRouter;
