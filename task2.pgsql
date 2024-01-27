-- 1) Выведите все жанры книг, которые прочитал читатель с именем "Grace Taylor".

SELECT genres.genre_name
FROM readers
JOIN readerbooks ON readers.reader_id = readerbooks.reader_id
JOIN books ON readerbooks.book_id = books.book_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
WHERE readers.reader_name = 'Grace Taylor';

-- 2) Найдите авторов, написавших книги в жанре "Фантастика".

SELECT authors.author_id, authors.author_name
FROM authors
JOIN books ON authors.author_id = books.author_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
WHERE genres.genre_name = 'Fantasy';

-- 3) Покажите книги, написанные авторами с именами "John Smith" и "Jane Doe".

SELECT books.book_title, authors.author_name
FROM books 
JOIN authors ON books.author_id = authors.author_id
WHERE authors.author_name IN ('John Smith', 'Jane Doe');

-- 4) Выведите все книги, у которых нет жанра.

SELECT books.book_title, authors.author_name
FROM books
LEFT JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN authors ON books.author_id = authors.author_id
WHERE bookgenres.genre_id IS NULL;

-- 5) Найдите читателей, которые прочитали книги хотя бы в двух разных жанрах.

SELECT readers.reader_id, readers.reader_name
FROM readers
JOIN readerbooks ON readers.reader_id = readerbooks.reader_id
JOIN books ON readerbooks.book_id = books.book_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
GROUP BY readers.reader_id, readers.reader_name
HAVING COUNT(bookgenres.genre_id) >= 2;

-- 6) Покажите авторов, чьи книги не были прочитаны.
SELECT authors.author_id, authors.author_name
FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
LEFT JOIN readerbooks ON books.book_id = readerbooks.book_id
WHERE readerbooks.reader_id IS NULL;

-- 7) Выведите читателей, прочитавших книги только в жанре "Фэнтези".

SELECT readers.reader_id, readers.reader_name
FROM readers
JOIN readerbooks ON readers.reader_id = readerbooks.reader_id
JOIN books ON readerbooks.book_id = books.book_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
WHERE genres.genre_name = 'Fantasy'
GROUP BY readers.reader_id, readers.reader_name

-- 8) Найдите автора с наибольшим количеством книг в жанре "Детектив".

-- нет жанра "Детектив"

-- 9) Покажите все книги, написанные в жанре "Научная фантастика", которые еще не прочитаны.

SELECT books.book_id, books.book_title, authors.author_name
FROM books 
JOIN authors ON books.author_id = authors.author_id
LEFT JOIN readerbooks ON books.book_id = readerbooks.book_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
WHERE genres.genre_name = 'Science Fiction' AND readerbooks.reader_id IS NULL;

-- 10) Выведите все книги, которые прочитаны более чем одним читателем.

SELECT books.book_id, books.book_title, authors.author_name, COUNT(readerbooks.reader_id) readers_count
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN readerbooks ON books.book_id = readerbooks.book_id
GROUP BY books.book_id, books.book_title, authors.author_name
HAVING COUNT(readerbooks.reader_id) > 1;

