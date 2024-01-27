CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE BookGenres (
    book_id INT,
    genre_id INT,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Readers (
    reader_id SERIAL PRIMARY KEY,
    reader_name VARCHAR(100) NOT NULL
);

CREATE TABLE ReaderBooks (
    reader_id INT,
    book_id INT,
    PRIMARY KEY (reader_id, book_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert authors
INSERT INTO Authors (author_name) VALUES
    ('John Smith'),
    ('Jane Doe'),
    ('Michael Johnson'),
    ('Emily Davis'),
    ('Christopher Wilson'),
    ('Olivia Brown'),
    ('Daniel Miller');

-- Insert books
INSERT INTO Books (book_title, author_id) VALUES
    ('The Great Adventure', 1),
    ('Mystery of the Lost Key', 2),
    ('Coding in Python', 3),
    ('The Art of Painting', 4),
    ('Data Science Essentials', 3),
    ('Moonlight Sonata', 5),
    ('The Secret Garden', 2),
    ('A Tale of Two Cities', 6),
    ('The Power of Now', 7),
    ('The Hobbit', 1),
    ('The Catcher in the Rye', 4),
    ('To Kill a Mockingbird', 2),
    ('The Alchemist', 3),
    ('Pride and Prejudice', 6),
    ('1984', 5),
    ('Harry Potter and the Sorcerer''s Stone', 1),
    ('The Hunger Games', 7),
    ('The Da Vinci Code', 4),
    ('The Shining', 5),
    ('The Lord of the Rings', 1);

-- Insert genres
INSERT INTO Genres (genre_name) VALUES
    ('Fiction'),
    ('Mystery'),
    ('Science Fiction'),
    ('Non-Fiction'),
    ('Fantasy');

-- Insert book genres
INSERT INTO BookGenres (book_id, genre_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 3),
    (6, 1),
    (7, 2),
    (8, 1),
    (9, 4),
    (10, 5),
    (11, 1),
    (12, 2),
    (13, 4),
    (14, 1),
    (15, 5),
    (16, 1),
    (17, 5),
    (18, 2),
    (19, 3),
    (20, 1);

INSERT INTO Readers (reader_name) VALUES
    ('Alice Johnson'),
    ('Bob Smith'),
    ('Eva White'),
    ('David Brown'),
    ('Grace Taylor'),
    ('Mark Anderson'),
    ('Sophia Martin'),
    ('Ryan Davis'),
    ('Emma Wilson'),
    ('Jason Miller');

INSERT INTO ReaderBooks (reader_id, book_id) VALUES
    (1, 1),
    (2, 3),
    (3, 5),
    (4, 7),
    (5, 9),
    (6, 11),
    (7, 13),
    (8, 15),
    (9, 17),
    (10, 19),
    (1, 2),
    (2, 4),
    (3, 6),
    (4, 8),
    (5, 10),
    (6, 12),
    (7, 14),
    (8, 16),
    (9, 18),
    (10, 20);

