CREATE DATABASE QuanLyBanHang1;
USE QuanLyBanHang1;

CREATE TABLE Customer
(
    cID   INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(255) NOT NULL UNIQUE,
    cAge  INT          NOT NULL
);

CREATE TABLE `Order`
(
    oID         INT PRIMARY KEY AUTO_INCREMENT,
    cID         INT,
    oDate       DATE,
    oTotalPrice DECIMAL NOT NULL
);

ALTER TABLE `Order`
    ADD CONSTRAINT fk_Order_Customer FOREIGN KEY (cID) REFERENCES Customer (cID);

CREATE TABLE Product
(
    pID    INT PRIMARY KEY AUTO_INCREMENT,
    pName  VARCHAR(255) NOT NULL UNIQUE,
    pPrice DECIMAL      NOT NULL
);

CREATE TABLE OrderDetail
(
    oID   INT,
    pID   INT,
    odQTY INT NOT NULL
);

ALTER TABLE OrderDetail
    ADD CONSTRAINT fk_OrderDetail_Order FOREIGN KEY (oID) REFERENCES `Order` (oID),
    ADD CONSTRAINT fk_OrderDetail_Product FOREIGN KEY (pID) REFERENCES Product (pID);