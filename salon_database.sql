-- Initial Drops
DROP TABLE IF EXISTS Programari;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Angajat;
DROP TABLE IF EXISTS Functie;
DROP TABLE IF EXISTS Servicii;

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS Client (
	id_client INT,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    data_nastere DATE,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) DEFAULT NULL,
    data_inregistrare TIMESTAMP,
    PRIMARY KEY(id_client)
);

CREATE TABLE IF NOT EXISTS Angajat (
	id_angajat INT,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    id_functie TINYINT DEFAULT NULL, -- foreign key references Functie(id_functie)
    salariu INT NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(id_angajat)
);

CREATE TABLE IF NOT EXISTS Functie (
	id_functie TINYINT,
    nume_functie VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_functie)
);

CREATE TABLE IF NOT EXISTS Servicii (
	id_serviciu SMALLINT,
    nume_serviciu VARCHAR(100),
    pret SMALLINT,
    PRIMARY KEY(id_serviciu)
);

CREATE TABLE IF NOT EXISTS Programari (
	id_programare INT,
    id_client INT, -- foreign key references Client(id_client)
	id_serviciu SMALLINT, -- foreign key references Servicii(id_serviciu)
    id_angajat INT, -- foreign key references Angajat(id_angajat)
    data_ora DATETIME,
    metoda_plata VARCHAR(50),
    status VARCHAR(50),
    PRIMARY KEY(id_programare)
);

-- CONSTRAINTS: AUTO_INCREMENT
ALTER TABLE Client
MODIFY COLUMN id_client INT AUTO_INCREMENT;

ALTER TABLE Angajat
MODIFY COLUMN id_angajat INT AUTO_INCREMENT;

ALTER TABLE Functie
MODIFY COLUMN id_functie TINYINT AUTO_INCREMENT;

ALTER TABLE Servicii
MODIFY COLUMN id_serviciu SMALLINT AUTO_INCREMENT;

ALTER TABLE Programari
MODIFY COLUMN id_programare INT AUTO_INCREMENT;

-- CONSTRAINTS: FOREIGN KEY()

ALTER TABLE Angajat
ADD CONSTRAINT fk_id_functie
FOREIGN KEY (id_functie)
REFERENCES Functie(id_functie);

ALTER TABLE Programari
ADD CONSTRAINT fk_id_client
FOREIGN KEY (id_client)
REFERENCES Client(id_client);

ALTER TABLE Programari
ADD CONSTRAINT fk_id_serviciu
FOREIGN KEY (id_serviciu)
REFERENCES Servicii(id_serviciu);

ALTER TABLE Programari
ADD CONSTRAINT fk_id_angajat
FOREIGN KEY (id_angajat)
REFERENCES Angajat(id_angajat);

-- INSERTIONS 
-- Client INSERTIONS (At least 10)

INSERT INTO Client(nume, prenume, data_nastere, telefon, email, data_inregistrare)
VALUES
('Andreescu', 'Victor', '1995-05-03', '40768162165', NULL, '2026-01-06 10:30:48'),
('Matei', 'Petronel', '1992-09-06', '40721521621', NULL, '2026-01-09 11:27:15'),
('Boldea', 'Petrisor', '1997-10-04', '40769151678', NULL, '2026-01-23 14:14:48'),
('Voinea', 'Rares-Traian', '2003-02-01', '40768996121', 'voineavoinicu3000@outlook.com', '2026-02-07 09:36:22'),
('Nicolae', 'Antoaneta', '2000-02-06', '40762161189', 'nicolaeantoaneta2000@yahoo.com', '2026-03-15 08:05:37'),
('Olaru', 'Anca-Stefania', '1998-12-27', '40716324220', 'olaruancastefania@gmail.com', '2026-04-03 12:42:56'),
('Preda', 'Denis', '1991-01-03', '40724224220', NULL, '2026-04-29 18:18:11'),
('Vulturu', 'Daniel-George', '1986-05-07', '40701286225', NULL, '2026-05-27 10:33:44'),
('Goleanu', 'Victor', '1976-07-24', '40773278912', NULL, '2026-05-27 12:38:41'),
('Sofrosinu', 'Andrei', '1980-03-29', '40764024768', NULL, '2026-05-27 16:07:12');

-- Functie INSERTIONS (At least 5)

INSERT INTO Functie(nume_functie)
VALUES
('frizer'), ('hair stylist'), ('manichiurist'), ('cosmetician'), ('receptioner');

-- Servicii INSERTIONS (At least 5)

INSERT INTO Servicii(nume_serviciu, pret)
VALUES
('Tuns Barbati', 75), ('Manichiura', 200), ('Make-up de ocazie speciala', 500), 
('Tuns Femei', 150), ('Manichiura TOP PREMIUM', 475);

