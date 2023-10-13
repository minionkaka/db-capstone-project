DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT, OUT message VARCHAR(255))
BEGIN
  DECLARE existingBooking INT;

  START TRANSACTION;

  SELECT COUNT(*)
  INTO existingBooking
  FROM Booking
  WHERE BookingSlot = bookingDate AND TableNo = tableNumber;

  IF existingBooking = 0 THEN
    INSERT INTO Booking (BookingSlot, TableNo)
    VALUES (bookingDate, tableNumber);
    SET message = 'Booking successful.';
  ELSE
    SET message = 'Booking declined. The table is already booked on the specified date.';
  END IF;

  COMMIT;

END //
DELIMITER ;

CALL AddValidBooking("2022-12-17", 6, @outputMessage);
