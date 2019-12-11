-- inner join from one table to two others by using two foreign keys in the Order Table

--  line 1 joins the first name and the last name columns from the employee table and makes them one column with a heading "SoldBy" in the results we get back
-- line 3 shows us the CustomerId from the order table in a column with a heading of 'Customer'
-- line 4 shows us the ShipCountry from the order table in a column with a heading of 'ShippedTo'
-- line 5 shows us the CompanyName from the company table in a column with a heading of 'OrderedBy'
select (e.firstName || ' ' || e.lastName) as SoldBy
    , o.id
    , o.CustomerId as Customer
    , o.ShipCountry as ShippedTo
    , c.CompanyName as OrderedBy
 from [Order] as o
 join employee as e on o.EmployeeId = e.id 
 join customer as c on o.CustomerId = c.id; 

-- joining orders to order detail and product id
select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice
    , *     
from [order] as o
join orderdetail as od
    on o.id = od.OrderId
join product as p
    on od.productId = p.id;

-- line 33 creates a column with the total of order detail quantity * product unit price
select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice as Price
    , (od.Quantity * p.UnitPrice) as LineTotal    
from [Order] as o
join OrderDetail as od
    on o.id = od.OrderId
join Product as p
    on od.ProductId = p.id;


-- joining 
select o.id as OrderNumber
    , p.ProductName
    , od.Quantity
    , p.UnitPrice as Price
    , (od.Quantity * p.UnitPrice) as LineTotal 
    , s.CompanyName as SoldBy   
from [Order] as o
join OrderDetail as od
    on o.id = od.OrderId
join Product as p
    on od.ProductId = p.id
join Supplier as s
    on s.id = p.SupplierId;