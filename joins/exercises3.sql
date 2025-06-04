USE northwind;
-- 1. List the product id, product name, unit price and category name of all products. Order by category name and within that,
-- by product name.
USE Northwind;

SELECT
    p.ProductID,      
    p.ProductName,    
    p.UnitPrice,      
    c.CategoryName    
FROM
    Products p        
JOIN
    Categories c ON p.CategoryID = c.CategoryID 
ORDER BY
    c.CategoryName ASC, 
    p.ProductName ASC; 

-- 2. List the product id, product name, unit price and supplier name of allproducts that cost more than $75. Order by product name.
SELECT
    p.ProductID,      -- Ürün Kimliği (Products tablosundan)
    p.ProductName,    -- Ürün Adı (Products tablosundan)
    p.UnitPrice,      -- Birim Fiyat (Products tablosundan)
    s.CompanyName AS SupplierName -- Tedarikçi Adı (Suppliers tablosundan, takma ad ver)
FROM
    Products p        -- Products tablosunu 'p' takma adıyla seç
JOIN
    Suppliers s ON p.SupplierID = s.SupplierID -- Products ve Suppliers tablolarını SupplierID üzerinden birleştir
WHERE
    p.UnitPrice > 75  -- Birim Fiyatı 75'ten büyük olanları filtrele
ORDER BY
    p.ProductName ASC; -- Ürün Adına göre artan sırada sırala

-- 3. List the product id, product name, unit price, category name, and supplier name of every product. Order by product name.
SELECT
    p.ProductID,      -- Ürün Kimliği
    p.ProductName,    -- Ürün Adı
    p.UnitPrice,      -- Birim Fiyat
    c.CategoryName,   -- Kategori Adı
    s.CompanyName AS SupplierName -- Tedarikçi Adı
FROM
    Products p        -- Products tablosunu 'p' takma adıyla seç
JOIN
    Categories c ON p.CategoryID = c.CategoryID -- Products ve Categories tablolarını CategoryID üzerinden birleştir
JOIN
    Suppliers s ON p.SupplierID = s.SupplierID -- Products ve Suppliers tablolarını SupplierID üzerinden birleştir
ORDER BY
    p.ProductName ASC; -- 

-- 4. What is the product name(s) and categories of the most expensive products? HINT: Find the max price in a subquery and then use that
-- in your more complex query that joins products with categories.
 SELECT
    p.ProductName,      -- Ürün Adı
    c.CategoryName,     -- Kategori Adı
    p.UnitPrice         -- Birim Fiyat
FROM
    Products p          -- Products tablosunu 'p' takma adıyla seç
JOIN
    Categories c ON p.CategoryID = c.CategoryID -- Products ve Categories tablolarını CategoryID üzerinden birleştir
WHERE
    p.UnitPrice = (SELECT MAX(UnitPrice) FROM Products);
 
-- 5. List the order id, ship name, ship address, and shipping company name of every order that shipped to Germany.
SELECT
    o.OrderID,              -- Sipariş Kimliği (Orders tablosundan)
    o.ShipName,             -- Gönderilen Kişi/Şirket Adı (Orders tablosundan)
    o.ShipAddress,          -- Gönderim Adresi (Orders tablosundan)
    s.CompanyName AS ShippingCompanyName -- Nakliye Şirketi Adı (Shippers tablosundan, takma ad ver)
FROM
    Orders o                -- Orders tablosunu 'o' takma adıyla seç
JOIN
    Shippers s ON o.ShipVia = s.ShipperID -- Orders ve Shippers tablolarını ShipVia ve ShipperID üzerinden birleştir
WHERE
    o.ShipCountry = 'Germany';

-- 6. List the order id, order date, ship name, ship address of all orders that ordered "Sasquatch Ale"?
SELECT DISTINCT -- Her siparişi sadece bir kez listelemek için DISTINCT kullanıldı
    o.OrderID,              -- Sipariş Kimliği (Orders tablosundan)
    o.OrderDate,            -- Sipariş Tarihi (Orders tablosundan)
    o.ShipName,             -- Gönderilen Kişi/Şirket Adı (Orders tablosundan)
    o.ShipAddress           -- Gönderim Adresi (Orders tablosundan)
FROM
    Orders o                -- Orders tablosunu 'o' takma adıyla seç
JOIN
    "Order Details" od ON o.OrderID = od.OrderID -- Orders ve "Order Details" tablolarını OrderID üzerinden birleştir
JOIN
    Products p ON od.ProductID = p.ProductID -- "Order Details" ve Products tablolarını ProductID üzerinden birleştir
WHERE
    p.ProductName = 'Sasquatch Ale';