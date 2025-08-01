-- How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

-- Total sold vs. Inventory in stock for each product:
SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    IFNULL(SUM(od.quantityOrdered), 0) AS totalSold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
ORDER BY totalSold DESC;
