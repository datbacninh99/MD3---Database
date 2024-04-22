CREATE DATABASE QuanLyBanHang3;
USE QuanLyBanHang3;

CREATE TABLE Customer
(
    cID  INT PRIMARY KEY,
    Name VARCHAR(25),
    cAge TINYINT
);

INSERT INTO Customer (cID, Name, cAge)
    VALUE (1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);

CREATE TABLE `Order`
(
    oID         INT PRIMARY KEY,
    cID         INT,
    oDate       DATETIME,
    oTotalPrice INT
);

INSERT INTO `Order` (oID, cID, oDate, oTotalPrice)
    VALUE (1, 1, '2006-03-21', null),
    (2, 2, '2006-03-23', null),
    (3, 1, '2006-03-16', null);

ALTER TABLE `Order`
    ADD CONSTRAINT fk_Order_Customer FOREIGN KEY (cID) REFERENCES Customer (cID);

CREATE TABLE Product
(
    pID    INT PRIMARY KEY,
    pName  VARCHAR(25),
    pPrice INT
);

INSERT INTO Product (pID, pName, pPrice)
    VALUE (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);

CREATE TABLE OrderDetail
(
    oID   INT,
    pID   INT,
    odQTY INT
);
INSERT INTO OrderDetail (oID, pID, odQTY)
    VALUE (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (2, 5, 4),
    (3, 1, 8),
    (2, 3, 3);

ALTER TABLE OrderDetail
    ADD CONSTRAINT fk_OrderDeatil_Order FOREIGN KEY (oID) REFERENCES `Order` (oID),
    ADD CONSTRAINT fk_OrderDetail_Product FOREIGN KEY (pID) REFERENCES Product (pID);

SELECT oID, oDate, oTotalPrice
FROM `Order`;

SELECT DISTINCT c.Name, p.pName
FROM Customer c
         JOIN `Order` o ON c.cID = o.cID
         JOIN OrderDetail od ON o.oID = od.oID
         JOIN Product p ON od.pID = p.pID;

SELECT c.Name
FROM Customer c
WHERE c.cID NOT IN (SELECT DISTINCT o.cID FROM `Order` o);

SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM `Order` o
         JOIN OrderDetail od ON o.oID = od.oID
         JOIN Product p ON od.pID = p.pID
GROUP BY o.oID;