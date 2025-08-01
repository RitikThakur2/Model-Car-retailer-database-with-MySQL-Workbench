-- 1. Where are items stored and if they were rearranged, could a warehouse be eliminated?

-- a. Inventory by Warehouse
SELECT 
    w.warehouseName,
    COUNT(p.productCode) AS numberOfProducts,
    SUM(p.quantityInStock) AS totalInventory
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseName;

-- Products stored in each warehouse
SELECT 
    p.productCode,
    p.productName,
    w.warehouseName,
    p.quantityInStock
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
ORDER BY w.warehouseName, p.productName;
