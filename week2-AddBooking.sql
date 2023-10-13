DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER //

CREATE PROCEDURE AddBooking(
    IN new_BookingID INT, 
    IN new_CustomerID INT, 
    IN new_TableNumber INT, 
    IN new_BookingDate DATE)
BEGIN
INSERT INTO Bookings(
    BookingID, 
    CustomerID, 
    TableNumber, 
    Date)
VALUES(
    new_BookingID, 
    new_CustomerID, 
    new_TableNumber, 
    new_BookingDate
    );

SELECT 'New booking added' AS 'Confirmation';
END;

DELIMITER //

CALL AddBooking(9, 3, 4, "2022-12-30");
