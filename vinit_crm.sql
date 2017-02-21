-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2017 at 11:26 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vinit_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `company_id`, `blocked`) VALUES
(1, 'admin', '1', 0),
(2, 'admin2', 'c12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `block_unblock_client_note`
--

CREATE TABLE IF NOT EXISTS `block_unblock_client_note` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block_unblock_client_note`
--

INSERT INTO `block_unblock_client_note` (`client_id`, `user_id`, `note`, `loggedTime`, `blocked`) VALUES
(16, 1, 'block', '2017-02-03 12:45:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `client_id`, `name`, `location`) VALUES
(26, 15, 'london', 'london'),
(27, 16, 'london', 'london'),
(28, 17, 'aus', 'aus'),
(29, 18, 'london', 'london'),
(30, 18, 'AUS', 'AUS');

-- --------------------------------------------------------

--
-- Stand-in structure for view `call_history`
--
CREATE TABLE IF NOT EXISTS `call_history` (
`subject` varchar(255)
,`content` varchar(1000)
,`type` varchar(4)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `call_record`
--

CREATE TABLE IF NOT EXISTS `call_record` (
  `call_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `description` varchar(1250) DEFAULT NULL,
  `time_duration` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`call_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `web_site` varchar(255) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `mlr_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `business_registration` varchar(255) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo` blob,
  `support_time` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `stage_id` (`stage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `company_name`, `address`, `contact_person_name`, `web_site`, `stage_id`, `country`, `town`, `mlr_number`, `postal_code`, `business_registration`, `logo_file_name`, `logo`, `support_time`, `blocked`) VALUES
(15, 'test', '', 'person', '', 1, 'United Kingdom', '', '', 'null', '', '', NULL, 300, 0),
(16, 'test2', '', '', '', 1, 'United Kingdom', '', '', 'null', '', '', NULL, NULL, 1),
(17, 'test 2', '', '', '', 1, 'United Kingdom', '', '', 'null', '', '', NULL, NULL, 0),
(18, 'client 18', '', '', '', 1, 'United Kingdom', '', '', 'null', '', '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_blocked_history`
--
CREATE TABLE IF NOT EXISTS `client_blocked_history` (
`subject` varchar(14)
,`content` varchar(1000)
,`type` varchar(7)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `client_branch_add_history`
--
CREATE TABLE IF NOT EXISTS `client_branch_add_history` (
`subject` varchar(268)
,`content` varchar(255)
,`type` varchar(12)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_branch_log`
--

CREATE TABLE IF NOT EXISTS `client_branch_log` (
  `client_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_branch_log`
--

INSERT INTO `client_branch_log` (`client_id`, `branch_id`, `branch_added`, `user_id`, `loggedTime`) VALUES
(15, 26, 1, 1, '2017-01-29 08:30:18'),
(16, 27, 1, 1, '2017-01-31 18:58:10'),
(17, 28, 1, 1, '2017-01-31 18:58:50'),
(18, 29, 1, 1, '2017-02-04 06:29:22'),
(18, 30, 1, 1, '2017-02-04 10:42:38');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_branch_remove_history`
--
CREATE TABLE IF NOT EXISTS `client_branch_remove_history` (
`subject` varchar(270)
,`content` varchar(255)
,`type` varchar(14)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_call`
--

CREATE TABLE IF NOT EXISTS `client_call` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `call_time` int(11) DEFAULT NULL,
  `call_description` varchar(1000) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_fax`
--

CREATE TABLE IF NOT EXISTS `client_fax` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `fax` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`,`fax`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_mail`
--

CREATE TABLE IF NOT EXISTS `client_mail` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`,`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_mail`
--

INSERT INTO `client_mail` (`client_id`, `mail`) VALUES
(15, 'chamupathi.12@cse.mrt.ac.lk'),
(15, 'chamupathi2008@gmail.com'),
(16, 'cham'),
(17, 'chamupathi2008@gmail.com'),
(18, 'chamupathi.12@cse.mrt.ac.lk');

-- --------------------------------------------------------

--
-- Table structure for table `client_note`
--

CREATE TABLE IF NOT EXISTS `client_note` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `note` varchar(1000) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_phone`
--

CREATE TABLE IF NOT EXISTS `client_phone` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_product`
--

CREATE TABLE IF NOT EXISTS `client_product` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `product_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`product_Id`),
  KEY `product_Id` (`product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_product`
--

INSERT INTO `client_product` (`client_id`, `product_Id`) VALUES
(15, 2),
(16, 2),
(17, 2),
(18, 3),
(18, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_product_added_history`
--
CREATE TABLE IF NOT EXISTS `client_product_added_history` (
`subject` varchar(269)
,`content` varchar(255)
,`type` varchar(13)
,`id` int(11)
,`client_id` int(11)
,`branchName` char(0)
,`productName` varchar(255)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_product_log`
--

CREATE TABLE IF NOT EXISTS `client_product_log` (
  `client_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_product_log`
--

INSERT INTO `client_product_log` (`client_id`, `product_id`, `product_added`, `user_id`, `loggedTime`) VALUES
(15, 2, 1, 1, '2017-01-29 08:30:09'),
(16, 2, 1, 1, '2017-01-31 18:58:00'),
(17, 2, 1, 1, '2017-01-31 18:58:43'),
(18, 3, 1, 1, '2017-02-04 06:29:06'),
(18, 4, 1, 1, '2017-02-04 10:42:30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_product_removed_history`
--
CREATE TABLE IF NOT EXISTS `client_product_removed_history` (
`subject` varchar(271)
,`content` varchar(255)
,`type` varchar(15)
,`id` int(11)
,`client_id` int(11)
,`branchName` char(0)
,`productName` varchar(255)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `client_till_log`
--

CREATE TABLE IF NOT EXISTS `client_till_log` (
  `client_id` int(11) NOT NULL,
  `till_id` int(11) NOT NULL,
  `till_added` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  KEY `client_id` (`client_id`),
  KEY `till_id` (`till_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_till_log`
--

INSERT INTO `client_till_log` (`client_id`, `till_id`, `till_added`, `user_id`, `loggedTime`) VALUES
(15, 50, 1, 1, '2017-01-29 08:30:45'),
(15, 51, 1, 1, '2017-01-31 08:25:00'),
(18, 52, 1, 1, '2017-02-04 06:29:39'),
(18, 53, 1, 1, '2017-02-04 06:30:11'),
(18, 54, 1, 1, '2017-02-04 10:42:57'),
(17, 55, 1, 1, '2017-02-05 07:44:51');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_unblocked_history`
--
CREATE TABLE IF NOT EXISTS `client_unblocked_history` (
`subject` varchar(16)
,`content` varchar(1000)
,`type` varchar(9)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `ticket_id` int(11) NOT NULL,
  `sender_role` varchar(10) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`ticket_id`, `sender_role`, `sender_name`, `message`, `timestamp`) VALUES
(1, 'OPERATOR', 'chamop', 'this is the first comment on this ticket\n', '2017-01-14 06:07:48'),
(1, 'OPERATOR', 'chamop', 'this is the second comment', '2017-01-14 06:08:01'),
(1, 'DEVELOPER', 'chamdev', 'I have started working on this ticket', '2017-01-14 06:09:37'),
(1, 'DEVELOPER', 'chamdev', 'changed the ticket status to in progress from open\n', '2017-01-14 06:10:22'),
(1, 'OPERATOR', 'chamop', 'Good I will be following this thread', '2017-01-14 06:11:09'),
(2, 'OPERATOR', 'chamop', 'the ticket is overdue', '2017-01-14 06:12:05'),
(1, 'DEVELOPER', 'chamdev', 'ajabu', '2017-01-14 08:26:53'),
(1, 'OPERATOR', 'chamop', 'kawda ajabu', '2017-01-14 08:27:16'),
(1, 'DEVELOPER', 'chamdev', 'bukku\n', '2017-01-14 08:27:49'),
(18, 'OPERATOR', 'chamop', 'initial comment', '2017-01-14 09:44:56'),
(18, 'OPERATOR', 'chamop', 'comment 2', '2017-01-14 10:05:37'),
(1, 'DEVELOPER', 'chamdev', 'Fixed\n', '2017-01-15 21:29:06'),
(18, 'ADMIN', 'admin', 'comment 3\n', '2017-01-16 13:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `customer_stage`
--

CREATE TABLE IF NOT EXISTS `customer_stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` varchar(255) NOT NULL,
  `stage_color` varchar(255) NOT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_stage`
--

INSERT INTO `customer_stage` (`stage_id`, `stage`, `stage_color`) VALUES
(1, 'potential', 'yellow'),
(2, 'pre-sale', 'brown'),
(3, 'existing', 'green'),
(4, 'old', 'brown');

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE IF NOT EXISTS `developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`id`, `name`, `company_id`, `blocked`) VALUES
(1, 'developer 1', 'developer 1 company Id', 0),
(2, 'developer 2', 'developer 2 company id', 0),
(3, 'chamdev', '1234', 0),
(4, 'cham', '001', 0),
(5, 'ch', '1', 0),
(6, 'ch', '1', 0),
(7, 'ch', '1', 0),
(8, 'ch', '1', 0),
(9, 'k', 'k10', 1),
(10, 'chamupathi', 'id1', 1),
(11, 'ch', '2', 0),
(12, 'ch', '2', 0),
(13, 'cha', 'ch2', 1),
(14, 'testdev', '89', 0),
(15, 'testdev', '90', 0),
(16, 'd', 'd', 0),
(17, 'd', 'kl', 0),
(18, 'jk', 'jk', 0),
(19, 'lkjl', '0i-0i', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `note_history`
--
CREATE TABLE IF NOT EXISTS `note_history` (
`subject` varchar(255)
,`content` varchar(1000)
,`type` varchar(4)
,`id` char(0)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE IF NOT EXISTS `operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `name`, `company_id`, `blocked`) VALUES
(1, 'chamop', '12', 0),
(2, 'ch', 'ch', 1),
(3, 'd', 'w', 0),
(4, 'd', 'df', 0),
(5, 'f', 'dsf', 0),
(6, 'k', 'kl', 0),
(7, 'sd', '32', 0),
(8, 'new', '12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE IF NOT EXISTS `priorities` (
  `priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `priority_name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`priority_id`, `priority_name`, `color`) VALUES
(1, 'LOW', 'green'),
(2, 'MEDIUM', 'yellow'),
(3, 'HIGH', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `problem_types`
--

CREATE TABLE IF NOT EXISTS `problem_types` (
  `problem_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_type_name` varchar(255) DEFAULT NULL,
  `problem_type_color` varchar(20) NOT NULL,
  PRIMARY KEY (`problem_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `problem_types`
--

INSERT INTO `problem_types` (`problem_type_id`, `problem_type_name`, `problem_type_color`) VALUES
(1, 'task', 'yellow'),
(2, 'bug', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_Id`, `name`, `description`) VALUES
(1, 'MX', 'MX'),
(2, 'MXP', 'MXP Description'),
(3, 'Money Xpress', 'Money Xpress'),
(4, 'Digital Display', 'Digital Display'),
(5, 'Web Sync', 'Web Sync'),
(6, 'Money Exchange web', 'Money Exchange web'),
(7, 'new prod', 'new prod'),
(8, 'my new prod', 'new description\n');

-- --------------------------------------------------------

--
-- Stand-in structure for view `single_ticket_data_view`
--
CREATE TABLE IF NOT EXISTS `single_ticket_data_view` (
`client_id` int(11)
,`problem_type_id` int(11)
,`problem_type_color` varchar(20)
,`priority_id` int(11)
,`swimlane_status_id` int(11)
,`swimlane_color` varchar(255)
,`ticket_id` int(11)
,`due_date` date
,`summary` varchar(255)
,`sceenshot_name` varchar(255)
,`description` varchar(1100)
,`problem_type_name` varchar(255)
,`priority_name` varchar(255)
,`priority_color` varchar(255)
,`swimlane_status` varchar(255)
,`till_id` int(11)
,`till_name` varchar(255)
,`product_name` varchar(255)
,`product_Id` int(11)
,`branch_id` int(11)
,`expiredate` date
,`location` varchar(255)
,`developer_name` varchar(255)
,`assignee_id` int(11)
,`company_name` varchar(255)
,`user_id` int(11)
,`added_date_time` varchar(10)
);
-- --------------------------------------------------------

--
-- Table structure for table `superadmins`
--

CREATE TABLE IF NOT EXISTS `superadmins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `superadmins`
--

INSERT INTO `superadmins` (`id`, `name`, `company_id`, `blocked`) VALUES
(1, 'VINIT SUPERADMIN', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `support_contract`
--

CREATE TABLE IF NOT EXISTS `support_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_file_name` varchar(255) DEFAULT NULL,
  `contract` blob,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `swimlane_change_mail`
--

CREATE TABLE IF NOT EXISTS `swimlane_change_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `swimlane_status_id` int(11) DEFAULT NULL,
  `mail_subject` varchar(300) DEFAULT NULL,
  `mail_template` varchar(2550) DEFAULT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `swimlane_status_id` (`swimlane_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `swimlane_change_mail`
--

INSERT INTO `swimlane_change_mail` (`mail_id`, `swimlane_status_id`, `mail_subject`, `mail_template`) VALUES
(1, 1, 'ticket status changed to open', 'hi $COMPANY_NAME,<br>\nyour ticket $TICKET_ID is changed to the status of open.\nthank you\nvinit team\n\nthis is an automated mail and do not reply to this mail'),
(2, 2, 'ticket status changed to "in progress"', 'ticket status changed to "in progress"'),
(3, 3, 'test', 'test'),
(4, 4, 'ticket TKT$TICKET_ID''s status changed to Reopen', 'Hi,\n\nyour ticket TKT$TICKET_ID is changed to the status reopen.\n\nthanks,\n\nvinit team'),
(5, 5, 'ticket status changed to "Can''t reproduced"', 'test temp Ticket TKT$TICKET_ID''s status changed to Can''t reproduced'),
(6, 6, 'test', 'test'),
(7, 7, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `swimlane_status_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `till_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` varchar(1100) DEFAULT NULL,
  `problem_type_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sceenshot_name` varchar(255) DEFAULT NULL,
  `due_date` date NOT NULL,
  `added_date_time` timestamp NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `swimlane_status_id` (`swimlane_status_id`),
  KEY `client_id` (`client_id`),
  KEY `till_id` (`till_id`),
  KEY `problem_type_id` (`problem_type_id`),
  KEY `priority_id` (`priority_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `product_id` (`product_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `swimlane_status_id`, `client_id`, `till_id`, `summary`, `description`, `problem_type_id`, `priority_id`, `assignee_id`, `user_id`, `sceenshot_name`, `due_date`, `added_date_time`, `product_id`, `branch_id`) VALUES
(1, 4, 15, NULL, 'no till', 'des', 1, 1, 1, 8, NULL, '2017-11-30', '2017-01-30 03:31:02', 2, 26),
(3, 8, 18, NULL, 'summ', 'des', 1, 2, NULL, 18, NULL, '2017-02-18', '2017-02-04 06:31:21', 3, 29);

-- --------------------------------------------------------

--
-- Table structure for table `ticketswimlane`
--

CREATE TABLE IF NOT EXISTS `ticketswimlane` (
  `swimlane_id` int(11) NOT NULL AUTO_INCREMENT,
  `swimlane_status` varchar(255) NOT NULL,
  `swimlane_color` varchar(255) NOT NULL,
  PRIMARY KEY (`swimlane_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ticketswimlane`
--

INSERT INTO `ticketswimlane` (`swimlane_id`, `swimlane_status`, `swimlane_color`) VALUES
(1, 'open', 'open'),
(2, 'in progress', 'in_progress'),
(3, 'To be discussed', 'to_be_discussed'),
(4, 'Reopen', 'Reopen'),
(5, 'Can’t reproduced', 'cant_reproduced'),
(6, 'Duplicate', 'duplicate'),
(7, 'Fixed', 'fixed'),
(8, 'new', 'new');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ticket_create_history`
--
CREATE TABLE IF NOT EXISTS `ticket_create_history` (
`subject` varchar(255)
,`content` varchar(1100)
,`type` varchar(6)
,`id` int(11)
,`client_id` int(11)
,`branchName` char(0)
,`productName` char(0)
,`expireDate` char(0)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ticket_data_view`
--
CREATE TABLE IF NOT EXISTS `ticket_data_view` (
`client_id` int(11)
,`problem_type_id` int(11)
,`problem_type_color` varchar(20)
,`priority_id` int(11)
,`swimlane_status_id` int(11)
,`swimlane_color` varchar(255)
,`ticket_id` int(11)
,`summary` varchar(255)
,`sceenshot_name` varchar(255)
,`description` varchar(1100)
,`problem_type_name` varchar(255)
,`priority_name` varchar(255)
,`color` varchar(255)
,`swimlane_status` varchar(255)
,`till_id` int(11)
,`till_name` varchar(255)
,`product_name` varchar(255)
,`expiredate` date
,`location` varchar(255)
,`developer_name` varchar(255)
,`user_id` int(11)
,`added_date_time` varchar(10)
);
-- --------------------------------------------------------

--
-- Table structure for table `ticket_swimlane_log`
--

CREATE TABLE IF NOT EXISTS `ticket_swimlane_log` (
  `ticket_id` int(11) NOT NULL,
  `swimlane_status_id` int(11) DEFAULT NULL,
  `loggedTime` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  KEY `ticket_id` (`ticket_id`),
  KEY `swimlane_status_id` (`swimlane_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_swimlane_log`
--

INSERT INTO `ticket_swimlane_log` (`ticket_id`, `swimlane_status_id`, `loggedTime`, `user_id`) VALUES
(1, 1, '2017-01-30 03:31:02', 8),
(1, 3, '2017-01-30 03:41:16', 8),
(1, 3, '2017-01-30 03:42:01', 8),
(1, 2, '2017-01-30 03:42:22', 8),
(1, 5, '2017-01-30 03:44:35', 8),
(1, 6, '2017-01-30 03:48:57', 8),
(1, 2, '2017-01-30 03:50:51', 8),
(1, 4, '2017-01-30 03:54:05', 8),
(1, 5, '2017-01-30 03:54:42', 8),
(1, 6, '2017-01-30 03:55:40', 8),
(1, 1, '2017-01-30 03:56:41', 8),
(1, 2, '2017-01-30 03:57:48', 8),
(1, 3, '2017-01-30 03:58:44', 8),
(1, 1, '2017-01-30 04:00:29', 8),
(1, 2, '2017-01-30 04:01:08', 8),
(1, 3, '2017-01-30 04:02:59', 8),
(1, 3, '2017-01-30 04:03:58', 8),
(1, 4, '2017-01-30 04:05:47', 8),
(1, 5, '2017-01-30 04:15:40', 8),
(1, 2, '2017-01-30 04:18:13', 8),
(1, 3, '2017-01-30 04:21:14', 8),
(1, 4, '2017-01-30 04:45:02', 8),
(1, 2, '2017-01-30 04:46:07', 8),
(1, 2, '2017-01-30 04:54:35', 8),
(1, 1, '2017-01-30 04:54:59', 8),
(1, 3, '2017-01-30 05:00:03', 8),
(1, 1, '2017-01-30 05:04:11', 8),
(1, 2, '2017-01-30 05:10:45', 8),
(1, 4, '2017-01-30 05:13:47', 8),
(1, 3, '2017-01-30 05:16:20', 8),
(1, 3, '2017-01-30 05:17:55', 8),
(1, 1, '2017-01-30 05:23:20', 8),
(1, 2, '2017-01-30 05:24:13', 8),
(1, 3, '2017-01-30 05:31:29', 8),
(1, 1, '2017-01-30 05:33:01', 8),
(1, 3, '2017-01-30 05:36:53', 8),
(1, 3, '2017-01-30 05:37:41', 8),
(1, 2, '2017-01-30 05:47:27', 8),
(1, 4, '2017-01-30 05:49:00', 8),
(1, 3, '2017-01-30 05:50:15', 8),
(1, 3, '2017-01-30 06:20:06', 8),
(1, 4, '2017-01-30 17:05:32', 1),
(3, 1, '2017-02-04 06:31:21', 18),
(3, 1, '2017-02-04 06:48:23', 1),
(3, 8, '2017-02-04 06:48:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `till`
--

CREATE TABLE IF NOT EXISTS `till` (
  `till_id` int(11) NOT NULL AUTO_INCREMENT,
  `till_key` varchar(255) DEFAULT NULL,
  `till_name` varchar(255) NOT NULL,
  `expiredate` date DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `product_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`till_id`),
  KEY `client_id` (`client_id`),
  KEY `branch_id` (`branch_id`),
  KEY `product_Id` (`product_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `till`
--

INSERT INTO `till` (`till_id`, `till_key`, `till_name`, `expiredate`, `client_id`, `branch_id`, `product_Id`) VALUES
(50, 'key', 'till one', '2017-12-31', 15, 26, 2),
(51, 'key', 'till two', '2016-01-30', 15, 26, 2),
(52, 'key', 'till one', '2017-12-31', 18, 29, 3),
(53, 'kye2', 'name', '2017-12-31', 18, 29, 3),
(54, 'key', 'till two', '2017-12-31', 18, 30, 4),
(55, 'key', 'name', '2017-02-08', 17, 28, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `till_history`
--
CREATE TABLE IF NOT EXISTS `till_history` (
`subject` varchar(14)
,`content` char(0)
,`type` varchar(8)
,`id` int(11)
,`client_id` int(11)
,`branchName` varchar(255)
,`productName` varchar(255)
,`expireDate` varchar(10)
,`loggedTimeStamp` timestamp
,`loggedDate` varchar(10)
,`loggedTime` time
);
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(100) NOT NULL,
  `has_logged_in` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `has_logged_in`) VALUES
(1, 'chamop', 'sha1$c1e6309e$1$0823e0446549843de46ba88020c01b6ddc8bd368', 'OPERATOR', 1),
(1, 'chamop', 'sha1$c1e6309e$1$0823e0446549843de46ba88020c01b6ddc8bd368', 'OPERATOR', 1),
(0, 'test', '1234', 'OPERATOR', 0),
(2, 'test', '1234', 'OPERATOR', 0),
(14, 'abcd', 'sha1$cc5d7e2a$1$310b74c08f4f41299ad439b39b4021f1e6019f50', 'CLIENT', 0),
(1, 'cham1', 'sha1$00fc38aa$1$1db218e3d175f8ae1ad46e93a1ce4738a8413436', 'ADMIN', 1),
(1, 'cham1', 'sha1$00fc38aa$1$1db218e3d175f8ae1ad46e93a1ce4738a8413436', 'ADMIN', 1),
(1, 'chamop', 'sha1$c1e6309e$1$0823e0446549843de46ba88020c01b6ddc8bd368', 'OPERATOR', 1),
(3, 'chamdev', 'sha1$58cb0b69$1$79d1ce16e9405c3df9a34f2a818ecc8d97515fbe', 'DEVELOPER', 1),
(2, 'cham', 'sha1$c1e6309e$1$0823e0446549843de46ba88020c01b6ddc8bd368', 'ADMIN', 1),
(4, 'CRM_DEVELOPER_USERNAME_4', 'sha1$430cda67$1$169a1133b47b60b757ab02008d1d480c45bf7bc4', 'DEVELOPER', 0),
(5, 'CRM_DEVELOPER_USERNAME_5', 'sha1$d470e54c$1$79454689e95de224013d2ad386d644febabdc060', 'DEVELOPER', 0),
(6, 'CRM_DEVELOPER_USERNAME_6', 'sha1$42de9ea7$1$ab8900e6a91d9b6ea35fa6affad29da7ea4b319b', 'DEVELOPER', 0),
(7, 'CRM_DEVELOPER_USERNAME_7', 'sha1$c19e64bc$1$77506bdf6fa01d653bdb9adbaa46e95d89c649b0', 'DEVELOPER', 0),
(8, 'CRM_DEVELOPER_USERNAME_8', 'sha1$f37dbfbd$1$eb746d0d41745cf93a8b1c64e1e04ddaee96f3ab', 'DEVELOPER', 0),
(9, 'koship', 'sha1$95f1aa52$1$09788a940d0d3b2dc85d3df345dd102790d76016', 'DEVELOPER', 1),
(10, 'CRM_DEVELOPER_USERNAME_10', 'sha1$5887f994$1$ca72ddefd4e057cd58303be997d75c01bfe99a9b', 'DEVELOPER', 0),
(11, 'CRM_DEVELOPER_USERNAME_11', 'sha1$493a36fb$1$e154e2ab6f7b59bda75edf78aa3abf081b164214', 'DEVELOPER', 0),
(12, 'CRM_DEVELOPER_USERNAME_12', 'sha1$cf96b096$1$cca069db83883bf08f87c76a0e6c96a23ac29032', 'DEVELOPER', 0),
(2, 'CRM_OPERATOR_USERNAME_2', 'sha1$52262b95$1$ea47eefeb1d922c8fc529ce81bf141a3297e087f', 'OPERATOR', 0),
(13, 'CRM_DEVELOPER_USERNAME_13', 'sha1$ca2f4a78$1$9a74d4afdd53233dc7fe050c7a12d3048c6aa508', 'DEVELOPER', 0),
(14, 'abc', 'sha1$2669f409$1$173d129f83f5776e99962245493404132e3089dd', 'DEVELOPER', 0),
(15, 'CRM_DEVELOPER_USERNAME_15', 'sha1$d49c9233$1$a754b53eff03793e81bd1e1bcf76bcb3a13430b4', 'DEVELOPER', 0),
(16, 'CRM_DEVELOPER_USERNAME_16', 'sha1$128a3cc3$1$c97b61e26eef7286d3e22819ad6273dd60c10e2a', 'DEVELOPER', 0),
(17, 'CRM_DEVELOPER_USERNAME_17', 'sha1$4ee4a183$1$4d6530b4f91eb62f88f70aeac33318ba807ce3da', 'DEVELOPER', 0),
(3, 'CRM_OPERATOR_USERNAME_3', 'sha1$98c949a5$1$1dcb2b1be9aa621997fa88437e0f1ea4e4f93e13', 'OPERATOR', 0),
(18, 'CRM_DEVELOPER_USERNAME_18', 'sha1$59b38c87$1$b276bf7b0a5a36454fa15986be7db6ae04038854', 'DEVELOPER', 0),
(4, 'CRM_OPERATOR_USERNAME_4', 'sha1$4bf5cc18$1$e67d25b17ef0828e7eafdf64c185e8331915f97b', 'OPERATOR', 0),
(5, 'CRM_OPERATOR_USERNAME_5', 'sha1$22e8caf2$1$40c17195bf6e886a57fdd8c899bec0626ee6efe2', 'OPERATOR', 0),
(6, 'CRM_OPERATOR_USERNAME_6', 'sha1$4cbcf78a$1$03cd1f281eafcc44ea5920372386166816383f2b', 'OPERATOR', 0),
(7, 'CRM_OPERATOR_USERNAME_7', 'sha1$040d5abd$1$b6b9317043b8bf43239ba92a80a57f2bc0f657fa', 'OPERATOR', 0),
(19, 'CRM_DEVELOPER_USERNAME_19', 'sha1$09340787$1$79179152ba969c14ce56f1ca16b4ee67b507408b', 'DEVELOPER', 0),
(15, 'C_CLT_U_15', 'sha1$ca798d86$1$25be2bdf99422b25d6db7a4c2fc862efa07606a1', 'CLIENT', 0),
(8, 'new user', 'sha1$7a5e25b5$1$95c6a8fa07d3767b91e8f18c6efd1be453cd9836', 'OPERATOR', 1),
(16, 'C_CLT_U_16', 'sha1$9cefc62a$1$054b5213f1a3c51af2567bbe54172d81ee13182f', 'CLIENT', 0),
(17, 'client1', 'sha1$5ce2b1e1$1$4a93cfea4168663c890e48eebfaa9feeae3a6937', 'CLIENT', 1),
(18, 'client18', 'sha1$cb9adecb$1$a36e74681df62b491bfad1a2014efdc0f333efc5', 'CLIENT', 1),
(1, 'super', 'sha1$3eaa8d0e$1$9eba8811d9dff8b699c065d2824a0ba801a19b57', 'SUPER_ADMIN', 1),
(2, 'C_AD_U_2', 'sha1$b1dd7d06$1$3672077e9934389c9b17e423a8a7898d96372ee4', 'ADMIN', 0);

-- --------------------------------------------------------

--
-- Structure for view `call_history`
--
DROP TABLE IF EXISTS `call_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `call_history` AS select `client_call`.`subject` AS `subject`,`client_call`.`call_description` AS `content`,'call' AS `type`,'' AS `id`,`client_call`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_call`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_call`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_call`.`loggedTime` as time) AS `loggedTime` from `client_call`;

-- --------------------------------------------------------

--
-- Structure for view `client_blocked_history`
--
DROP TABLE IF EXISTS `client_blocked_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_blocked_history` AS select 'Client Blocked' AS `subject`,`block_unblock_client_note`.`note` AS `content`,'blocked' AS `type`,'' AS `id`,`block_unblock_client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`block_unblock_client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`block_unblock_client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`block_unblock_client_note`.`loggedTime` as time) AS `loggedTime` from `block_unblock_client_note` where (`block_unblock_client_note`.`blocked` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_branch_add_history`
--
DROP TABLE IF EXISTS `client_branch_add_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_branch_add_history` AS select concat('Branch ',`branch`.`name`,' Added') AS `subject`,`branch`.`name` AS `content`,'branch-added' AS `type`,`branch`.`branch_id` AS `id`,`client_branch_log`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_branch_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_branch_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_branch_log`.`loggedTime` as time) AS `loggedTime` from (`client_branch_log` join `branch` on((`branch`.`branch_id` = `client_branch_log`.`branch_id`))) where (`client_branch_log`.`branch_added` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_branch_remove_history`
--
DROP TABLE IF EXISTS `client_branch_remove_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_branch_remove_history` AS select concat('Branch ',`branch`.`name`,' Removed') AS `subject`,`branch`.`name` AS `content`,'branch-removed' AS `type`,`branch`.`branch_id` AS `id`,`client_branch_log`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_branch_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_branch_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_branch_log`.`loggedTime` as time) AS `loggedTime` from (`client_branch_log` join `branch` on((`branch`.`branch_id` = `client_branch_log`.`branch_id`))) where (`client_branch_log`.`branch_added` = 0);

-- --------------------------------------------------------

--
-- Structure for view `client_product_added_history`
--
DROP TABLE IF EXISTS `client_product_added_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_product_added_history` AS select concat('Product ',`products`.`name`,' Added') AS `subject`,`products`.`description` AS `content`,'product-added' AS `type`,`products`.`product_Id` AS `id`,`client_product_log`.`client_id` AS `client_id`,'' AS `branchName`,`products`.`name` AS `productName`,'' AS `expireDate`,`client_product_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_product_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_product_log`.`loggedTime` as time) AS `loggedTime` from (`client_product_log` join `products` on((`products`.`product_Id` = `client_product_log`.`product_id`))) where (`client_product_log`.`product_added` = 1);

-- --------------------------------------------------------

--
-- Structure for view `client_product_removed_history`
--
DROP TABLE IF EXISTS `client_product_removed_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_product_removed_history` AS select concat('Product ',`products`.`name`,' removed') AS `subject`,`products`.`description` AS `content`,'product-removed' AS `type`,`products`.`product_Id` AS `id`,`client_product_log`.`client_id` AS `client_id`,'' AS `branchName`,`products`.`name` AS `productName`,'' AS `expireDate`,`client_product_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_product_log`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_product_log`.`loggedTime` as time) AS `loggedTime` from (`client_product_log` join `products` on((`products`.`product_Id` = `client_product_log`.`product_id`))) where (`client_product_log`.`product_added` = 0);

-- --------------------------------------------------------

--
-- Structure for view `client_unblocked_history`
--
DROP TABLE IF EXISTS `client_unblocked_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_unblocked_history` AS select 'Client Unblocked' AS `subject`,`block_unblock_client_note`.`note` AS `content`,'unblocked' AS `type`,'' AS `id`,`block_unblock_client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`block_unblock_client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`block_unblock_client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`block_unblock_client_note`.`loggedTime` as time) AS `loggedTime` from `block_unblock_client_note` where (`block_unblock_client_note`.`blocked` = 0);

-- --------------------------------------------------------

--
-- Structure for view `note_history`
--
DROP TABLE IF EXISTS `note_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `note_history` AS select `client_note`.`subject` AS `subject`,`client_note`.`note` AS `content`,'note' AS `type`,'' AS `id`,`client_note`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`client_note`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_note`.`loggedTime` as date),'') AS `loggedDate`,cast(`client_note`.`loggedTime` as time) AS `loggedTime` from `client_note`;

-- --------------------------------------------------------

--
-- Structure for view `single_ticket_data_view`
--
DROP TABLE IF EXISTS `single_ticket_data_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `single_ticket_data_view` AS select `tickets`.`client_id` AS `client_id`,`tickets`.`problem_type_id` AS `problem_type_id`,`problem_types`.`problem_type_color` AS `problem_type_color`,`tickets`.`priority_id` AS `priority_id`,`tickets`.`swimlane_status_id` AS `swimlane_status_id`,`ticketswimlane`.`swimlane_color` AS `swimlane_color`,`tickets`.`ticket_id` AS `ticket_id`,`tickets`.`due_date` AS `due_date`,`tickets`.`summary` AS `summary`,`tickets`.`sceenshot_name` AS `sceenshot_name`,`tickets`.`description` AS `description`,`problem_types`.`problem_type_name` AS `problem_type_name`,`priorities`.`priority_name` AS `priority_name`,`priorities`.`color` AS `priority_color`,`ticketswimlane`.`swimlane_status` AS `swimlane_status`,`tickets`.`till_id` AS `till_id`,`till`.`till_name` AS `till_name`,`products`.`name` AS `product_name`,`products`.`product_Id` AS `product_Id`,`branch`.`branch_id` AS `branch_id`,`till`.`expiredate` AS `expiredate`,`branch`.`location` AS `location`,`developers`.`name` AS `developer_name`,`tickets`.`assignee_id` AS `assignee_id`,`client`.`company_name` AS `company_name`,`tickets`.`user_id` AS `user_id`,concat(cast(`tickets`.`added_date_time` as date),'') AS `added_date_time` from ((((((((`tickets` join `ticketswimlane` on((`tickets`.`swimlane_status_id` = `ticketswimlane`.`swimlane_id`))) join `priorities` on((`tickets`.`priority_id` = `priorities`.`priority_id`))) join `problem_types` on((`tickets`.`problem_type_id` = `problem_types`.`problem_type_id`))) join `developers` on((`tickets`.`assignee_id` = `developers`.`id`))) join `till` on((`tickets`.`till_id` = `till`.`till_id`))) join `branch` on((`till`.`branch_id` = `branch`.`branch_id`))) join `products` on((`till`.`product_Id` = `products`.`product_Id`))) join `client` on((`tickets`.`client_id` = `client`.`client_id`)));

-- --------------------------------------------------------

--
-- Structure for view `ticket_create_history`
--
DROP TABLE IF EXISTS `ticket_create_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticket_create_history` AS select `tickets`.`summary` AS `subject`,`tickets`.`description` AS `content`,'ticket' AS `type`,`tickets`.`ticket_id` AS `id`,`tickets`.`client_id` AS `client_id`,'' AS `branchName`,'' AS `productName`,'' AS `expireDate`,`tickets`.`added_date_time` AS `loggedTimeStamp`,concat(cast(`tickets`.`added_date_time` as date),'') AS `loggedDate`,cast(`tickets`.`added_date_time` as time) AS `loggedTime` from `tickets`;

-- --------------------------------------------------------

--
-- Structure for view `ticket_data_view`
--
DROP TABLE IF EXISTS `ticket_data_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticket_data_view` AS select `tickets`.`client_id` AS `client_id`,`tickets`.`problem_type_id` AS `problem_type_id`,`problem_types`.`problem_type_color` AS `problem_type_color`,`tickets`.`priority_id` AS `priority_id`,`tickets`.`swimlane_status_id` AS `swimlane_status_id`,`ticketswimlane`.`swimlane_color` AS `swimlane_color`,`tickets`.`ticket_id` AS `ticket_id`,`tickets`.`summary` AS `summary`,`tickets`.`sceenshot_name` AS `sceenshot_name`,`tickets`.`description` AS `description`,`problem_types`.`problem_type_name` AS `problem_type_name`,`priorities`.`priority_name` AS `priority_name`,`priorities`.`color` AS `color`,`ticketswimlane`.`swimlane_status` AS `swimlane_status`,`tickets`.`till_id` AS `till_id`,`till`.`till_name` AS `till_name`,`products`.`name` AS `product_name`,`till`.`expiredate` AS `expiredate`,`branch`.`location` AS `location`,`developers`.`name` AS `developer_name`,`tickets`.`user_id` AS `user_id`,concat(cast(`tickets`.`added_date_time` as date),'') AS `added_date_time` from (((((((`tickets` join `ticketswimlane` on((`tickets`.`swimlane_status_id` = `ticketswimlane`.`swimlane_id`))) join `priorities` on((`tickets`.`priority_id` = `priorities`.`priority_id`))) join `problem_types` on((`tickets`.`problem_type_id` = `problem_types`.`problem_type_id`))) join `developers` on((`tickets`.`assignee_id` = `developers`.`id`))) join `till` on((`tickets`.`till_id` = `till`.`till_id`))) join `branch` on((`till`.`branch_id` = `branch`.`branch_id`))) join `products` on((`till`.`product_Id` = `products`.`product_Id`)));

-- --------------------------------------------------------

--
-- Structure for view `till_history`
--
DROP TABLE IF EXISTS `till_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `till_history` AS select 'new till added' AS `subject`,'' AS `content`,'till add' AS `type`,`till`.`till_id` AS `id`,`till`.`client_id` AS `client_id`,`branch`.`name` AS `branchName`,`products`.`name` AS `productName`,concat(cast(`till`.`expiredate` as date),'') AS `expireDate`,`client_till_log`.`loggedTime` AS `loggedTimeStamp`,concat(cast(`client_till_log`.`loggedTime` as date)) AS `loggedDate`,cast(`client_till_log`.`loggedTime` as time) AS `loggedTime` from (((`client_till_log` join `till` on((`till`.`till_id` = `client_till_log`.`till_id`))) join `branch` on((`branch`.`branch_id` = `till`.`branch_id`))) join `products` on((`products`.`product_Id` = `till`.`product_Id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_unblock_client_note`
--
ALTER TABLE `block_unblock_client_note`
  ADD CONSTRAINT `block_unblock_client_note_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `call_record`
--
ALTER TABLE `call_record`
  ADD CONSTRAINT `call_record_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `customer_stage` (`stage_id`);

--
-- Constraints for table `client_branch_log`
--
ALTER TABLE `client_branch_log`
  ADD CONSTRAINT `client_branch_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_branch_log_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `client_call`
--
ALTER TABLE `client_call`
  ADD CONSTRAINT `client_call_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_fax`
--
ALTER TABLE `client_fax`
  ADD CONSTRAINT `client_fax_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_mail`
--
ALTER TABLE `client_mail`
  ADD CONSTRAINT `client_mail_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_note`
--
ALTER TABLE `client_note`
  ADD CONSTRAINT `client_note_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_phone`
--
ALTER TABLE `client_phone`
  ADD CONSTRAINT `client_phone_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `client_product`
--
ALTER TABLE `client_product`
  ADD CONSTRAINT `client_product_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_product_ibfk_2` FOREIGN KEY (`product_Id`) REFERENCES `products` (`product_Id`);

--
-- Constraints for table `client_product_log`
--
ALTER TABLE `client_product_log`
  ADD CONSTRAINT `client_product_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_product_log_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_Id`);

--
-- Constraints for table `client_till_log`
--
ALTER TABLE `client_till_log`
  ADD CONSTRAINT `client_till_log_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `client_till_log_ibfk_2` FOREIGN KEY (`till_id`) REFERENCES `till` (`till_id`);

--
-- Constraints for table `support_contract`
--
ALTER TABLE `support_contract`
  ADD CONSTRAINT `support_contract_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `swimlane_change_mail`
--
ALTER TABLE `swimlane_change_mail`
  ADD CONSTRAINT `swimlane_change_mail_ibfk_1` FOREIGN KEY (`swimlane_status_id`) REFERENCES `ticketswimlane` (`swimlane_id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`swimlane_status_id`) REFERENCES `ticketswimlane` (`swimlane_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`till_id`) REFERENCES `till` (`till_id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`problem_type_id`) REFERENCES `problem_types` (`problem_type_id`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`priority_id`),
  ADD CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`assignee_id`) REFERENCES `developers` (`id`),
  ADD CONSTRAINT `tickets_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_Id`),
  ADD CONSTRAINT `tickets_ibfk_8` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `ticket_swimlane_log`
--
ALTER TABLE `ticket_swimlane_log`
  ADD CONSTRAINT `ticket_swimlane_log_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  ADD CONSTRAINT `ticket_swimlane_log_ibfk_2` FOREIGN KEY (`swimlane_status_id`) REFERENCES `ticketswimlane` (`swimlane_id`);

--
-- Constraints for table `till`
--
ALTER TABLE `till`
  ADD CONSTRAINT `till_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `till_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `till_ibfk_3` FOREIGN KEY (`product_Id`) REFERENCES `products` (`product_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
