DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER,
  publisher_id INTEGER,
  title VARCHAR,
  genre VARCHAR,
  released_on DATE,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
  FOREIGN KEY (author_id) REFERENCES Authors(id),
  FOREIGN KEY (publisher_id) REFERENCES Publishers(id)
);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NULL,
  publisher_id INTEGER DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
  FOREIGN KEY (publisher_id) REFERENCES Publishers (id)
);

DROP TABLE IF EXISTS publishers;

CREATE TABLE publishers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NULL,
  email VARCHAR DEFAULT NULL,
  password VARCHAR DEFAULT NULL,
  username VARCHAR DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER DEFAULT NULL,
  user_id INTEGER DEFAULT NULL,
  author_id INTEGER DEFAULT NULL,
  publisher_id INTEGER DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp
);

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER DEFAULT NULL,
  user_id INTEGER DEFAULT NULL,
  rating INTEGER DEFAULT NULL,
  content VARCHAR DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
  FOREIGN KEY (book_id) REFERENCES Books (id),
  FOREIGN KEY (user_id) REFERENCES Users (id)
);
