-- Create posts table

CREATE TABLE posts 
(
  post_id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
  title VARCHAR(255) NOT NULL, 
  author VARCHAR(255) NOT NULL, 
  date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  body TEXT NOT NULL, 
  PRIMARY KEY (post_id)
) ENGINE = InnoDB;

-- Add all posts
INSERT INTO posts (title, author, date, body) VALUES
('Post 1', 'James Band', '2023-12-20', 'This is body of Post 1'),
('Post 2', 'Jane Dow', '2023-12-01', 'Body of post 2'),
('POST 3', 'James Band', '2023-12-04', 'Body about post 3'),
('Post 4', 'Mike T', '2023-12-14', 'Post about Boxing from T. '),
('Post 5', 'Mike T', '2023-12-15', 'Post about Boxing from T. '),
('Post 6', 'Jane Dow', '2023-11-05', 'Post 6 about Jane');

-- Create one post
INSERT INTO posts 
  (title, author, date, body) 
  VALUES ('Post 5', 'Mike T', '2023-12-15', 'Post about Boxing from T. ');

-- books with categories

SELECT book_id, title, author, year, categories.category 
FROM books 
INNER JOIN categories 
ON books.cat_id=categories.cat_id;

SELECT book_id, title, author, year, categories.category , isDeleted
FROM books 
INNER JOIN categories 
ON books.cat_id=categories.cat_id
WHERE isDeleted=0

-- sukurti post_comments
-- comm_id, content, post_id, author

-- irasyti bent 3 komentarus
-- parasyti sql kuris atvaizduoja post title ir autoriu ir komentaro autoriu ir contenta

SELECT posts.title, posts.author, post_comments.author AS `comment author`, post_comments.content AS comment, post_comments.created_at AS `commented time` FROM posts INNER JOIN post_comments ON posts.post_id=post_comments.post_id;

-- vienas komentaras
INSERT INTO `post_comments` (`comm_id`, `content`, `post_id`, `author`, `created_at`) 
VALUES (NULL, ?, ?, ?, ?);