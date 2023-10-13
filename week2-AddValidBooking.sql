DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN Date DATE, IN TableNumber INT, OUT message VARCHAR(255))
BEGIN
  DECLARE existingBooking INT;

  START TRANSACTION;

  SELECT COUNT(*)
  INTO existingBooking
  FROM Bookings
  WHERE Date = booking_date AND TableNumber = table_number;

  IF existingBooking = 0 THEN
    INSERT INTO Booking (Date, TableNumber)
    VALUES (booking_date, table_number);
    SET message = 'Booking successful.';
  ELSE
    SET message = 'Booking declined. The table is already booked on the specified date.';
  END IF;

  COMMIT;

END //
DELIMITER ;

CALL AddValidBooking("2022-12-17", 6, @outputMessage);
