CREATE TABLE Car (
    carMake   TEXT    NOT NULL,
    carModel  TEXT    NOT NULL,
    carYear   INTEGER    NOT NULL,
    dailyCost INTEGER    NOT NULL,
    kmCost    REAL   NOT NULL,
    PRIMARY KEY (
        carMake,
        carModel,
        carYear
    )
);


CREATE TABLE Vehicle (
    carMake   TEXT    NOT NULL,
    carModel  TEXT    NOT NULL,
    carYear   INTEGER    NOT NULL,
    VIN TEXT NOT NULL UNIQUE  
			CHECK(
			length(VIN) = 5 AND
			VIN = UPPER(VIN) AND
			VIN REGEXP '^[ABCDEFGHJKLMNPRSTUVWXYZ0-9]+$'
			),
    odometer    INTEGER   NOT NULL,
    
	PRIMARY KEY (
        VIN
    ),
	CONSTRAINT Vehicle_ibfk_1 FOREIGN KEY (
        carMake,
		carModel,
		carYear
    )
    REFERENCES Car (carMake, carModel, carYear) 
);

CREATE TABLE rental (customerId INTEGER NOT NULL,
    VIN TEXT NOT NULL,
    odo_out INTEGER NOT NULL,
	date_out TEXT NOT NULL,
    odo_back INTEGER DEFAULT NULL,
    date_back TEXT DEFAULT NULL,
    CONSTRAINT rental_ibfk_1 FOREIGN KEY (
        VIN)
    REFERENCES Vehicle (VIN),
    CONSTRAINT rental_ibfk_2 FOREIGN KEY (
        customerId)
    REFERENCES Customer (id) ON UPDATE CASCADE
);

CREATE TABLE Customer (
    id INTEGER NOT NULL UNIQUE, 
    name TEXT NOT NULL, 
    email TEXT,
    PRIMARY KEY (
        id
    )
);