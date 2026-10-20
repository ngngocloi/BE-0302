IF DB_ID(N'MyStore') IS NULL
    EXEC(N'CREATE DATABASE [MyStore]');
GO
USE [MyStore];
GO
IF OBJECT_ID(N'dbo.Category', N'U') IS NULL
CREATE TABLE dbo.Category (
    CategoryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CategoryName nvarchar(max) NOT NULL
);
GO
IF OBJECT_ID(N'dbo.[User]', N'U') IS NULL
CREATE TABLE dbo.[User] (
    Username nvarchar(255) NOT NULL PRIMARY KEY,
    Password nchar(50) NOT NULL,
    UserRole nchar(1) NOT NULL
);
GO
IF OBJECT_ID(N'dbo.Customer', N'U') IS NULL
CREATE TABLE dbo.Customer (
    CustomerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerName nvarchar(max) NOT NULL,
    CustomerPhone nvarchar(15) NOT NULL,
    CustomerEmail nvarchar(max) NULL,
    CustomerAddress nvarchar(max) NULL,
    Username nvarchar(255) NOT NULL,
    CONSTRAINT FK_User_Customer FOREIGN KEY (Username) REFERENCES dbo.[User](Username)
);
GO
IF OBJECT_ID(N'dbo.Product', N'U') IS NULL
CREATE TABLE dbo.Product (
    ProductID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CategoryID int NOT NULL,
    ProductName nvarchar(max) NOT NULL,
    ProductDecription nvarchar(max) NOT NULL,
    ProductPrice decimal(18,2) NOT NULL,
    ProductImage nvarchar(max) NULL,
    CONSTRAINT FK_Pro_Category FOREIGN KEY (CategoryID) REFERENCES dbo.Category(CategoryID)
);
GO
IF OBJECT_ID(N'dbo.[Order]', N'U') IS NULL
CREATE TABLE dbo.[Order] (
    OrderID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerID int NOT NULL,
    OrderDate date NOT NULL,
    TotalAmount decimal(18,2) NOT NULL,
    PaymentStatus nvarchar(max) NULL,
    AddressDelivery nvarchar(max) NOT NULL,
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID)
);
GO
IF OBJECT_ID(N'dbo.OrderDetail', N'U') IS NULL
CREATE TABLE dbo.OrderDetail (
    ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductID int NOT NULL,
    OrderID int NOT NULL,
    Quantity int NOT NULL,
    UnitPrice decimal(18,2) NOT NULL,
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID),
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderID) REFERENCES dbo.[Order](OrderID)
);
GO
