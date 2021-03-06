-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2018 at 02:48 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fet15015248`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `idCity` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `area` float NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  PRIMARY KEY (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`idCity`, `name`, `area`, `latitude`, `longitude`) VALUES
(1, 'Birmingham', 267.8, -1.89857, 52.4895),
(2, 'Chicago', 606.1, -87.6232, 41.8818);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `idComment` int(10) NOT NULL AUTO_INCREMENT,
  `idCity` int(10) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `idCity` (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flickr`
--

CREATE TABLE IF NOT EXISTS `flickr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(200) NOT NULL,
  `CAPTION` varchar(100) NOT NULL,
  `TIME_CACHED` date NOT NULL,
  `CITY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flickr`
--

INSERT INTO `flickr` (`ID`, `IMAGE_URL`, `CAPTION`, `TIME_CACHED`, `CITY_ID`) VALUES
(1, 'https://farm1.staticflickr.com/787/40820154181_2f07e7e82f_b.jpg', 'Inverted tides of Industry*', '2018-03-15', 1),
(2, 'https://farm5.staticflickr.com/4785/40777574852_159644fc5c_b.jpg', 'Edgbaston_Tunnel_1801', '2018-03-15', 1),
(3, 'https://farm1.staticflickr.com/821/39918505035_c606aecd8a_b.jpg', '#crcouses in my back garden', '2018-03-15', 1),
(4, 'https://farm1.staticflickr.com/787/39918504195_3d8f7d1fe6_b.jpg', 'Snowdrops in my back garden', '2018-03-15', 1),
(5, 'https://farm1.staticflickr.com/805/39918503595_8c3d97cc92_b.jpg', 'EI-FRJ Boeing 737-800 at high altitude a mile north west of Birmingham Airport', '2018-03-15', 1),
(6, 'https://farm5.staticflickr.com/4773/40102276404_dbae6cdf9f_b.jpg', 'National Express West Midlands ADL E40D/Enviro 400, 4939', '2018-03-15', 1),
(7, 'https://farm5.staticflickr.com/4776/26940217278_3d1f8dedec_b.jpg', 'Grand Central', '2018-03-15', 1),
(8, 'https://farm5.staticflickr.com/4779/40100357594_f7c4d38fba_b.jpg', '', '2018-03-15', 1),
(9, 'https://farm5.staticflickr.com/4776/26937708768_c7ffd2577c_b.jpg', 'Waylands Yard Coffee House', '2018-03-15', 1),
(10, 'https://farm5.staticflickr.com/4794/26937702578_30f24684fc_b.jpg', 'Waylands Yard Coffee House', '2018-03-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `idPlace` varchar(150) NOT NULL,
  `idCity` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `street_number` varchar(30) DEFAULT NULL,
  `route` varchar(30) DEFAULT NULL,
  `locality` varchar(30) DEFAULT NULL,
  `region` varchar(30) NOT NULL,
  `post_code` varchar(15) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  PRIMARY KEY (`idPlace`),
  KEY `idCity` (`idCity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`idPlace`, `idCity`, `name`, `url`, `floor`, `street_number`, `route`, `locality`, `region`, `post_code`, `phone`, `dateAdded`) VALUES
