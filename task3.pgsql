-- 1) Обновите имя автора с именем "John Smith" на "John A. Smith"

UPDATE authors
SET author_name = 'John A. Smith'
WHERE author_name = 'John Smith';

-- 2) Удалите все книги в жанре "Мистика"
DELETE FROM books
WHERE book_id IN (
    SELECT book_id
    FROM bookGenres
    WHERE genre_id = (
        SELECT genre_id
        FROM genres
        WHERE genre_name = 'Mystery'
    )
);

-- 3) Измените название книги с именем "The Great Adventure" на "The Amazing 

UPDATE books
SET book_title = 'The Amazing'
WHERE book_title = 'The Great Adventure';

-- 4) Удалите все записи из таблицы ReaderBooks, связанные с читателем с именем "Bob Smith"

DELETE FROM readerbooks
WHERE reader_id = (
    SELECT reader_id
    FROM readers
    WHERE reader_name = 'Bob Smith'
);

-- 5) Обновите жанр книги "The Power of Now" на "Self-Help"

UPDATE genres
SET genre_name = 'Self-Help'
WHERE genre_id = (
    SELECT genre_id
    FROM bookgenres
    WHERE book_id = (
        SELECT book_id
        FROM Books
        WHERE book_title = 'The Power of Now'
    )
);

-- 6) Удалите автора с наименьшим количеством написанных книг

DELETE FROM Authors
WHERE author_id = (
    SELECT authors.author_id
    FROM authors
    LEFT JOIN Books ON authors.author_id = books.author_id
    GROUP BY authors.author_id
    ORDER BY COUNT(books.book_id) ASC
    LIMIT 1
);

-- 7) Обновите имя читателя с именем "Eva White" на "Eva Johnson"

UPDATE readers
SET reader_name = 'Eva Johnson'
WHERE reader_name = 'Eva White';

-- 8) Удалите все книги, написанные автором с именем "Christopher Wilson"

DELETE FROM books
WHERE author_id = (
    SELECT author_id
    FROM authors
    WHERE author_name = 'Christopher Wilson'
);

-- 9) Измените жанр книги "Moonlight Sonata" на "Romance"

UPDATE genres
SET genre_name = 'Romance'
WHERE genre_id = (
    SELECT genre_id
    FROM bookgenres
    WHERE book_id = (
        SELECT book_id
        FROM books
        WHERE book_title = 'Moonlight Sonata'
    )
);

-- 10) Удалите все записи из таблицы BookGenres, связанные с книгой с именем "To Kill a Mockingbird"

DELETE FROM bookgenres
WHERE book_id = (
    SELECT book_id
    FROM books
    WHERE book_title = 'To Kill a Mockingbird'
);
