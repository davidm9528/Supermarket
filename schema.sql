CREATE TABLE IF NOT EXISTS Store (
    Store_ID BIGINT AUTO_INCREMENT UNIQUE,
    Stock_ID BIGINT AUTO_INCREMENT UNIQUE,
    County CHAR, 
    PRIMARY KEY(Store_ID)
    FOREIGN KEY (Stock_ID) REFERENCES Stock(Stock_ID)
);

CREATE TABLE IF NOT EXISTS Item (
    Item_ID BIGINT AUTO_INCREMENT UNIQUE,
    Provider CHAR,
    Name CHAR,
    BBD DATE,
    PRIMARY KEY(Item_ID)
);

CREATE TABLE IF NOT EXISTS Stock (
    Stock_ID BIGINT AUTO_INCREMENT UNIQUE,
    Item_ID BIGINT,
    Remaining BIGINT,
    Next_Delivery DATE,
    PRIMARY KEY(Stock_ID),   
    FOREIGN KEY(Item_ID) REFERENCES Item(Item_ID)
);

CREATE TABLE IF NOT EXISTS Staff (
    Staff_ID BIGINT AUTO_INCREMENT UNIQUE,
    Store_ID BIGINT UNIQUE,
    F_name CHAR,
    S_name CHAR, 
    DOB DATE,
    Clock_Num BIGINT UNIQUE,
    User_Num BIGINT UNIQUE,
    User_Pass BIGINT, 
    PRIMARY KEY(Staff_ID),
    FOREIGN KEY(Store_ID) REFERENCES Store(Store_ID)
);

CREATE TABLE IF NOT EXISTS Contract (
    Contract_ID BIGINT AUTO_INCREMENT UNIQUE,
    Staff_ID BIGINT,
    Rate float,
    Weekly_Hrs INT, 
    Holidays_Hrs_Remaining INT,
    FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID),
    PRIMARY KEY(Contract_ID)
);

CREATE TABLE IF NOT EXISTS Contractor (
    Contractor_ID BIGINT AUTO_INCREMENT UNIQUE,
    Company CHAR,
    Store_ID BIGINT UNIQUE,
    Job CHAR,
    Job_Start DATE,
    Job_End DATE,
    PRIMARY KEY(Contractor_ID),
    FOREIGN KEY(Store_ID) REFERENCES Store(Store_ID)
); 