-- Angajat INSERTIONS (at least 10)
INSERT INTO Angajat(nume, prenume, id_functie, salariu, telefon, email)
VALUES
('Popa', 'Andrei', 1, 3500, '0721345678', 'andrei.popa@salon.ro'),
('Ionescu', 'Maria', 2, 4200, '0745123987', 'maria.ionescu@yahoo.com'),
('Dumitrescu', 'Alex', 3, 3900, '0768234512', NULL),
('Stan', 'Ioana', 4, 3700, '0734456789', 'ioana.stan@gmail.com'),
('Marin', 'Elena', 5, 4100, '0756782341', NULL),
('Georgescu', 'Mihai', 1, 3600, '0770123456', 'mihai.georgescu@salon.ro'),
('Radu', 'Cristina', 2, 4300, '0729876543', 'cristina.radu@gmail.com'),
('Tudor', 'Vlad', 3, 3850, '0740789123', NULL),
('Enache', 'Ana', 4, 3950, '0765123478', 'ana.enache@yahoo.com'),
('Matei', 'Sorin', 5, 4000, '0732987654', NULL);

-- Programari INSERTIONS (at least 25)
INSERT INTO Programari(id_client, id_serviciu, id_angajat, data_ora, metoda_plata, status)
VALUES
(1, 1, 1, '2026-06-01 09:30:00', NULL, 'programata'),
(2, 2, 2, '2026-06-01 11:00:00', NULL, 'programata'),
(3, 3, 4, '2026-06-01 13:30:00', 'card', 'finalizata'),
(4, 4, 5, '2026-06-02 10:00:00', 'cash', 'finalizata'),
(5, 5, 3, '2026-06-02 15:00:00', NULL, 'anulata'),
(6, 1, 6, '2026-06-03 09:00:00', 'transfer', 'finalizata'),
(7, 2, 7, '2026-06-03 12:30:00', NULL, 'neprezentat'),
(8, 3, 8, '2026-06-04 14:00:00', NULL, 'programata'),
(9, 4, 9, '2026-06-04 16:30:00', 'card', 'finalizata'),
(10, 5, 10, '2026-06-05 10:30:00', NULL, 'programata'),
(1, 2, 2, '2026-06-05 13:00:00', 'cash', 'finalizata'),
(2, 3, 4, '2026-06-06 09:30:00', NULL, 'anulata'),
(3, 1, 1, '2026-06-06 11:30:00', NULL, 'programata'),
(4, 5, 5, '2026-06-07 15:30:00', 'transfer', 'finalizata'),
(5, 4, 9, '2026-06-07 17:00:00', NULL, 'neprezentat'),
(6, 2, 2, '2026-06-08 09:00:00', NULL, 'programata'),
(7, 1, 6, '2026-06-08 10:30:00', 'cash', 'finalizata'),
(8, 5, 10, '2026-06-08 12:00:00', NULL, 'anulata'),
(9, 3, 8, '2026-06-09 14:30:00', 'card', 'finalizata'),
(10, 4, 9, '2026-06-09 16:00:00', NULL, 'neprezentat'),
(1, 5, 5, '2026-06-10 11:00:00', 'transfer', 'finalizata'),
(2, 1, 1, '2026-06-10 13:30:00', NULL, 'programata'),
(3, 4, 4, '2026-06-11 09:30:00', 'cash', 'finalizata'),
(4, 2, 7, '2026-06-11 15:00:00', NULL, 'programata'),
(5, 3, 3, '2026-06-12 17:30:00', NULL, 'anulata');

-- NEW UPDATES

-- Name Programari -> Programare
ALTER TABLE Programari 
RENAME TO Programare; 
-- Name Servicii -> Serviciu
ALTER TABLE Servicii
RENAME TO Serviciu;

-- QUERIES
-- BASIC SELECT ALL
SELECT * FROM Client; 
SELECT * FROM Angajat;
Select * FROM Functie;
Select * FROM Serviciu;
Select * FROM Programare;

-- BASIC JOINS
-- SHOW ALL APPOINTMENTS WITH FULL CLIENT NAME, NAME OF SERVICE, AND FULL EMPLOYEE NAME
SELECT Programare.id_programare, CONCAT(Client.nume, ' ', Client.prenume) AS nume_client,
       Serviciu.nume_serviciu, CONCAT(Angajat.nume, ' ', Angajat.prenume) AS nume_angajat,
       Programare.data_ora, Programare.metoda_plata, Programare.status
FROM Programare
JOIN Client
ON Programare.id_client = Client.id_client
JOIN Serviciu
ON Programare.id_serviciu = Serviciu.id_serviciu
JOIN Angajat
ON Programare.id_angajat = Angajat.id_angajat
ORDER BY id_programare ASC;

-- OTHER BASIC QUERIES
-- HOW MANY APPOINTMENTS WERE MADE
SELECT COUNT(id_programare)
AS total_programari
FROM Programare;
-- HOW MANY APPOINTMENTS WERE MADE TODAY
SELECT COUNT(id_programare)
AS total_programari
FROM Programare
WHERE YEAR(data_ora) = YEAR(CURRENT_DATE)
AND MONTH(data_ora) = MONTH(CURRENT_DATE)
AND DAY(data_ora) = DAY(CURRENT_DATE);