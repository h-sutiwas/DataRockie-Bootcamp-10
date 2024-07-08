-- Transactions table
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    order_date DATE,
    staff_id INTEGER,
    total_amount DECIMAL(10, 2)
);

-- Staff table
CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    name TEXT,
    position TEXT,
    hire_date DATE
);

-- Menu table
CREATE TABLE menu (
    item_id INTEGER PRIMARY KEY,
    name TEXT,
    price DECIMAL(10, 2),
    category TEXT
);

-- Ingredients table
CREATE TABLE ingredients (
    ingredient_id INTEGER PRIMARY KEY,
    name TEXT,
    stock_quantity INTEGER,
    unit TEXT
);

-- Insert Values into Transactions
INSERT INTO transactions (order_date, staff_id, total_amount) VALUES
('2024-07-01', 1, 45.50),
('2024-07-01', 2, 32.75),
('2024-07-02', 3, 78.25),
('2024-07-02', 1, 55.00),
('2024-07-03', 2, 67.50);

-- Insert Values into Staff
INSERT INTO staff (name, position, hire_date) VALUES
('John Doe', 'Waiter', '2023-01-15'),
('Jane Smith', 'Chef', '2022-11-01'),
('Mike Johnson', 'Manager', '2021-06-30'),
('Sarah Brown', 'Bartender', '2023-03-10');

-- Insert Values into Menu
INSERT INTO menu (name, price, category) VALUES
('Margherita Pizza', 12.99, 'Main Course'),
('Caesar Salad', 8.50, 'Appetizer'),
('Grilled Salmon', 18.75, 'Main Course'),
('Chocolate Mousse', 6.99, 'Dessert'),
('Iced Tea', 2.50, 'Beverage');

-- Insert Values into Ingredients
INSERT INTO ingredients (name, stock_quantity, unit) VALUES
('Flour', 50, 'kg'),
('Tomatoes', 30, 'kg'),
('Chicken', 25, 'kg'),
('Lettuce', 15, 'kg'),
('Chocolate', 10, 'kg');

.mode table
.header on

--- SQL QUERIES ---
WITH daily_sales AS (
  SELECT 
    order_date, 
    SUM(total_amount) as daily_total
  FROM transactions
  GROUP BY order_date
)
SELECT 
  order_date, 
  daily_total,
  AVG(daily_total) OVER (
  ORDER BY order_date 
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) as moving_average
FROM daily_sales
ORDER BY order_date;


SELECT
  m.name as menu_item, 
  m.price,
  ( SELECT 
      AVG(price) 
    FROM menu 
    WHERE category = m.category
  ) as avg_category_price
FROM menu m
WHERE m.price > (
    SELECT AVG(price)
    FROM menu
    WHERE category = m.category
)
ORDER BY m.category, m.price DESC;


SELECT s.name as staff_name, s.position,
       COUNT(t.transaction_id) as total_orders,
       SUM(t.total_amount) as total_sales,
       AVG(t.total_amount) as avg_order_value
FROM staff s
LEFT JOIN transactions t 
ON s.staff_id = t.staff_id
GROUP BY 
  s.staff_id, 
  s.name, 
  s.position
ORDER BY total_sales DESC;