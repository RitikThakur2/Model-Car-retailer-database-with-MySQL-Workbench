--  Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
-- Products with low or zero sales:
SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    IFNULL(SUM(od.quantityOrdered), 0) AS totalSold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
HAVING totalSold = 0
ORDER BY p.quantityInStock DESC;
