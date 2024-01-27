-- 1) Выведите все имена авторов из таблицы Authors.

SELECT author_name FROM Authors;

-- 2) Покажите названия всех книг и соответствующих им авторов.

SELECT books.book_title, authors.author_name
FROM books 
JOIN Authors ON books.author_id = authors.author_id;


-- 3) Найдите все книги в жанре "Фэнтези" из таблицы Genres.

SELECT book_title
FROM books 
JOIN bookgenres ON books.book_id = bookgenres.book_id
WHERE bookgenres.genre_id = 5; 

-- 4) Выведите имена всех читателей из таблицы Readers.

SELECT reader_name FROM Readers;

-- 5) Покажите все книги, которые прочитал читатель с именем "Alice Johnson".

SELECT book_title, readers.reader_name
FROM books 
JOIN readerbooks ON books.book_id = readerbooks.book_id
JOIN readers ON readerbooks.reader_id = readers.reader_id
WHERE readers.reader_name = 'Alice Johnson';


-- 6) Найдите всех авторов, написавших хотя бы две книги.

SELECT authors.author_id, authors.author_name
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_id, authors.author_name
HAVING COUNT(books.book_id) >= 2;

-- 7) Выведите жанры всех книг с их количеством в базе данных.

SELECT genres.genre_name, COUNT(*)
FROM genres
JOIN bookgenres ON genres.genre_id = bookgenres.genre_id
GROUP BY genres.genre_name;

-- 8) Покажите все книги, написанные автором с именем "Jane Doe".

SELECT books.book_title, authors.author_name
FROM books
JOIN authors  ON books.author_id = authors.author_id
WHERE authors.author_name = 'Jane Doe';

-- 9) Найдите читателя, который прочитал наибольшее количество книг.

SELECT readers.reader_id, readers.reader_name, COUNT(readerbooks.book_id)
FROM readers 
JOIN readerbooks ON readers.reader_id = readerbooks.reader_id
GROUP BY readers.reader_id, readers.reader_name
ORDER BY COUNT(readerbooks.book_id) DESC
LIMIT 1;

-- 10) Выведите имена авторов и количество книг, написанных каждым из них.

SELECT authors.author_name, COUNT(books.book_id)
FROM authors 
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name;

-- 11) Найдите все книги в жанре "Научная фантастика", написанные автором с именем "Michael Johnson".

SELECT books.book_title, authors.author_name
FROM books
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
JOIN authors ON books.author_id = authors.author_id
WHERE genres.genre_name = 'Science Fiction' AND authors.author_name = 'Michael Johnson';

-- 12) Покажите все книги, которые не были прочитаны ни одним читателем.

SELECT books.book_title, authors.author_name
FROM books 
LEFT JOIN readerbooks ON books.book_id = readerbooks.book_id
JOIN authors ON books.author_id = authors.author_id
WHERE readerbooks.reader_id IS NULL;

-- 13) Выведите читателей, которые прочитали книги в жанре "Мистика".

SELECT readers.reader_id, readers.reader_name
FROM readers 
JOIN readerbooks ON readers.reader_id = readerbooks.reader_id
JOIN books ON readerbooks.book_id = books.book_id
JOIN bookgenres ON books.book_id = bookgenres.book_id
JOIN genres ON bookgenres.genre_id = genres.genre_id
WHERE genres.genre_name = 'Mystery';

-- 14) Найдите все книги, написанные автором с именем "Daniel Miller" и прочитанные читателем с именем "Bob Smith".

SELECT books.book_title, authors.author_name, readers.reader_name
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN readerbooks ON books.book_id = readerbooks.book_id
JOIN readers ON readerbooks.reader_id = readers.reader_id
WHERE authors.author_name = 'Daniel Miller' AND readers.reader_name = 'Bob Smith';

-- 15) Покажите читателя, который прочитал наименьшее количество книг.

SELECT readers.reader_id, readers.reader_name, COUNT(readerbooks.book_id)
FROM readers
LEFT JOIN readerbooks  ON readers.reader_id = readerbooks.reader_id
GROUP BY readers.reader_id, readers.reader_name
ORDER BY COUNT(readerbooks.book_id) ASC
LIMIT 1;

