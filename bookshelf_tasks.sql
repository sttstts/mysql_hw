-- 1. 
SELECT authors.name as 'Автор', COUNT(authors.name) as count  
FROM authors
JOIN authors_books ON authors_books.authors_id = authors.id
JOIN books ON authors_books.books_id = books.id
GROUP BY authors.name
ORDER BY count DESC
LIMIT 1
;
-- 2. 
SELECT * 
FROM books
WHERE year LIKE '%%'
ORDER BY year ASC
LIMIT 5
;
-- 3.
SELECT COUNT(books.id) as count 
FROM books
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.title = 'Полка в кабинете'
GROUP BY books.shelves_id;
;
-- 4. 
SELECT books.title, authors.name, books.year 
FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE shelves.title = 'Полка в спальне';
;
-- 5. 
SELECT books.title as 'Книга', books.year 'Год', authors.name as 'Автор' 
FROM books
JOIN authors_books ON books.id = authors_books.books_id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name = 'Лев Толстой'
;
-- 6. 
SELECT books.title as 'Книга', authors.name as 'Автор' 
FROM books
JOIN authors_books ON books.id = authors_books.books_id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name LIKE 'А%'
;
-- 7. 
SELECT books.title as 'Книга', authors.name as 'Автор', shelves.title as 'Полка' 
FROM books
JOIN authors_books ON books.id = authors_books.books_id
JOIN authors ON authors_books.authors_id = authors.id
JOIN shelves ON books.shelves_id = shelves.id
WHERE (shelves.title LIKE 'верхняя%') OR (shelves.title LIKE 'нижняя%')
;
-- 8. 
UPDATE books
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
SET books.friends_id = (SELECT friends.id FROM friends WHERE friends.name = 'Иванов Иван')
WHERE authors.name = 'Данте Алигьери' AND books.title = 'Божественная комедия'
AND books.id > 0;
;
-- 9. 
INSERT INTO books (books.title, books.year, books.shelves_id)
VALUES ('Краткие ответы на большие вопросы', '2020', 1)
;
INSERT INTO authors (authors.name)
VALUES ('Стивен Хокинг')
;
INSERT INTO authors_books (authors_books.books_id, authors_books.authors_id)
VALUES (176, 145)
;
