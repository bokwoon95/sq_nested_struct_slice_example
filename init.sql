-- This is the file used to seed data.sqlite3 with data
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS books_authors;

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name TEXT
);

CREATE TABLE books (
    isbn TEXT PRIMARY KEY,
    title TEXT
);

CREATE TABLE books_authors (
    isbn TEXT,
    author_id INT,

    FOREIGN KEY (isbn) REFERENCES books (isbn),
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

DROP VIEW IF EXISTS v_books_authors;
CREATE VIEW v_books_authors AS
SELECT
    a.author_id,
    a.name,
    b.isbn,
    b.title
FROM
    books_authors AS ba
    JOIN books AS b ON b.isbn = ba.isbn
    JOIN authors AS a ON a.author_id = ba.author_id
;

INSERT INTO authors
    (author_id, name)
VALUES
    (01, 'Gina Sheldon')
    ,(02, 'Valerie Simmons')
    ,(03, 'Rosalind Daugherty')
    ,(04, 'Bernard Boyer')
    ,(05, 'Mahnoor Cottrell')
    ,(06, 'Oliver Grey')
    ,(07, 'Oran Mckee')
    ,(08, 'Rayhaan Guest')
    ,(09, 'Edison Appleton')
    ,(10, 'Harrison Lamb')
    ,(11, 'Lucy Krause')
    ,(12, 'Falak Stokes')
    ,(13, 'Kourtney Mclean')
    ,(14, 'Rhian Esparza')
    ,(15, 'Haniya Hobbs')
    ,(16, 'Mahad Rowe')
    ,(17, 'Heath Stein')
    ,(18, 'Olli O''Brien')
    ,(19, 'Faizaan Shepherd')
    ,(20, 'Aniqa Mercer')
    ,(21, 'Tammy Deacon')
    ,(22, 'Reece Marquez')
    ,(23, 'Brooklyn Stubbs')
    ,(24, 'Marwah Lopez')
    ,(25, 'Yvie Dickinson')
    ,(26, 'Wayne Mellor')
    ,(27, 'Julie Bartlett')
    ,(28, 'Renzo Blake')
    ,(29, 'Harvir Mullen')
    ,(30, 'Meerab Shah')
    ,(31, 'Amit Salter')
    ,(32, 'Riley Neville')
    ,(33, 'Cara Blanchard')
    ,(34, 'Zak Barrow')
    ,(35, 'Husnain Walton')
    ,(36, 'Penelope Hassan')
    ,(37, 'Sonia Phan')
    ,(38, 'Aroush Mendoza')
    ,(39, 'Zaynah Berry')
    ,(40, 'Anabelle Parkinson')
    ,(41, 'Anees Chadwick')
    ,(42, 'Lizzie Hawes')
    ,(43, 'Ephraim Bowden')
    ,(44, 'Enzo Tran')
    ,(45, 'Kimberly Mcdonald')
    ,(46, 'Akeem Park')
    ,(47, 'Rhiannan Mccann')
    ,(48, 'Dante Bostock')
    ,(49, 'Seth Vasquez')
    ,(50, 'Alton Mccartney')
;

INSERT INTO books
    (isbn, title)
VALUES
    ('9780323661300', 'Adolescent Health Screening: an Update in the Age of Big Data')
    ,('9780323679688', 'Atlas of Wound Healing')
    ,('9780323653770', 'Anatomy, Imaging and Surgery of the Intracranial Dural Venous Sinuses')
    ,('9780323681278', 'Complications in Male Circumcision')
    ,('9780323533140', 'Cowell and Tyler''s Diagnostic Cytology and Hematology of the Dog and Cat (Fifth Edition)')
    ,('9780128169629', 'Wildlife Conservation in Africa')
    ,('9780128119136', 'Protein Modificomics')
    ,('9780128136355', 'Genome Chaos')
    ,('9780128137963', 'Chromatin Signaling and Neurological Disorders')
    ,('9780128148792', 'Epigenetics and Regeneration')
;

INSERT INTO books_authors
    (isbn, author_id)
VALUES
    ('9780323661300', 01)
    ,('9780323661300', 02)
    ,('9780323661300', 03)
    ,('9780323661300', 04)
    ,('9780323661300', 05)

    ,('9780323679688', 06)
    ,('9780323679688', 07)
    ,('9780323679688', 08)
    ,('9780323679688', 09)
    ,('9780323679688', 10)

    ,('9780323653770', 11)
    ,('9780323653770', 12)
    ,('9780323653770', 13)
    ,('9780323653770', 14)
    ,('9780323653770', 15)

    ,('9780323681278', 16)
    ,('9780323681278', 17)
    ,('9780323681278', 18)
    ,('9780323681278', 19)
    ,('9780323681278', 20)

    ,('9780323533140', 21)
    ,('9780323533140', 22)
    ,('9780323533140', 23)
    ,('9780323533140', 24)
    ,('9780323533140', 25)

    ,('9780128169629', 26)
    ,('9780128169629', 27)
    ,('9780128169629', 28)
    ,('9780128169629', 29)
    ,('9780128169629', 30)

    ,('9780128119136', 31)
    ,('9780128119136', 32)
    ,('9780128119136', 33)
    ,('9780128119136', 34)
    ,('9780128119136', 35)

    ,('9780128136355', 36)
    ,('9780128136355', 37)
    ,('9780128136355', 38)
    ,('9780128136355', 39)
    ,('9780128136355', 40)

    ,('9780128137963', 41)
    ,('9780128137963', 42)
    ,('9780128137963', 43)
    ,('9780128137963', 44)
    ,('9780128137963', 45)

    ,('9780128148792', 46)
    ,('9780128148792', 47)
    ,('9780128148792', 48)
    ,('9780128148792', 49)
    ,('9780128148792', 50)
;