('ChIJ28wffZWxcEgRpCzENFGQfwg', 1, 'Coleshill Hotel', 'http://www.oldenglishinns.co.uk/coleshill/?utm_source=g_places&utm_medium=locations&utm_campaign=coleshill', NULL, NULL, NULL, NULL, 'England', 'B46 3BG', '01675 465527', '2018-03-15 14:47:16'),
('ChIJC4fq9DCWcEgRWNN0DcPyWZo', 1, 'Innkeeper''s Lodge Birmingham', 'https://www.innkeeperslodge.com/hotels/toby-carvery-quinton-birmingham?utm_source=google&utm_medium=organic&utm_campaign=gmb', NULL, '563', 'Hagley Rd W', 'Quinton', 'England', 'B32 1HP', '0845 112 6066', '2018-03-15 14:47:13'),
('ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1, 'Hotel ibis Birmingham Bordesley Circus', 'http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=2178&merchantid=seo-maps-GB-2178&sourceid=aw-cen', NULL, '1', 'Bordesley Park Rd', 'Bordesley Green', 'England', 'B10 0PD', '0121 506 2600', '2018-03-15 14:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `place_photos`
--

CREATE TABLE IF NOT EXISTS `place_photos` (
  `idPhoto` varchar(200) NOT NULL,
  `idPlace` varchar(150) NOT NULL,
  `maxWidth` int(10) NOT NULL,
  PRIMARY KEY (`idPhoto`),
  KEY `idPlace` (`idPlace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_photos`
--

INSERT INTO `place_photos` (`idPhoto`, `idPlace`, `maxWidth`) VALUES
('CmRaAAAA-6CsrstEUDAQfxqscFfFsgZzrYjc3NTqhi-LWiXa8B4lL__LIsG57hza6z9EnV2gfplXGhYaPhdi8a8GuGDfk2oKPS0Ryw5p9avKtrXF72EWWu_IiO5cMCEZKgYzgm2oEhDn7J2yQJgw6p41dERLLmuIGhS5aM4jWIHA_9vZkMN9gFceEZbhrQ', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1024),
('CmRaAAAA3Vfw2P7qRKzHicZU2WjbNvORVFgVqiYO0YVhoSRMsUbYEuGWOE1iXREPtdWFGzRLqR6P8cEzr9-jpiEBRJydkS9hQLkCQibikA1SR_6WmQQoGpZnUpqANNrEywJMkRLaEhAzFir3foYIuGYqRhDaKgIjGhROGwAU-Crao7_lDiW6AJmIOBBPyg', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 5312),
('CmRaAAAA6QR2SQ21LNca53Y9SQidxobyCDDKV6yUh7H16SWleJHWbArTCRw-5ZeeytB6YDi-AG6UHJqc1weisYHGs4hEh941Jv2KMVLAe9FzL8SzOONaGpD0ZwhkEMr4cuHOJjbiEhBnlUbAO50buAv_czGV2wqGGhTDQjIzjTNLi7PC8y76KND73RIhog', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 2322),
('CmRaAAAA7G8ApyUyA1LcyU6pkcjVo1QITrBNwxdVWyaM_syyaS81vR3KmHCbn1HpHcBvjHzftUBDqrTTd43izoqwhAj8jUemt6mPji3yH-DNBTSVzW28_oris9kbdWxdEQSS3zNAEhAn29oQkzpBoXqaC_sB8DgCGhQOdSUPlqqdZGUKG3GUelSoxVVrAQ', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 291),
('CmRaAAAA7k3I3hnO19dD6627KZ3xREZ-3cu-8rJS6DQRr8CKYmJdIqKxWYkNh37L0yno0xMWimm5vCIiyMddvi-F2mS8KzEP6iK8rP_H7a_bherlEBtY2IER11cHF-RJBY3X9L3FEhBU9qDV3SBqs7KO9vYhStGEGhRSTTFgRHzl3h0_SX_O-KDYTKMAIg', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 3264),
('CmRaAAAAacf2rQwuLB-dvqWbOxxaf6JQJr6tt1H1dV3-h1BdBmV9A9qe11OArnySsi0ObChXeA8s_i0lHgnqMgUESaW5AVHLjiBJSl7J89BZoU7hQ66pjt5xvzhQ308QyHKtsv_yEhDL3y27a3Ui1GGuUUP-0y2YGhQBgOCiikMFcscCQUUtYze8JyiZDw', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 3120),
('CmRaAAAABy5juaIzoNf6T-Nb-f7lkhLK955yv5lPSWaIdv_FLCePtikR3TTag7quziAWY-0g0PJTTMai9TGjgxng2PuFfAb7asydUH4E4t5KJrla-XPpfP4xqzzuRy7tj-xGJ5HpEhBHtHVjEi1ZUNDgqlRte9hBGhR9ducHA0EA02vDghYo5Cc_k6mjwg', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 5312),
('CmRaAAAADJtWnBRbvk66FjM_hvXsZx9VL7e2NC5sxR3hhc4ReZmx8ipKCoP3pMpWe92ysJ_5DFy58MsSiIXVbod6r3gXoHTCV4b5FseKlMNfrHo8IabN5vr-uw9TMy8lzHex1ktYEhAIi9G4I-tM1SI7ncCxBLqfGhQkYzrJmGRkDnv6PTXVLRfGKTz6Hg', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 4032),
('CmRaAAAAeRymsPShPoyudoIoXOZpjnXLeX4L85oToAnf3UDZm_IowGjxqHJwYhwBGckYds0ah9-CdgU2GI3Ye5Wwsa2Yw5HJj7Xqln2v1yi7kT6WQ7n62q0tFvOvbPzgi3nBxcYGEhAvtCmiHYlZVjyTMHLmiJAJGhSFpg8LYNJqpYilecKmsxJowfimVQ', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1024),
('CmRaAAAAGK8sf8XgKnRIQbqbkNy_F2RPAJsUAiFjxndfpI3rgHscla5U4USjpsp-yGMv-gNL6-NAxhM4EctV71o3B8-7JIbVXjn0s1t5ItdL1V8JtYv8MIBdRFp1pxErK4Y1giXlEhBT_mfnWDivjTjrMyPKcardGhTLr37SSM9G6UNeph0KHSpx0wCSPw', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 4032),
('CmRaAAAAjZ78rwDpRtvBgtel5CjT7Ek0oH7C6O0kgdFA8DrmFTPvKkcIY2MRh25udCryGiRxOGietIf2SbUotPNSxYkQmKB0WSxVYS_nFbceC01v5uzm5ZcFt1thS1zb-CiohJmyEhB2UPHtRHjy8R-inBjUBptbGhQ2NGCIjhRenkOhPxAjvMcWK289sg', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1024),
('CmRaAAAAK6Npi1LpjdgV3AZDC_gmwi5ddyl4op1OXo78CpV4ouhiV1mcaP7n55VKNzVQ3CU-suCavAhsLMvuMdMg8FCCnLI2YmcDLe9ljcSDyQFGDiSamarnsXU0CcQYyLP_P4XtEhBZU7bnVxoVIprwvQ0coD3xGhStIbttAEHAAxFGSDUU6IpYO3JP_w', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 3264),
('CmRaAAAALaRGAGQSQV3zyRcejrxQq-tVMiEzUOQSHR7aYs0MsYCROc5eyPnSnrxV3NRYVGsg81elcNBql6Ioe-zkU87KksoXPbNKce9tGa33lvS2mCnVt7XoHgqVj2UtDAb2ARu8EhBHOF77u-5SwReNZuAgthfYGhS__Sm6YHqi6Dg9s0FagySrapvBuQ', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 3120),
('CmRaAAAALEU7EMI-dkP-yvEQSgj_gtnd7FZKxMb-v12b8I28_7wwD8S5dWJPpzsFzm4Qv7QyVFgCTaVccIcq1jgHMNHLPdC5iW_0EFv0e_f7Y8DeJLGfDB97jEfvWjZCTEAmriMOEhCqkxxRbS4CbXzqQABeqn0aGhSwo-xdu3kVEL0oVKmFN3RlgJHudQ', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1024),
('CmRaAAAANJJGOHDSkeCqskYgHzNleF9Hue8OAWOV72i6sYJkdVSkE4Y1-crckV0O-0RaG-PCZ5pYbAjYJ9uxMxr1wNX2MdJwyUjSSvjroDz4HSceHMZlHpJErWsd_bDijMZWBCbmEhC7mgD1VWJmKNXXiO00s8NBGhS4ULBmAUcx-JHjP5V2VFNkhrVk5Q', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 3120),
('CmRaAAAAo4RmsRunaBDkwVevrejEvzhfyhO6TY9h-ziFbiGB9OYPZ1LuTfcMdqBzeW7Zu1J8tTODwuGOjCvDjJfYzP96s3_dFfsQJfZrgrJbA5IXU60ptZC8GOSiIcW0OOc5hjiCEhATKiIRSb2i7uRqYH8rd1xPGhTDQk19r8kVVbxQ3l8PqvOmUgSdDw', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 3264),
('CmRaAAAApdUZaJZcaJLzkn04NBIdmmZ2FgLR-N0fFXM9l2NY7GhxI25PUbxrPLG8ZaJf0Iz3z6SZtNcdvbbYLENHE7Cid3XduS8AKmxO-YUGgQvimbB87mnWcXr8gc1e07a6K5_iEhB37prAjPud_dksiAruci3MGhSdu9iDX4Tpcmb3y6zc5k3fWNy77A', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 980),
('CmRaAAAAQlgJcdbXLQmwZ3DLvgzztQhM3iZZWYol3fi3pUo7MlLk6Cu972xzK4AcOM8XCCM49Y4sW3fakULoAdETNLPSjG_XeYBywx2YggyntqkC9_FTMWjQ56zR6C8LRNLVsjvREhB_KbofKmi4lWJyg75l1lCvGhSM6nKcMMrFcvghFzujP3dkVj9YWQ', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 2368),
('CmRaAAAAqZvsJOCoNC2LD6dMgqPwX9hpRCZEKmu2JnBJSQXKQZktWQHR5UqHxUUr3yso-4fZXCxphFQFqhnhbv5zdRRqLIZoHjhasyeTomPEjuJQlWC8juBq1B9Ytd-60EBqESjIEhAmSSHhGAyhD4104H2eRUnQGhRdbBa0xBzFLv-vbO_6zCij-tKdtg', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 1024),
('CmRaAAAArjuYrNYGrJWmBUsSBOJfWUPkpbcdkV3Hmt9OKOqfKbB0jFJrpLbltw9BeTi2ieOFekWQuBpaoF-Ic9cfY8oCXmOdViJtBtlhEdg-TNo3D_yHK5yvAljmMcTJtVUfODAFEhB3zp5sqnhH90dFSV17EElHGhTTQDcXJvCaNr53MpnfCeYQUSv8og', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 3672),
('CmRaAAAArkAz66gkwO_0gOBOJzTqL-2er73QVyUzVEka9cyNQGKpJuAat8OYcJ2etkfstdw3nhOa562z9B4_CSejqH9U8AQScYGX-zmJqAM0Yo68KKJ2EGGxMlLTe5BrmgbbyTbCEhDDttLaXcmvujgpktHyVHUPGhSBndPKd872sUk5-24bwm8K9lvrSA', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 4032),
('CmRaAAAARKlKEappYIWs8Jd6J2kq3pst-61sBQdpmJGXBC4OtEnMfuVmDQ6M-B6g-fxSRn9PKrJ2hB2uZjiQlqiheXXSdeHK8_OLF8ai6ibyP0SX7P9zaMvVPRsk_glisrtdyWOyEhA3yrnVJk-Ft6fnlNSuE-GdGhTekIQSkD4WJ72NO2fE377mIm-S1Q', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 4032),
('CmRaAAAASnW6aZtqhbUugcOSiW31Uq-CaxWO7ZeL4UUCPUN5eWOa6yFf3oFAlY-oTG2xnBurqoXdE_Dh0g16-LenIQLBqgcQLFB4Ym7cX9VAOVouOsjRZ7XkHi3Uasp7pc0DiXKIEhDycRHIi77YHBmqeWmEHhEdGhS0JeQyZOdGy8VRN5ZCi1F8nkN8Mg', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 3264),
('CmRaAAAATAy_Yd5IUHcoKIGT6TVFrzriFclk_NFWP7Jz39doeRvbNfmIWj_HD8NpImvoAvn055yNj3o_5-mv1p7br61s4oMrjeQgjgIbQh1gTvBWm8rpXf47t9qHGx-D9U2qyM5wEhCWoQm8Qoe8mUcxT-4WVGBXGhQ169bVVMzo2q_LJqceOy2PUKePgg', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 4160),
('CmRaAAAAuF9U7NJXFNI3tIuGk3hsSFWf2F943yvIts2pJgI3zn29KSrTJAZRMtSDac1NZaG9_nAu-CSYe1zZdNhL6CxRtnIwXYSai8Qqh9OhoAj7i7gb_y4aAWBqe4w9Fvy2PmifEhCMFn4GzvTeGFQ7igv3XhzZGhTwVbmiN3FiwbhVqnuNhzY9QUIjnQ', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 3264),
('CmRaAAAAvhKfNUR38FgMdcOSQBIMln6nhMEPB3A0sAMIzssAmNCJpmZUp9dEUOsYsQkR79VZuCTulPgCWLeaepMbSpnO27V5M5m35qPCcF0EJR83E9HS3QaCbMefc3z3cgjJO7VyEhB71RGycXS8Bo2d53pDo4kIGhSdjOLTO_DIyIoLLfl9wfxW72ksNg', 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 4032),
('CmRaAAAAxTdEwqZ5pbsEPTumS8hWoouQTlWzHUy1KV3eSwCaYDqLaUdsEX9KAKFV-N5jerfv0TgEHpdnCVuW9mgy1u4142Z_l-ulkgKPViIlWQjHVwM7mn1NMFjXO28EQSYRnhsIEhCs-Dc_M7HBAtMCf9X41pWyGhSxbsAv55eLnty9GFIB6eVBTocUCg', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 4128),
('CmRaAAAAy6PkEUwKCKZj_zF6-AXCgue06F0O7c776idIPHSI-9UF91ANEksTtxMIhbrFYiEeFcnOo3hfak9RVcHRZlotZidI0u9iPQPSU8DrVqDzxhYeMCthI2lxkrOI68gi1TZYEhB-5pAEOaxoZeKcm2wjC5z-GhQd6vfxObo9emuM8YOhdTM4VvePNw', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 4032),
('CmRaAAAAYAEImuA57iMzWDblu8hB-KyiY22fPaYm-_OOazh_F8fx3rmaEbMUoKVSUPiZLvqH_5J57XZMFAfPFVq6NERXzaAAIZZQaJ3bf7ts6zvje9hsBdYW2BEMawa4BEA69s-0EhAP4BRy98HJGyvhNZNiz9LEGhS9wKiN7ypA1oRQozB5klOTMdc0hw', 'ChIJ28wffZWxcEgRpCzENFGQfwg', 2048),
('CmRaAAAAZgExZsrn96Doj86_tqYTahizbm9HpNXwhwqv5Fwi0mjMRdTRgETasacgaAY2GDkg51PYgoR9JIebPn5qYBo3CkLb1Djo5AnSzh3OXnP-JGS8-BLyqWc0rk9gwNVPptFBEhBRxS0nfend9snUO13_HIUDGhQu0Dw0Lu4DZOlwiQ6osY8GwtOQFQ', 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 3120);

-- --------------------------------------------------------

--
-- Table structure for table `place_reviews`
--

CREATE TABLE IF NOT EXISTS `place_reviews` (
  `idReview` int(10) NOT NULL AUTO_INCREMENT,
  `idPlace` varchar(150) NOT NULL,
  `author` varchar(50) NOT NULL,
  `rating` int(1) NOT NULL,
  `text` text,
  `timeAgo` datetime NOT NULL,
  PRIMARY KEY (`idReview`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_reviews`
--

INSERT INTO `place_reviews` (`idReview`, `idPlace`, `author`, `rating`, `text`, `timeAgo`) VALUES
(1, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 'Anto64w', 3, 'Quiet little place not too far from the city centre. The hotel itself is nice, location leaves a bit to be desired but if you''re just looking for a place to put your head down its grand. The rooms are very nice and have an en-suite bathroom which has one of the best showers I''ve ever used. There is free WiFi and a lounge area which sells food and drink. Overall if you''re going to be out a lot during the day and just in the hotel in the evening then for the price you can''t really do any better.', '2018-01-06 01:09:43'),
(2, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 'Chris M', 5, 'Not even staying there but am an accor member.phone died with all my essential information bus pass airline check in etc let me charge it. Made me feel welcome when I felt I was taking the p**s. Staff were a credit to the company and hospitality in general.', '2018-02-24 23:18:47'),
(3, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 'Dornu L', 5, 'Perfect location for our visit. Really helpful, smiling, friendly staff. Rooms are well stocked and nice albeit a little petite', '2018-01-26 17:59:03'),
(4, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 'Julian Allsopp', 3, 'Used to be an excellent 3 star motel. Now completely "remodelled" (=downgraded) and classified 2 star. Disabled room on 1st floor was tiny and double bed against the wall so one occupant would have to climb over the other to get out. We opted for a standard room instead.  When my wheelchair-bound wife and I stayed the lift was out of order. The engineers enabled it to get us up to the first floor but we were told we would then have to stay there until the lift was finally repaired. Thank goodness there wasn''t a fire!  Stayed here many times before the remodelling but now unlikely to return or recommend to family or friends. Such a shame. ', '2017-08-24 16:32:50'),
(5, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE', 'mohammed patel', 4, 'Nice clean rooms and bathroom. Single beds seemed more narrower than standard single beds but was comfortable but may not be suitable for some due to the width.', '2018-01-03 14:33:57'),
(6, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 'Bryan Willetts', 3, 'A bit of a tired old pub/b&b/restaurant, in need of redecorating, however, the staff were lovely and the breakfast was value for money. But our bed was uncomfortable and our room smelt musty..hence the 3 ðŸŒŸ', '2018-02-03 21:07:17'),
(7, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 'A H', 1, 'What can I say about my experience at the InnKeepers Lodge? It''s a poor quality restless disaster zone. \n\nIt cost Â£62 for the night for a so called family quad room with 1 double bed and 1 sofa bed. I got a twin room with two single beds, had an uncomfortable nights sleep due to a room invader; then I was locked in and could not leave the horrific hotel in the morning.\n\nFirst thing to bear in mind about this hotel, it''s a Toby Carvery, you have to wade through the rafts of diners to get to the reception; which is the bar area. When you are eventually served, the keys have a fob on them to give access to the otherwise locked doors which lead to the bedrooms, my fob didn''t work; which was fixed eventually with a replacement. You walk through the dirty and grubby rabbit warren corridors to get to the rooms. On the way be careful not to trip over the bags of dirty laundry hanging around. Except for the fact that the room had no double bed but two singles, it was clean and the temperature was ok. The bed was uncomfortable and small. The tea making facilities were OK, however there was no iron or ironing board. To give you an idea of the priorities of this hotel, you can sit on the toilet and watch TV at the same time; if that''s a bonus and sleeping is not a requirement then crack on.\n\nThe sleeping experience: I was awoken shortly after midnight, when a random woman unlocked my door and entered the room. Fortunately she left quite quickly upon realising her mistake when I mumbled some sleep deprived query, although I didnt sleep so well there after. The morning was a groggy hell, a 0600 start for me, first off I could not exit from where I had entered as the door was alarmed; this door had been making an incessant beeping noise previously so I wasnt convinced the alarm worked anyway. And so I went to find the other exit, which was a maze of corridors; a few more random laundry bags. Eventually I found the exit, success! but my fob would not work and I couldnt open the door. As there was a phone with "reception" written on it on the side, I tried calling; alas nobody answered. As I heard voices I tried knocking on the door, nothing. Eventually a woman appeared in view and caught sight of my waving hands. They thought I was a member of staff and were initially confused upon opening the door. Eventually they showed me the way out and askedÂ  "have you had a nice stay?" I replied "not really", as I left I could hear the woman repeating, parrot like the words "not really" in a sarcastic voice. That final moment sums up my stay at this hotel, I had to work a 12 hour shift; arriving late and appearing unprofessional. This was the worst hotel I have ever stayed in, and I''ve stayed in some cesspits. On the positive side, the bar/reception staff were friendly if not massively helpful or efficient.', '2018-02-01 21:03:44'),
(8, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 'Kim Cartner', 5, 'Brilliant good food rooms staff and very clean.', '2018-02-10 15:28:07'),
(9, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 'Mary Doling', 4, 'Good position for access into city centre and / or Worcestershire countryside.    Good choice of food for vegetarians and even larger choice for meat eaters.', '2018-02-08 19:49:45'),
(10, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo', 'Jack Sheahan', 5, 'Comfortable rooms, great breakfast, late checkout.', '2018-02-02 10:11:55'),
(11, 'ChIJ28wffZWxcEgRpCzENFGQfwg', 'Mrs Pearce', 5, 'Booked for daughter in law''s birthday.lovely food super service and very cheeky we took our own cupcakes..nobody minded. Not many restaurants would allow.many thanks and fabulous food.see you all very soon..\nMothering Sunday.', '2018-02-06 20:05:37'),
(12, 'ChIJ28wffZWxcEgRpCzENFGQfwg', 'Stephen Williams', 5, 'What a fantastic dining experience at the Coleshill hotel. After responding to a Facebook advertisement for a special price menu me an a friend decided to check it out.\n\nGoing in to the hotel it looked very welcoming and clean, greeted by a friendly member of the team we was taken to our table where we was presented with the perfect menu offering a mouth watering array of food. I proceeded to go get the drinks which the price of a pint of coke was expensive compared to a lot of places.\nMy friend ordered a lamb shank an I ordered the beef rib. \nOn arrival to the table we was presented with 2 plates of well presented food. Cutting into to the meat didn''t take much effort as it just melted off the bone. The rest of the dinner was just as nice even if it lacked seasoning and the vegetables could have done with being a bit hotter. Still we enjoyed every mouthful. \nAfter dinner the deliberation about a pudding my friend decided to go for the black forest sundae which looked nice but lacked cream which usually makes a sundae. \nWe paid the bill an received another promotion which was unexpected an even without this we left 2 happy diners. Would highly recommend the coleshill hotel.', '2018-01-21 15:45:09'),
(13, 'ChIJ28wffZWxcEgRpCzENFGQfwg', 'Tom Stokes', 3, 'Nice local pub. Good staff. Ok food selection. No x-factor.', '2018-03-11 00:14:37'),
(14, 'ChIJ28wffZWxcEgRpCzENFGQfwg', 'Michael Trice', 1, 'Pretty awful experience  at the resurant. Started off by getting stared down by a bouncer to get to the restaurant, and my friend got told off for wearing a hat (it was snowing). Then the waiter didn''t know what was one the menu or what drinks were being served. Once the food came (after a long wait), it wsa very disappointing. I had the game pie, this was a not quite hot reheated dish with a pastry top that wasn''t even the same shape. My friend had the suthern fried chicken burger, which would look at out place even at 2am outside a kabab shop.\n\nThis was especially disappointing when you have to pay over Â£10 per main.\n\nOh, and to top it off you have to pay at the bar (once asking what your table nnumber is) and enjoy the loud club music.', '2018-03-03 22:54:29'),
(15, 'ChIJ28wffZWxcEgRpCzENFGQfwg', 'Wilf Moralee', 3, 'A quirky old hotel but beyond its best. A very warm welcome to the hotel from reception, bit then entered the room to a light not working and a very noisy bathroom fan. Other than that although needing a refresh the room was comfortable. There was not enough sockets in the room near the desk, so laptop duly unplugged to boil the kettle. Room service was very efficient with okay food. On checking out I was told everything was already paid before even given the receptionist my room number (I have to cover food myself). All in all an okay stay but room for improvement.', '2017-09-06 19:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `place_type`
--

CREATE TABLE IF NOT EXISTS `place_type` (
  `idType` int(10) NOT NULL,
  `idPlace` varchar(150) NOT NULL,
  PRIMARY KEY (`idType`,`idPlace`),
  KEY `idPlace` (`idPlace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place_type`
--

INSERT INTO `place_type` (`idType`, `idPlace`) VALUES
(26, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(26, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo'),
(26, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE'),
(27, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(27, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo'),
(27, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE'),
(28, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(28, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo'),
(28, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE'),
(29, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(29, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo'),
(29, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE'),
(30, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(30, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo'),
(30, 'ChIJCSkzMoK7cEgR0cqMxi-dvyE'),
(31, 'ChIJ28wffZWxcEgRpCzENFGQfwg'),
(31, 'ChIJC4fq9DCWcEgRWNN0DcPyWZo');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `idType` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`idType`, `name`) VALUES
(26, 'lodging'),
(27, 'restaurant'),
(28, 'food'),
(29, 'point_of_interest'),
(30, 'establishment'),
(31, 'bar');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;