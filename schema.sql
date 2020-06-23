/*Details regarding each Product in a store*/
CREATE TABLE IF NOT EXISTS Product (
    Product_ID BIGINT AUTO_INCREMENT UNIQUE,
    Product_Name VARCHAR(82),
    Aisle_ID BIGINT, 
    PRIMARY KEY(Product_ID)
);

/*Store Addresses for x company*/
CREATE TABLE IF NOT EXISTS Addresses (
    AD1 VARCHAR(50),
    AD2 VARCHAR(50),
    City_Town VARCHAR(20),
    District VARCHAR(15),
    Country VARCHAR(30),
    Telephone_No VARCHAR(11) UNIQUE,
    PRIMARY KEY(AD2)
);

/*Details about a store*/
CREATE TABLE IF NOT EXISTS Store (
    Store_ID BIGINT AUTO_INCREMENT UNIQUE,
    Store_Name VARCHAR(30),
    Address VARCHAR(50),
    PRIMARY KEY(Store_ID),
    FOREIGN KEY (Address) REFERENCES Addresses(AD2)
);

/*Details holding all the details about items in a Store's Stock*/
CREATE TABLE IF NOT EXISTS Stock (
    Product_ID BIGINT,
    Store_ID BIGINT,
    Promotion BIT, 
    Quantity BIGINT,
    Value INT, 
    Next_Delivery DATE,
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY(Store_ID) REFERENCES Store(Store_ID)
);

/*Details about the staff in different Stores*/
CREATE TABLE IF NOT EXISTS Staff (
    Staff_ID BIGINT AUTO_INCREMENT UNIQUE,
    Store_ID BIGINT UNIQUE,
    F_name VARCHAR(50),
    S_name VARCHAR(50),
    DOB DATE,
    Clock_Num BIGINT UNIQUE,
    User_Num BIGINT UNIQUE,
    User_Pass BIGINT, 
    PRIMARY KEY(Staff_ID),
    FOREIGN KEY(Store_ID) REFERENCES Store(Store_ID)
);

/*The Contracts for each member of Staff*/
CREATE TABLE IF NOT EXISTS Contract (
    Contract_ID BIGINT AUTO_INCREMENT UNIQUE,
    Staff_ID BIGINT,
    Rate float,
    Weekly_Hrs INT,
    Holidays_Hrs_Remaining INT,
    FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID),
    PRIMARY KEY(Contract_ID)
);

/*Contractors (eg: Cleaner, Maintenance)*/
CREATE TABLE IF NOT EXISTS Contractor (
    Contractor_ID BIGINT AUTO_INCREMENT UNIQUE,
    Company VARCHAR(50),
    Store_ID BIGINT,
    Job VARCHAR(50),
    Job_Start DATE,
    Job_End DATE,
    PRIMARY KEY(Contractor_ID),
    FOREIGN KEY(Store_ID) REFERENCES Store(Store_ID)
); 