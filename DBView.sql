CREATE VIEW CustomerSummary AS
SELECT customerId,
       rental.date_out AS rental_date_out,
       rental.date_back AS rental_date_back, (((julianday(rental_date_back)) - (julianday(rental_date_out))) * Car.dailyCost) + ((odo_back - odo_out) *  kmCost) As rental_cost
       FROM rental JOIN vehicle USING (VIN)
           JOIN car USING (carMake, carModel, carYear)
           WHERE odo_back IS NOT NULL 
           GROUP BY customeriId;
		