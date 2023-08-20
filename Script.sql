USE BMSO601_DB_Group_004;

/**** DO NOT EDIT BELOW *****/

DROP TABLE IF EXISTS G4_CUSTOMER;
DROP TABLE IF EXISTS G4_SUBSCRIPTION;
DROP TABLE IF EXISTS G4_PRODUCT;
DROP TABLE IF EXISTS G4_MEAL;
DROP TABLE IF EXISTS G4_RECIPE;
DROP TABLE IF EXISTS G4_VENDOR;
DROP TABLE IF EXISTS G4_PROCUREMENT;
DROP TABLE IF EXISTS G4_DRIVER;
DROP TABLE IF EXISTS G4_ORDER;

CREATE TABLE G4_CUSTOMER (
	customer_id VARCHAR(10) NOT NULL PRIMARY KEY,
	customer_fname VARCHAR(50),
	customer_lname VARCHAR(50),
	customer_address VARCHAR(100)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_CUSTOMER VALUES 
('C001', 'John', 'Smith', '7160 Glendale Street Washington, DC 20226'),
('C002', 'Ellen', 'Zhang', '6211 Centreville Rd #800, Centreville, Virginia, 20121'),
('C003', 'Jennifer', 'Rodriguez', '9216 Diamond Street Washington, DC 20544'),
('C004', 'Giselle', 'Noa', '12110 Monument Dr, Fairfax, Virginia, 22033'),
('C005', 'Kelly', 'Greene', '5329 Baltimore Ave, Chevy Chase, Maryland, 20815'),
('C006', 'Mario', 'Gimelli', '9463 Brickell St. Washington, DC 20558'),
('C007', 'Kevin', 'Brown', '951 Clopper Rd, Gaithersburg, Maryland, 20878'),
('C008', 'Stephanie', 'Emmerson', '400 Canterbury Rd, Virginia Beach, Virginia, 23452'),
('C009', 'Mark', 'Grey', '9 Apollo Rd. Washington, DC 20252'),
('C010', 'Mike', 'Johns', '604 N 32nd St, Richmond, Virginia, 23223'); 
/* Group 4 04-09-2023 */

SELECT * FROM G4_CUSTOMER
/* Group 4 04-09-2023 */

CREATE TABLE G4_SUBSCRIPTION (
	subscription_id VARCHAR(10) NOT NULL PRIMARY KEY,
	subscription_type VARCHAR(50) CHECK (subscription_type in ('Weekly', 'Bi-Weekly', 'Monthly')),
	subscription_cost MONEY,
	subscription_date DATE,
	customer_id VARCHAR(10),
	CONSTRAINT G4_SUBSCRIPTION_CUSTOMER FOREIGN KEY (customer_id) 
	REFERENCES G4_CUSTOMER (customer_id)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_SUBSCRIPTION VALUES
('S001', 'Monthly', 180, '2022-10-10', 'C001'),
('S002', 'Bi-Weekly', 100, '2022-09-30', 'C002'),
('S003', 'Weekly', 50, '2022-08-30', 'C003'),
('S004', 'Bi-Weekly', 100, '2022-10-30', 'C004'),
('S005', 'Monthly', 180, '2022-11-30', 'C006'),
('S007', 'Monthly', 180, '2022-11-30', 'C007'),
('S008', 'Monthly', 180, '2022-12-30', 'C008'),
('S010', 'Weekly', 50, '2023-01-10', 'C010');
/* Group 4 04-09-2023 */

SELECT * FROM G4_SUBSCRIPTION
/* Group 4 04-09-2023 */

CREATE TABLE G4_PRODUCT (
	product_id VARCHAR(10) NOT NULL PRIMARY KEY,
	product_name VARCHAR(50),
	product_count INT,
	product_price MONEY
);
/* Group 4 04-09-2023 */

INSERT INTO G4_PRODUCT VALUES
('P001', 'Tofu', 40, 5.50),
('P002', 'Quinoa', 10, 5.75),
('P003', 'Tempeh', 40, 4.19),
('P004', 'Brown Rice', 20, 2.70),
('P005', 'Black Beans', 10, 2.29),
('P006', 'Butter', 20, 3.00),
('P007', 'Sage', 10, 2.19),
('P008', 'Gnocchi', 10, 5.17),
('P009', 'Goat Cheese', 15, 3.29),
('P010', 'Polenta', 18, 2.79),
('P011', 'Tomatoes', 30, 1.10),
('P012', 'Eggplant', 23, 2.29),
('P013', 'Zucchinis', 21, 1.40),
('P014', 'Yellow Squash', 19, 1.80),
('P015', 'Chicken Breast', 10, 3.50),
('P016', 'Carrots', 20, 1.50),
('P017', 'Green Peas', 42, 1.18);
/* Group 4 04-09-2023 */

SELECT * FROM G4_PRODUCT;
/* Group 4 04-09-2023 */

CREATE TABLE G4_MEAL (
	meal_id VARCHAR(10) NOT NULL PRIMARY KEY,
	meal_name VARCHAR(50),
	meal_type VARCHAR(50) CHECK (meal_type in ('Vegan', 'Vegetarian', 'Gluten-free')),
	meal_cost MONEY
);
/* Group 4 04-09-2023 */

INSERT INTO G4_MEAL VALUES
('M001', 'Tofu Quinoa Salad', 'Vegan', 13.15),
('M002', 'Tempeh Burrito Bowl', 'Vegan', 14.21),
('M003', 'Brown Butter Sage Gnocchi', 'Vegetarian', 17.56),
('M004', 'Creamy Goat Cheese Polenta With Ratatouille', 'Vegetarian', 19.88),
('M005', 'Gluten-free Chicken Stir-Fry', 'Gluten-free', 15.74);
/* Group 4 04-09-2023 */

SELECT * FROM G4_MEAL;
/* Group 4 04-09-2023 */

CREATE TABLE G4_RECIPE (
	product_id VARCHAR(10) NOT NULL,
	meal_id VARCHAR(10) NOT NULL,
	CONSTRAINT G4_RECIPE_PK PRIMARY KEY (product_id, meal_id),
	CONSTRAINT G4_RECIPE_PRODUCT FOREIGN KEY(product_id) REFERENCES G4_PRODUCT(product_id),
	CONSTRAINT G4_RECIPE_MEAL FOREIGN KEY (meal_id) REFERENCES G4_MEAL(meal_id)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_RECIPE VALUES
('P001', 'M001'),
('P002', 'M001'),
('P003', 'M002'),
('P004', 'M002'),
('P005', 'M002'),
('P006', 'M003'),
('P007', 'M003'),
('P008', 'M003'),
('P009', 'M004'),
('P010', 'M004'),
('P011', 'M004'),
('P012', 'M004'),
('P013', 'M004'),
('P014', 'M004'),
('P015', 'M005'),
('P016', 'M005'),
('P017', 'M005');
/* Group 4 04-09-2023 */

SELECT * FROM G4_RECIPE;
/* Group 4 04-09-2023 */

CREATE TABLE G4_VENDOR (
	vendor_id VARCHAR(10) NOT NULL PRIMARY KEY,
	vendor_name VARCHAR(50),
	vendor_address VARCHAR(100)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_VENDOR VALUES
('V001', 'Tiny Farms', '9673 Brassie Way, Montgomery Village, Maryland, 20886'),
('V002', 'Giants Garden', '103 Cross Creek Ln, Mouth Of Wilson, Virginia, 24363'),
('V003', 'Soy Bros', 'Po Box 92, White Stone, Virginia, 22578');
/* Group 4 04-09-2023 */

SELECT * FROM G4_VENDOR;
/* Group 4 04-09-2023 */

CREATE TABLE G4_PROCUREMENT (
	product_id VARCHAR(10) NOT NULL,
	vendor_id VARCHAR(10) NOT NULL,
	CONSTRAINT G4_PROCUREMENT_PK PRIMARY KEY (product_id, vendor_id),
	CONSTRAINT G4_PROCUREMENT_PRODUCT FOREIGN KEY(product_id) REFERENCES G4_PRODUCT(product_id),
	CONSTRAINT G4_PROCUREMENT_VENDOR FOREIGN KEY (vendor_id) REFERENCES G4_VENDOR(vendor_id)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_PROCUREMENT VALUES
('P015', 'V001'),
('P009', 'V001'),
('P008', 'V001'),
('P010', 'V001'),
('P006', 'V001'),
('P002', 'V001'),
('P004', 'V002'),
('P016', 'V002'),
('P007', 'V002'),
('P011', 'V002'),
('P012', 'V002'),
('P013', 'V002'),
('P014', 'V002'),
('P017', 'V002'),
('P001', 'V003'),
('P003', 'V003'),
('P005', 'V003');
/* Group 4 04-09-2023 */

SELECT * FROM G4_PROCUREMENT;
/* Group 4 04-09-2023 */

CREATE TABLE G4_DRIVER (
	driver_id VARCHAR(10) NOT NULL PRIMARY KEY,
	driver_fname VARCHAR(50),
	driver_lname VARCHAR(50)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_DRIVER VALUES
('D001', 'Julio', 'Taylor'),
('D002', 'Philip', 'Curtis'),
('D003', 'Martin', 'Li'),
('D004', 'Richard', 'Lee'),
('D005', 'Aaron', 'Gomes'),
('D006', 'Nick', 'Kim'),
('D007', 'Jayden', 'Mill');
/* Group 4 04-09-2023 */

SELECT * FROM G4_DRIVER;
/* Group 4 04-09-2023 */

CREATE TABLE G4_ORDER (
	order_id VARCHAR(10) NOT NULL PRIMARY KEY,
	order_date DATE,
	customer_id VARCHAR(10),
	meal_id VARCHAR(10),
	driver_id VARCHAR(10),
	subscription_id VARCHAR(10),
	CONSTRAINT G4_ORDER_CUSTOMER FOREIGN KEY (customer_id) 
	REFERENCES G4_CUSTOMER (customer_id),
	CONSTRAINT G4_ORDER_MEAL FOREIGN KEY (meal_id) 
	REFERENCES G4_MEAL (meal_id),
	CONSTRAINT G4_ORDER_DRIVER FOREIGN KEY (driver_id) 
	REFERENCES G4_DRIVER (driver_id),
	CONSTRAINT G4_ORDER_SUBSCRIPTION FOREIGN KEY (subscription_id) 
	REFERENCES G4_SUBSCRIPTION (subscription_id)
);
/* Group 4 04-09-2023 */

INSERT INTO G4_ORDER VALUES
('O001', '2022-10-29', 'C002', 'M002', 'D003', 'S002'),
('O002', '2022-11-03', 'C001', 'M005', 'D007', 'S001'),
('O003', '2022-11-15', 'C003', 'M004', 'D004', 'S003'),
('O004', '2022-11-24', 'C001', 'M003', 'D003', 'S001'),
('O005', '2022-12-06', 'C005', 'M001', 'D006', NULL),
('O006', '2022-12-21', 'C004', 'M004', 'D004', 'S004'),
('O007', '2023-01-05', 'C007', 'M002', 'D005', 'S007'),
('O008', '2023-01-19', 'C009', 'M005', 'D001', NULL),
('O009', '2023-01-31', 'C010', 'M002', 'D002', 'S010'),
('O010', '2023-02-08', 'C003', 'M003', 'D003', 'S003');
/* Group 4 04-09-2023 */

SELECT * FROM G4_ORDER;
/* Group 4 04-09-2023 */

SELECT
	C.customer_id,
	C.customer_fname, 
	C.customer_lname, 
	S.subscription_id,
	S.subscription_type,
	S.subscription_date,
	S.subscription_cost
FROM G4_CUSTOMER AS C INNER JOIN G4_SUBSCRIPTION AS S
ON C.customer_id = S.customer_id
WHERE S.subscription_cost = 180 
AND S.subscription_date BETWEEN '2022-10-01' AND '2022-12-31';
/* Group 4 04-09-2023 */

SELECT 
	OC.order_id,
	OC.customer_fname,
	OC.customer_lname,
	M.meal_name,
	M.meal_type,
	M.meal_cost
FROM G4_MEAL AS M INNER JOIN (
	SELECT
		O.order_id,
		O.customer_id,
		O.meal_id,
		C.customer_fname, 
		C.customer_lname
	FROM G4_ORDER AS O INNER JOIN G4_CUSTOMER AS C 
	ON O.customer_id = C.customer_id
	) AS OC ON OC.meal_id = M.meal_id
WHERE M.meal_cost > 15
AND M.meal_type LIKE '%Veg%';
/* Group 4 04-09-2023 */

SELECT
	C.customer_fname,
	C.customer_lname,
	OM.meal_name,
	OM.order_date,
	OM.meal_cost
FROM G4_CUSTOMER AS C INNER JOIN (
		SELECT
		O.order_id,
		O.order_date,
		O.customer_id,
		O.meal_id,
		M.meal_name, 
		M.meal_type,
		M.meal_cost
	FROM G4_ORDER AS O INNER JOIN G4_MEAL AS M 
	ON O.meal_id = M.meal_id
	WHERE O.order_date >= '2023-01-01'
	) AS OM ON OM.customer_id = C.customer_id
/* Group 4 04-09-2023 */

SELECT 
	C.customer_fname,
	C.customer_lname
FROM G4_CUSTOMER AS C 
WHERE C.customer_id IN 
	(SELECT S.customer_id 
	FROM G4_SUBSCRIPTION AS S
	);
/* Group 4 04-09-2023 */

SELECT
	O.driver_id,
	COUNT(O.order_id) AS delivery_times
FROM G4_ORDER AS O
WHERE O.subscription_id IS NOT NULL
GROUP BY O.driver_id
HAVING COUNT(O.order_id)>1;
/* Group 4 04-09-2023 */

SELECT 
	M.meal_id, M.meal_name,
	new.product_needed
FROM (
	SELECT
		M.meal_id, 
		COUNT(M.meal_id) AS product_needed
	FROM (
		SELECT 
			R.meal_id,
			PR.product_id, PR.product_name, PR.product_count, PR.product_price
		FROM G4_RECIPE AS R RIGHT JOIN (
			SELECT * FROM G4_PRODUCT AS P
			WHERE P.product_count < 20
			) AS PR ON PR.product_id = R.product_id
		) AS PM RIGHT JOIN G4_MEAL AS M
		ON PM.meal_id = M.meal_id
	GROUP BY M.meal_id
	HAVING COUNT(M.meal_id)>1
	) AS new INNER JOIN G4_MEAL AS M 
	ON new.meal_id = M.meal_id
ORDER BY product_needed DESC;
/* Group 4 04-09-2023 */

SELECT MVP.meal_name, PRO.product_name, MVP.vendor_name, MVP.meal_order_count
FROM G4_PRODUCT AS PRO
INNER JOIN (
	SELECT MV.meal_id, MV.meal_name, MV.meal_type, MV.meal_cost, MV.meal_order_count, MV.product_id, V.vendor_name
	FROM G4_VENDOR AS V
	INNER JOIN (
		SELECT PV.meal_id, PV.meal_name, PV.meal_type, PV.meal_cost, PV.meal_order_count, PV.product_id, P.vendor_id
		FROM G4_PROCUREMENT AS P
		INNER JOIN (
			SELECT MEAL.meal_id, MEAL.meal_name, MEAL.meal_type, MEAL.meal_cost, MEAL.meal_order_count, R.product_id
			FROM G4_RECIPE AS R
			INNER JOIN ( SELECT MO.meal_id, MO.meal_order_count, M.meal_name, M.meal_type, M.meal_cost FROM (
							SELECT O.meal_id, COUNT(O.meal_id) AS meal_order_count FROM G4_ORDER AS O GROUP BY O.meal_id
					) AS MO INNER JOIN G4_MEAL AS M ON MO.meal_id = M.meal_id
				) AS MEAL ON MEAL.meal_id = R.meal_id
			) AS PV ON PV.product_id = P.product_id
		) AS MV ON MV.vendor_id = V.vendor_id
	) AS MVP on MVP.product_id = PRO.product_id
ORDER BY MVP.meal_order_count DESC;
/* Group 4 04-09-2023 */

CREATE TRIGGER [dbo].[G4_CUSTOMERDELETE]
ON [dbo].[G4_CUSTOMER]
INSTEAD OF DELETE
AS 
BEGIN
		UPDATE G4_CUSTOMER
		SET customer_address = 'NULL'
		WHERE customer_id IN (SELECT customer_id FROM Deleted)
END
GO
/* Group 4 04-09-2023 */

SELECT * FROM G4_CUSTOMER
GO
/* Group 4 04-09-2023 */

DELETE FROM G4_CUSTOMER
WHERE customer_id = 'C001'
GO
/* Group 4 04-09-2023 */

SELECT * FROM G4_CUSTOMER
GO
/* Group 4 04-09-2023 */
