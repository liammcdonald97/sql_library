CREATE DATABASE final_project;

USE final_project

CREATE TABLE library_branch (
branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
branch_name VARCHAR(50),
address VARCHAR (100)
);

CREATE TABLE publisher (
publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
address VARCHAR (100),
phone VARCHAR (50)
);

CREATE TABLE books (
book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
title VARCHAR(50),
publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
author_name VARCHAR(50)
);

CREATE TABLE book_copies (
book_id INT NOT NULL CONSTRAINT fk_book_copies_book_id FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
number_of_copies INT NOT NULL
);

CREATE TABLE book_loans (
book_id INT NOT NULL CONSTRAINT fk_book_loans_book_id FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
branch_id INT NOT NULL CONSTRAINT fk_book_loans_branch_id FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
card_number INT NOT NULL CONSTRAINT fk_card_number FOREIGN KEY REFERENCES borrower(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
date_out DATE NOT NULL,
date_due DATE NOT NULL
);

CREATE TABLE borrower (
card_number INT PRIMARY KEY NOT NULL IDENTITY (1,1),
name VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
phone VARCHAR(50) NOT NULL
);


/****INSERT DATA FOR PUBLISHER TABLE****/
INSERT INTO publisher (publisher_name, address, phone)
VALUES ('Random House', 'New York City, NY', '1-800-733-3000');

INSERT INTO publisher (publisher_name, address, phone)
VALUES ('Harper Collins', 'New York City, NY', '1-800-242-7737');

INSERT INTO publisher (publisher_name, address, phone)
VALUES ('Penguin', 'London, UK', '+44 (0)1206 256000');

/****INSERT DATA FOR LIBRARY_BRANCH TABLE****/
INSERT INTO library_branch (branch_name, address)
VALUES ('Sharpstown', '4794 Beechwood Dr, Pittsburgh, PA 15212');

INSERT INTO library_branch (branch_name, address)
VALUES ('Central', '2476 Stiles St, Pittsburgh, PA 15219');

INSERT INTO library_branch (branch_name, address)
VALUES ('East Liberty', '3243 Jacobs St, Pittsburgh, PA 15219');

INSERT INTO library_branch (branch_name, address)
VALUES ('North Hills', '33 Platinum Dr, Pittsburgh, PA 15381');

SELECT * FROM books

/****INSERT DATA FOR BOOK TABLE****/
INSERT INTO books (title, publisher_name)
VALUES ('The Lost Tribe', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('The Shining', 'Penguin')

INSERT INTO books (title, publisher_name)
VALUES ('The Green Mile', 'Penguin')

INSERT INTO books (title, publisher_name)
VALUES ('Holy Ghost', 'Penguin')

INSERT INTO books (title, publisher_name)
VALUES ('Ambush', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('The Witch Elm', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('Winter in Paradise', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('Presidents of War', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('Ship of Fools', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('Fear', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('The Fifth Risk', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('1984', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('A Tree Grows in Brooklyn', 'Harper Collins')

INSERT INTO books (title, publisher_name)
VALUES ('Cane', 'Penguin')

INSERT INTO books (title, publisher_name)
VALUES ('Frankenstein', 'Penguin')

INSERT INTO books (title, publisher_name)
VALUES ('Great Expectations', 'Random House')

INSERT INTO books (title, publisher_name)
VALUES ('Heart of Darkness', 'Random House')

INSERT INTO books (title, publisher_name)
VALUES ('Howards End', 'Random House')

INSERT INTO books (title, publisher_name)
VALUES ('Invisible Man', 'Random House')

INSERT INTO books (title, publisher_name)
VALUES ('Little Women', 'Random House')

/****INSERT DATA FOR BOOK_AUTHORS TABLE****/
INSERT INTO book_authors (book_id, author_name)
VALUES (3, 'Mark Lee')

INSERT INTO book_authors (book_id, author_name)
VALUES (4, 'Stephen King')

INSERT INTO book_authors (book_id, author_name)
VALUES (5, 'Stephen King')

INSERT INTO book_authors (book_id, author_name)
VALUES (6, 'John Sandford')

INSERT INTO book_authors (book_id, author_name)
VALUES (7, 'James Patterson')

INSERT INTO book_authors (book_id, author_name)
VALUES (8, 'Tana French')

INSERT INTO book_authors (book_id, author_name)
VALUES (9, 'Elin Hilderbrand')

INSERT INTO book_authors (book_id, author_name)
VALUES (10, 'Michael Beschloss')

INSERT INTO book_authors (book_id, author_name)
VALUES (11, 'Kate Morton')

INSERT INTO book_authors (book_id, author_name)
VALUES (12, 'Bob Woodward')

INSERT INTO book_authors (book_id, author_name)
VALUES (13, 'Michael Lewis')

INSERT INTO book_authors (book_id, author_name)
VALUES (14, 'George Orwell')

INSERT INTO book_authors (book_id, author_name)
VALUES (15, 'Betty Smith')

INSERT INTO book_authors (book_id, author_name)
VALUES (16, 'Jean Toomer')

INSERT INTO book_authors (book_id, author_name)
VALUES (17, 'Mary Shelley')

INSERT INTO book_authors (book_id, author_name)
VALUES (18, 'Charles Dickens')

INSERT INTO book_authors (book_id, author_name)
VALUES (19, 'Joseph Conrad')

INSERT INTO book_authors (book_id, author_name)
VALUES (20, 'E.M. Forster')

INSERT INTO book_authors (book_id, author_name)
VALUES (21, 'Ralph Ellison')

INSERT INTO book_authors (book_id, author_name)
VALUES (22, 'Louisa May Alcott')

/****INSERT DATA FOR BOOK_COPIES TABLE****/
/****CENTRAL BRANCH****/
SELECT * FROM book_copies

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (4, 2, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (5, 2, 4)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (3, 2, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (6, 2, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (7, 2, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (8, 2, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (9, 2, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (10, 2, 5)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (11, 2, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (12, 2, 4)

/****SHARPSTOWN BRANCH****/
INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (13, 1, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (14, 1, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (15, 1, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (16, 1, 5)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (17, 1, 4)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (18, 1, 5)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (19, 1, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (20, 1, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (21, 1, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (22, 1, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (3, 1, 4)

/****EAST LIBERTY BRANCH****/
INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (3, 3, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (4, 3, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (5, 3, 4)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (6, 3, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (7, 3, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (8, 3, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (9, 3, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (10, 3, 5)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (11, 3, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (12, 3, 2)

/****NORTH HILLS BRANCH****/
INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (13, 4, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (14, 4, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (15, 4, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (16, 4, 6)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (17, 4, 2)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (18, 4, 4)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (19, 4, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (20, 4, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (21, 4, 3)

INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES (22, 4, 4)

/****INSERT DATA FOR BORROWER TABLE****/
INSERT INTO borrower (name, address, phone)
VALUES ('John Smith', '3145 Michigan Ave', '412-992-9015')

INSERT INTO borrower (name, address, phone)
VALUES ('Mary Jones', '2800 Cahndler Hollow Rd', '412-891-0081')

INSERT INTO borrower (name, address, phone)
VALUES ('Jason Peters', '1868 Shinn Ave', '412-372-4190')

INSERT INTO borrower (name, address, phone)
VALUES ('Eli Apple', '238 Losh Ln', '412-442-4932')

INSERT INTO borrower (name, address, phone)
VALUES ('Margaret Watson', '2747 Lucky Duck Dr', '412-862-9081')

INSERT INTO borrower (name, address, phone)
VALUES ('Mary Van Pelt', '2714 Spruce Dr', '724-877-9778')

INSERT INTO borrower (name, address, phone)
VALUES ('Loreta Gottfried', '4038 Frank Ave', '412-876-1992')

INSERT INTO borrower (name, address, phone)
VALUES ('Marshall Parker', '3892 Pne St', '724-269-4873')

INSERT INTO borrower (name, address, phone)
VALUES ('Jane Washington', '322 5th Ave', '412-881-9021')

INSERT INTO borrower (name, address, phone)
VALUES ('Sean Showalter', '219 Wilkins Ave', '724-882-0945')

INSERT INTO borrower (name, address, phone)
VALUES ('Elizabeth Waters', '23 Darlington Rd', '412-376-2837')

INSERT INTO borrower (name, address, phone)
VALUES ('Sidney Rust', '677 Duquesne Ave', '412-998-0981')

/****INSERT DATA FOR BOOK_LOANS TABLE****/
INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (3, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (4, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (5, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (6, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (7, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (8, 4, 1, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (9, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (10, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (11, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (12, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (13, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (14, 1, 2, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (15, 2, 3, '10/10/2018', '10/22/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (16, 2, 3, '10/10/2018', '10/22/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (17, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (18, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (19, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (20, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (21, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (21, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (22, 2, 3, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (4, 1, 4, '10/10/2018', '10/22/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (5, 3, 4, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (6, 3, 4, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (7, 3, 4, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (10, 3, 4, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (22, 3, 5, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (21, 3, 5, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (20, 3, 5, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (19, 3, 5, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (3, 1, 6, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (4, 1, 6, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (15, 1, 6, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (16, 1, 6, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (6, 2, 7, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (7, 2, 7, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (8, 2, 7, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (13, 2, 7, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (22, 3, 8, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (21, 3, 8, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (20, 3, 8, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (19, 3, 8, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (8, 4, 9, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (9, 4, 9, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (10, 4, 9, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (11, 4, 9, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (17, 1, 10, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (18, 1, 10, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (19, 1, 10, '10/22/2018', '11/1/2018')

INSERT INTO book_loans (book_id, branch_id, card_number, date_out, date_due)
VALUES (20, 1, 10, '10/22/2018', '11/1/2018')

/* How many copies of the book titled "The Lost Tribe" are owned by
the library branch whose name is "Sharpstown"?*/

CREATE PROCEDURE copies_of_lost_tribe_sharpstown
AS
SELECT number_of_copies FROM book_copies
WHERE book_id = 3 AND branch_id = 1
GO

/* How many copies of the book titled "The Lost Tribe" are owned by
each library branch? */
CREATE PROCEDURE total_copies_of_lost_tribe
AS
SELECT SUM(number_of_copies) FROM book_copies
WHERE book_id = 3
GO

/* Retrieve the names of all borrowers who do not have books checked out */
CREATE PROCEDURE no_books_checked_out
AS
SELECT name
FROM borrower
INNER JOIN book_loans ON borrower.card_number = book_loans.card_number
GROUP BY name
HAVING COUNT(book_id) = 0
GO
/* For each book that is loaned out from the "Sharpstown" branch and whose
due_date is today, retrieve the book title, the borrower's name, and the
borrower's address. */
CREATE PROCEDURE sharpstown_books_due_today
AS
SELECT title, name, address
FROM books
INNER JOIN book_loans ON books.book_id = book_loans.book_id
INNER JOIN borrower ON book_loans.card_number = borrower.card_number
WHERE branch_id = 1 AND date_due = CONVERT(DATE, GETDATE())
GO

/* For each library branch, retrieve the branch name and the total
number of books loaned out from that branch. */
CREATE PROCEDURE number_of_books_loaned_out
AS
SELECT branch_name, COUNT(bl.branch_id) AS 'Number of Books Loaned Out'
 FROM book_loans AS bl
INNER JOIN library_branch ON bl.branch_id = library_branch.branch_id
GROUP BY branch_name
GO

/* Retrieve the names, addresses, and the number of books checked out for
all borrowers who have more than 5 books checked out. */
CREATE PROCEDURE more_than_five_books
AS
SELECT name, address, COUNT(book_id)
FROM borrower
INNER JOIN book_loans ON borrower.card_number = book_loans.card_number
GROUP BY name, address
HAVING COUNT(book_id) > 5
GO

/* For each book authored by "Stephen King", retrieve the title and the
number of copies owned by the library whose name is "Central." */
CREATE PROCEDURE stephen_king_copies_at_central
AS
SELECT title, number_of_copies FROM books
INNER JOIN book_authors ON books.book_id = book_authors.book_id
INNER JOIN book_copies ON book_authors.book_id = book_copies.book_id
WHERE author_name = 'Stephen King' AND branch_id = 2
GO

