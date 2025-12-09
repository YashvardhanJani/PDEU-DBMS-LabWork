/* [Set 03]
Movie Management System-Table Creation (5 Marks)
TABLE: MOVIE - MoviclD INT PRIMARY KEY, Title VARCHAR(60) NOT NULL, Language
VARCHAR(30) NOT NULL, Genre VARCHAR(30), DurationMin INT CHECK(DurationMin BETWEEN 60 AND 240)
TABLE: THEATRE - TheatrelD INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, City
VARCHAR(40) NOT NULL, Capacity INT CHECK(Capacity>0)
TABLE: SHOWBOOKING - ShowlD INT PRIMARY KEY, MovielD INT NOT NULL REFERENCES MOVIE(MovielD),
TheatrelD INT NOT NULL REFERENCES THEATRE(TheatrelD), ShowDate DATE NOT NULL,
TicketsSold INT CHECK(TicketsSold>=0), TicketPrice DECIMAL(8,2) CHECK(TicketPrice 0)

Insert Records (5 Marks)
Insert at least 10 meaningful records in each table.

Write the following SQL Queries (5x4 = 20 Marks)
1. Display all Hindi movies with duration greater than 120 minutes.
2. Display show date, movie title, thcatre name, city and revenue for all shows.
3. Display movies whose total revenue is greater than the average total revenue of all movies.
4. Display each movie with total tickets sold, arranged from highest to lowest.
5. Display each city with total shows, total tickets sold and total revenue, arrunged from highest to lowest revenue. 
*/

CREATE TABLE MOVIE (
    MovieID     INT PRIMARY KEY,
    Title       VARCHAR(60) NOT NULL,
    Language    VARCHAR(30) NOT NULL,
    Genre       VARCHAR(30),
    DurationMin INT CHECK (DurationMin BETWEEN 60 AND 240)
);

CREATE TABLE THEATRE (
    TheatreID INT PRIMARY KEY,
    Name      VARCHAR(50) NOT NULL,
    City      VARCHAR(40) NOT NULL,
    Capacity  INT CHECK (Capacity > 0)
);

CREATE TABLE SHOWBOOKING (
    ShowID      INT PRIMARY KEY,
    MovieID     INT NOT NULL REFERENCES MOVIE(MovieID),
    TheatreID   INT NOT NULL REFERENCES THEATRE(TheatreID),
    ShowDate    DATE NOT NULL,
    TicketsSold INT CHECK (TicketsSold >= 0),
    TicketPrice DECIMAL(8,2) CHECK (TicketPrice > 0)
);

INSERT INTO MOVIE (MovieID, Title, Language, Genre, DurationMin) VALUES
(1,  '3 Idiots',                    'Hindi',   'Comedy-Drama', 170),
(2,  'Dangal',                      'Hindi',   'Sports',       161),
(3,  'Bahubali: The Beginning',     'Telugu',  'Action',       159),
(4,  'Inception',                   'English', 'Sci-Fi',       148),
(5,  'Chennai Express',             'Hindi',   'Comedy',       141),
(6,  'KGF: Chapter 1',              'Kannada', 'Action',       156),
(7,  'Interstellar',                'English', 'Sci-Fi',       169),
(8,  'Tanhaji',                     'Hindi',   'Historical',   135),
(9,  'Dear Zindagi',                'Hindi',   'Drama',        150),
(10, 'Golmaal Again',               'Hindi',   'Comedy',       140);

INSERT INTO THEATRE (TheatreID, Name, City, Capacity) VALUES
(1,  'PVR City Centre',      'Ahmedabad', 250),
(2,  'INOX Crystal Mall',    'Rajkot',    220),
(3,  'Cinepolis VR',         'Surat',     300),
(4,  'Carnival Cinemas',     'Mumbai',    350),
(5,  'PVR Phoenix',          'Pune',      280),
(6,  'Cinepolis Seasons',    'Pune',      260),
(7,  'INOX Alpha One',       'Ahmedabad', 320),
(8,  'Rajhans Cinema',       'Jaipur',180),
(9,  'PVR Vegas',            'Delhi',     400),
(10, 'INOX Forum',           'Bangalore', 320);

INSERT INTO SHOWBOOKING (ShowID, MovieID, TheatreID, ShowDate, TicketsSold, TicketPrice) VALUES
(1,  1, 1,  '2025-01-02', 220, 250.00),
(2,  2, 4,  '2025-01-03', 300, 280.00),
(3,  3, 3,  '2025-01-04', 260, 300.00),
(4,  4, 9,  '2025-01-05', 350, 350.00),
(5,  5, 2,  '2025-01-06', 200, 220.00),
(6,  6, 10, '2025-01-07', 290, 270.00),
(7,  7, 5,  '2025-01-08', 240, 320.00),
(8,  8, 7,  '2025-01-09', 210, 230.00),
(9,  9, 6,  '2025-01-10', 180, 260.00),
(10,10, 8,  '2025-01-11', 150, 200.00),
(11,1,  3,  '2025-01-12', 280, 260.00),
(12,2,  9,  '2025-01-13', 320, 300.00);

-- 1. Display all Hindi movies with duration greater than 120 minutes.
SELECT * FROM MOVIE WHERE Language = 'Hindi' AND DurationMin > 120;

-- 2. Display show date, movie title, theatre name, city and revenue for all shows. (Revenue = TicketsSold * TicketPrice)
SELECT s.ShowDate, m.Title AS MovieTitle, t.Name AS TheatreName, t.City, (s.TicketsSold * s.TicketPrice) AS Revenue
FROM SHOWBOOKING s
JOIN MOVIE m ON s.MovieID = m.MovieID
JOIN THEATRE t ON s.TheatreID = t.TheatreID;

-- 3. Display movies whose total revenue is greater than the average total revenue of all movies.
SELECT m.MovieID, m.Title, SUM(s.TicketsSold * s.TicketPrice) AS TotalRevenue
FROM MOVIE m
JOIN SHOWBOOKING s ON m.MovieID = s.MovieID
GROUP BY m.MovieID, m.Title
HAVING SUM(s.TicketsSold * s.TicketPrice) > (SELECT AVG(MovieRevenue) FROM (SELECT SUM(TicketsSold * TicketPrice) AS MovieRevenue FROM SHOWBOOKING GROUP BY MovieID) AS T);

-- 4. Display each movie with total tickets sold, arranged from highest to lowest.
SELECT m.MovieID, m.Title, COALESCE(SUM(s.TicketsSold), 0) AS TotalTicketsSold
FROM MOVIE m
LEFT JOIN SHOWBOOKING s ON m.MovieID = s.MovieID
GROUP BY m.MovieID, m.Title
ORDER BY TotalTicketsSold DESC;

-- 5. Display each city with total shows, total tickets sold and total revenue, arranged from highest to lowest revenue.
SELECT t.City, COUNT(s.ShowID) AS TotalShows, SUM(s.TicketsSold) AS TotalTicketsSold, SUM(s.TicketsSold * s.TicketPrice) AS TotalRevenue
FROM THEATRE t
JOIN SHOWBOOKING s ON t.TheatreID = s.TheatreID
GROUP BY t.City
ORDER BY TotalRevenue DESC;