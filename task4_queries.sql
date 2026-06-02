SELECT * FROM customers;

SELECT *
FROM customers
WHERE Country = 'USA';

SELECT FirstName, LastName
FROM customers
ORDER BY LastName;

SELECT CustomerId,
       SUM(Total) AS TotalSpent
FROM invoices
GROUP BY CustomerId;

SELECT AVG(Total) AS AverageInvoice
FROM invoices;

SELECT c.FirstName,
       c.LastName,
       i.InvoiceId,
       i.Total
FROM customers c
INNER JOIN invoices i
ON c.CustomerId = i.CustomerId;

SELECT c.FirstName,
       c.LastName,
       i.InvoiceId
FROM customers c
LEFT JOIN invoices i
ON c.CustomerId = i.CustomerId;

SELECT *
FROM invoices
WHERE Total >
(
    SELECT AVG(Total)
    FROM invoices
);

CREATE VIEW CustomerSpending AS
SELECT CustomerId,
       SUM(Total) AS TotalSpent
FROM invoices
GROUP BY CustomerId;

SELECT * FROM CustomerSpending;

CREATE INDEX idx_customer
ON invoices(CustomerId);