CREATE TRIGGER get_odo_out_reading AFTER INSERT
ON rental
BEGIN 
UPDATE rental 
    SET odo_out = (SELECT odometer from vehicle 
					WHERE Vehicle.VIN = rental.VIN)
	WHERE rental.dateback IS NULL ;
END ;


CREATE TRIGGER get_odo_back_reading AFTER UPDATE
ON rental
BEGIN 
UPDATE Vehicle 
    SET odometer = new.odo_back 
    WHERE rental.VIN = Vehicle.VIN;
END ;