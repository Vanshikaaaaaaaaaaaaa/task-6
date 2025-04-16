-- Database: online sales

-- Revenue and Order Volume by Month and Year
SELECT SUM(sub.Tot_Price) as Tot_Sell, SUM(sub.ctr) as count, 'sport' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN sport_product
WHERE sub.ID = sport_product.Product_ID
UNION
SELECT SUM(sub.Tot_Price), SUM(sub.ctr) as count, 'home' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN home_product
WHERE sub.ID = home_product.Product_ID
UNION
SELECT SUM(sub.Tot_Price), SUM(sub.ctr) as count, 'digital' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN product
WHERE sub.ID = product.ID AND NOT EXISTS (SELECT product_ID
                                                 FROM home_product
                                                 WHERE product.ID = home_product.Product_ID) AND
                                                 NOT EXISTS (SELECT product_ID
												 FROM sport_product
                                                 WHERE product.ID = sport_product.Product_ID)

--2
SELECT person.Fname, registered_customer.registerDate
FROM registered_customer JOIN customer JOIN person
WHERE registered_customer.Customer_ID = customer.ID and customer.Person_ID = person.ID

--3
SELECT Fname, Lname, UserName
FROM Employee NATURAL JOIN customer NATURAL JOIN person
WHERE Employee.Company_ID = '2'
