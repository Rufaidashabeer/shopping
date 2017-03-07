-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2017 at 11:37 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `pk_vchr_admin_id` varchar(20) NOT NULL,
  `fk_int_admin_id` int(10) DEFAULT NULL,
  `vchr_admin_name` varchar(20) DEFAULT NULL,
  `vchr_admin_email` varchar(20) DEFAULT NULL,
  `vchr_admin_password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_add_category`
--

CREATE TABLE IF NOT EXISTS `tbl_admin_add_category` (
`pk_int_cat_id` int(10) NOT NULL,
  `vchr_cat_name` varchar(20) DEFAULT NULL,
  `vchr_cat_description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_add_product`
--

CREATE TABLE IF NOT EXISTS `tbl_admin_add_product` (
`pk_int_pdt_id` int(10) NOT NULL,
  `vchr_pdt_name` varchar(20) DEFAULT NULL,
  `vchr_pdt_image` varchar(20) DEFAULT NULL,
  `int_price` int(20) DEFAULT NULL,
  `vchr_specifications` varchar(20) DEFAULT NULL,
  `vchr_description` varchar(20) DEFAULT NULL,
  `int_quantity_available` int(10) DEFAULT NULL,
  `fk_int_cat_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_credit_card_details`
--

CREATE TABLE IF NOT EXISTS `tbl_credit_card_details` (
  `pk_cr_name` varchar(20) NOT NULL,
  `int_card_no` int(20) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `fk_vchr_cr_user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `pk_vchr_customer_id` varchar(20) NOT NULL,
  `fk_int_customer_id` int(10) DEFAULT NULL,
  `vchr_customer_name` varchar(20) DEFAULT NULL,
  `vchr_customer_email` varchar(20) DEFAULT NULL,
  `vchr_customer_password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE IF NOT EXISTS `tbl_order_details` (
  `pk_int_order_id` int(10) NOT NULL DEFAULT '0',
  `fk_vchr_user_id` varchar(20) DEFAULT NULL,
  `vchr_receiver_address` varchar(200) DEFAULT NULL,
  `purchse_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase`
--

CREATE TABLE IF NOT EXISTS `tbl_purchase` (
`pk_int_purchase_id` int(10) NOT NULL,
  `fk_int_product_id` int(10) DEFAULT NULL,
  `vchr_purchase_item` varchar(20) DEFAULT NULL,
  `int_total_price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopping_cart`
--

CREATE TABLE IF NOT EXISTS `tbl_shopping_cart` (
`pk_int_cart_id` int(10) NOT NULL,
  `fk_int_pdt_id` int(10) DEFAULT NULL,
  `int_price` int(20) DEFAULT NULL,
  `int_date` date DEFAULT NULL,
  `fk_vchr_user_id` varchar(20) DEFAULT NULL,
  `int_quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sign_up`
--

CREATE TABLE IF NOT EXISTS `tbl_sign_up` (
`pk_int_s_id` int(10) NOT NULL,
  `vchr_name` varchar(20) DEFAULT NULL,
  `vchr_gender` varchar(20) DEFAULT NULL,
  `vchr_address` varchar(20) DEFAULT NULL,
  `vchr_email` varchar(20) DEFAULT NULL,
  `vchr_mobile` varchar(20) DEFAULT NULL,
  `vchr_password` varchar(20) DEFAULT NULL,
  `vchr_status` varchar(10) DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
 ADD PRIMARY KEY (`pk_vchr_admin_id`), ADD UNIQUE KEY `vchr_admin_email` (`vchr_admin_email`), ADD UNIQUE KEY `vchr_admin_email_2` (`vchr_admin_email`), ADD KEY `fk_int_admin_id` (`fk_int_admin_id`);

--
-- Indexes for table `tbl_admin_add_category`
--
ALTER TABLE `tbl_admin_add_category`
 ADD PRIMARY KEY (`pk_int_cat_id`);

--
-- Indexes for table `tbl_admin_add_product`
--
ALTER TABLE `tbl_admin_add_product`
 ADD PRIMARY KEY (`pk_int_pdt_id`), ADD KEY `fk_int_cat_id` (`fk_int_cat_id`);

--
-- Indexes for table `tbl_credit_card_details`
--
ALTER TABLE `tbl_credit_card_details`
 ADD PRIMARY KEY (`pk_cr_name`), ADD KEY `fk_vchr_cr_user_id` (`fk_vchr_cr_user_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
 ADD PRIMARY KEY (`pk_vchr_customer_id`), ADD UNIQUE KEY `vchr_customer_email` (`vchr_customer_email`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
 ADD PRIMARY KEY (`pk_int_order_id`), ADD KEY `fk_vchr_user_id` (`fk_vchr_user_id`);

--
-- Indexes for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
 ADD PRIMARY KEY (`pk_int_purchase_id`), ADD KEY `fk_int_product_id` (`fk_int_product_id`);

--
-- Indexes for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
 ADD PRIMARY KEY (`pk_int_cart_id`), ADD KEY `fk_int_pdt_id` (`fk_int_pdt_id`), ADD KEY `fk_vchr_user_id` (`fk_vchr_user_id`);

--
-- Indexes for table `tbl_sign_up`
--
ALTER TABLE `tbl_sign_up`
 ADD PRIMARY KEY (`pk_int_s_id`), ADD UNIQUE KEY `vchr_email` (`vchr_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_add_category`
--
ALTER TABLE `tbl_admin_add_category`
MODIFY `pk_int_cat_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_admin_add_product`
--
ALTER TABLE `tbl_admin_add_product`
MODIFY `pk_int_pdt_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
MODIFY `pk_int_purchase_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
MODIFY `pk_int_cart_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sign_up`
--
ALTER TABLE `tbl_sign_up`
MODIFY `pk_int_s_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
ADD CONSTRAINT `tbl_admin_ibfk_1` FOREIGN KEY (`fk_int_admin_id`) REFERENCES `tbl_sign_up` (`pk_int_s_id`);

--
-- Constraints for table `tbl_admin_add_product`
--
ALTER TABLE `tbl_admin_add_product`
ADD CONSTRAINT `tbl_admin_add_product_ibfk_1` FOREIGN KEY (`fk_int_cat_id`) REFERENCES `tbl_admin_add_category` (`pk_int_cat_id`);

--
-- Constraints for table `tbl_credit_card_details`
--
ALTER TABLE `tbl_credit_card_details`
ADD CONSTRAINT `tbl_credit_card_details_ibfk_1` FOREIGN KEY (`fk_vchr_cr_user_id`) REFERENCES `tbl_customer` (`pk_vchr_customer_id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`fk_vchr_user_id`) REFERENCES `tbl_customer` (`pk_vchr_customer_id`);

--
-- Constraints for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
ADD CONSTRAINT `tbl_purchase_ibfk_1` FOREIGN KEY (`fk_int_product_id`) REFERENCES `tbl_admin_add_product` (`pk_int_pdt_id`);

--
-- Constraints for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
ADD CONSTRAINT `tbl_shopping_cart_ibfk_1` FOREIGN KEY (`fk_int_pdt_id`) REFERENCES `tbl_admin_add_product` (`pk_int_pdt_id`),
ADD CONSTRAINT `tbl_shopping_cart_ibfk_2` FOREIGN KEY (`fk_vchr_user_id`) REFERENCES `tbl_customer` (`pk_vchr_customer_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
