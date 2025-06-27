-- Use the database
USE LibraryDB;

-- 1️⃣ Count how many books are written by each author
SELECT AuthorID, COUNT(*) AS BookCount
FROM Books
GROUP BY AuthorID;

-- 2️⃣ Count how many books each member has borrowed
SELECT MemberID, COUNT(*) AS BorrowCount
FROM Borrow
GROUP BY MemberID;

-- 3️⃣ Count members with and without email
SELECT 
    CASE 
        WHEN Email IS NULL THEN 'No Email'
        ELSE 'Has Email'
    END AS EmailStatus,
    COUNT(*) AS MemberCount
FROM Members
GROUP BY EmailStatus;

-- 4️⃣ Total number of borrowings per BookID
SELECT BookID, COUNT(*) AS TimesBorrowed
FROM Borrow
GROUP BY BookID;

-- 5️⃣ Count how many different members borrowed books
SELECT COUNT(DISTINCT MemberID) AS UniqueBorrowers
FROM Borrow;

-- 6️⃣ Group borrowings by month
SELECT 
    MONTH(BorrowDate) AS BorrowMonth,
    COUNT(*) AS TotalBorrows
FROM Borrow
WHERE BorrowDate IS NOT NULL
GROUP BY BorrowMonth;

-- 7️⃣ Members who borrowed more than 1 book
SELECT MemberID, COUNT(*) AS BorrowCount
FROM Borrow
GROUP BY MemberID
HAVING COUNT(*) > 1;

-- 8️⃣ Round average borrowings per member
SELECT ROUND(AVG(BorrowCount), 2) AS AvgBorrows
FROM (
    SELECT MemberID, COUNT(*) AS BorrowCount
    FROM Borrow
    GROUP BY MemberID
) AS Sub;