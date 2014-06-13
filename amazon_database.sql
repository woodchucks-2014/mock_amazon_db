DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
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

DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NOT NULL
  publisher_id INTEGER DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
  FOREIGN KEY (publisher_id) REFERENCES Publishers (id)
);

DROP TABLE IF EXISTS Publishers;

CREATE TABLE Publishers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
);

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR DEFAULT NULL,
  email VARCHAR DEFAULT NULL,
  password VARCHAR DEFAULT NULL,
  username VARCHAR DEFAULT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER DEFAULT NOT NULL,
  user_id INTEGER DEFAULT NOT NULL,
  author_id INTEGER DEFAULT NOT NULL,
  publisher_id INTEGER DEFAULT NOT NULL,
  created_at DEFAULT current_timestamp,
  updated_at DEFAULT current_timestamp,
);

DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews (
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
