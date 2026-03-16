-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 12:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gurrea_vhanneallen`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `membership_level` varchar(20) DEFAULT NULL,
  `join_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `city`, `membership_level`, `join_date`) VALUES
(1, 'Alice', 'Cebu', 'Gold', '2025-01-10'),
(2, 'Bob', 'Bohol', 'Silver', '2025-01-15'),
(3, 'Charlie', 'Cebu', 'Bronze', '2025-02-10'),
(4, 'Diana', 'Tagbilaran', 'Gold', '2025-02-12'),
(5, 'Ethan', 'Bohol', 'Silver', '2025-03-01'),
(6, 'Fiona', 'Cebu', 'Gold', '2025-03-05'),
(7, 'George', 'Tagbilaran', 'Bronze', '2025-03-08'),
(8, 'Hannah', 'Cebu', 'Silver', '2025-04-01'),
(9, 'Ian', 'Bohol', 'Gold', '2025-04-10'),
(10, 'Julia', 'Cebu', 'Bronze', '2025-04-15');

--
-- Query 1
-- List all customers from Cebu.
SELECT * 
FROM customers
WHERE city = 'Cebu';

-- Query 2
-- Find all Gold membership customers.
SELECT * 
FROM customers
WHERE membership_level = 'Gold';

-- Query 3
-- List customers whose names start with “A” or “D”.
SELECT * 
FROM customers
WHERE customer_name LIKE 'A%' OR customer_id LIKE 'D%';

-- Query 4
-- Find customers from Cebu who have Silver or Gold membership.
SELECT *
FROM customers
WHERE city = 'Cebu'
AND  (membership_level='Silver'OR membership_level='Gold');

-- Query 5
-- Select customers who joined between 2025-02-01 and 2025-03-31.
SELECT *
FROM customers
WHERE join_date BETWEEN '2025-02-01' AND '2025-03-31';

-- Query 6
-- Find customers from either Bohol or Tagbilaran with Bronze membership.
SELECT *
FROM customers
WHERE city IN ( 'Bohol','Tagbilaran')
AND membership_level = 'Bronze';

-- Query 7
-- List all customers whose names contain the letter “a” (case-insensitive).
SELECT *
FROM customers
WHERE customer_name LIKE '%a%';

-- Query 8
-- Find all customers from Cebu who are Gold members and joined before March 2025.
SELECT *
FROM customers
WHERE city = 'Cebu' 
AND membership_level = 'Gold' 
AND join_date < '2025-03-01';

-- Query 9
-- List all customers from Bohol or Tagbilaran who joined on or before February 2025 and have Silver or Bronze membership.
SELECT *
FROM customers
WHERE city IN ('Bohol','Tagbilaran')
AND join_date <= '2025-02-28'
AND membership_level IN ('Silver','Bronze');

-- Query 10
-- Select all customers except those whose customer_id is 1, 4, or 6, and who joined after February 2025.
SELECT *
FROM customers
WHERE customer_id NOT IN (1,4,6)
AND join_date > '2025-02-28';

-- Query 11
-- List customers who joined in April 2025, are from Cebu or Bohol, and are not Bronze members.
SELECT *
FROM customers
WHERE join_date BETWEEN '2025-04-01' AND '2025-04-30'
AND city IN ('Cebu','Bohol')
AND membership_level <> 'Bronze';
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
