CREATE TABLE IF NOT EXISTS Item (
    Item_ID BIGINT AUTO_INCREMENT UNIQUE,
    Provider CHAR,
    Name CHAR,
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
    F_name CHAR,
    S_name CHAR, 
    DOB DATE,
    Clock_Num BIGINT UNIQUE,
    User_Num BIGINT UNIQUE,
    User_Pass BIGINT, 
    PRIMARY KEY(Staff_ID)
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