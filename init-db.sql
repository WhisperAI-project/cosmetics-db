-- Skapa databas om den inte finns
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CosmeticsDb')
BEGIN
    CREATE DATABASE CosmeticsDb;
END
GO

USE CosmeticsDb;
GO

-- Skapa tabell Products som matchar CSV
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products;
GO

CREATE TABLE dbo.Products (
    Id INT,
    ProductName NVARCHAR(200),
    Brand NVARCHAR(200),
    Manufacturer NVARCHAR(200),
    Category NVARCHAR(100),
    Price DECIMAL(10,2),
    Shade NVARCHAR(100),
    SkinType NVARCHAR(100),
    Stock INT,
    ExpiryDate DATE,
    CreatedAt DATETIME
);
GO

-- Importera CSV direkt till Products
BULK INSERT dbo.Products
FROM '/usr/src/app/mock_cosmetics.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char'
);
GO
