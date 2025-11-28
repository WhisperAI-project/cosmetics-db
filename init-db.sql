CREATE DATABASE CosmeticsDb;
GO

USE CosmeticsDb;
GO

CREATE TABLE Products (
    Id INT PRIMARY KEY,
    ProductName NVARCHAR(200),
    Brand NVARCHAR(100),
    Manufacturer NVARCHAR(150),
    Category NVARCHAR(100),
    Price DECIMAL(10,2),
    Shade NVARCHAR(100),
    SkinType NVARCHAR(100),
    Stock INT,
    ExpiryDate DATE,
    CreatedAt DATE
);
GO

-- sökvägen är inne i containern
BULK INSERT Products
FROM '/usr/src/app/mock_cosmetics.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO
