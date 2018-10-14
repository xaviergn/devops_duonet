-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2012 at 10:30 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb_zcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `xhd_comments`
--

CREATE TABLE IF NOT EXISTS `xhd_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `content` mediumtext,
  `author` varchar(50) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `website` varchar(250) NOT NULL,
  `date_born` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-visible, 1-blocked, 2-deleted',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xhd_menu`
--

CREATE TABLE IF NOT EXISTS `xhd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `menu` int(2) DEFAULT NULL,
  `place` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `xhd_menu`
--

INSERT INTO `xhd_menu` (`id`, `title`, `link`, `menu`, `place`) VALUES
(1, 'Home', '#', 0, 0),
(2, ' ', ' ', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xhd_posts`
--

CREATE TABLE IF NOT EXISTS `xhd_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `content` mediumtext,
  `author` varchar(250) DEFAULT NULL,
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Modification Date',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - post, -1- page.',
  `visibility` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-public, 1-private',
  `comments` tinyint(1) NOT NULL COMMENT '0- allowed, 1- not_allowed',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-visible, 1-modified, 2-blocked, 3-deleted',
  `date_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `xhd_posts`
--

INSERT INTO `xhd_posts` (`id`, `post_id`, `title`, `content`, `author`, `date_mod`, `type`, `visibility`, `comments`, `status`, `date_end`) VALUES
(1, 1, 'Your First Post!', '<p>What is ZCMS?<br><br>\r\nZCMS simplifies content management by offering an elegant user interface, flexible templating per page, simple user management and permissions. We keep the core CMS as light, fast and flexible as possible.<br>\r\n<br>\r\nZCMS requires Tomcat 7.0 and a MySQL database. It is distributed under the GNU General Public License version 3. The source will soon be available from ZCMSÂ´s Google Code project page.</p>', 'Rodrigo Villanueva Ceballos', '2012-06-15 21:29:38', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xhd_users`
--

CREATE TABLE IF NOT EXISTS `xhd_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `fist_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `signup_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - regular user, -1- admin.',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0- active, 1- banned, 2- deleted  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xhd_users`
--

INSERT INTO `xhd_users` (`id`, `email`, `fist_name`, `last_name`, `username`, `password`, `signup_date`, `type`, `status`) VALUES
(1, 'admin@email.com', 'Admin', 'Admin_Last_Name', 'admin', 'admin', '2012-06-15 17:00:06', 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
