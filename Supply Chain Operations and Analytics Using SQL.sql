Create database SCA;
use SCA;


### Find the Total Sales for Each Product:

SELECT 
    p.Product_Name,
    SUM(oi.Quantity_Ordered * oi.Unit_Price) AS Total_Sales
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.Product_ID = p.Product_ID
GROUP BY 
    p.Product_Name
ORDER BY 
    Total_Sales DESC;
   
   
### Average Shipping Cost by Order Status:

SELECT 
    s.Shipment_Status,
    AVG(s.Shipping_Cost) AS Average_Shipping_Cost
FROM 
    Shipments s
GROUP BY 
    s.Shipment_Status;


### Most Popular Product in Terms of Quantity Ordered:


SELECT 
    p.Product_Name,
    SUM(oi.Quantity_Ordered) AS Total_Quantity_Ordered
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.Product_ID = p.Product_ID
GROUP BY 
    p.Product_Name
ORDER BY 
    Total_Quantity_Ordered DESC
LIMIT 1;


### Number of Orders Per Customer:    


SELECT 
    c.Customer_Name,
    COUNT(o.Order_ID) AS Number_Of_Orders
FROM 
    Customers c
JOIN 
    Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY 
    c.Customer_Name
ORDER BY 
    Number_Of_Orders DESC;


### Total Cost of All Orders Shipped by a Specific Supplier:


SELECT 
    s.Supplier_Name,
    SUM(oi.Quantity_Ordered * oi.Unit_Price) AS Total_Order_Cost
FROM 
    Suppliers s
JOIN 
    Products p ON s.Supplier_ID = p.Supplier_ID
JOIN 
    Order_Items oi ON p.Product_ID = oi.Product_ID
JOIN 
    Orders o ON oi.Order_ID = o.Order_ID
JOIN 
    Shipments sh ON o.Order_ID = sh.Order_ID
WHERE 
    sh.Shipment_Status = 'Delivered'
GROUP BY 
    s.Supplier_Name;


### Total Cost of All Orders Shipped by a Specific Supplier:


SELECT 
    s.Supplier_Name,
    SUM(oi.Quantity_Ordered * oi.Unit_Price) AS Total_Order_Cost
FROM 
    Suppliers s
JOIN 
    Products p ON s.Supplier_ID = p.Supplier_ID
JOIN 
    Order_Items oi ON p.Product_ID = oi.Product_ID
JOIN 
    Orders o ON oi.Order_ID = o.Order_ID
JOIN 
    Shipments sh ON o.Order_ID = sh.Order_ID
WHERE 
    sh.Shipment_Status = 'Delivered'
GROUP BY 
    s.Supplier_Name;


### List of Customers Who Have Not Placed Any Orders:


SELECT 
    c.Customer_Name
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.Customer_ID = o.Customer_ID
WHERE 
    o.Order_ID IS NULL;

