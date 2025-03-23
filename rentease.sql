-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 12:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentease`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `details` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `first_name`, `last_name`, `image`, `username`, `email`, `password`, `status`, `details`, `address`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Rent', 'Ease', '1685432111.png', 'admin', 'aprilzic475@gmail.com', '$2y$10$3czmvcKcqGjPp6aE/gO2w..H7v7.YtzzshMMh0PA3fTiSBQOqBtV6', 1, NULL, 'Philippines, Negros Occidental', NULL, '2024-12-02 23:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uniqid` int(10) UNSIGNED NOT NULL DEFAULT 12345 COMMENT 'This column is going to be used for fetching the information from db.',
  `favicon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website_title` varchar(255) NOT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `support_contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `base_currency_symbol` varchar(255) NOT NULL,
  `base_currency_symbol_position` varchar(20) NOT NULL,
  `base_currency_text` varchar(20) NOT NULL,
  `base_currency_text_position` varchar(20) NOT NULL,
  `base_currency_rate` decimal(8,2) NOT NULL,
  `primary_color` varchar(30) NOT NULL,
  `secondary_color` varchar(30) NOT NULL,
  `breadcrumb_overlay_color` varchar(30) NOT NULL,
  `breadcrumb_overlay_opacity` decimal(4,2) NOT NULL,
  `smtp_status` tinyint(4) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `encryption` varchar(50) NOT NULL,
  `smtp_username` varchar(255) NOT NULL,
  `smtp_password` varchar(255) NOT NULL,
  `from_mail` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `to_mail` varchar(255) NOT NULL,
  `breadcrumb` varchar(255) NOT NULL DEFAULT 'test.jpg',
  `google_recaptcha_status` tinyint(4) DEFAULT NULL,
  `google_recaptcha_site_key` varchar(255) DEFAULT NULL,
  `google_recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `maintenance_img` varchar(255) NOT NULL,
  `maintenance_status` tinyint(4) NOT NULL,
  `maintenance_msg` text NOT NULL,
  `secret_path` varchar(255) DEFAULT NULL,
  `announcement_img` varchar(255) DEFAULT NULL,
  `announcement_status` tinyint(4) DEFAULT NULL,
  `popup_delay` decimal(4,2) DEFAULT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `room_category_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive, 1 - active',
  `package_category_status` tinyint(3) UNSIGNED NOT NULL,
  `room_rating_status` tinyint(3) UNSIGNED NOT NULL,
  `package_rating_status` tinyint(3) UNSIGNED NOT NULL,
  `room_guest_checkout_status` tinyint(3) UNSIGNED NOT NULL,
  `package_guest_checkout_status` tinyint(3) UNSIGNED NOT NULL,
  `theme_version` varchar(255) NOT NULL DEFAULT 'theme_one',
  `home_version` varchar(20) NOT NULL DEFAULT 'slider',
  `is_disqus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `disqus_shortname` varchar(255) NOT NULL,
  `is_tawkto` tinyint(4) NOT NULL DEFAULT 1,
  `tawkto_property_id` varchar(255) DEFAULT NULL,
  `is_whatsapp` tinyint(4) NOT NULL DEFAULT 1,
  `whatsapp_number` varchar(50) DEFAULT NULL,
  `whatsapp_header_title` varchar(255) DEFAULT NULL,
  `whatsapp_popup_message` text DEFAULT NULL,
  `whatsapp_popup` tinyint(4) NOT NULL DEFAULT 1,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `preloader_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive',
  `preloader` varchar(50) DEFAULT NULL,
  `hero_video_link` text DEFAULT NULL,
  `notification_image` varchar(255) DEFAULT NULL,
  `qr_image` varchar(255) DEFAULT NULL,
  `qr_color` varchar(255) NOT NULL DEFAULT '000000',
  `qr_size` int(10) UNSIGNED NOT NULL DEFAULT 250,
  `qr_style` varchar(255) NOT NULL DEFAULT 'square',
  `qr_eye_style` varchar(255) NOT NULL DEFAULT 'square',
  `qr_margin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `qr_text` varchar(255) DEFAULT NULL,
  `qr_text_color` varchar(255) NOT NULL DEFAULT '000000',
  `qr_text_size` int(10) UNSIGNED NOT NULL DEFAULT 15,
  `qr_text_x` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `qr_text_y` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `qr_inserted_image` varchar(255) DEFAULT NULL,
  `qr_inserted_image_size` int(10) UNSIGNED NOT NULL DEFAULT 20,
  `qr_inserted_image_x` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `qr_inserted_image_y` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `qr_type` varchar(255) NOT NULL DEFAULT 'default' COMMENT 'default, image, text',
  `qr_url` varchar(255) DEFAULT NULL,
  `facebook_login_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 -> active, 0 -> deactive',
  `facebook_app_id` varchar(255) DEFAULT NULL,
  `facebook_app_secret` varchar(255) DEFAULT NULL,
  `google_login_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 -> active, 0 -> deactive',
  `google_client_id` varchar(255) DEFAULT NULL,
  `google_client_secret` varchar(255) DEFAULT NULL,
  `vendor_admin_approval` int(11) DEFAULT NULL COMMENT '1 active, 2 deactive',
  `vendor_email_verification` int(11) DEFAULT NULL COMMENT '1 active, 2 deactive',
  `admin_approval_notice` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `uniqid`, `favicon`, `logo`, `website_title`, `support_email`, `support_contact`, `address`, `base_currency_symbol`, `base_currency_symbol_position`, `base_currency_text`, `base_currency_text_position`, `base_currency_rate`, `primary_color`, `secondary_color`, `breadcrumb_overlay_color`, `breadcrumb_overlay_opacity`, `smtp_status`, `smtp_host`, `smtp_port`, `encryption`, `smtp_username`, `smtp_password`, `from_mail`, `from_name`, `to_mail`, `breadcrumb`, `google_recaptcha_status`, `google_recaptcha_site_key`, `google_recaptcha_secret_key`, `maintenance_img`, `maintenance_status`, `maintenance_msg`, `secret_path`, `announcement_img`, `announcement_status`, `popup_delay`, `footer_logo`, `room_category_status`, `package_category_status`, `room_rating_status`, `package_rating_status`, `room_guest_checkout_status`, `package_guest_checkout_status`, `theme_version`, `home_version`, `is_disqus`, `disqus_shortname`, `is_tawkto`, `tawkto_property_id`, `is_whatsapp`, `whatsapp_number`, `whatsapp_header_title`, `whatsapp_popup_message`, `whatsapp_popup`, `latitude`, `longitude`, `preloader_status`, `preloader`, `hero_video_link`, `notification_image`, `qr_image`, `qr_color`, `qr_size`, `qr_style`, `qr_eye_style`, `qr_margin`, `qr_text`, `qr_text_color`, `qr_text_size`, `qr_text_x`, `qr_text_y`, `qr_inserted_image`, `qr_inserted_image_size`, `qr_inserted_image_x`, `qr_inserted_image_y`, `qr_type`, `qr_url`, `facebook_login_status`, `facebook_app_id`, `facebook_app_secret`, `google_login_status`, `google_client_id`, `google_client_secret`, `vendor_admin_approval`, `vendor_email_verification`, `admin_approval_notice`) VALUES
(1, 12345, '674879655db5e.png', '674887c4e3042.png', 'Rentease', 'aprilzic475@gmail.com', '+639950598296', 'Philippines, Negros Occidental', '₱', 'left', 'PHP', 'left', 58.00, '1837FE', '0F172B', '0F172B', 0.76, 1, 'smtp.gmail.com', 587, 'TLS', 'aprilzic475@gmail.com', 'zsay fvzl vfyd krvf', 'aprilzic475@gmail.com', 'Rentease', 'aprilzic475@gmail.com', '1685514475.jpg', 0, NULL, NULL, '1685431061.png', 0, 'We are upgrading our site. We will come back soon. \r\nPlease stay with us.\r\nThank you.', 'secret', '1621420908.jpg', 1, 2.00, '1732808296.png', 1, 1, 1, 1, 0, 0, 'theme_two', 'slider', 1, '', 1, '674928ff4304e3196aea22dd', 0, NULL, 'Hi, There!', 'If you have any issues, let us know', 0, '9.9633', '122.9528', 1, '6620e751eaf79.gif', 'https://youtu.be/9bkr-0M80Rc', '626a21c417ca4.png', '6749360053c6c.png', '000000', 250, 'square', 'square', 0, NULL, '000000', 15, 50, 50, NULL, 20, 50, 50, 'default', 'http://localhost/rentease', 0, NULL, NULL, 0, NULL, NULL, 1, 1, 'Your account is deactive now. Please Contact with admin');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_img` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `language_id`, `name`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(9, 7, 'Luxury', 1, 1, '2021-06-14 00:16:33', '2021-06-14 00:16:33'),
(10, 7, 'Tour Places', 1, 2, '2021-06-14 00:16:47', '2021-06-14 00:16:47'),
(11, 7, 'Vacations', 1, 3, '2021-06-14 00:16:56', '2021-06-14 00:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `blog_contents`
--

CREATE TABLE `blog_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` blob NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `brand_img` varchar(255) NOT NULL,
  `brand_url` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `language_id`, `brand_img`, `brand_url`, `serial_number`, `created_at`, `updated_at`) VALUES
(33, 8, '1624261371.png', 'http://example.com/', 1, '2021-06-14 02:06:14', '2021-06-21 01:42:51'),
(34, 8, '1624261435.png', 'http://example.com/', 2, '2021-06-14 02:06:28', '2021-06-21 01:43:55'),
(35, 8, '1624261450.png', 'http://example.com/', 3, '2021-06-14 02:06:42', '2021-06-21 01:44:10'),
(36, 8, '1624261462.png', 'http://example.com/', 4, '2021-06-14 02:06:54', '2021-06-21 01:44:22'),
(37, 8, '1624261474.png', 'http://example.com/', 5, '2021-06-14 02:07:04', '2021-06-21 01:44:34'),
(38, 8, '1624261486.png', 'http://example.com/', 6, '2021-06-14 02:07:21', '2021-06-21 01:44:46'),
(39, 8, '1624261499.png', 'http://example.com/', 7, '2021-06-14 02:07:36', '2021-06-21 01:44:59'),
(40, 7, '1732851318.png', 'http://localhost/rentease/', 1, '2024-11-28 19:35:18', '2024-11-28 19:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_booking_commission` double(8,2) DEFAULT NULL,
  `package_booking_commission` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `room_booking_commission`, `package_booking_commission`, `created_at`, `updated_at`) VALUES
(1, 10.00, 10.00, '2022-10-19 06:28:28', '2022-11-12 23:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1=user, 2=admin, 3=vendor',
  `support_ticket_id` int(11) DEFAULT NULL,
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cookie_alerts`
--

CREATE TABLE `cookie_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `cookie_alert_status` tinyint(3) UNSIGNED NOT NULL,
  `cookie_alert_btn_text` varchar(255) NOT NULL,
  `cookie_alert_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookie_alerts`
--

INSERT INTO `cookie_alerts` (`id`, `language_id`, `cookie_alert_status`, `cookie_alert_btn_text`, `cookie_alert_text`, `created_at`, `updated_at`) VALUES
(1, 7, 0, 'I Agree', '<p>We use cookies to give you the best online experience.<br />By continuing to browse the site you are agreeing to our use of cookies.</p>', '2022-11-02 01:30:03', '2024-11-28 19:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_revenue` double(8,2) NOT NULL DEFAULT 0.00,
  `total_earning` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `total_revenue`, `total_earning`, `created_at`, `updated_at`) VALUES
(1, 25121.00, 3592.10, '2022-11-08 11:58:41', '2024-12-05 05:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `facility_icon` varchar(255) NOT NULL,
  `facility_title` varchar(255) NOT NULL,
  `facility_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `language_id`, `facility_icon`, `facility_title`, `facility_text`, `created_at`, `updated_at`) VALUES
(8, 7, 'fas fa-swimmer', 'Relex Living', 'Dreat explorer of the truth, the master-builder of human happines one rejects, dislikes avoids', '2021-06-14 01:52:52', '2021-06-14 01:52:52'),
(9, 7, 'fas fa-shield-alt', 'High Security System', 'Procure him some great pleasure. To take a trivial example, which of us ever undertakes labor', '2021-06-14 01:53:15', '2021-06-14 01:53:15'),
(10, 7, 'far fa-calendar-alt', 'Such Events & Party', 'Libero tempore, cum soluta nobis est eligenoptio cumque nihil impedit quo minus id quod', '2021-06-14 01:53:30', '2021-06-14 01:53:30');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `language_id`, `question`, `answer`, `serial_number`, `created_at`, `updated_at`) VALUES
(8, 7, 'How do I search for available properties?', 'Simply enter your preferred location, budget, and other search criteria (e.g., number of bedrooms, amenities) in the search bar. You can then browse through available listings that match your preferences.', 1, '2021-06-14 01:36:15', '2024-11-28 07:35:29'),
(9, 7, 'How do I pay rent through RentEase?', 'RentEase offers secure online payment options. You can set up automatic payments or make manual payments through your RentEase account. We accept multiple payment methods, including credit/debit cards and bank transfers.', 2, '2021-06-14 01:36:27', '2024-11-28 07:36:27'),
(10, 7, 'What if I need to break my lease early?', 'We recommend reviewing your lease agreement for any clauses regarding early termination. If you\'re unsure, contact your landlord through the RentEase platform to discuss your situation. RentEase also offers resources and guidance on your rights as a tenant.', 3, '2021-06-14 01:36:39', '2024-11-28 07:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `footer_quick_links`
--

CREATE TABLE `footer_quick_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_quick_links`
--

INSERT INTO `footer_quick_links` (`id`, `language_id`, `title`, `url`, `serial_number`, `created_at`, `updated_at`) VALUES
(6, 7, 'About Us', 'http://localhost/rentease/about-us', 1, '2021-06-14 02:47:42', '2024-11-28 19:24:34'),
(7, 7, 'Terms & Conditions', 'http://localhost/rentease/terms-&-conditions', 2, '2021-06-14 02:48:02', '2024-11-28 19:29:20'),
(8, 7, 'FAQs', 'http://localhost/rentease/faqs', 3, '2021-06-14 02:48:24', '2024-11-28 19:30:07'),
(9, 7, 'Contact Us', 'http://localhost/rentease/contact', 4, '2021-06-14 02:48:39', '2024-11-28 19:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `footer_texts`
--

CREATE TABLE `footer_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `about_company` text NOT NULL,
  `copyright_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_texts`
--

INSERT INTO `footer_texts` (`id`, `language_id`, `about_company`, `copyright_text`, `created_at`, `updated_at`) VALUES
(3, 7, 'At RentEase, we’re transforming the rental experience for both tenants and landlords. Our platform bridges the gap between those seeking a home and those offering it, creating a seamless, transparent, and efficient process for all. Whether you\'re a first-time renter or an experienced property owner, RentEase offers a variety of tools and resources to make renting easier, faster, and more enjoyable.', '<p>Copyright@2024. All Rights Reserved</p>', '2021-06-14 02:52:06', '2024-11-28 08:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categories`
--

CREATE TABLE `gallery_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `gallery_category_id` bigint(20) UNSIGNED NOT NULL,
  `gallery_img` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `endpoint`, `created_at`, `updated_at`) VALUES
(3, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAAB7rTbLWkP3IbWzITU8oFaJ4CbKlWDnZspZymK4vGxFAgFcO3B%2bDiQEzF8ZCEwG0fN9GpKT%2fO%2fj8X5AAw9Z%2baWN6jx1ogONRbKp7qdmhDEg5rcRBMrjJj9u690LwD1Dq13KGX95%2fwry7qqCxsLSOF5srRZ0ai4hGg%2bzsrtA1wkI7tqYaRizfE4JtcYxYfOd6h5JIFtMzgCMIStPxsrpSQ5O%2fo8WQ7RFoBPQp0RxgojQeaqBD45Xk6Yt2a9lb%2b8TajoBevTbTrV3bYmo%2blXe9ap67aZP0BZpJ4GrHGu51iHmGaTktkWAztBf1YgedOXMWyk%3d', '2022-04-27 21:59:46', '2022-04-27 21:59:46'),
(4, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAADd0kJ3ZLRZRLhTLtbrQY5pyhqdrYibNVHt%2bt1QTyr757R0%2fJxilzE6JUUpslszLXFkf%2fU1dXZ2omRAuVRXLseLj6nGiinZ%2fGz3ZOmKJpGT%2bgyHWhay0C7Vs4bH0duSxO06A%2fnv4zq%2bvHGzqBmiu1NATdpJPbapF42vQqlIIkfuK6x%2fRL58fwK8Qm3G8nSCr8SHfY2mMgQ8O5EaHLqQocWvxJhedBoOAAJEv4mlbROXGKZK5wi8YtfXKt%2byeOG10I0bFf9f1sNDHi66OnhX2iuUenpLkanJbCFQPXvREn0EzV%2f0gw2EC1qSvEhP%2fP%2ffkp8%3d', '2022-04-27 22:00:12', '2022-04-27 22:00:12'),
(5, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAABvvTwRKBolXdzZzPhpLIX9nw3fPA%2blWdmGGK84FZJSbT1%2bkiNf7YjIfYHVr0XPijdQD7o4R%2fxz%2bjKWV3rDMFjyp2uNE6AbLpG%2bWW%2bbZKXDS%2fFbpbTDhnkZKhIcRVqAW0SLeZa0z%2bwLK14MUtAEm1GQWKdrs%2bLh4TEZLBSIbnydJNzTYE55M%2fN%2f58AWtcPX5JaQe4gZGZ7sSBSWD4mcv%2fJX%2fg%2fSm3q8pFsTgETW%2f5KTGh1pY7Icie1qIhjjChtD%2bkcUnMN9FgCxz3EvU%2fvCZBRqqu3X5GHZj%2fTUbYMPMuNyPPX5kWhIEyQXkF6ogmVQvZA%3d', '2022-04-29 21:45:21', '2022-04-29 21:45:21'),
(6, 'https://fcm.googleapis.com/fcm/send/fbH_YZ6GP1k:APA91bEuZdBhdC9CU3po7i5x9DuvmlvczIYT-wafSuqNboLTZHf9C1N-KxQSTQqaqxVKFz-BjCilhvePp91ehg_W3j11KsLuuZWCNFZKh_UQJkCCzU2f2rQu9q0bfqhbnKoqPy_Y0sVr', '2022-06-29 01:22:16', '2022-06-29 01:22:16'),
(7, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAAAr8iHytZptw7T%2bvQnS0zSEuAxrPYmXfBYXx%2bXbfiN2hvgl8Lf8YPXGw9gy7l6Gyk4IbpvaEmE5WCL7amKBvolkc%2b%2fZPk2xEkHgARXufqliq%2fYKthtICEFn4itXBVG0LhyKEQftJXU5RuAvEMkQeuzRqhlj6WtWUXTPJactOot9pB7y19bZ5DwygvDGkj21XhiGW3fBffSSmKWUlpZGYLg5hfK%2ba7uWw6fc9VgxVUunn5b4FiwSvkeB6hJnCoUsPYP8YNnYHvjO3xzn%2f7YN85l%2fnzu2I3vduki48D0x4kDi150G0Yy3MqmVavtKAjaMh30%3d', '2022-06-29 22:18:38', '2022-06-29 22:18:38'),
(8, 'https://fcm.googleapis.com/fcm/send/fSRjpAukqPw:APA91bE1nl4PQ8gBdjDRG5S8JyNtL733e0h2huLmJQ67izTt9xsCdinVUAuHqpnFLQ7gTWw3jxquNm8cN74SlGNxfG9cQo-vNVMtYGh40WIHcoxbuVo9OXkQN_DL9qf7LS2zTA0zp3x6', '2022-06-29 23:20:36', '2022-06-29 23:20:36'),
(9, 'https://wns2-pn1p.notify.windows.com/w/?token=BQYAAABR9Da9Wz5yMb2CQlcTW5Tj6Zp5CQZx9e4GXIxG0EDt6KGVVoBcKLf%2bAqN4s8uW9G1S6%2fnh333Pj0V1h1e%2bSYa9Z9ouqNY2ahV6xgkKhLBha0OwnaaoHyiUi22uk%2fhKrOKf9KZ3plB6hAgCfFzOuSFTr5G%2fjOhIHDAG0WO9%2bi0xwLYpYBC%2bot6AsSaJTk1Mq92NGn7miRbQ7LWBrm3cMK7AmDq0YwT91mz8ILZ7awQSjh5y7ARXKwnA3Kv2c%2bi3mJpKM5yjbw8kOm5qn4Eck2EJY6S%2ftDDJB3LmzznG9qLZBRiHZMVlePMU0lK4yURPasM%3d', '2022-11-02 04:44:02', '2022-11-02 04:44:02'),
(10, 'https://fcm.googleapis.com/fcm/send/cCeB__w0-v8:APA91bE9wE7JAzaV6lSMETeFl9ZEeYSyZMpv5lB7kHVMgawESfLBGgJJH_m_sLAGJxha8A4GCR0MgNoiLJgP4KlgTF1E4LE9oZ9CIl7oT5pePgiS6OOF-j7dYh6Ejkjt5kc710cIsbLf', '2022-11-07 23:28:10', '2022-11-07 23:28:10'),
(11, 'https://fcm.googleapis.com/fcm/send/dVZtTZ0fncc:APA91bGFdsmtkoLax5GCd-Did2yLC2WphlB-Z_VRZpqk84SoYRQqT_BIyalBcFF-XbP82wiN2zVAezxyYRM7z2QD3TJKBvv2QCkz4Bs_YGmQ2oyEFZZZap6uFtoWT2iv0yWMm_9BkamS', '2022-11-07 23:30:06', '2022-11-07 23:30:06'),
(12, 'https://fcm.googleapis.com/fcm/send/dTNgHJTKrmw:APA91bH5eUEmdjtw82nX9me06y7m3qkxCvZAo6WiBHwwKK-AqLjFFuqsFkIPCahsj5xPjMc-bzBDcY071HIwc26rZnAlrdJuBO82ZjbPxh42jYKA4GnpyOGx3N95HuChy95uuLuQtbE6', '2024-11-30 22:01:31', '2024-11-30 22:01:31'),
(13, 'https://fcm.googleapis.com/fcm/send/fUL6VnbI_ik:APA91bGjTu5DF4ClzWEd9R92pw6a0pW0QYGfrvMXI3fPN2GDYe0P97yoAx0HrpGAhosmm3BjNQuXyBbtovcCGPzFFMtqt-bj230UE2GlH89D4UpTnMSr0dQCj14mlzplhm77kud1z76w', '2024-12-02 21:48:01', '2024-12-02 21:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `hero_sliders`
--

CREATE TABLE `hero_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `btn_name` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_sliders`
--

INSERT INTO `hero_sliders` (`id`, `language_id`, `img`, `title`, `subtitle`, `btn_name`, `btn_url`, `serial_number`, `created_at`, `updated_at`) VALUES
(17, 7, '1732806554.jpg', 'Welcome to Rentease', 'Discover A Place Where You\'ll Love To Live', 'get started', 'http://localhost/rentease/rooms', 2, '2021-06-13 08:45:49', '2024-12-02 22:36:53'),
(18, 7, '1732806529.jpg', 'Welcome to Rentease', 'We provide the best', 'get started', 'http://localhost/rentease/packages', 1, '2021-06-13 08:48:17', '2024-12-02 22:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `hero_statics`
--

CREATE TABLE `hero_statics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `btn_name` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_statics`
--

INSERT INTO `hero_statics` (`id`, `language_id`, `img`, `title`, `subtitle`, `btn_name`, `btn_url`, `created_at`, `updated_at`) VALUES
(4, 7, '1685513173.jpg', 'Welcome to Rentease', 'Luxury Living', 'Get Started', 'https://.com', '2021-06-14 04:21:21', '2024-11-28 07:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(11) NOT NULL,
  `search_section` tinyint(4) NOT NULL DEFAULT 1,
  `intro_section` tinyint(4) NOT NULL DEFAULT 1,
  `featured_rooms_section` tinyint(4) NOT NULL DEFAULT 1,
  `featured_services_section` tinyint(4) NOT NULL DEFAULT 1,
  `faq_section` tinyint(4) NOT NULL DEFAULT 1,
  `statistics_section` tinyint(4) NOT NULL DEFAULT 1,
  `video_section` tinyint(4) NOT NULL DEFAULT 1,
  `featured_package_section` tinyint(4) NOT NULL DEFAULT 1,
  `facilities_section` tinyint(4) NOT NULL DEFAULT 1,
  `testimonials_section` tinyint(4) NOT NULL DEFAULT 1,
  `blogs_section` tinyint(4) NOT NULL DEFAULT 1,
  `brand_section` tinyint(4) NOT NULL DEFAULT 1,
  `top_footer_section` tinyint(4) NOT NULL DEFAULT 1,
  `copyright_section` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `search_section`, `intro_section`, `featured_rooms_section`, `featured_services_section`, `faq_section`, `statistics_section`, `video_section`, `featured_package_section`, `facilities_section`, `testimonials_section`, `blogs_section`, `brand_section`, `top_footer_section`, `copyright_section`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `intro_count_infos`
--

CREATE TABLE `intro_count_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` bigint(20) UNSIGNED NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intro_count_infos`
--

INSERT INTO `intro_count_infos` (`id`, `language_id`, `icon`, `title`, `amount`, `serial_number`, `created_at`, `updated_at`) VALUES
(12, 7, 'far fa-building iconpicker-component', 'Property and Rooms', 506, 1, '2021-06-13 09:03:01', '2024-11-28 07:26:27'),
(13, 7, 'far fa-smile', 'Happy Customers', 700, 2, '2021-06-13 09:04:20', '2021-06-13 09:04:20'),
(20, 7, 'fas fa-wine-bottle', 'Lots of Amenities', 300, 4, '2024-04-16 22:12:08', '2024-04-16 22:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `intro_sections`
--

CREATE TABLE `intro_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `intro_img` varchar(255) DEFAULT NULL,
  `intro_primary_title` varchar(255) NOT NULL,
  `intro_secondary_title` varchar(255) NOT NULL,
  `intro_text` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `member_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intro_sections`
--

INSERT INTO `intro_sections` (`id`, `language_id`, `intro_img`, `intro_primary_title`, `intro_secondary_title`, `intro_text`, `url`, `button_text`, `background_image`, `member_image`, `created_at`, `updated_at`) VALUES
(4, 7, '1732807257.jpeg', 'About Us', 'Welcome To Rentease', 'At RentEase, we’re transforming the rental experience for both tenants and landlords. Our platform bridges the gap between those seeking a home and those offering it, creating a seamless, transparent, and efficient process for all. Whether you\'re a first-time renter or an experienced property owner, RentEase offers a variety of tools and resources to make renting easier, faster, and more enjoyable.', 'http://localhost/rentease/packages', 'All Property', '1713337975.jpg', '1713336833.png', '2021-06-13 09:02:18', '2024-11-28 07:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` char(255) NOT NULL,
  `direction` tinyint(4) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `direction`, `is_default`, `created_at`, `updated_at`) VALUES
(7, 'English', 'en', 0, 1, '2021-06-13 08:09:43', '2021-06-13 08:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` int(11) NOT NULL,
  `mail_type` varchar(50) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `mail_type`, `mail_subject`, `mail_body`) VALUES
(1, 'room_rental', 'Confirmation of Room Rental', 0x3c64697620636c6173733d22223e0d0a3c64697620636c6173733d226969206774223e0d0a3c64697620636c6173733d226133732061694c223e0d0a3c703ec2a03c2f703e0d0a3c646976207374796c653d226d617267696e3a20303b20626f782d73697a696e673a20626f726465722d626f783b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b206d696e2d77696474683a20313030253b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b2077696474683a203130302521696d706f7274616e743b223e0d0a3c7461626c65207374796c653d226d617267696e3a20303b206261636b67726f756e643a20236633663566383b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206865696768743a20313030253b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b2077696474683a20313030253b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b766572746963616c2d616c69676e3a746f703b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b2220616c69676e3d2263656e746572222076616c69676e3d22746f70223e3c63656e746572207374796c653d226d696e2d77696474683a35383070783b77696474683a313030253b223e0d0a3c646976207374796c653d2270616464696e672d6c6566743a203136707821696d706f7274616e743b2070616464696e672d72696768743a203136707821696d706f7274616e743b2220616c69676e3d2263656e746572223e3c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a0c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a00d0a3c7461626c65207374796c653d226d617267696e3a2030206175746f3b206261636b67726f756e643a20236635663566663b20626f726465723a2031707820736f6c696420236434646365323b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b206d696e2d77696474683a2035303070783b2070616464696e673a20303b20746578742d616c69676e3a20696e68657269743b20766572746963616c2d616c69676e3a20746f703b2077696474683a2035383070783b2220616c69676e3d2263656e746572223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b766572746963616c2d616c69676e3a746f703b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e3c6272202f3e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e44656172207b74656e616e745f6e616d657d2c3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e5468697320656d61696c20697320746f20636f6e6669726d20796f75722072656e74616c23207b72656e74616c5f6e756d6265727d206f6e207b72656e74616c5f646174657dc2a0666f7220612073696e676c6520726f6f6d20666f72207b6e756d6265725f6f665f646179737d207b776562736974655f7469746c657d2e2054686520636865636b2d696e2064617465207368616c6c206265206f6e207b636865636b5f696e5f646174657d20616e642074686520636865636b2d6f75742064617465207368616c6c206265206f6e207b636865636b5f6f75745f646174657d2e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e467572746865722064657461696c73206f6620796f757220626f6f6b696e6720617265206c69737465642062656c6f772e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e526f6f6d204e616d653a207b726f6f6d5f6e616d657d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e52656e743a207b726f6f6d5f72656e747d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e4e756d626572206f6620506572736f6e733a207b6e756d6265725f6f665f706572736f6e737d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e526f6f6d20747970653a207b726f6f6d5f747970657d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e416d656e69746965733a207b726f6f6d5f616d656e69746965737d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e496620796f75206861766520616e7920696e717569726965732c20706c6561736520646f6e277420686573697461746520746f20636f6e746163742075732e20576520617265206c6f6f6b696e6720666f727761726420746f20796f757220766973697420616e6420686f7065207468617420796f752077696c6c20656e6a6f7920796f757220737461792e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b223e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e0d0ac2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a020c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0ac2a03c2f6469763e0d0a3c2f63656e7465723ec2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c703ec2a03c2f703e),
(3, 'property_rental', 'Confirmation of Property Rental', 0x3c64697620636c6173733d22223e0d0a3c64697620636c6173733d226969206774223e0d0a3c64697620636c6173733d226133732061694c223e0d0a3c646976207374796c653d226d617267696e3a20303b20626f782d73697a696e673a20626f726465722d626f783b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b206d696e2d77696474683a20313030253b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b2077696474683a203130302521696d706f7274616e743b223e0d0a3c7461626c65207374796c653d226d617267696e3a20303b206261636b67726f756e643a20236633663566383b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206865696768743a20313030253b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b2077696474683a20313030253b223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b766572746963616c2d616c69676e3a746f703b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b2220616c69676e3d2263656e746572222076616c69676e3d22746f70223e3c63656e746572207374796c653d226d696e2d77696474683a35383070783b77696474683a313030253b223e0d0a3c646976207374796c653d2270616464696e672d6c6566743a203136707821696d706f7274616e743b2070616464696e672d72696768743a203136707821696d706f7274616e743b2220616c69676e3d2263656e746572223e3c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a0c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a00d0a3c7461626c65207374796c653d226d617267696e3a2030206175746f3b206261636b67726f756e643a20236635663566663b20626f726465723a2031707820736f6c696420236434646365323b20626f726465722d636f6c6c617073653a20636f6c6c617073653b20626f726465722d73706163696e673a20303b206d696e2d77696474683a2035303070783b2070616464696e673a20303b20746578742d616c69676e3a20696e68657269743b20766572746963616c2d616c69676e3a20746f703b2077696474683a2035383070783b2220616c69676e3d2263656e746572223e0d0a3c74626f64793e0d0a3c7472207374796c653d2270616464696e673a303b746578742d616c69676e3a6c6566743b766572746963616c2d616c69676e3a746f703b223e0d0a3c7464207374796c653d226d617267696e3a20303b20626f726465722d636f6c6c617073653a20636f6c6c6170736521696d706f7274616e743b20636f6c6f723a20233061306130613b20666f6e742d66616d696c793a205461686f6d612c274c7563696461204772616e6465272c274c75636964612053616e73272c48656c7665746963612c417269616c2c73616e732d73657269663b20666f6e742d73697a653a20313670783b20666f6e742d7765696768743a206e6f726d616c3b206c696e652d6865696768743a20313970783b2070616464696e673a20303b20746578742d616c69676e3a206c6566743b20766572746963616c2d616c69676e3a20746f703b20776f72642d777261703a20627265616b2d776f72643b223e3c6272202f3e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e44656172207b74656e616e745f6e616d657d2c3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e5468697320656d61696c20697320746f20636f6e6669726d20796f75722072656e74616c20237b72656e74616c5f6e756d6265727d206f6e207b72656e74616c5f646174657d20666f7220612070726f706572747920617420746865207b776562736974655f7469746c657d2e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e467572746865722064657461696c73206f6620796f75722072656e74616c20617265206c69737465642062656c6f773a3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e50726f7065727479206e616d653a207b7061636b6167655f6e616d657d3c6272202f3e50726f70657274792070726963653a207b7061636b6167655f70726963657d3c6272202f3e4e756d626572206f662076697369746f72733a207b6e756d6265725f6f665f76697369746f72737d3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e496620796f75206861766520616e7920696e717569726965732c20706c6561736520646f6e277420686573697461746520746f20636f6e746163742075732e3c2f703e0d0a3c70207374796c653d2270616464696e672d6c6566743a343070783b6c696e652d6865696768743a312e323b223e4265737420526567617264732c3c6272202f3e7b776562736974655f7469746c657d3c2f703e0d0ac2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a020c2a03c6272202f3ec2a020c2a020c2a020c2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0ac2a03c2f6469763e0d0a3c2f63656e7465723ec2a020c2a020c2a020c2a03c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c703ec2a03c2f703e),
(4, 'verify_email', 'Verify Your Email Address', 0x3c703e44656172203c7374726f6e673e7b757365726e616d657d3c2f7374726f6e673e2c3c2f703e0d0a3c703e5765206a757374206e65656420746f2076657269667920796f757220656d61696c2061646472657373206265666f726520796f752063616e2061636365737320746f20796f75722064617368626f6172642e3c2f703e0d0a3c703e56657269667920796f757220656d61696c20616464726573732c207b766572696669636174696f6e5f6c696e6b7d2e3c2f703e0d0a3c703e5468616e6b20796f752e3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(5, 'reset_password', 'Recover Password of Your Account', 0x3c703e4869207b637573746f6d65725f6e616d657d2c3c2f703e0d0a3c703e576520686176652072656365697665642061207265717565737420746f20726573657420796f75722070617373776f72642e3c2f703e0d0a3c703e496620796f7520646964206e6f74206d616b652074686520726571756573742c206a7573742069676e6f7265207468697320656d61696c2e204f74686572776973652c20796f752063616e20726573657420796f75722070617373776f7264206279207b636c69636b5f686572657d2e3c2f703e0d0a3c703e5468616e6b732c3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(6, 'payment_cancelled', 'Rental Request is Rejected', 0x3c703e44656172207b74656e616e745f6e616d657d2c3c2f703e0d0a3c703e536f7272792c20776520686176652072656a656374656420796f75722052656e74616c20526571756573742e3c2f703e0d0a3c703e5468616e6b20796f752e3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(7, 'payment_received', 'Confirmation of Payment Received', 0x3c703e44656172207b74656e616e745f6e616d657d2c3c2f703e0d0a3c703e54686973206973206120636f6e6669726d6174696f6e20746861742077652068617665206a75737420726563656976656420796f7572207061796d656e742e2048657265206973206120636f7079206f6620796f75722064657461696c656420696e766f6963652e20446f6e277420686573697461746520746f20636f6e7461637420757320666f7220616e79207175657374696f6e73206f7220636f6e6365726e732e3c2f703e0d0a3c703e5468616e6b20796f752e3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(8, 'withdraw_approve', 'Confirmation of Withdraw Approve', 0x3c703e486920c2a07b6c616e646c6f72645f66756c6c5f6e616d657d2c3c2f703e0d0a3c703e5468697320656d61696c20697320636f6e6669726d207468617420796f75722077697468647261772072657175657374c2a0207b77697468647261775f69647d20697320617070726f7665642ec2a03c2f703e0d0a3c703e596f75722063757272656e742062616c616e6365206973207b63757272656e745f62616c616e63657d2c20776974686472617720616d6f756e74207b77697468647261775f616d6f756e747d2c20636861726765203a207b6368617267657d2c70617961626c6520616d6f756e74207b70617961626c655f616d6f756e747d3c2f703e0d0a3c703e7769746864726177206d6574686f64203ac2a07b77697468647261775f6d6574686f647d2c3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(9, 'withdraw_rejected', 'Withdraw Request Rejected', 0x3c703e4869c2a07b6c616e646c6f72645f66756c6c5f6e616d657d2c3c2f703e0d0a3c703e5468697320656d61696c20697320636f6e6669726d207468617420796f75722077697468647261772072657175657374c2a0207b77697468647261775f69647d2069732072656a656374656420616e642062616c616e636520616464656420746f20796f7572206163636f756e742ec2a03c2f703e0d0a3c703e596f75722063757272656e742062616c616e6365206973207b63757272656e745f62616c616e63657d3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e),
(10, 'balance_add', 'Balance Add', 0x3c703e4869207b757365726e616d657d3c2f703e3c703e7b616d6f756e747d20616464656420746f20796f7572206163636f756e742e3c2f703e3c703e596f75722063757272656e742062616c616e6365206973207b63757272656e745f62616c616e63657d2e203c2f703e3c703e546865207472616e73616374696f6e206964206973207b7472616e73616374696f6e5f69647d2e3c62723e3c2f703e3c703e3c62723e3c2f703e3c703e4265737420526567617264732e3c62723e7b776562736974655f7469746c657d3c62723e3c2f703e3c62723e),
(11, 'balance_subtract', 'Balance Subtract', 0x3c703e4869207b757365726e616d657d3c2f703e3c703e7b616d6f756e747d2073756274726163742066726f6d20796f7572206163636f756e742e3c2f703e3c703e596f75722063757272656e742062616c616e6365206973207b63757272656e745f62616c616e63657d2e3c2f703e3c703e546865207472616e73616374696f6e206964206973207b7472616e73616374696f6e5f69647d2e3c62723e3c2f703e3c703e3c62723e3c2f703e3c703e4265737420526567617264732e3c62723e7b776562736974655f7469746c657d3c2f703e3c703e3c62723e3c2f703e3c703e3c696d67207372633d2268747470733a2f2f686f74656c69612e746573742f6173736574732f696d672f73756d6d65726e6f74652f363436613034323333336536612e706e672220616c743d22363436613034323333336536612e706e67223e3c62723e3c2f703e3c62723e),
(12, 'landlord_added', 'Landlord Registration', 0x3c703e596f752068617665207375636365737366756c6c79207265676973746572656420617320612076656e646f7220696e207b776562736974655f7469746c657d2e3c2f703e0d0a3c703e596f757220757365726e616d652069733a207b757365726e616d657d20616e6420796f75722070617373776f72642069733a207b70617373776f72647d2e3c2f703e0d0a3c703e4265737420526567617264732e3c6272202f3e7b776562736974655f7469746c657d3c2f703e);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `menus` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `language_id`, `menus`, `created_at`, `updated_at`) VALUES
(273, 7, '[{\"text\":\"Home\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"home\"},{\"text\":\"Property\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"packages\"},{\"text\":\"Transient\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"rooms\"},{\"text\":\"Landlords\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"vendors\"},{\"text\":\"Contact\",\"href\":\"\",\"icon\":\"empty\",\"target\":\"_self\",\"title\":\"\",\"type\":\"contact\"}]', '2024-12-05 05:02:26', '2024-12-05 05:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2021_10_27_042323_add_quantity_to_rooms_table', 1),
(10, '2022_04_27_095020_create_push_subscriptions_table', 2),
(11, '2022_04_27_095718_create_guests_table', 3),
(12, '2022_04_28_050723_add_notification_image_to_basic_settings_table', 4),
(16, '2022_04_28_051844_alter_table_room_bookings', 5),
(17, '2022_04_28_053427_create_room_coupons_table', 5),
(19, '2022_04_28_080102_create_qr_codes_table', 7),
(20, '2022_04_28_074052_alter_table_basic_settings', 8),
(22, '2022_04_30_055359_add_facebook_credentials_to_basic_settings_table', 9),
(23, '2022_04_30_092558_alter_table_users', 10),
(24, '2022_04_30_101023_add_google_credentials_to_basic_settings_table', 11),
(25, '2022_05_01_043221_create_package_coupons_table', 12),
(26, '2022_05_07_054927_alter_table_package_bookings', 13),
(27, '2022_07_04_054928_add_password_col_to_users_table', 14),
(29, '2023_05_22_045033_create_vendor_infos_table', 15),
(31, '2023_05_29_090057_create_room_images_table', 16),
(32, '2023_05_29_102143_create_package_images_table', 17),
(33, '2023_06_08_052204_add_commission_percentage_column_to_room_bookings_table', 18),
(34, '2023_06_08_052523_add_commission_percentage_column_to_package_bookings_table', 18),
(35, '2023_06_11_112658_add_columns_to_admins_table', 19),
(36, '2024_04_17_061323_add_url_and_member_image_to_intro_sections_table', 20),
(38, '2024_04_17_062840_add_button_text_to_intro_sections_table', 21),
(39, '2024_04_17_070654_add_button_text_and_background_image_to_intro_sections_table', 22),
(40, '2024_04_17_102723_add_video_img_to_section_headings_table', 23),
(43, '2024_04_22_090907_add_border_color_to_testimonials_table', 24),
(44, '2024_05_26_084146_add_10_new_payment_gateways', 24),
(45, '2024_05_28_093115_add_conversation_id_into_room_bookings_and_package_bookings_table', 25),
(46, '2021_02_01_030511_create_payment_invoices_table', 26),
(47, '2024_01_10_123456_create_wishlists_table', 27);

-- --------------------------------------------------------

--
-- Table structure for table `offline_gateways`
--

CREATE TABLE `offline_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `instructions` blob DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `attachment_status` tinyint(4) NOT NULL,
  `serial_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offline_gateways`
--

INSERT INTO `offline_gateways` (`id`, `name`, `short_description`, `instructions`, `status`, `attachment_status`, `serial_number`) VALUES
(3, 'Cash', 'Please Upload Valid ID Photo', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_gateways`
--

CREATE TABLE `online_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `information` mediumtext NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_gateways`
--

INSERT INTO `online_gateways` (`id`, `name`, `keyword`, `information`, `status`) VALUES
(1, 'PayPal', 'paypal', '{\"sandbox_status\":\"0\",\"client_id\":\"AVYKFEw63FtDt9aeYOe9biyifNI56s2Hc2F1Us11hWoY5GMuegipJRQBfWLiIKNbwQ5tmqKSrQTU3zB3\",\"client_secret\":\"EJY0qOKliVg7wKsR3uPN7lngr9rL1N7q4WV0FulT1h4Fw3_e5Itv1mxSdbtSUwAaQoXQFgq-RLlk_sQu\"}', 0),
(2, 'Stripe', 'stripe', '{\"key\":\"pk_test_UnU1Coi1p5qFGwtpjZMRMgJM\",\"secret\":\"sk_test_QQcg3vGsKRPlW6T3dXcNJsor\"}', 0),
(3, 'Instamojo', 'instamojo', '{\"sandbox_status\":\"0\",\"instamojo_key\":\"test_172371aa837ae5cad6047dc3052\",\"instamojo_token\":\"test_4ac5a785e25fc596b67dbc5c267\"}', 0),
(4, 'Paystack', 'paystack', '{\"paystack_key\":\"sk_test_4ac9f2c43514e3cc08ab68f922201549ebda1bfd\",\"paystack_email\":\"fahadahmadshemul@gmail.com\"}', 0),
(5, 'Flutterwave', 'flutterwave', '{\"flutterwave_public_key\":\"FLWPUBK_TEST-93972d50b7b24582a2050de2803799c0-X\",\"flutterwave_secret_key\":\"FLWSECK_TEST-3c9d39d4b16e9011bc4b9893f882f71e-X\"}', 0),
(6, 'Razorpay', 'razorpay', '{\"razorpay_key\":\"rzp_test_fV9dM9URYbqjm7\",\"razorpay_secret\":\"nickxZ1du2ojPYVVRTDif2Xr\"}', 0),
(7, 'MercadoPago', 'mercadopago', '{\"sandbox_status\":\"0\",\"mercadopago_token\":\"TEST-705032440135962-041006-ad2e021853f22338fe1a4db9f64d1491-421886156\"}', 0),
(8, 'Mollie', 'mollie', '{\"mollie_key\":\"test_kKT2J9nRMHH9cN6acf2CTruN3t5CC6\"}', 0),
(9, 'Paytm', 'paytm', '{\"environment\":\"production\",\"merchant_key\":\"LhNGUUKE9xCQ9xY8\",\"merchant_mid\":\"tkogux49985047638244\",\"merchant_website\":\"WEBSTAGING\",\"industry\":\"Retail\"}', 0),
(19, 'Phonepe', 'phonepe', '{\"merchant_id\":\"PGTESTPAYUAT\",\"sandbox_status\":\"0\",\"salt_key\":\"099eb0cd-02cf-4e2a-8aca-3e6c6aff0399\",\"salt_index\":\"1\"}', 0),
(20, 'Xendit', 'xendit', '{\"secret_key\":\"xnd_development_3UYs96dELioZGSsxGvyci9GXThQLf1Pl95KqjiXqR6XkzlcJS26xed92THSWb8S\"}', 1),
(21, 'Perfect Money', 'perfect_money', '{\"perfect_money_wallet_id\":\"U45424907\"}', 0),
(22, 'Myfatoorah', 'myfatoorah', '{\"token\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\",\"sandbox_status\":\"0\"}', 0),
(23, 'Yoco', 'yoco', '{\"secret_key\":\"sk_test_960bfde0VBrLlpK098e4ffeb53e1\"}', 0),
(24, 'Toyyibpay', 'toyyibpay', '{\"sandbox_status\":\"0\",\"secret_key\":\"5zcr9cl4-3aak-8vzl-5ahm-6f1k6z1lvjw3\",\"category_code\":\"m1plpg99\"}', 0),
(25, 'Paytabs', 'paytabs', '{\"server_key\":\"SKJ9LL6R92-J6NRR9LDNM-J9JHHMDHMR\",\"profile_id\":\"125178\",\"country\":\"global\",\"api_endpoint\":\"https:\\/\\/secure-global.paytabs.com\\/payment\\/request\"}', 0),
(26, 'Iyzico', 'iyzico', '{\"api_key\":\"sandbox-nhwvNYFN8EdyUm0MXVon9u9wNt6HTKrl\",\"secrect_key\":\"sandbox-nZ69wQYaUbxqKbOoHJmc9CjQZtgcSloC\",\"sandbox_status\":\"0\"}', 0),
(27, 'Midtrans', 'midtrans', '{\"server_key\":\"SB-Mid-server-w4Ihfmt0iPijcKkEfa8X2e-9\",\"is_production\":\"0\"}', 0),
(28, 'Authorize.net', 'authorizenet', '{\"sandbox_status\":\"0\",\"login_id\":\"3Ca5hYQ6h\",\"transaction_key\":\"8bt8Kr5gPZ3ZE23C\",\"public_key\":\"7m38JBnNjStNFq58BA6Wrr852ahtT533cGKavWwu6Fge28RDc5wC7wTL8Vsb35B3\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_imgs` text DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `featured_img` varchar(255) NOT NULL,
  `plan_type` varchar(255) NOT NULL,
  `max_persons` mediumint(8) UNSIGNED DEFAULT NULL,
  `number_of_days` int(11) NOT NULL DEFAULT 1,
  `pricing_type` varchar(255) NOT NULL,
  `package_price` decimal(8,2) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'this email will be used to contact with the admin',
  `phone` varchar(255) DEFAULT NULL COMMENT 'this phone will be used to contact with the admin',
  `avg_rating` decimal(4,2) UNSIGNED DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 - will not show in home page, 1 - will show in home page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `slider_imgs`, `vendor_id`, `featured_img`, `plan_type`, `max_persons`, `number_of_days`, `pricing_type`, `package_price`, `email`, `phone`, `avg_rating`, `is_featured`, `created_at`, `updated_at`) VALUES
(47, NULL, 1, '1732848648.png', 'daywise', 5, 30, 'fixed', 2000.00, 'rentease30@gmail.com', '1234567890', NULL, 1, '2024-11-28 08:34:29', '2024-11-28 18:50:48'),
(48, NULL, 10, '1733398512.png', 'daywise', 4, 30, 'per-person', 1500.00, 'garciatrecia25@gmail.com', '09950598296', NULL, 1, '2024-12-05 03:35:12', '2024-12-05 03:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `package_bookings`
--

CREATE TABLE `package_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_number` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `visitors` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) UNSIGNED NOT NULL,
  `discount` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) UNSIGNED DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `currency_symbol_position` varchar(255) DEFAULT NULL,
  `currency_text` varchar(255) DEFAULT NULL,
  `currency_text_position` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `gateway_type` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `payment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 -> payment incomplete, 1 -> payment complete',
  `comission` float(8,2) DEFAULT NULL,
  `received_amount` float(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_percentage` double(8,2) DEFAULT 0.00,
  `conversation_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_bookings`
--

INSERT INTO `package_bookings` (`id`, `booking_number`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `package_id`, `vendor_id`, `visitors`, `subtotal`, `discount`, `grand_total`, `currency_symbol`, `currency_symbol_position`, `currency_text`, `currency_text_position`, `payment_method`, `gateway_type`, `attachment`, `invoice`, `payment_status`, `comission`, `received_amount`, `created_at`, `updated_at`, `commission_percentage`, `conversation_id`) VALUES
(137, 1733211096, 38, 'Yssabelle Marie Zaguirre', 'zyssabelle@gmail.com', '09157349957', 47, 1, 1, 2000.00, 0.00, 2000.00, '₱', 'left', 'PHP', 'left', 'Cash', 'offline', '1733211096.jpg', '1733211096.pdf', 1, 200.00, 1800.00, '2024-12-02 23:31:36', '2024-12-03 00:31:52', 10.00, NULL),
(138, 1733214531, 39, 'April Joy Aranas', 'sba76787@gmail.com', '09166248825', 47, 1, 2, 2000.00, 0.00, 2000.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, '1733214531.pdf', 1, 200.00, 1800.00, '2024-12-03 00:28:51', '2024-12-03 00:29:36', 10.00, NULL),
(139, 1733303694, 38, 'Yssabelle Marie Zaguirre', 'zyssabelle@gmail.com', '09157349957', 47, 1, 1, 2000.00, 0.00, 2000.00, '₱', 'left', 'PHP', 'left', 'Cash', 'offline', '1733303694.jpg', '1733303694.pdf', 1, 200.00, 1800.00, '2024-12-04 01:14:54', '2024-12-05 05:03:39', 10.00, NULL),
(140, 1733398766, 39, 'April Joy Aranas', 'sba76787@gmail.com', '09166248825', 48, 10, 1, 1500.00, 0.00, 1500.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, '1733398766.pdf', 1, 150.00, 1350.00, '2024-12-05 03:39:26', '2024-12-05 03:41:18', 10.00, NULL),
(141, 1733400652, 40, 'Ian Garcia', 'ian22alvarezgarcia@gmail.com', '09485551236', 47, 1, 1, 2000.00, 0.00, 2000.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, '1733400652.pdf', 1, 200.00, 1800.00, '2024-12-05 04:10:52', '2024-12-05 04:36:08', 10.00, NULL),
(142, 1733446728, 41, 'Anamaris Gamilla', 'anamarisgamilla304@gmail.com', '09369974017', 48, 10, 1, 1500.00, 0.00, 1500.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, NULL, 0, NULL, NULL, '2024-12-05 16:58:48', '2024-12-05 16:58:48', 10.00, NULL),
(143, 1733558488, 36, 'Tenant Tenant2', 'tenant@gmail.com', '1234567890', 48, 10, 2, 3000.00, 0.00, 3000.00, '₱', 'left', 'PHP', 'left', 'Cash', 'offline', '1733558488.png', '1733558488.pdf', 0, NULL, NULL, '2024-12-07 00:01:28', '2024-12-07 00:01:31', 10.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_categories`
--

CREATE TABLE `package_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_categories`
--

INSERT INTO `package_categories` (`id`, `language_id`, `name`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(9, 7, 'House', 1, 1, '2021-06-13 09:27:15', '2024-11-28 07:54:53'),
(10, 7, 'Apartment', 1, 2, '2021-06-13 09:27:33', '2024-11-28 07:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `package_contents`
--

CREATE TABLE `package_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `package_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` blob NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_contents`
--

INSERT INTO `package_contents` (`id`, `language_id`, `package_category_id`, `package_id`, `title`, `slug`, `description`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(96, 7, 9, 47, 'Heeaus', 'heeaus', 0x3c703e3c7374726f6e673e53756d6d6172793a3c2f7374726f6e673e3c6272202f3e5468697320636f7a7920332d626564726f6f6d20686f75736520666561747572657320612070726976617465207377696d6d696e6720706f6f6c20616e6420612073706163696f75732067617264656e2e205065726665637420666f722066616d696c79206c6976696e672c207468652070726f7065727479206f666665727320626f746820696e646f6f7220636f6d666f727420616e64206f7574646f6f722072656c61786174696f6e2c206d616b696e6720697420616e20696465616c20686f6d6520666f7220616e796f6e652077686f20656e6a6f797320612062616c616e636564206c6966657374796c652e3c2f703e0d0a3c68333e3c7374726f6e673e50726f7065727479204465736372697074696f6e3a3c2f7374726f6e673e3c2f68333e0d0a3c703e3c7374726f6e673e436f7a7920332d426564726f6f6d20486f7573652077697468205377696d6d696e6720506f6f6c20616e642047617264656e3c2f7374726f6e673e3c2f703e0d0a3c703e5468697320636861726d696e6720332d626564726f6f6d2070726f7065727479206973207065726665637420666f722074686f7365206c6f6f6b696e6720746f20656e6a6f7920626f746820696e646f6f7220616e64206f7574646f6f72206c6976696e672e204c6f636174656420696e206120706561636566756c206e65696768626f72686f6f642c206974206f66666572732067726561742070726976616379207768696c65207374696c6c206265696e6720636c6f736520746f20657373656e7469616c20616d656e69746965732e204b657920666561747572657320696e636c7564653a3c2f703e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e3320426564726f6f6d733c2f7374726f6e673e20776974682073706163696f757320636c6f7365747320616e64206169722d636f6e646974696f6e696e673c2f6c693e0d0a3c6c693e3c7374726f6e673e322042617468726f6f6d733c2f7374726f6e673e2077697468206d6f6465726e2c20757064617465642066697874757265733c2f6c693e0d0a3c6c693e3c7374726f6e673e4f70656e2d506c616e204c6976696e6720616e642044696e696e6720417265613c2f7374726f6e673e2074686174206f70656e7320757020746f207468652067617264656e3c2f6c693e0d0a3c6c693e3c7374726f6e673e46756c6c792d6571756970706564204b69746368656e3c2f7374726f6e673e2077697468206d6f6465726e206170706c69616e6365733c2f6c693e0d0a3c6c693e3c7374726f6e673e57656c6c2d6d61696e7461696e65642047617264656e2f596172643c2f7374726f6e673e207769746820737061636520666f72206f7574646f6f722064696e696e6720616e642066616d696c7920676174686572696e67733c2f6c693e0d0a3c6c693e3c7374726f6e673e5065747320616c6c6f7765643c2f7374726f6e673e2c207769746820612066656e636564207961726420666f7220796f757220667572727920667269656e64733c2f6c693e0d0a3c2f756c3e0d0a3c703e546869732070726f706572747920636f6d62696e6573206c757875727920616e6420636f6d666f7274207769746820656173792061636365737320746f207363686f6f6c732c207061726b732c20616e642073686f7070696e672063656e746572732e20546865207072697661746520706f6f6c20616e642067617264656e2070726f76696465206120736572656e6520656e7669726f6e6d656e7420666f722072656c61786174696f6e2c206d616b696e6720697420746865207065726665637420686f6d6520666f722066616d696c696573206f7220696e646976696475616c732077686f206c6f7665206f7574646f6f72206c6976696e672e3c2f703e0d0a3c7461626c65207374796c653d22626f726465722d636f6c6c617073653a20636f6c6c617073653b2077696474683a203130302e303538253b2220626f726465723d2231223e3c636f6c67726f75703e3c636f6c207374796c653d2277696474683a2032302e30323838253b22202f3e3c636f6c207374796c653d2277696474683a2032302e30323838253b22202f3e3c636f6c207374796c653d2277696474683a2032302e30323838253b22202f3e3c636f6c207374796c653d2277696474683a2032302e30323838253b22202f3e3c636f6c207374796c653d2277696474683a2032302e30323838253b22202f3e3c2f636f6c67726f75703e0d0a3c74626f64793e0d0a3c74723e0d0a3c74643e416d656e69746965733c2f74643e0d0a3c74643e54763c2f74643e0d0a3c74643e576946693c2f74643e0d0a3c74643e5461626c653c2f74643e0d0a3c74643e526566726967657261746f723c2f74643e0d0a3c2f74723e0d0a3c2f74626f64793e0d0a3c2f7461626c653e, NULL, NULL, '2024-11-28 08:34:29', '2024-11-28 18:33:22'),
(97, 7, 9, 48, 'Julian\'s Boarding House', 'julian\'s-boarding-house', 0x3c703e57656c636f6d6520746f204a756c69616e3b7320426f617264696e6720486f7573652c20776865726520636f6e76656e69656e6365206d6565747320636f6d6d756e697479206c6976696e672e2044657369676e656420746f2070726f76696465206120636f7a7920616e642070726163746963616c20656e7669726f6e6d656e742c206f757220626f617264696e67686f757365206f66666572733a3c2f703e0d0a3c756c3e0d0a3c6c693e5072697661746520526f6f6d733a2046756c6c79206675726e697368656420726f6f6d73207769746820636f6d666f727461626c6520626564732c2073746f72616765206f7074696f6e732c20616e6420776f726b7370616365732e3c2f6c693e0d0a3c6c693e53686172656420416d656e69746965733a2041636365737320746f20612077656c6c2d6d61696e7461696e6564206b69746368656e2c2073706163696f75732064696e696e6720617265612c20616e64206d6f6465726e207368617265642062617468726f6f6d732e3c2f6c693e0d0a3c6c693e436f6d6d6f6e2041726561733a2052656c617820616e6420736f6369616c697a6520696e2074686520696e766974696e67206c6f756e67652c20636f6d706c65746520776974682054562c2057692d46692c20616e6420636f7a792073656174696e672e3c2f6c693e0d0a3c6c693e5574696c697469657320496e636c756465643a20416c6c207574696c6974792062696c6c732028656c6563747269636974792c2077617465722c20616e642057692d4669292061726520696e636c7564656420696e207468652072656e7420666f7220776f7272792d66726565206c6976696e672e3c2f6c693e0d0a3c6c693e486f7573656b656570696e673a20526567756c617220636c65616e696e6720736572766963657320666f7220636f6d6d756e616c2073706163657320656e737572652061207469647920616e642068796769656e696320656e7669726f6e6d656e742e3c2f6c693e0d0a3c6c693e53656375726520616e6420467269656e646c7920456e7669726f6e6d656e743a2054686520626f617264696e67686f757365206973206571756970706564207769746820434354562c2073656375726520656e7472792c20616e6420612077656c636f6d696e6720636f6d6d756e69747920766962652e3c2f6c693e0d0a3c2f756c3e0d0a3c703e4c6f6361746564206a757374206d696e7574657320617761792066726f6d206b6579207075626c6963207472616e73706f72746174696f6e20726f757465732c2073686f70732c20616e64206c6f63616c2061747472616374696f6e732c205b4e616d65206f6620426f617264696e67686f7573655d206973207065726665637420666f722073747564656e74732c2070726f66657373696f6e616c732c20616e642074726176656c657273207365656b696e672061206275646765742d667269656e646c7920616e6420686f6d657920706c61636520746f20737461792e3c2f703e0d0a3c703e546869732072656e74616c2061677265656d656e74206f75746c696e657320746865207465726d7320666f72206f6363757079696e67206120626f617264696e6720686f75736520726f6f6d2e205468652074656e616e7420697320726571756972656420746f20706179206f6e6520283129206d6f6e746820616476616e63652072656e7420616e64206f6e6520283129206d6f6e7468206465706f7369742075706f6e206d6f76652d696e2e204d6f6e74686c792072656e74206d7573742062652070616964206f6e206f72206265666f7265207468652061677265656420646174652e20546865206465706f7369742077696c6c20626520726566756e6465642075706f6e206d6f76652d6f75742c2070726f766964656420746865726520617265206e6f2064616d61676573206f7220756e706169642062616c616e6365732e205468652074656e616e742061677265657320746f20636f6d706c79207769746820686f7573652072756c65732c206b65657020746865207072656d6973657320696e20676f6f6420636f6e646974696f6e2c20616e642067697665203330206461797327207772697474656e206e6f74696365207072696f7220746f207465726d696e6174696f6e2e3c2f703e0d0a3c703e3c6272202f3e504c4541534520434f4e5441435420544845204c414e444c4f5244204245464f52452052454e54494e47213c2f703e, NULL, NULL, '2024-12-05 03:35:12', '2024-12-05 04:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `package_coupons`
--

CREATE TABLE `package_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` decimal(8,2) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `packages` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_images`
--

CREATE TABLE `package_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_images`
--

INSERT INTO `package_images` (`id`, `package_id`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, '6475b983e3573.jpg', '2023-05-30 02:53:23', '2023-05-30 02:53:23'),
(2, NULL, '6475b983e2812.jpg', '2023-05-30 02:53:23', '2023-05-30 02:53:23'),
(3, 35, '6475ba0556f78.jpg', '2023-05-30 02:55:33', '2023-05-30 02:55:58'),
(5, 35, '6475bbd033bf6.jpg', '2023-05-30 03:03:12', '2023-05-30 03:03:12'),
(6, 36, '6476d76eda421.jpg', '2023-05-30 23:13:18', '2023-05-30 23:13:56'),
(7, 36, '6476d76ed9b99.jpg', '2023-05-30 23:13:18', '2023-05-30 23:13:56'),
(8, 37, '647c72c7d36ce.jpg', '2023-06-04 05:17:27', '2023-06-04 05:18:01'),
(10, NULL, '64841792c54ee.jpg', '2023-06-10 00:26:26', '2023-06-10 00:26:26'),
(11, NULL, '648417c29f141.jpg', '2023-06-10 00:27:14', '2023-06-10 00:27:14'),
(12, 38, '648573af3ed49.jpg', '2023-06-11 01:11:43', '2023-06-11 01:12:27'),
(13, 38, '648573af3ed3a.jpg', '2023-06-11 01:11:43', '2023-06-11 01:12:27'),
(14, 39, '6485763b0ee48.jpg', '2023-06-11 01:22:35', '2023-06-11 01:23:05'),
(15, 39, '6485763b109ae.jpg', '2023-06-11 01:22:35', '2023-06-11 01:23:05'),
(16, 40, '6496996e402b3.jpg', '2023-06-24 01:21:18', '2023-06-24 01:29:04'),
(17, 40, '6496996e469a6.jpg', '2023-06-24 01:21:18', '2023-06-24 01:29:04'),
(18, 40, '6496996e71869.jpg', '2023-06-24 01:21:18', '2023-06-24 01:29:04'),
(19, 40, '6496996e75ee1.jpg', '2023-06-24 01:21:18', '2023-06-24 01:29:04'),
(20, 41, '6496ad4f40870.jpg', '2023-06-24 02:46:07', '2023-06-24 02:50:48'),
(21, 41, '6496ad4f4bb23.jpg', '2023-06-24 02:46:07', '2023-06-24 02:50:48'),
(22, 41, '6496ad4f6d7e5.jpg', '2023-06-24 02:46:07', '2023-06-24 02:50:48'),
(23, 41, '6496ad4f7603a.jpg', '2023-06-24 02:46:07', '2023-06-24 02:50:48'),
(24, 42, '6496b8cf44135.jpg', '2023-06-24 03:35:11', '2023-06-24 03:36:50'),
(25, 42, '6496b8cf4419f.jpg', '2023-06-24 03:35:11', '2023-06-24 03:36:50'),
(26, 42, '6496b8cf78c64.jpg', '2023-06-24 03:35:11', '2023-06-24 03:36:50'),
(27, 42, '6496b8cf7e74e.jpg', '2023-06-24 03:35:11', '2023-06-24 03:36:50'),
(28, 43, '6496bcd94139a.jpg', '2023-06-24 03:52:25', '2023-06-24 03:55:43'),
(29, 43, '6496bce5bee3f.jpg', '2023-06-24 03:52:37', '2023-06-24 03:55:43'),
(30, 43, '6496bce5c04e8.jpg', '2023-06-24 03:52:37', '2023-06-24 03:55:43'),
(31, 44, '6496c265aee4f.jpg', '2023-06-24 04:16:05', '2023-06-24 04:18:57'),
(32, 44, '6496c26d5d75b.jpg', '2023-06-24 04:16:13', '2023-06-24 04:18:57'),
(33, 44, '6496c26d62a37.jpg', '2023-06-24 04:16:13', '2023-06-24 04:18:57'),
(34, 44, '6496c26d8b3bb.jpg', '2023-06-24 04:16:13', '2023-06-24 04:18:57'),
(38, 46, '6496c9c788fee.jpg', '2023-06-24 04:47:35', '2023-06-24 04:49:34'),
(39, 46, '6496c9ce61a15.jpg', '2023-06-24 04:47:42', '2023-06-24 04:49:34'),
(40, 46, '6496c9ce68a65.jpg', '2023-06-24 04:47:42', '2023-06-24 04:49:34'),
(41, 46, '6496c9ce8c16f.jpg', '2023-06-24 04:47:42', '2023-06-24 04:49:34'),
(42, 45, '674894b9d2406.jpg', '2024-11-28 08:05:13', '2024-11-28 08:05:13'),
(43, 45, '674894b9d243d.jpg', '2024-11-28 08:05:13', '2024-11-28 08:05:13'),
(44, 47, '67489ab419059.jpg', '2024-11-28 08:30:44', '2024-11-28 08:34:29'),
(45, 47, '67489ab4207fa.jpg', '2024-11-28 08:30:44', '2024-11-28 08:34:29'),
(46, 47, '67492bb483315.jpg', '2024-11-28 18:49:24', '2024-11-28 18:49:24'),
(47, 48, '67518c86d5ba8.jpg', '2024-12-05 03:20:38', '2024-12-05 03:35:12'),
(48, 48, '67518c8ca18e5.jpg', '2024-12-05 03:20:44', '2024-12-05 03:35:12'),
(49, 48, '67518c93b78a9.jpg', '2024-12-05 03:20:51', '2024-12-05 03:35:12'),
(50, 48, '67518ca204148.jpg', '2024-12-05 03:21:06', '2024-12-05 03:35:12'),
(51, 48, '67518ca85e4e3.jpg', '2024-12-05 03:21:12', '2024-12-05 03:35:12'),
(52, 48, '67518e8286a21.jpg', '2024-12-05 03:29:06', '2024-12-05 03:35:12'),
(53, 48, '67518e8ec3cd7.jpg', '2024-12-05 03:29:18', '2024-12-05 03:35:12'),
(54, 48, '67518ea6a9104.jpg', '2024-12-05 03:29:42', '2024-12-05 03:35:12'),
(55, NULL, '67523d764786e.jpg', '2024-12-05 15:55:34', '2024-12-05 15:55:34'),
(56, NULL, '67523d7c06119.jpg', '2024-12-05 15:55:40', '2024-12-05 15:55:40'),
(57, NULL, '67523d84c9a8c.jpg', '2024-12-05 15:55:48', '2024-12-05 15:55:48'),
(58, NULL, '67523d8e6bf0d.jpg', '2024-12-05 15:55:58', '2024-12-05 15:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `package_locations`
--

CREATE TABLE `package_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `longitude` decimal(8,5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_locations`
--

INSERT INTO `package_locations` (`id`, `language_id`, `package_id`, `name`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(115, 7, 47, 'Binalbagan Negros Occidental', 9.96330, 122.95280, '2024-11-28 08:34:57', '2024-11-28 08:34:57'),
(116, 7, 48, 'Vietnam Rose, Brgy. Enclaro, Binalbagan, Negros Occidental', 10.17700, 122.85830, '2024-12-05 03:37:09', '2024-12-05 03:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `package_plans`
--

CREATE TABLE `package_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `day_number` mediumint(8) UNSIGNED DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `plan` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_plans`
--

INSERT INTO `package_plans` (`id`, `language_id`, `package_id`, `day_number`, `start_time`, `end_time`, `title`, `plan`, `created_at`, `updated_at`) VALUES
(113, 7, 47, 30, NULL, NULL, 'Monthly', 0x3c703e4d6f6e74686c793c2f703e, '2024-11-28 08:35:13', '2024-11-28 08:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `package_reviews`
--

CREATE TABLE `package_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `serial_number`, `created_at`, `updated_at`) VALUES
(9, 1, '2020-11-03 09:03:05', '2020-11-03 09:03:05'),
(10, 21, '2020-11-03 09:12:14', '2020-11-03 09:35:31'),
(12, 1, '2021-06-02 02:23:42', '2021-06-02 02:23:42'),
(23, 2, '2021-06-13 08:54:51', '2021-06-13 08:54:51'),
(24, 2, '2023-05-25 04:57:23', '2023-05-25 04:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `body` blob DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_contents`
--

INSERT INTO `page_contents` (`id`, `language_id`, `page_id`, `name`, `slug`, `body`, `meta_keywords`, `meta_description`) VALUES
(30, 7, 23, 'Privacy Policy', 'privacy-policy', 0x3c703e5072697661637920506f6c6963793c2f703e0d0a3c703e54686973205072697661637920506f6c69637920646573637269626573204f757220706f6c696369657320616e642070726f63656475726573206f6e2074686520636f6c6c656374696f6e2c2075736520616e6420646973636c6f73757265206f6620596f757220696e666f726d6174696f6e207768656e20596f752075736520746865205365727669636520616e642074656c6c7320596f752061626f757420596f757220707269766163792072696768747320616e6420686f7720746865206c61772070726f746563747320596f752e3c2f703e0d0a3c703e57652075736520596f757220506572736f6e616c206461746120746f2070726f7669646520616e6420696d70726f76652074686520536572766963652e204279207573696e672074686520536572766963652c20596f7520616772656520746f2074686520636f6c6c656374696f6e20616e6420757365206f6620696e666f726d6174696f6e20696e206163636f7264616e636520776974682074686973205072697661637920506f6c6963792ec2a03c2f703e0d0a3c68343e496e746572707265746174696f6e3c2f68343e0d0a3c703e54686520776f726473206f662077686963682074686520696e697469616c206c6574746572206973206361706974616c697a65642068617665206d65616e696e677320646566696e656420756e6465722074686520666f6c6c6f77696e6720636f6e646974696f6e732e2054686520666f6c6c6f77696e6720646566696e6974696f6e73207368616c6c2068617665207468652073616d65206d65616e696e67207265676172646c657373206f66207768657468657220746865792061707065617220696e2073696e67756c6172206f7220696e20706c7572616c2e3c2f703e0d0a3c68343e446566696e6974696f6e733c2f68343e0d0a3c703e466f722074686520707572706f736573206f662074686973205072697661637920506f6c6963793a3c2f703e0d0a3c756c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4163636f756e743c2f7374726f6e673e206d65616e73206120756e69717565206163636f756e74206372656174656420666f7220596f7520746f20616363657373206f75722053657276696365206f72207061727473206f66206f757220536572766963652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e416666696c696174653c2f7374726f6e673e206d65616e7320616e20656e74697479207468617420636f6e74726f6c732c20697320636f6e74726f6c6c6564206279206f7220697320756e64657220636f6d6d6f6e20636f6e74726f6c207769746820612070617274792c2077686572652022636f6e74726f6c22206d65616e73206f776e657273686970206f6620353025206f72206d6f7265206f6620746865207368617265732c2065717569747920696e746572657374206f72206f74686572207365637572697469657320656e7469746c656420746f20766f746520666f7220656c656374696f6e206f66206469726563746f7273206f72206f74686572206d616e6167696e6720617574686f726974792e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e436f6d70616e793c2f7374726f6e673e2028726566657272656420746f20617320656974686572202274686520436f6d70616e79222c20225765222c2022557322206f7220224f75722220696e20746869732041677265656d656e74292072656665727320746f204576656e746f2e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e436f6f6b6965733c2f7374726f6e673e2061726520736d616c6c2066696c657320746861742061726520706c61636564206f6e20596f757220636f6d70757465722c206d6f62696c6520646576696365206f7220616e79206f7468657220646576696365206279206120776562736974652c20636f6e7461696e696e67207468652064657461696c73206f6620596f75722062726f7773696e6720686973746f7279206f6e2074686174207765627369746520616d6f6e6720697473206d616e7920757365732e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e436f756e7472793c2f7374726f6e673e2072656665727320746f3a20416c61736b612c20556e69746564205374617465733c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4465766963653c2f7374726f6e673e206d65616e7320616e792064657669636520746861742063616e206163636573732074686520536572766963652073756368206173206120636f6d70757465722c20612063656c6c70686f6e65206f722061206469676974616c207461626c65742e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e506572736f6e616c20446174613c2f7374726f6e673e20697320616e7920696e666f726d6174696f6e20746861742072656c6174657320746f20616e206964656e746966696564206f72206964656e7469666961626c6520696e646976696475616c2e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e536572766963653c2f7374726f6e673e2072656665727320746f2074686520576562736974652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e536572766963652050726f76696465723c2f7374726f6e673e206d65616e7320616e79206e61747572616c206f72206c6567616c20706572736f6e2077686f2070726f636573736573207468652064617461206f6e20626568616c66206f662074686520436f6d70616e792e2049742072656665727320746f2074686972642d706172747920636f6d70616e696573206f7220696e646976696475616c7320656d706c6f7965642062792074686520436f6d70616e7920746f20666163696c69746174652074686520536572766963652c20746f2070726f76696465207468652053657276696365206f6e20626568616c66206f662074686520436f6d70616e792c20746f20706572666f726d2073657276696365732072656c6174656420746f207468652053657276696365206f7220746f206173736973742074686520436f6d70616e7920696e20616e616c797a696e6720686f7720746865205365727669636520697320757365642e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e54686972642d706172747920536f6369616c204d6564696120536572766963653c2f7374726f6e673e2072656665727320746f20616e792077656273697465206f7220616e7920736f6369616c206e6574776f726b2077656273697465207468726f756768207768696368206120557365722063616e206c6f6720696e206f722063726561746520616e206163636f756e7420746f207573652074686520536572766963652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e557361676520446174613c2f7374726f6e673e2072656665727320746f206461746120636f6c6c6563746564206175746f6d61746963616c6c792c206569746865722067656e6572617465642062792074686520757365206f66207468652053657276696365206f722066726f6d20746865205365727669636520696e66726173747275637475726520697473656c662028666f72206578616d706c652c20746865206475726174696f6e206f6620612070616765207669736974292e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e576562736974653c2f7374726f6e673e2072656665727320746f204576656e746f2c2061636365737369626c652066726f6d203c6120687265663d2268747470733a2f2f636f646563616e796f6e382e6b7265617469766465762e636f6d2f6576656e746f223e68747470733a2f2f636f646563616e796f6e382e6b7265617469766465762e636f6d2f686f74656c69613c2f613e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e596f753c2f7374726f6e673e206d65616e732074686520696e646976696475616c20616363657373696e67206f72207573696e672074686520536572766963652c206f722074686520636f6d70616e792c206f72206f74686572206c6567616c20656e74697479206f6e20626568616c66206f66207768696368207375636820696e646976696475616c20697320616363657373696e67206f72207573696e672074686520536572766963652c206173206170706c696361626c652e3c2f703e0d0a3c2f6c693e0d0a3c2f756c3e0d0a3c703e436f6c6c656374696e6720616e64205573696e6720596f757220506572736f6e616c20446174613c2f703e0d0a3c703ec2a03c2f703e0d0a3c68343e3c7370616e207374796c653d22666f6e742d73697a653a312e3033373572656d3b666f6e742d7765696768743a626f6c643b223e506572736f6e616c20446174613c2f7370616e3e3c2f68343e0d0a3c703e5768696c65207573696e67204f757220536572766963652c205765206d61792061736b20596f7520746f2070726f766964652055732077697468206365727461696e20706572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e20746861742063616e206265207573656420746f20636f6e74616374206f72206964656e7469667920596f752e20506572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e206d617920696e636c7564652c20627574206973206e6f74206c696d6974656420746f3a3c2f703e0d0a3c756c3e0d0a3c6c693e0d0a3c703e456d61696c20616464726573733c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e4669727374206e616d6520616e64206c617374206e616d653c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e50686f6e65206e756d6265723c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e416464726573732c2053746174652c2050726f76696e63652c205a49502f506f7374616c20636f64652c20436974793c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e557361676520446174613c2f703e0d0a3c2f6c693e0d0a3c2f756c3e0d0a3c68343e557361676520446174613c2f68343e0d0a3c703e5573616765204461746120697320636f6c6c6563746564206175746f6d61746963616c6c79207768656e207573696e672074686520536572766963652e3c2f703e0d0a3c703e55736167652044617461206d617920696e636c75646520696e666f726d6174696f6e207375636820617320596f757220446576696365277320496e7465726e65742050726f746f636f6c20616464726573732028652e672e2049502061646472657373292c2062726f7773657220747970652c2062726f777365722076657273696f6e2c20746865207061676573206f66206f75722053657276696365207468617420596f752076697369742c207468652074696d6520616e642064617465206f6620596f75722076697369742c207468652074696d65207370656e74206f6e2074686f73652070616765732c20756e6971756520646576696365206964656e7469666965727320616e64206f7468657220646961676e6f7374696320646174612e3c2f703e0d0a3c703e5768656e20596f7520616363657373207468652053657276696365206279206f72207468726f7567682061206d6f62696c65206465766963652c205765206d617920636f6c6c656374206365727461696e20696e666f726d6174696f6e206175746f6d61746963616c6c792c20696e636c7564696e672c20627574206e6f74206c696d6974656420746f2c207468652074797065206f66206d6f62696c652064657669636520596f75207573652c20596f7572206d6f62696c652064657669636520756e697175652049442c207468652049502061646472657373206f6620596f7572206d6f62696c65206465766963652c20596f7572206d6f62696c65206f7065726174696e672073797374656d2c207468652074797065206f66206d6f62696c6520496e7465726e65742062726f7773657220596f75207573652c20756e6971756520646576696365206964656e7469666965727320616e64206f7468657220646961676e6f7374696320646174612e3c2f703e0d0a3c703e5765206d617920616c736f20636f6c6c65637420696e666f726d6174696f6e207468617420596f75722062726f777365722073656e6473207768656e6576657220596f75207669736974206f75722053657276696365206f72207768656e20596f7520616363657373207468652053657276696365206279206f72207468726f7567682061206d6f62696c65206465766963652e3c2f703e0d0a3c68343e496e666f726d6174696f6e2066726f6d2054686972642d506172747920536f6369616c204d656469612053657276696365733c2f68343e0d0a3c703e54686520436f6d70616e7920616c6c6f777320596f7520746f2063726561746520616e206163636f756e7420616e64206c6f6720696e20746f20757365207468652053657276696365207468726f7567682074686520666f6c6c6f77696e672054686972642d706172747920536f6369616c204d656469612053657276696365733a3c2f703e0d0a3c756c3e0d0a3c6c693e476f6f676c653c2f6c693e0d0a3c6c693e46616365626f6f6b3c2f6c693e0d0a3c2f756c3e0d0a3c703e496620596f752064656369646520746f207265676973746572207468726f756768206f72206f7468657277697365206772616e742075732061636365737320746f20612054686972642d506172747920536f6369616c204d6564696120536572766963652c205765206d617920636f6c6c65637420506572736f6e616c2064617461207468617420697320616c7265616479206173736f636961746564207769746820596f75722054686972642d506172747920536f6369616c204d6564696120536572766963652773206163636f756e742c207375636820617320596f7572206e616d652c20596f757220656d61696c20616464726573732c20596f75722061637469766974696573206f7220596f757220636f6e74616374206c697374206173736f63696174656420776974682074686174206163636f756e742e3c2f703e0d0a3c703e596f75206d617920616c736f206861766520746865206f7074696f6e206f662073686172696e67206164646974696f6e616c20696e666f726d6174696f6e20776974682074686520436f6d70616e79207468726f75676820596f75722054686972642d506172747920536f6369616c204d6564696120536572766963652773206163636f756e742e20496620596f752063686f6f736520746f2070726f76696465207375636820696e666f726d6174696f6e20616e6420506572736f6e616c20446174612c20647572696e6720726567697374726174696f6e206f72206f74686572776973652c20596f752061726520676976696e672074686520436f6d70616e79207065726d697373696f6e20746f207573652c2073686172652c20616e642073746f726520697420696e2061206d616e6e657220636f6e73697374656e7420776974682074686973205072697661637920506f6c6963792e3c2f703e0d0a3c68343e547261636b696e6720546563686e6f6c6f6769657320616e6420436f6f6b6965733c2f68343e0d0a3c703e57652075736520436f6f6b69657320616e642073696d696c617220747261636b696e6720746563686e6f6c6f6769657320746f20747261636b20746865206163746976697479206f6e204f7572205365727669636520616e642073746f7265206365727461696e20696e666f726d6174696f6e2e20547261636b696e6720746563686e6f6c6f6769657320757365642061726520626561636f6e732c20746167732c20616e64207363726970747320746f20636f6c6c65637420616e6420747261636b20696e666f726d6174696f6e20616e6420746f20696d70726f766520616e6420616e616c797a65204f757220536572766963652e2054686520746563686e6f6c6f6769657320576520757365206d617920696e636c7564653a3c2f703e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e436f6f6b696573206f722042726f7773657220436f6f6b6965732e3c2f7374726f6e673e204120636f6f6b6965206973206120736d616c6c2066696c6520706c61636564206f6e20596f7572204465766963652e20596f752063616e20696e73747275637420596f75722062726f7773657220746f2072656675736520616c6c20436f6f6b696573206f7220746f20696e646963617465207768656e206120436f6f6b6965206973206265696e672073656e742e20486f77657665722c20696620596f7520646f206e6f742061636365707420436f6f6b6965732c20596f75206d6179206e6f742062652061626c6520746f2075736520736f6d65207061727473206f66206f757220536572766963652e20556e6c65737320796f7520686176652061646a757374656420596f75722062726f777365722073657474696e6720736f20746861742069742077696c6c2072656675736520436f6f6b6965732c206f75722053657276696365206d61792075736520436f6f6b6965732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e57656220426561636f6e732e3c2f7374726f6e673e204365727461696e2073656374696f6e73206f66206f7572205365727669636520616e64206f757220656d61696c73206d617920636f6e7461696e20736d616c6c20656c656374726f6e69632066696c6573206b6e6f776e2061732077656220626561636f6e732028616c736f20726566657272656420746f20617320636c65617220676966732c20706978656c20746167732c20616e642073696e676c652d706978656c2067696673292074686174207065726d69742074686520436f6d70616e792c20666f72206578616d706c652c20746f20636f756e742075736572732077686f206861766520766973697465642074686f7365207061676573206f72206f70656e656420616e20656d61696c20616e6420666f72206f746865722072656c61746564207765627369746520737461746973746963732028666f72206578616d706c652c207265636f7264696e672074686520706f70756c6172697479206f662061206365727461696e2073656374696f6e20616e6420766572696679696e672073797374656d20616e642073657276657220696e74656772697479292e3c2f6c693e0d0a3c2f756c3e0d0a3c703e436f6f6b6965732063616e206265202250657273697374656e7422206f72202253657373696f6e2220436f6f6b6965732e2050657273697374656e7420436f6f6b6965732072656d61696e206f6e20596f757220706572736f6e616c20636f6d7075746572206f72206d6f62696c6520646576696365207768656e20596f7520676f206f66666c696e652c207768696c652053657373696f6e20436f6f6b696573206172652064656c6574656420617320736f6f6e20617320596f7520636c6f736520596f7572207765622062726f777365722e204c6561726e206d6f72652061626f757420636f6f6b696573206f6e20746865c2a061727469636c652e3c2f703e0d0a3c703e57652075736520626f74682053657373696f6e20616e642050657273697374656e7420436f6f6b69657320666f722074686520707572706f73657320736574206f75742062656c6f773a3c2f703e0d0a3c756c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4e6563657373617279202f20457373656e7469616c20436f6f6b6965733c2f7374726f6e673e3c2f703e0d0a3c703e547970653a2053657373696f6e20436f6f6b6965733c2f703e0d0a3c703e41646d696e697374657265642062793a2055733c2f703e0d0a3c703e507572706f73653a20546865736520436f6f6b6965732061726520657373656e7469616c20746f2070726f7669646520596f75207769746820736572766963657320617661696c61626c65207468726f75676820746865205765627369746520616e6420746f20656e61626c6520596f7520746f2075736520736f6d65206f66206974732066656174757265732e20546865792068656c7020746f2061757468656e74696361746520757365727320616e642070726576656e74206672617564756c656e7420757365206f662075736572206163636f756e74732e20576974686f757420746865736520436f6f6b6965732c20746865207365727669636573207468617420596f7520686176652061736b656420666f722063616e6e6f742062652070726f76696465642c20616e64205765206f6e6c792075736520746865736520436f6f6b69657320746f2070726f7669646520596f7520776974682074686f73652073657276696365732e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e436f6f6b69657320506f6c696379202f204e6f7469636520416363657074616e636520436f6f6b6965733c2f7374726f6e673e3c2f703e0d0a3c703e547970653a2050657273697374656e7420436f6f6b6965733c2f703e0d0a3c703e41646d696e697374657265642062793a2055733c2f703e0d0a3c703e507572706f73653a20546865736520436f6f6b696573206964656e7469667920696620757365727320686176652061636365707465642074686520757365206f6620636f6f6b696573206f6e2074686520576562736974652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e46756e6374696f6e616c69747920436f6f6b6965733c2f7374726f6e673e3c2f703e0d0a3c703e547970653a2050657273697374656e7420436f6f6b6965733c2f703e0d0a3c703e41646d696e697374657265642062793a2055733c2f703e0d0a3c703e507572706f73653a20546865736520436f6f6b69657320616c6c6f7720757320746f2072656d656d6265722063686f6963657320596f75206d616b65207768656e20596f75207573652074686520576562736974652c20737563682061732072656d656d626572696e6720796f7572206c6f67696e2064657461696c73206f72206c616e677561676520707265666572656e63652e2054686520707572706f7365206f6620746865736520436f6f6b69657320697320746f2070726f7669646520596f7520776974682061206d6f726520706572736f6e616c20657870657269656e636520616e6420746f2061766f696420596f7520686176696e6720746f2072652d656e74657220796f757220707265666572656e6365732065766572792074696d6520596f75207573652074686520576562736974652e3c2f703e0d0a3c2f6c693e0d0a3c2f756c3e0d0a3c703e466f72206d6f726520696e666f726d6174696f6e2061626f75742074686520636f6f6b6965732077652075736520616e6420796f75722063686f6963657320726567617264696e6720636f6f6b6965732c20706c65617365207669736974206f757220436f6f6b69657320506f6c696379206f722074686520436f6f6b6965732073656374696f6e206f66206f7572205072697661637920506f6c6963792e3c2f703e0d0a3c68343e557365206f6620596f757220506572736f6e616c20446174613c2f68343e0d0a3c703e54686520436f6d70616e79206d61792075736520506572736f6e616c204461746120666f722074686520666f6c6c6f77696e6720707572706f7365733a3c2f703e0d0a3c756c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e546f2070726f7669646520616e64206d61696e7461696e206f757220536572766963653c2f7374726f6e673e2c20696e636c7564696e6720746f206d6f6e69746f7220746865207573616765206f66206f757220536572766963652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e546f206d616e61676520596f7572204163636f756e743a3c2f7374726f6e673e20746f206d616e61676520596f757220726567697374726174696f6e20617320612075736572206f662074686520536572766963652e2054686520506572736f6e616c204461746120596f752070726f766964652063616e206769766520596f752061636365737320746f20646966666572656e742066756e6374696f6e616c6974696573206f6620746865205365727669636520746861742061726520617661696c61626c6520746f20596f752061732061207265676973746572656420757365722e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e466f722074686520706572666f726d616e6365206f66206120636f6e74726163743a3c2f7374726f6e673e2074686520646576656c6f706d656e742c20636f6d706c69616e636520616e6420756e64657274616b696e67206f662074686520707572636861736520636f6e747261637420666f72207468652070726f64756374732c206974656d73206f7220736572766963657320596f75206861766520707572636861736564206f72206f6620616e79206f7468657220636f6e74726163742077697468205573207468726f7567682074686520536572766963652e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e546f20636f6e7461637420596f753a3c2f7374726f6e673e20546f20636f6e7461637420596f7520627920656d61696c2c2074656c6570686f6e652063616c6c732c20534d532c206f72206f74686572206571756976616c656e7420666f726d73206f6620656c656374726f6e696320636f6d6d756e69636174696f6e2c20737563682061732061206d6f62696c65206170706c69636174696f6e27732070757368206e6f74696669636174696f6e7320726567617264696e672075706461746573206f7220696e666f726d617469766520636f6d6d756e69636174696f6e732072656c6174656420746f207468652066756e6374696f6e616c69746965732c2070726f6475637473206f7220636f6e747261637465642073657276696365732c20696e636c7564696e672074686520736563757269747920757064617465732c207768656e206e6563657373617279206f7220726561736f6e61626c6520666f7220746865697220696d706c656d656e746174696f6e2e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e546f2070726f7669646520596f753c2f7374726f6e673e2077697468206e6577732c207370656369616c206f666665727320616e642067656e6572616c20696e666f726d6174696f6e2061626f7574206f7468657220676f6f64732c20736572766963657320616e64206576656e7473207768696368207765206f666665722074686174206172652073696d696c617220746f2074686f7365207468617420796f75206861766520616c726561647920707572636861736564206f7220656e7175697265642061626f757420756e6c65737320596f752068617665206f70746564206e6f7420746f2072656365697665207375636820696e666f726d6174696f6e2e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e546f206d616e61676520596f75722072657175657374733a3c2f7374726f6e673e20546f20617474656e6420616e64206d616e61676520596f757220726571756573747320746f2055732e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e466f7220627573696e657373207472616e73666572733a3c2f7374726f6e673e205765206d61792075736520596f757220696e666f726d6174696f6e20746f206576616c75617465206f7220636f6e647563742061206d65726765722c2064697665737469747572652c2072657374727563747572696e672c2072656f7267616e697a6174696f6e2c20646973736f6c7574696f6e2c206f72206f746865722073616c65206f72207472616e73666572206f6620736f6d65206f7220616c6c206f66204f7572206173736574732c2077686574686572206173206120676f696e6720636f6e6365726e206f722061732070617274206f662062616e6b7275707463792c206c69717569646174696f6e2c206f722073696d696c61722070726f63656564696e672c20696e20776869636820506572736f6e616c20446174612068656c642062792055732061626f7574206f7572205365727669636520757365727320697320616d6f6e672074686520617373657473207472616e736665727265642e3c2f703e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e466f72206f7468657220707572706f7365733c2f7374726f6e673e3a205765206d61792075736520596f757220696e666f726d6174696f6e20666f72206f7468657220707572706f7365732c2073756368206173206461746120616e616c797369732c206964656e74696679696e67207573616765207472656e64732c2064657465726d696e696e6720746865206566666563746976656e657373206f66206f75722070726f6d6f74696f6e616c2063616d706169676e7320616e6420746f206576616c7561746520616e6420696d70726f7665206f757220536572766963652c2070726f64756374732c2073657276696365732c206d61726b6574696e6720616e6420796f757220657870657269656e63652e3c2f703e0d0a3c2f6c693e0d0a3c2f756c3e0d0a3c703e5765206d617920736861726520596f757220706572736f6e616c20696e666f726d6174696f6e20696e2074686520666f6c6c6f77696e6720736974756174696f6e733a3c2f703e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e5769746820536572766963652050726f7669646572733a3c2f7374726f6e673e205765206d617920736861726520596f757220706572736f6e616c20696e666f726d6174696f6e207769746820536572766963652050726f76696465727320746f206d6f6e69746f7220616e6420616e616c797a652074686520757365206f66206f757220536572766963652c20746f20636f6e7461637420596f752e3c2f6c693e0d0a3c6c693e3c7374726f6e673e466f7220627573696e657373207472616e73666572733a3c2f7374726f6e673e205765206d6179207368617265206f72207472616e7366657220596f757220706572736f6e616c20696e666f726d6174696f6e20696e20636f6e6e656374696f6e20776974682c206f7220647572696e67206e65676f74696174696f6e73206f662c20616e79206d65726765722c2073616c65206f6620436f6d70616e79206173736574732c2066696e616e63696e672c206f72206163717569736974696f6e206f6620616c6c206f72206120706f7274696f6e206f66204f757220627573696e65737320746f20616e6f7468657220636f6d70616e792e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5769746820416666696c69617465733a3c2f7374726f6e673e205765206d617920736861726520596f757220696e666f726d6174696f6e2077697468204f757220616666696c69617465732c20696e20776869636820636173652077652077696c6c20726571756972652074686f736520616666696c696174657320746f20686f6e6f722074686973205072697661637920506f6c6963792e20416666696c696174657320696e636c756465204f757220706172656e7420636f6d70616e7920616e6420616e79206f74686572207375627369646961726965732c206a6f696e742076656e7475726520706172746e657273206f72206f7468657220636f6d70616e696573207468617420576520636f6e74726f6c206f7220746861742061726520756e64657220636f6d6d6f6e20636f6e74726f6c20776974682055732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5769746820627573696e65737320706172746e6572733a3c2f7374726f6e673e205765206d617920736861726520596f757220696e666f726d6174696f6e2077697468204f757220627573696e65737320706172746e65727320746f206f6666657220596f75206365727461696e2070726f64756374732c207365727669636573206f722070726f6d6f74696f6e732e3c2f6c693e0d0a3c6c693e3c7374726f6e673e57697468206f746865722075736572733a3c2f7374726f6e673e207768656e20596f7520736861726520706572736f6e616c20696e666f726d6174696f6e206f72206f746865727769736520696e74657261637420696e20746865207075626c69632061726561732077697468206f746865722075736572732c207375636820696e666f726d6174696f6e206d61792062652076696577656420627920616c6c20757365727320616e64206d6179206265207075626c69636c79206469737472696275746564206f7574736964652e20496620596f7520696e7465726163742077697468206f74686572207573657273206f72207265676973746572207468726f75676820612054686972642d506172747920536f6369616c204d6564696120536572766963652c20596f757220636f6e7461637473206f6e207468652054686972642d506172747920536f6369616c204d656469612053657276696365206d61792073656520596f7572206e616d652c2070726f66696c652c20706963747572657320616e64206465736372697074696f6e206f6620596f75722061637469766974792e2053696d696c61726c792c206f746865722075736572732077696c6c2062652061626c6520746f2076696577206465736372697074696f6e73206f6620596f75722061637469766974792c20636f6d6d756e6963617465207769746820596f7520616e64207669657720596f75722070726f66696c652e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5769746820596f757220636f6e73656e743c2f7374726f6e673e3a205765206d617920646973636c6f736520596f757220706572736f6e616c20696e666f726d6174696f6e20666f7220616e79206f7468657220707572706f7365207769746820596f757220636f6e73656e742e3c2f6c693e0d0a3c2f756c3e0d0a3c68343e526574656e74696f6e206f6620596f757220506572736f6e616c20446174613c2f68343e0d0a3c703e54686520436f6d70616e792077696c6c2072657461696e20596f757220506572736f6e616c2044617461206f6e6c7920666f72206173206c6f6e67206173206973206e656365737361727920666f722074686520707572706f73657320736574206f757420696e2074686973205072697661637920506f6c6963792e2057652077696c6c2072657461696e20616e642075736520596f757220506572736f6e616c204461746120746f2074686520657874656e74206e656365737361727920746f20636f6d706c792077697468206f7572206c6567616c206f626c69676174696f6e732028666f72206578616d706c652c2069662077652061726520726571756972656420746f2072657461696e20796f7572206461746120746f20636f6d706c792077697468206170706c696361626c65206c617773292c207265736f6c76652064697370757465732c20616e6420656e666f726365206f7572206c6567616c2061677265656d656e747320616e6420706f6c69636965732e3c2f703e0d0a3c703e54686520436f6d70616e792077696c6c20616c736f2072657461696e205573616765204461746120666f7220696e7465726e616c20616e616c7973697320707572706f7365732e20557361676520446174612069732067656e6572616c6c792072657461696e656420666f7220612073686f7274657220706572696f64206f662074696d652c20657863657074207768656e20746869732064617461206973207573656420746f20737472656e677468656e20746865207365637572697479206f7220746f20696d70726f7665207468652066756e6374696f6e616c697479206f66204f757220536572766963652c206f7220576520617265206c6567616c6c79206f626c69676174656420746f2072657461696e2074686973206461746120666f72206c6f6e6765722074696d6520706572696f64732e3c2f703e0d0a3c68343e5472616e73666572206f6620596f757220506572736f6e616c20446174613c2f68343e0d0a3c703e596f757220696e666f726d6174696f6e2c20696e636c7564696e6720506572736f6e616c20446174612c2069732070726f6365737365642061742074686520436f6d70616e792773206f7065726174696e67206f66666963657320616e6420696e20616e79206f7468657220706c6163657320776865726520746865207061727469657320696e766f6c76656420696e207468652070726f63657373696e6720617265206c6f63617465642e204974206d65616e732074686174207468697320696e666f726d6174696f6e206d6179206265207472616e7366657272656420746f20e2809420616e64206d61696e7461696e6564206f6e20e2809420636f6d707574657273206c6f6361746564206f757473696465206f6620596f75722073746174652c2070726f76696e63652c20636f756e747279206f72206f7468657220676f7665726e6d656e74616c206a7572697364696374696f6e2077686572652074686520646174612070726f74656374696f6e206c617773206d617920646966666572207468616e2074686f73652066726f6d20596f7572206a7572697364696374696f6e2e3c2f703e0d0a3c703e596f757220636f6e73656e7420746f2074686973205072697661637920506f6c69637920666f6c6c6f77656420627920596f7572207375626d697373696f6e206f66207375636820696e666f726d6174696f6e20726570726573656e747320596f75722061677265656d656e7420746f2074686174207472616e736665722e3c2f703e0d0a3c703e54686520436f6d70616e792077696c6c2074616b6520616c6c20737465707320726561736f6e61626c79206e656365737361727920746f20656e73757265207468617420596f757220646174612069732074726561746564207365637572656c7920616e6420696e206163636f7264616e636520776974682074686973205072697661637920506f6c69637920616e64206e6f207472616e73666572206f6620596f757220506572736f6e616c20446174612077696c6c2074616b6520706c61636520746f20616e206f7267616e697a6174696f6e206f72206120636f756e74727920756e6c6573732074686572652061726520616465717561746520636f6e74726f6c7320696e20706c61636520696e636c7564696e6720746865207365637572697479206f6620596f7572206461746120616e64206f7468657220706572736f6e616c20696e666f726d6174696f6e2e3c2f703e0d0a3c68343e44656c65746520596f757220506572736f6e616c20446174613c2f68343e0d0a3c703e596f7520686176652074686520726967687420746f2064656c657465206f72207265717565737420746861742057652061737369737420696e2064656c6574696e672074686520506572736f6e616c20446174612074686174205765206861766520636f6c6c65637465642061626f757420596f752e3c2f703e0d0a3c703e4f75722053657276696365206d6179206769766520596f7520746865206162696c69747920746f2064656c657465206365727461696e20696e666f726d6174696f6e2061626f757420596f752066726f6d2077697468696e2074686520536572766963652e3c2f703e0d0a3c703e596f75206d6179207570646174652c20616d656e642c206f722064656c65746520596f757220696e666f726d6174696f6e20617420616e792074696d65206279207369676e696e6720696e20746f20596f7572204163636f756e742c20696620796f752068617665206f6e652c20616e64207669736974696e6720746865206163636f756e742073657474696e67732073656374696f6e207468617420616c6c6f777320796f7520746f206d616e61676520596f757220706572736f6e616c20696e666f726d6174696f6e2e20596f75206d617920616c736f20636f6e7461637420557320746f20726571756573742061636365737320746f2c20636f72726563742c206f722064656c65746520616e7920706572736f6e616c20696e666f726d6174696f6e207468617420596f7520686176652070726f766964656420746f2055732e3c2f703e0d0a3c703e506c65617365206e6f74652c20686f77657665722c2074686174205765206d6179206e65656420746f2072657461696e206365727461696e20696e666f726d6174696f6e207768656e20776520686176652061206c6567616c206f626c69676174696f6e206f72206c617766756c20626173697320746f20646f20736f2e3c2f703e0d0a3c68343e3c7370616e207374796c653d22666f6e742d73697a653a312e3136323572656d3b223e427573696e657373205472616e73616374696f6e733c2f7370616e3e3c2f68343e0d0a3c703e49662074686520436f6d70616e7920697320696e766f6c76656420696e2061206d65726765722c206163717569736974696f6e206f722061737365742073616c652c20596f757220506572736f6e616c2044617461206d6179206265207472616e736665727265642e2057652077696c6c2070726f76696465206e6f74696365206265666f726520596f757220506572736f6e616c2044617461206973207472616e7366657272656420616e64206265636f6d6573207375626a65637420746f206120646966666572656e74205072697661637920506f6c6963792e3c2f703e0d0a3c68343e4c617720656e666f7263656d656e743c2f68343e0d0a3c703e556e646572206365727461696e2063697263756d7374616e6365732c2074686520436f6d70616e79206d617920626520726571756972656420746f20646973636c6f736520596f757220506572736f6e616c204461746120696620726571756972656420746f20646f20736f206279206c6177206f7220696e20726573706f6e736520746f2076616c6964207265717565737473206279207075626c696320617574686f7269746965732028652e672e206120636f757274206f72206120676f7665726e6d656e74206167656e6379292e3c2f703e0d0a3c68343e4f74686572206c6567616c20726571756972656d656e74733c2f68343e0d0a3c703e54686520436f6d70616e79206d617920646973636c6f736520596f757220506572736f6e616c204461746120696e2074686520676f6f642066616974682062656c6965662074686174207375636820616374696f6e206973206e656365737361727920746f3a3c2f703e0d0a3c756c3e0d0a3c6c693e436f6d706c7920776974682061206c6567616c206f626c69676174696f6e3c2f6c693e0d0a3c6c693e50726f7465637420616e6420646566656e642074686520726967687473206f722070726f7065727479206f662074686520436f6d70616e793c2f6c693e0d0a3c6c693e50726576656e74206f7220696e76657374696761746520706f737369626c652077726f6e67646f696e6720696e20636f6e6e656374696f6e20776974682074686520536572766963653c2f6c693e0d0a3c6c693e50726f746563742074686520706572736f6e616c20736166657479206f66205573657273206f66207468652053657276696365206f7220746865207075626c69633c2f6c693e0d0a3c6c693e50726f7465637420616761696e7374206c6567616c206c696162696c6974793c2f6c693e0d0a3c2f756c3e0d0a3c68343e5365637572697479206f6620596f757220506572736f6e616c20446174613c2f68343e0d0a3c703e546865207365637572697479206f6620596f757220506572736f6e616c204461746120697320696d706f7274616e7420746f2055732c206275742072656d656d6265722074686174206e6f206d6574686f64206f66207472616e736d697373696f6e206f7665722074686520496e7465726e65742c206f72206d6574686f64206f6620656c656374726f6e69632073746f726167652069732031303025207365637572652e205768696c652057652073747269766520746f2075736520636f6d6d65726369616c6c792061636365707461626c65206d65616e7320746f2070726f7465637420596f757220506572736f6e616c20446174612c2057652063616e6e6f742067756172616e74656520697473206162736f6c7574652073656375726974792e3c2f703e0d0a3c703e4368696c6472656e277320507269766163793c2f703e0d0a3c703e4f7572205365727669636520646f6573206e6f74206164647265737320616e796f6e6520756e6465722074686520616765206f662031332e20576520646f206e6f74206b6e6f77696e676c7920636f6c6c65637420706572736f6e616c6c79206964656e7469666961626c6520696e666f726d6174696f6e2066726f6d20616e796f6e6520756e6465722074686520616765206f662031332e20496620596f7520617265206120706172656e74206f7220677561726469616e20616e6420596f7520617265206177617265207468617420596f7572206368696c64206861732070726f7669646564205573207769746820506572736f6e616c20446174612c20706c6561736520636f6e746163742055732e204966205765206265636f6d652061776172652074686174205765206861766520636f6c6c656374656420506572736f6e616c20446174612066726f6d20616e796f6e6520756e6465722074686520616765206f6620313320776974686f757420766572696669636174696f6e206f6620706172656e74616c20636f6e73656e742c2057652074616b6520737465707320746f2072656d6f7665207468617420696e666f726d6174696f6e2066726f6d204f757220736572766572732e3c2f703e0d0a3c703e4966205765206e65656420746f2072656c79206f6e20636f6e73656e742061732061206c6567616c20626173697320666f722070726f63657373696e6720596f757220696e666f726d6174696f6e20616e6420596f757220636f756e74727920726571756972657320636f6e73656e742066726f6d206120706172656e742c205765206d6179207265717569726520596f757220706172656e74277320636f6e73656e74206265666f726520576520636f6c6c65637420616e6420757365207468617420696e666f726d6174696f6e2e3c2f703e0d0a3c703e4c696e6b7320746f204f746865722057656273697465733c2f703e0d0a3c703e4f75722053657276696365206d617920636f6e7461696e206c696e6b7320746f206f74686572207765627369746573207468617420617265206e6f74206f706572617465642062792055732e20496620596f7520636c69636b206f6e2061207468697264207061727479206c696e6b2c20596f752077696c6c20626520646972656374656420746f2074686174207468697264207061727479277320736974652e205765207374726f6e676c792061647669736520596f7520746f2072657669657720746865205072697661637920506f6c696379206f66206576657279207369746520596f752076697369742e3c2f703e0d0a3c703e57652068617665206e6f20636f6e74726f6c206f76657220616e6420617373756d65206e6f20726573706f6e736962696c69747920666f722074686520636f6e74656e742c207072697661637920706f6c6963696573206f7220707261637469636573206f6620616e79207468697264207061727479207369746573206f722073657276696365732e3c2f703e0d0a3c703e4368616e67657320746f2074686973205072697661637920506f6c6963793c2f703e0d0a3c703e5765206d617920757064617465204f7572205072697661637920506f6c6963792066726f6d2074696d6520746f2074696d652e2057652077696c6c206e6f7469667920596f75206f6620616e79206368616e67657320627920706f7374696e6720746865206e6577205072697661637920506f6c696379206f6e207468697320706167652e3c2f703e0d0a3c703e57652077696c6c206c657420596f75206b6e6f772076696120656d61696c20616e642f6f7220612070726f6d696e656e74206e6f74696365206f6e204f757220536572766963652c207072696f7220746f20746865206368616e6765206265636f6d696e672065666665637469766520616e64207570646174652074686520224c61737420757064617465642220646174652061742074686520746f70206f662074686973205072697661637920506f6c6963792e3c2f703e0d0a3c703e596f7520617265206164766973656420746f207265766965772074686973205072697661637920506f6c69637920706572696f646963616c6c7920666f7220616e79206368616e6765732e204368616e67657320746f2074686973205072697661637920506f6c6963792061726520656666656374697665207768656e20746865792061726520706f73746564206f6e207468697320706167652e3c2f703e0d0a3c703e436f6e746163742055733c2f703e0d0a3c703e496620796f75206861766520616e79207175657374696f6e732061626f75742074686973205072697661637920506f6c6963792c20596f752063616e20636f6e746163742075733a3c2f703e, 'terms', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney');
INSERT INTO `page_contents` (`id`, `language_id`, `page_id`, `name`, `slug`, `body`, `meta_keywords`, `meta_description`) VALUES
(32, 7, 24, 'Terms & Conditions', 'terms-&-conditions', 0x3c68333e3c7374726f6e673e54656e616e74205465726d7320616e6420436f6e646974696f6e733c2f7374726f6e673e3c2f68333e0d0a3c6f6c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e52656e74616c2041677265656d656e743c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652074656e616e742061677265657320746f2072656e74207468652070726f706572747920617420746865206167726565642d75706f6e20726174652c20666f7220746865206167726565642d75706f6e207465726d2028652e672e2c206d6f6e74686c79206f722066697865642d7465726d292c20616e6420746f20706179207468652072656e7420696e2066756c6c20616e64206f6e2074696d652e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5365637572697479204465706f7369743c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e41207365637572697479206465706f73697420697320726571756972656420617420746865207374617274206f6620746865206c6561736520746f20636f76657220616e792064616d61676573206f7220756e706169642072656e742e20546865206465706f7369742077696c6c2062652072657475726e656420746f207468652074656e616e742061742074686520656e64206f6620746865206c656173652c206d696e757320616e7920646564756374696f6e7320666f722064616d616765732c206f75747374616e64696e672072656e742c206f72206f7468657220636861726765732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4d61696e74656e616e636520616e6420526570616972733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652074656e616e742061677265657320746f206d61696e7461696e207468652070726f706572747920696e20676f6f6420636f6e646974696f6e2c206b656570696e6720697420636c65616e20616e64207265706f7274696e6720616e79206e656365737361727920726570616972732070726f6d70746c792e3c2f6c693e0d0a3c6c693e526f7574696e65206d61696e74656e616e636520726573706f6e736962696c6974696573206d617920626520646566696e65642028652e672e2c206c61776e20636172652c206368616e67696e67206c6967687462756c6273292c207768696c65207374727563747572616c207265706169727320616e64206d616a6f7220697373756573206172652074686520726573706f6e736962696c697479206f6620746865206c616e646c6f72642e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e557365206f662050726f70657274793c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652074656e616e742061677265657320746f20757365207468652070726f7065727479206578636c75736976656c7920666f72207265736964656e7469616c20707572706f7365732028756e6c657373206f7468657277697365207370656369666965642920616e64206e6f7420656e6761676520696e20696c6c6567616c20616374697669746965732e3c2f6c693e0d0a3c6c693e416e79207375626c657474696e67206f722061737369676e6d656e74206f6620746865206c65617365206d75737420626520617070726f76656420696e2077726974696e6720627920746865206c616e646c6f72642e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e52656e74205061796d656e743c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e52656e7420697320647565206f6e207468652073706563696669656420646174652065616368206d6f6e74682e204661696c75726520746f207061792072656e74206f6e2074696d65206d617920726573756c7420696e206c6174652066656573206f72206576696374696f6e2e3c2f6c693e0d0a3c6c693e4d6574686f6473206f66207061796d656e742028652e672e2c2062616e6b207472616e736665722c206f6e6c696e6520706c6174666f726d292073686f756c64206265207370656369666965642e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5574696c697469657320616e642053657276696365733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e53706563696679207768696368207574696c69746965732028652e672e2c2077617465722c206761732c20656c6563747269636974792c20696e7465726e6574292061726520696e636c7564656420696e207468652072656e742c20616e64207768696368207468652074656e616e7420697320726573706f6e7369626c6520666f7220706179696e672073657061726174656c792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e52756c657320616e6420526567756c6174696f6e733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652074656e616e742061677265657320746f20666f6c6c6f7720616c6c2070726f70657274792072756c65732c20696e636c7564696e67206e6f697365207265737472696374696f6e732c2070657420706f6c69636965732c20736d6f6b696e6720706f6c69636965732c20616e6420616e79206275696c64696e67206f7220636f6d6d756e69747920726567756c6174696f6e732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e496e737572616e63653c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652074656e616e7420697320656e636f75726167656420286f722072657175697265642920746f206d61696e7461696e2072656e746572732720696e737572616e636520746f20636f76657220706572736f6e616c2070726f7065727479206c6f73732c2064616d6167652c206f72206c696162696c6974792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5465726d696e6174696f6e20616e642052656e6577616c3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5370656369667920636f6e646974696f6e7320756e64657220776869636820746865206c656173652063616e206265207465726d696e617465642028652e672e2c206561726c79207465726d696e6174696f6e20666565732c206e6f7469636520706572696f64292c20616e64207468652070726f6365737320666f722072656e6577696e6720746865206c65617365206966206170706c696361626c652e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c2f6f6c3e0d0a3c6872202f3e0d0a3c68333e3c7374726f6e673e4c616e646c6f7264205465726d7320616e6420436f6e646974696f6e733c2f7374726f6e673e3c2f68333e0d0a3c6f6c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e50726f706572747920436f6e646974696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f72642061677265657320746f2070726f76696465207468652070726f706572747920696e206120686162697461626c6520636f6e646974696f6e2c206d656574696e6720616c6c206c6f63616c206865616c746820616e6420736166657479207374616e64617264732e3c2f6c693e0d0a3c6c693e546865206c616e646c6f726420697320726573706f6e7369626c6520666f72206d616a6f72207265706169727320616e6420656e737572696e672074686174207468652070726f70657274792072656d61696e73207361666520616e642066756e6374696f6e616c2e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e52656e7420436f6c6c656374696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f72642061677265657320746f20636c6561726c7920636f6d6d756e69636174652072656e7420616d6f756e74732c206475652064617465732c20616e64207061796d656e74206d6574686f64732e20546865206c616e646c6f72642073686f756c642070726f7669646520726563656970747320666f7220616e79207061796d656e7473206d6164652e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e41636365737320746f2050726f70657274793c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f7264206861732074686520726967687420746f20616363657373207468652070726f706572747920666f7220726570616972732c20696e7370656374696f6e732c206f722073686f77696e67732c20627574206d757374206769766520726561736f6e61626c65206e6f746963652028757375616c6c792032342d343820686f7572732920756e6c65737320746865726520697320616e20656d657267656e63792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5265706169727320616e64204d61696e74656e616e63653c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f726420697320726573706f6e7369626c6520666f7220726570616972696e6720616e79207374727563747572616c206973737565732c20706c756d62696e672c2068656174696e672c20616e6420656c656374726963616c2073797374656d7320756e6c657373207468652064616d61676520697320636175736564206279207468652074656e616e742773206e65676c6967656e63652e3c2f6c693e0d0a3c6c693e546865206c616e646c6f7264206973206f626c69676174656420746f2061646472657373207265706169722072657175657374732077697468696e206120726561736f6e61626c652074696d65206672616d652e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5072697661637920616e6420517569657420456e6a6f796d656e743c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f72642061677265657320746f2072657370656374207468652074656e616e74e280997320726967687420746f207072697661637920616e64206e6f7420656e746572207468652070726f706572747920776974686f75742070726f706572206e6f74696365202865786365707420696e20656d657267656e63696573292e3c2f6c693e0d0a3c6c693e546865206c616e646c6f7264206d75737420656e737572652074686174206e6f206f746865722074656e616e7473206f7220706572736f6e732064697374757262207468652074656e616e74e28099732022717569657420656e6a6f796d656e7422206f66207468652070726f70657274792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5365637572697479204465706f7369743c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f7264206d757374206163636f756e7420666f7220616e642072657475726e207468652074656e616e742773207365637572697479206465706f73697420286d696e757320616e79206c65676974696d61746520646564756374696f6e73292077697468696e207468652072657175697265642074696d65206672616d652c207479706963616c6c79203330206461797320616674657220746865206c6561736520656e64732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e54656e616e74e2809973205269676874733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f7264206d757374206e6f74206469736372696d696e61746520616761696e73742074656e616e747320616e64206d75737420636f6d706c79207769746820616c6c206661697220686f7573696e67206c6177732e3c2f6c693e0d0a3c6c693e416e79206368616e67657320746f206c65617365207465726d732c20737563682061732072656e7420696e637265617365732c206d75737420626520636f6d6d756e69636174656420696e2077726974696e6720616e642061646865726520746f206c6f63616c20726567756c6174696f6e732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5465726d696e6174696f6e20616e64204576696374696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e546865206c616e646c6f7264206861732074686520726967687420746f207465726d696e61746520746865206c6561736520616e6420657669637420612074656e616e7420666f72206e6f6e2d7061796d656e74206f662072656e742c2076696f6c6174696f6e206f6620746865206c65617365207465726d732c206f7220696c6c6567616c2061637469766974792c20696e206163636f7264616e63652077697468206c6f63616c206c6177732e3c2f6c693e0d0a3c6c693e546865206c616e646c6f7264206d75737420666f6c6c6f7720746865206c6567616c2070726f6365737320666f72206576696374696f6e2c2070726f766964696e6720617070726f707269617465206e6f746963657320616e6420636f7572742066696c696e67732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c2f6f6c3e0d0a3c6872202f3e0d0a3c68333e3c7374726f6e673e41646d696e202850726f7065727479204d616e61676572206f72204f6e6c696e6520506c6174666f726d29205465726d7320616e6420436f6e646974696f6e733c2f7374726f6e673e3c2f68333e0d0a3c6f6c3e0d0a3c6c693e0d0a3c703e3c7374726f6e673e526f6c65206f662041646d696e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e206163747320617320616e20696e7465726d656469617279206265747765656e207468652074656e616e7420616e6420746865206c616e646c6f72642c20666163696c69746174696e6720636f6d6d756e69636174696f6e2c206d616e6167696e67207061796d656e74732c2068616e646c696e67206d61696e74656e616e63652072657175657374732c20616e64207265736f6c76696e672064697370757465732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5061796d656e742050726f63657373696e673c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e206d61792070726f7669646520616e206f6e6c696e6520706c6174666f726d20666f722072656e74207061796d656e7420616e6420656e737572652074696d656c792070726f63657373696e672e2046656573206d6179206170706c7920666f72206c617465207061796d656e7473206f72207573696e67207370656369666963207061796d656e74206d6574686f64732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e436f6d6d756e69636174696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e20697320726573706f6e7369626c6520666f7220666f7277617264696e6720636f6d6d756e69636174696f6e73206265747765656e20746865206c616e646c6f726420616e642074656e616e742c206d61696e7461696e696e6720636f6e666964656e7469616c6974792c20616e6420656e737572696e67207468617420616c6c20636f72726573706f6e64656e636520697320636c65617220616e642074696d656c792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4d61696e74656e616e636520616e64205265706169722052657175657374733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e20666163696c69746174657320746865207265706f7274696e6720616e6420747261636b696e67206f66206d61696e74656e616e6365206973737565732e205468652061646d696e206d61792061737369676e20636f6e74726163746f727320666f7220726570616972732c20616e6420656e73757265207468617420626f7468207061727469657320617265206b65707420696e666f726d65642061626f75742070726f67726573732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e4c6567616c20436f6d706c69616e63653c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e20656e7375726573207468617420616c6c206c656173652061677265656d656e747320636f6d706c792077697468206c6f63616c20686f7573696e67206c6177732c20726567756c6174696f6e732c20616e64207374616e64617264732e20546865792073686f756c6420616c736f20626520726573706f6e7369626c6520666f722068656c70696e6720626f7468207061727469657320756e6465727374616e642074686569722072696768747320616e64206f626c69676174696f6e732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e44697370757465205265736f6c7574696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e206d61792070726f76696465206d6564696174696f6e207365727669636573206f7220657363616c617465206469737075746573206265747765656e207468652074656e616e7420616e64206c616e646c6f726420746f20612074686972642070617274792028652e672e2c2061206c6567616c20617574686f7269747929206966206e65636573736172792e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e466565205374727563747572653c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e41646d696e2066656573206d6179206265206368617267656420666f722073657276696365732073756368206173206c617465207061796d656e742070726f63657373696e672c206d61696e74656e616e636520636f6f7264696e6174696f6e2c206f7220636f6e7472616374206d616e6167656d656e742e2054686520666565207374727563747572652073686f756c64206265207472616e73706172656e7420616e64206167726565642075706f6e20627920616c6c20706172746965732e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5072697661637920616e6420446174612050726f74656374696f6e3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e206d75737420656e73757265207468617420626f74682074656e616e7420616e64206c616e646c6f726420706572736f6e616c2064617461206973206b6570742073656375726520616e64206e6f742073686172656420776974686f757420636f6e73656e742c20696e20636f6d706c69616e6365207769746820646174612070726f74656374696f6e206c6177732028652e672e2c20474450522c2043435041292e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c6c693e0d0a3c703e3c7374726f6e673e5465726d696e6174696f6e206f662053657276696365733c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e5468652061646d696e2063616e207465726d696e6174652069747320736572766963657320666f72206e6f6e2d636f6d706c69616e63652077697468207465726d732062792065697468657220746865206c616e646c6f7264206f722074656e616e742e20436f6e646974696f6e7320666f72207465726d696e6174696f6e2073686f756c6420626520636c6561722c20616e642074686520696e766f6c766564207061727479206d757374206265206e6f7469666965642e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6c693e0d0a3c2f6f6c3e, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_headings`
--

CREATE TABLE `page_headings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `blogs_title` varchar(255) NOT NULL,
  `contact_us_title` varchar(255) NOT NULL,
  `about_us_title` varchar(255) DEFAULT NULL,
  `faqs_title` varchar(255) NOT NULL,
  `gallery_title` varchar(255) NOT NULL,
  `rooms_title` varchar(255) NOT NULL,
  `services_title` varchar(255) NOT NULL,
  `packages_title` varchar(255) NOT NULL,
  `error_page_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_headings`
--

INSERT INTO `page_headings` (`id`, `language_id`, `blogs_title`, `contact_us_title`, `about_us_title`, `faqs_title`, `gallery_title`, `rooms_title`, `services_title`, `packages_title`, `error_page_title`, `created_at`, `updated_at`) VALUES
(3, 7, 'Blog', 'Contact Us', 'About Us', 'FAQs', 'Gallery', 'Rooms', 'Services', 'Property', '404', '2021-06-14 04:12:25', '2024-11-28 07:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(6, 'fahadahmadshemul@gmail.com', '4mGYmXbhg7AKTv7uQfg2xH4YbWNrKtqJ', NULL),
(7, 'garciatrecia25@gmail.com', 'J9zmO0TriV0LVZUsgNhhOjqzxm6sx7nG', NULL),
(9, 'garciatrecia25@gmail.com', '0gETgTgLPCVgO8OvFYRATI014BYa0d9M', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_invoices`
--

CREATE TABLE `payment_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `InvoiceId` bigint(20) UNSIGNED NOT NULL,
  `InvoiceStatus` varchar(255) NOT NULL,
  `InvoiceValue` varchar(255) NOT NULL,
  `Currency` varchar(255) NOT NULL,
  `InvoiceDisplayValue` varchar(255) NOT NULL,
  `TransactionId` bigint(20) UNSIGNED NOT NULL,
  `TransactionStatus` varchar(255) NOT NULL,
  `PaymentGateway` varchar(255) NOT NULL,
  `PaymentId` bigint(20) UNSIGNED NOT NULL,
  `CardNumber` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `background_color` varchar(100) DEFAULT NULL,
  `background_opacity` decimal(8,2) NOT NULL DEFAULT 1.00,
  `title` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `button_color` varchar(20) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `delay` int(11) NOT NULL DEFAULT 1000 COMMENT 'in milisconds',
  `serial_number` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribable_type` varchar(255) NOT NULL,
  `subscribable_id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` varchar(500) NOT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `content_encoding` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_subscriptions`
--

INSERT INTO `push_subscriptions` (`id`, `subscribable_type`, `subscribable_id`, `endpoint`, `public_key`, `auth_token`, `content_encoding`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\Guest', 3, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAAB7rTbLWkP3IbWzITU8oFaJ4CbKlWDnZspZymK4vGxFAgFcO3B%2bDiQEzF8ZCEwG0fN9GpKT%2fO%2fj8X5AAw9Z%2baWN6jx1ogONRbKp7qdmhDEg5rcRBMrjJj9u690LwD1Dq13KGX95%2fwry7qqCxsLSOF5srRZ0ai4hGg%2bzsrtA1wkI7tqYaRizfE4JtcYxYfOd6h5JIFtMzgCMIStPxsrpSQ5O%2fo8WQ7RFoBPQp0RxgojQeaqBD45Xk6Yt2a9lb%2b8TajoBevTbTrV3bYmo%2blXe9ap67aZP0BZpJ4GrHGu51iHmGaTktkWAztBf1YgedOXMWyk%3d', 'BNfCPEGpKXz_N07yzDLgHjYlgJCVKMdUt68UHf3X-8rav4Vuxmk8Nm1a6FhxJc2c_1LqWI5usNijLYNjQbYQZbQ', 'OpxAnJXNVBVUEGGeaqlIQg', NULL, '2022-04-27 21:59:46', '2022-04-27 21:59:46'),
(3, 'App\\Models\\Guest', 4, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAADd0kJ3ZLRZRLhTLtbrQY5pyhqdrYibNVHt%2bt1QTyr757R0%2fJxilzE6JUUpslszLXFkf%2fU1dXZ2omRAuVRXLseLj6nGiinZ%2fGz3ZOmKJpGT%2bgyHWhay0C7Vs4bH0duSxO06A%2fnv4zq%2bvHGzqBmiu1NATdpJPbapF42vQqlIIkfuK6x%2fRL58fwK8Qm3G8nSCr8SHfY2mMgQ8O5EaHLqQocWvxJhedBoOAAJEv4mlbROXGKZK5wi8YtfXKt%2byeOG10I0bFf9f1sNDHi66OnhX2iuUenpLkanJbCFQPXvREn0EzV%2f0gw2EC1qSvEhP%2fP%2ffkp8%3d', 'BPZN3JVUEd1KNpAFrr89mVzn7C8vDM-3ag1Q9u0VuU9nLvlpf_MZH_NliJ-g2Ks_ntz7eP5jhJRJCOOCX_ogtQg', 'dloqTnQAIY7CcQMtF2S5hg', NULL, '2022-04-27 22:00:12', '2022-04-27 22:00:12'),
(4, 'App\\Models\\Guest', 5, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAABvvTwRKBolXdzZzPhpLIX9nw3fPA%2blWdmGGK84FZJSbT1%2bkiNf7YjIfYHVr0XPijdQD7o4R%2fxz%2bjKWV3rDMFjyp2uNE6AbLpG%2bWW%2bbZKXDS%2fFbpbTDhnkZKhIcRVqAW0SLeZa0z%2bwLK14MUtAEm1GQWKdrs%2bLh4TEZLBSIbnydJNzTYE55M%2fN%2f58AWtcPX5JaQe4gZGZ7sSBSWD4mcv%2fJX%2fg%2fSm3q8pFsTgETW%2f5KTGh1pY7Icie1qIhjjChtD%2bkcUnMN9FgCxz3EvU%2fvCZBRqqu3X5GHZj%2fTUbYMPMuNyPPX5kWhIEyQXkF6ogmVQvZA%3d', 'BKKY3hQwqA9MvCJZQS8eHsOkdXIoyBgUzw1SPYlrzghMlzbS9wRAg3PPtcclqIatHcy8TKdvH2AU3X7wQDlWmtI', 'XETR2AeFZQCW0YtPnEALvA', NULL, '2022-04-29 21:45:21', '2022-04-29 21:45:21'),
(6, 'App\\Models\\Guest', 7, 'https://wns2-sg2p.notify.windows.com/w/?token=BQYAAAAr8iHytZptw7T%2bvQnS0zSEuAxrPYmXfBYXx%2bXbfiN2hvgl8Lf8YPXGw9gy7l6Gyk4IbpvaEmE5WCL7amKBvolkc%2b%2fZPk2xEkHgARXufqliq%2fYKthtICEFn4itXBVG0LhyKEQftJXU5RuAvEMkQeuzRqhlj6WtWUXTPJactOot9pB7y19bZ5DwygvDGkj21XhiGW3fBffSSmKWUlpZGYLg5hfK%2ba7uWw6fc9VgxVUunn5b4FiwSvkeB6hJnCoUsPYP8YNnYHvjO3xzn%2f7YN85l%2fnzu2I3vduki48D0x4kDi150G0Yy3MqmVavtKAjaMh30%3d', 'BJYMwSUwIyOvysNZyiUnjmrY-S56k7fivpO6xYPvHCmTE9VOji1cE3v0k02T7veIn1wKNNCLlHUtbKg64Rcsh1o', 'D-8_KXgcTsqhUFJIthPSqg', NULL, '2022-06-29 22:18:38', '2022-06-29 22:18:38'),
(10, 'App\\Models\\Guest', 11, 'https://fcm.googleapis.com/fcm/send/dVZtTZ0fncc:APA91bGFdsmtkoLax5GCd-Did2yLC2WphlB-Z_VRZpqk84SoYRQqT_BIyalBcFF-XbP82wiN2zVAezxyYRM7z2QD3TJKBvv2QCkz4Bs_YGmQ2oyEFZZZap6uFtoWT2iv0yWMm_9BkamS', 'BN7fk9ezgk6Uv0poKlptjJ7svPJFAp2Osi49QVJlKY6t0_09mtYBE8UPrTSZdJ-_bsisCbLVL5Ge95YY8qs0KSA', 'Ifup-mKgrAor7sc5OypMGw', NULL, '2022-11-07 23:30:06', '2022-11-07 23:30:06'),
(11, 'App\\Models\\Guest', 12, 'https://fcm.googleapis.com/fcm/send/dTNgHJTKrmw:APA91bH5eUEmdjtw82nX9me06y7m3qkxCvZAo6WiBHwwKK-AqLjFFuqsFkIPCahsj5xPjMc-bzBDcY071HIwc26rZnAlrdJuBO82ZjbPxh42jYKA4GnpyOGx3N95HuChy95uuLuQtbE6', 'BGq0_mWwQhgH9SI3rvqTZdrU1xrsA7Ekn4LPIy6M-B1mm62fgoYcqfy3VD9jJMJLNh-RtNsBfIraykQAdlF0g10', 'Yn9wzXJGMtB0K6y3dmjoPA', NULL, '2024-11-30 22:01:31', '2024-11-30 22:01:31'),
(12, 'App\\Models\\Guest', 13, 'https://fcm.googleapis.com/fcm/send/fUL6VnbI_ik:APA91bGjTu5DF4ClzWEd9R92pw6a0pW0QYGfrvMXI3fPN2GDYe0P97yoAx0HrpGAhosmm3BjNQuXyBbtovcCGPzFFMtqt-bj230UE2GlH89D4UpTnMSr0dQCj14mlzplhm77kud1z76w', 'BMZ7pNHuWwTdtEtQxi3P4S6G0CuG0s6GhUFpssH1DyZxt9cLh6KlbjwzQ5x46jaj8lz5YHlTQXXWVL1e9_Be7FI', 'VM5Bcui4pixJ4LQpAUvySA', NULL, '2024-12-02 21:48:01', '2024-12-02 21:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `name`, `url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Rentease', 'http://localhost/rentease', '674935ea89c70.png', '2024-11-28 19:33:20', '2024-11-28 19:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(3, 'Super Admin', '[\"Dashboard\",\"Rooms Management\",\"Room Bookings\",\"Packages Management\",\"Package Bookings\",\"Withdraw\",\"Lifetime Earnings\",\"Total Profit\",\"Transaction\",\"Support Tickets\",\"Vendors Management\",\"Home Page Sections\",\"Footer\",\"Services Management\",\"Blogs Management\",\"Gallery Management\",\"FAQ Management\",\"Custom Pages\",\"Announcement Popup\",\"Users Management\",\"Payment Gateways\",\"Theme & Home\",\"Menu Builder\",\"Settings\",\"Language Management\",\"Admins Management\",\"Sitemap\"]', '2019-10-04 02:52:29', '2022-11-13 00:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `slider_imgs` text DEFAULT NULL,
  `featured_img` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `bed` smallint(5) UNSIGNED NOT NULL,
  `bath` smallint(5) UNSIGNED NOT NULL,
  `max_guests` int(11) DEFAULT NULL,
  `rent` decimal(8,2) UNSIGNED NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 means will not show in home page, 1 means will show in home page',
  `avg_rating` decimal(8,2) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `vendor_id`, `slider_imgs`, `featured_img`, `status`, `bed`, `bath`, `max_guests`, `rent`, `latitude`, `longitude`, `address`, `phone`, `email`, `is_featured`, `avg_rating`, `created_at`, `updated_at`, `quantity`) VALUES
(76, 1, NULL, '1732811975.png', 1, 4, 1, 6, 150.00, '9.9633', '122.9528', 'Binalbagan', '1234567890', 'rentease30@gmail.com', 1, NULL, '2024-11-28 08:39:35', '2024-11-28 19:16:38', 1),
(78, 10, NULL, '1733399748.png', 1, 2, 3, 6, 100.00, '10.0774', '122.8686', 'Prk. Wvsu, Brgy. Caradion, Himamaylan City', '09950598296', 'garciatrecia25@gmail.com', 1, NULL, '2024-12-05 03:55:48', '2024-12-05 03:56:12', 3),
(80, 1, NULL, '1733565091.png', 1, 3, 1, 3, 1123.00, '10.193339', '122.859569', 'Bin', '123123123123', 'test4@gmail.com', 1, NULL, '2024-12-07 01:51:31', '2024-12-07 01:51:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_amenities`
--

CREATE TABLE `room_amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_amenities`
--

INSERT INTO `room_amenities` (`id`, `language_id`, `name`, `serial_number`, `created_at`, `updated_at`) VALUES
(10, 7, 'Free Wifi', 1, '2021-06-13 22:16:18', '2021-06-13 22:16:18'),
(11, 7, 'Parking', 2, '2021-06-13 22:16:29', '2021-06-13 22:16:29'),
(12, 7, 'Family Rooms', 3, '2021-06-13 22:16:44', '2021-06-13 22:16:44'),
(13, 7, 'Non Smoking Rooms', 4, '2021-06-13 22:17:01', '2021-06-13 22:17:01'),
(14, 7, 'TV', 5, '2021-06-13 22:17:21', '2024-11-28 19:17:05'),
(15, 7, 'Pets Allowed', 6, '2021-06-13 22:17:34', '2021-06-13 22:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `room_bookings`
--

CREATE TABLE `room_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_number` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `guests` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) UNSIGNED DEFAULT NULL,
  `discount` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) UNSIGNED NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `currency_symbol_position` varchar(255) NOT NULL,
  `currency_text` varchar(255) NOT NULL,
  `currency_text_position` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `gateway_type` varchar(255) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `comission` float(8,2) DEFAULT NULL,
  `received_amount` float(8,2) DEFAULT NULL,
  `payment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 -> payment incomplete, 1 -> payment complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_percentage` double(8,2) DEFAULT 0.00,
  `conversation_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_bookings`
--

INSERT INTO `room_bookings` (`id`, `booking_number`, `user_id`, `vendor_id`, `customer_name`, `customer_email`, `customer_phone`, `room_id`, `arrival_date`, `departure_date`, `guests`, `subtotal`, `discount`, `grand_total`, `currency_symbol`, `currency_symbol_position`, `currency_text`, `currency_text_position`, `payment_method`, `gateway_type`, `attachment`, `invoice`, `comission`, `received_amount`, `payment_status`, `created_at`, `updated_at`, `commission_percentage`, `conversation_id`) VALUES
(95, 1733208534, 36, 1, 'Tenant Tenant2', 'tenant@gmail.com', '1234567890', 76, '2024-12-03', '2024-12-14', 5, 1650.00, 0.00, 1650.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, '1733208534.pdf', 165.00, 1485.00, 1, '2024-12-02 22:48:54', '2024-12-02 22:50:07', 10.00, NULL),
(96, 1733304076, 38, 1, 'Yssabelle Marie Zaguirre', 'zyssabelle@gmail.com', '09157349957', 76, '2024-12-14', '2024-12-15', 1, 150.00, 0.00, 150.00, '₱', 'left', 'PHP', 'left', 'Xendit', 'online', NULL, '1733304076.pdf', 15.00, 135.00, 1, '2024-12-04 01:21:16', '2024-12-04 01:22:17', 10.00, NULL),
(98, 1733400257, 40, 10, 'Ian Garcia', 'ian22alvarezgarcia@gmail.com', '09485551236', 78, '2024-12-05', '2024-12-06', 1, 100.00, 0.00, 100.00, '₱', 'left', 'PHP', 'left', 'Cash', 'offline', '1733400257.jpg', '1733400257.pdf', 10.00, 90.00, 1, '2024-12-05 04:04:17', '2024-12-05 04:04:34', 10.00, NULL),
(99, 1733646037, 36, 1, 'Tenant Tenant2', 'tenant@gmail.com', '1234567890', 80, '2024-12-08', '2024-12-21', 3, 14599.00, 0.00, 14599.00, '₱', 'left', 'PHP', 'left', 'Cash', 'offline', '1733646037.png', '1733646037.pdf', NULL, NULL, 0, '2024-12-08 00:20:37', '2024-12-08 00:20:37', 10.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_categories`
--

CREATE TABLE `room_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_categories`
--

INSERT INTO `room_categories` (`id`, `language_id`, `name`, `status`, `image`, `serial_number`, `created_at`, `updated_at`) VALUES
(9, 7, 'House', 1, '67488959162bc.jpeg', 1, '2021-06-13 22:07:03', '2024-11-28 07:16:41'),
(10, 7, 'Apartment', 1, '67488966ced31.jpg', 2, '2021-06-13 22:07:13', '2024-11-28 07:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `room_contents`
--

CREATE TABLE `room_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `room_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `description` blob NOT NULL,
  `amenities` text NOT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_contents`
--

INSERT INTO `room_contents` (`id`, `language_id`, `room_category_id`, `room_id`, `title`, `slug`, `summary`, `description`, `amenities`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(154, 7, 9, 76, 'Boarding House', 'boarding-house', 'Enjoy a modern and affordable living experience in this shared 4-bedroom unit. The fully furnished room is ideal for individuals looking to live in a vibrant community, with easy access to work, study, and entertainment options. High-speed Wi-Fi, and shared amenities like the kitchen and bathroom make this an excellent choice for students or professionals.', 0x3c703e3c7374726f6e673e4d6f6465726e2053686172656420526f6f6d20696e206120342d426564726f6f6d20556e69743c2f7374726f6e673e3c2f703e0d0a3c703e4c6f6f6b696e6720666f7220616e206166666f726461626c652c20736861726564206c6976696e6720617272616e67656d656e743f2054686973206d6f6465726e2073686172656420726f6f6d20696e206120322d626564726f6f6d20756e697420697320696465616c20666f722073747564656e7473206f7220776f726b696e672070726f66657373696f6e616c732e2054686520726f6f6d20636f6d6573206675726e697368656420616e642069732064657369676e6564207769746820626f746820636f6d666f727420616e6420636f6e76656e69656e636520696e206d696e642e20466561747572657320696e636c7564653a3c2f703e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e46756c6c79206675726e69736865643c2f7374726f6e673e2077697468206120646f75626c65206265642c2077617264726f62652c206465736b2c20616e642063686169723c2f6c693e0d0a3c6c693e3c7374726f6e673e5368617265642062617468726f6f6d3c2f7374726f6e673e207769746820636c65616e2c206d6f6465726e20616d656e69746965733c2f6c693e0d0a3c6c693e3c7374726f6e673e536861726564206b69746368656e3c2f7374726f6e673e2065717569707065642077697468206120726566726967657261746f722c2073746f76652c20616e64206d6963726f776176653c2f6c693e0d0a3c6c693e3c7374726f6e673e486967682d73706565642057692d46693c2f7374726f6e673e20696e636c756465643c2f6c693e0d0a3c6c693e3c7374726f6e673e32342f372073656375726974793c2f7374726f6e673e20666f7220796f7572207065616365206f66206d696e643c2f6c693e0d0a3c2f756c3e0d0a3c703e4c6f636174656420696e20612076696272616e7420616e642061636365737369626c6520617265612077697468206e6561726279206d616c6c732c207363686f6f6c732c20616e64207472616e73706f72746174696f6e20687562732e20546869732073686172656420726f6f6d206f666665727320746865207065726665637420626c656e64206f6620636f6d666f727420616e64206166666f72646162696c6974792e3c2f703e, '[\"10\",\"11\",\"16\"]', NULL, NULL, '2024-11-28 08:39:35', '2024-11-28 08:39:35'),
(156, 7, 9, 78, 'Emman\'s Boarding house', 'emman\'s-boarding-house', 'Welcome to Emman\'s Boarding House, your home away from home! Conveniently located in [City/Neighborhood], our boarding house offers a safe, clean, and welcoming environment tailored for students, professionals, and travelers.', 0x3c703e3c7374726f6e673e466561747572657320616e6420416d656e69746965733a3c2f7374726f6e673e3c2f703e0d0a3c756c3e0d0a3c6c693e3c7374726f6e673e46756c6c79204675726e697368656420526f6f6d733a3c2f7374726f6e673e204561636820726f6f6d20696e636c75646573206120636f6d666f727461626c65206265642c207374756479206465736b2c2063686169722c20616e642077617264726f62652e3c2f6c693e0d0a3c6c693e3c7374726f6e673e536861726564205370616365733a3c2f7374726f6e673e2057656c6c2d6d61696e7461696e656420636f6d6d6f6e20617265617320696e636c7564696e67206120636f7a79206c6976696e6720726f6f6d2c2064696e696e6720617265612c20616e64206b69746368656e657474652e3c2f6c693e0d0a3c6c693e3c7374726f6e673e4d6f6465726e2042617468726f6f6d733a3c2f7374726f6e673e20536861726564206f7220707269766174652062617468726f6f6d206f7074696f6e732c20636c65616e656420726567756c61726c7920666f7220796f757220636f6d666f72742e3c2f6c693e0d0a3c6c693e3c7374726f6e673e5574696c697469657320496e636c756465643a3c2f7374726f6e673e2052656e7420636f7665727320656c6563747269636974792c2077617465722c20616e642057692d466920746f206b65657020796f75722062756467657420696e20636865636b2e3c2f6c693e0d0a3c6c693e3c7374726f6e673e536563757265205072656d697365733a3c2f7374726f6e673e2032342f3720434354562c2073656375726520656e7472792c20616e64206f6e2d7369746520737461666620666f7220796f75722073616665747920616e64207065616365206f66206d696e642e3c2f6c693e0d0a3c2f756c3e0d0a3c703e3c7374726f6e673e5072696d65204c6f636174696f6e3a3c2f7374726f6e673e3c6272202f3e536974756174656420696e20612076696272616e74206e65696768626f72686f6f642c2074686520626f617264696e6720686f757365206973206a75737420612073686f72742077616c6b206f7220636f6d6d75746520746f3a3c2f703e0d0a3c756c3e0d0a3c6c693e5363686f6f6c7320616e6420756e697665727369746965733c2f6c693e0d0a3c6c693e427573696e65737320687562733c2f6c693e0d0a3c6c693e52657374617572616e74732c2063616665732c20616e642067726f636572792073746f7265733c2f6c693e0d0a3c6c693e5075626c6963207472616e73706f7274206c696e6b3c2f6c693e0d0a3c2f756c3e0d0a3c703e5468697320426f617264696e6720486f757365206f6666657273205472616e7369656e742072656e742e3c2f703e0d0a3c703e3c7374726f6e673e466c657869626c6520417272616e67656d656e74733a3c2f7374726f6e673e3c6272202f3e43686f6f73652066726f6d2073696e676c652c20646f75626c652c206f7220646f726d69746f72792d7374796c6520726f6f6d732c20617661696c61626c6520666f722073686f72742d7465726d206f72206c6f6e672d7465726d2073746179732e3c2f703e, '[\"10\",\"11\",\"13\",\"14\"]', NULL, NULL, '2024-12-05 03:55:48', '2024-12-05 03:55:48'),
(158, 7, 10, 80, 'house', 'house', 'aweaweawewa', 0x3c703e6177656177656177657761657761656177656177653c2f703e, '[\"11\",\"12\"]', NULL, NULL, '2024-12-07 01:51:31', '2024-12-07 01:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `room_coupons`
--

CREATE TABLE `room_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` decimal(8,2) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `serial_number` int(10) UNSIGNED NOT NULL,
  `rooms` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_coupons`
--

INSERT INTO `room_coupons` (`id`, `name`, `code`, `type`, `value`, `start_date`, `end_date`, `serial_number`, `rooms`, `created_at`, `updated_at`) VALUES
(2, 'Rent Ease', 'Rentease', 'percentage', 10.00, '2023-05-25', '2030-01-04', 1, NULL, '2023-05-27 04:31:07', '2024-12-02 22:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 58, '6475b2d2c5097.jpg', '2023-05-30 02:24:50', '2023-05-30 02:26:19'),
(2, 58, '6475b2d2c6524.jpg', '2023-05-30 02:24:50', '2023-05-30 02:26:19'),
(3, 58, '6475b5456464a.jpg', '2023-05-30 02:35:17', '2023-05-30 02:35:17'),
(4, NULL, '6475b7c1aac18.jpg', '2023-05-30 02:45:53', '2023-05-30 02:45:53'),
(5, NULL, '6475b7c1aac19.jpg', '2023-05-30 02:45:53', '2023-05-30 02:45:53'),
(6, NULL, '6475b815658d2.jpg', '2023-05-30 02:47:17', '2023-05-30 02:47:17'),
(7, NULL, '6475b81565d5a.jpg', '2023-05-30 02:47:17', '2023-05-30 02:47:17'),
(8, NULL, '6475b838ee4a5.jpg', '2023-05-30 02:47:52', '2023-05-30 02:47:52'),
(9, NULL, '6475b838f4156.jpg', '2023-05-30 02:47:53', '2023-05-30 02:47:53'),
(10, NULL, '6475b868cb35d.jpg', '2023-05-30 02:48:40', '2023-05-30 02:48:40'),
(11, NULL, '6475b868cb30d.jpg', '2023-05-30 02:48:40', '2023-05-30 02:48:40'),
(12, NULL, '6475b8d083d06.jpg', '2023-05-30 02:50:24', '2023-05-30 02:50:24'),
(13, NULL, '6475b8d088550.jpg', '2023-05-30 02:50:24', '2023-05-30 02:50:24'),
(14, NULL, '6475b95ec9737.jpg', '2023-05-30 02:52:46', '2023-05-30 02:52:46'),
(15, NULL, '6475b95ec9888.jpg', '2023-05-30 02:52:46', '2023-05-30 02:52:46'),
(16, 59, '647b0418b15aa.jpg', '2023-06-03 03:12:56', '2023-06-03 03:13:56'),
(18, 60, '647da5ef132b5.jpg', '2023-06-05 03:07:59', '2023-06-05 03:10:04'),
(19, 60, '647da689c3575.jpg', '2023-06-05 03:10:33', '2023-06-05 03:10:33'),
(21, 61, '647da7bba8858.jpg', '2023-06-05 03:15:39', '2023-06-05 03:16:56'),
(22, 61, '647da83ea6620.jpg', '2023-06-05 03:17:50', '2023-06-05 03:17:50'),
(24, 62, '64841f8493383.jpg', '2023-06-10 01:00:20', '2023-06-10 01:02:25'),
(25, 62, '64841f849343d.jpg', '2023-06-10 01:00:20', '2023-06-10 01:02:25'),
(26, 63, '64843330b5371.jpg', '2023-06-10 02:24:16', '2023-06-10 02:25:08'),
(27, 63, '64843330b5329.jpg', '2023-06-10 02:24:16', '2023-06-10 02:25:08'),
(28, 64, '648575a9a7236.jpg', '2023-06-11 01:20:09', '2023-06-11 01:21:09'),
(29, 64, '648575a9b050a.jpg', '2023-06-11 01:20:09', '2023-06-11 01:21:09'),
(32, 65, '64941cce29637.jpg', '2023-06-22 04:05:02', '2023-06-22 04:11:25'),
(33, 65, '64941eaa359d0.jpg', '2023-06-22 04:12:58', '2023-06-22 04:12:58'),
(34, 66, '64941ef3e7dee.jpg', '2023-06-22 04:14:11', '2023-06-22 04:17:53'),
(35, 66, '64941ef3e8973.jpg', '2023-06-22 04:14:11', '2023-06-22 04:17:53'),
(36, 66, '64941ef43564e.jpg', '2023-06-22 04:14:12', '2023-06-22 04:17:53'),
(37, 66, '64941ef89d0ab.jpg', '2023-06-22 04:14:16', '2023-06-22 04:17:53'),
(38, 67, '649424c937ada.jpg', '2023-06-22 04:39:05', '2023-06-22 04:47:21'),
(39, 67, '649424c93f682.jpg', '2023-06-22 04:39:05', '2023-06-22 04:47:21'),
(40, 67, '649424c96bea0.jpg', '2023-06-22 04:39:05', '2023-06-22 04:47:21'),
(41, 68, '64968837b700f.jpg', '2023-06-24 00:07:51', '2023-06-24 00:21:58'),
(42, 68, '64968837b6f41.jpg', '2023-06-24 00:07:51', '2023-06-24 00:21:58'),
(43, 68, '64968837e8dc0.jpg', '2023-06-24 00:07:51', '2023-06-24 00:21:58'),
(44, 68, '64968837efa3c.jpg', '2023-06-24 00:07:51', '2023-06-24 00:21:58'),
(45, 65, '6496899a32bb8.jpg', '2023-06-24 00:13:46', '2023-06-24 00:13:46'),
(46, 69, '64968bf03b7ce.jpg', '2023-06-24 00:23:44', '2023-06-24 00:27:38'),
(47, 69, '64968bf03ff14.jpg', '2023-06-24 00:23:44', '2023-06-24 00:27:38'),
(48, 69, '64968bf06cf65.jpg', '2023-06-24 00:23:44', '2023-06-24 00:27:38'),
(49, 69, '64968bf32d205.jpg', '2023-06-24 00:23:47', '2023-06-24 00:27:38'),
(50, 70, '64968d43aa34c.jpg', '2023-06-24 00:29:23', '2023-06-24 00:36:55'),
(51, 70, '64968d43bd5fb.jpg', '2023-06-24 00:29:23', '2023-06-24 00:36:55'),
(52, 70, '64968d43e5c87.jpg', '2023-06-24 00:29:23', '2023-06-24 00:36:55'),
(53, 70, '64968d43f075e.jpg', '2023-06-24 00:29:23', '2023-06-24 00:36:55'),
(54, 71, '64968f7dd9ec1.jpg', '2023-06-24 00:38:53', '2023-06-24 00:42:21'),
(55, 71, '64968f7ddad41.jpg', '2023-06-24 00:38:53', '2023-06-24 00:42:21'),
(56, 71, '64968f7e1a9d2.jpg', '2023-06-24 00:38:54', '2023-06-24 00:42:21'),
(57, 71, '64968f7e1d352.jpg', '2023-06-24 00:38:54', '2023-06-24 00:42:21'),
(58, 72, '649690e367c33.jpg', '2023-06-24 00:44:51', '2023-06-24 00:49:42'),
(59, 72, '649690e367c33.jpg', '2023-06-24 00:44:51', '2023-06-24 00:49:42'),
(60, 72, '649690e3946b6.jpg', '2023-06-24 00:44:51', '2023-06-24 00:49:42'),
(61, 72, '649690e3948e1.jpg', '2023-06-24 00:44:51', '2023-06-24 00:49:42'),
(62, 73, '64969296dc3c6.jpg', '2023-06-24 00:52:06', '2023-06-24 00:54:51'),
(63, 73, '64969296dc3c6.jpg', '2023-06-24 00:52:06', '2023-06-24 00:54:51'),
(64, 73, '649692971242b.jpg', '2023-06-24 00:52:07', '2023-06-24 00:54:51'),
(65, 73, '64969297125de.jpg', '2023-06-24 00:52:07', '2023-06-24 00:54:51'),
(71, 75, '6496972e54c16.jpg', '2023-06-24 01:11:42', '2023-06-24 01:14:53'),
(72, 75, '6496972e54c35.jpg', '2023-06-24 01:11:42', '2023-06-24 01:14:53'),
(73, 75, '6496972e7f6dc.jpg', '2023-06-24 01:11:42', '2023-06-24 01:14:53'),
(74, 75, '64969730f29c6.jpg', '2023-06-24 01:11:44', '2023-06-24 01:14:53'),
(75, 74, '67488cf665403.jpg', '2024-11-28 07:32:06', '2024-11-28 07:32:06'),
(76, 74, '67488cfa4ab91.jpg', '2024-11-28 07:32:10', '2024-11-28 07:32:10'),
(77, 76, '67489c317b012.jpg', '2024-11-28 08:37:05', '2024-11-28 08:39:35'),
(78, 76, '67489c3f9f566.jpg', '2024-11-28 08:37:19', '2024-11-28 08:39:35'),
(79, 76, '67492cc090047.jpg', '2024-11-28 18:53:52', '2024-11-28 18:53:52'),
(80, 77, '67519218ddf2a.jpg', '2024-12-05 03:44:24', '2024-12-05 03:50:11'),
(81, 77, '6751921f905f1.jpg', '2024-12-05 03:44:31', '2024-12-05 03:50:11'),
(82, 77, '67519225a11e9.jpg', '2024-12-05 03:44:37', '2024-12-05 03:50:11'),
(83, 77, '675192322247f.jpg', '2024-12-05 03:44:50', '2024-12-05 03:50:11'),
(84, 77, '6751923dad399.jpg', '2024-12-05 03:45:01', '2024-12-05 03:50:11'),
(85, 77, '675192532537e.jpg', '2024-12-05 03:45:23', '2024-12-05 03:50:11'),
(86, 77, '6751925c75fef.jpg', '2024-12-05 03:45:32', '2024-12-05 03:50:11'),
(87, 77, '6751926023930.jpg', '2024-12-05 03:45:36', '2024-12-05 03:50:11'),
(88, 78, '6751941419182.jpg', '2024-12-05 03:52:52', '2024-12-05 03:55:48'),
(89, 78, '6751941ae5d83.jpg', '2024-12-05 03:52:58', '2024-12-05 03:55:48'),
(90, 78, '6751941f9581c.jpg', '2024-12-05 03:53:03', '2024-12-05 03:55:48'),
(91, 78, '6751942484136.jpg', '2024-12-05 03:53:08', '2024-12-05 03:55:48'),
(92, 79, '675418f2bd2dc.jpg', '2024-12-07 01:44:18', '2024-12-07 01:45:05'),
(93, 79, '675418f2d5804.jpg', '2024-12-07 01:44:18', '2024-12-07 01:45:05'),
(94, 79, '675418f30d0e4.jpg', '2024-12-07 01:44:19', '2024-12-07 01:45:05'),
(95, 80, '675419726acdd.jpg', '2024-12-07 01:46:26', '2024-12-07 01:51:31'),
(96, 80, '675419727a909.jpg', '2024-12-07 01:46:26', '2024-12-07 01:51:31'),
(97, 80, '67541972a5167.jpg', '2024-12-07 01:46:26', '2024-12-07 01:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `room_reviews`
--

CREATE TABLE `room_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_headings`
--

CREATE TABLE `section_headings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `room_section_title` varchar(255) DEFAULT NULL,
  `room_section_subtitle` varchar(255) DEFAULT NULL,
  `room_section_text` text DEFAULT NULL,
  `service_section_title` varchar(255) DEFAULT NULL,
  `service_section_subtitle` varchar(255) DEFAULT NULL,
  `booking_section_title` varchar(255) DEFAULT NULL,
  `booking_section_subtitle` varchar(255) DEFAULT NULL,
  `booking_section_button` varchar(255) DEFAULT NULL,
  `booking_section_button_url` varchar(255) DEFAULT NULL,
  `booking_section_video_url` varchar(255) DEFAULT NULL,
  `video_img` varchar(255) DEFAULT NULL,
  `package_section_title` varchar(255) DEFAULT NULL,
  `package_section_subtitle` varchar(255) DEFAULT NULL,
  `facility_section_title` varchar(255) DEFAULT NULL,
  `facility_section_subtitle` varchar(255) DEFAULT NULL,
  `facility_section_image` varchar(255) DEFAULT NULL,
  `testimonial_section_title` varchar(255) DEFAULT NULL,
  `testimonial_section_subtitle` varchar(255) DEFAULT NULL,
  `testimonial_section_image` varchar(255) DEFAULT NULL,
  `faq_section_title` varchar(255) DEFAULT NULL,
  `faq_section_subtitle` varchar(255) DEFAULT NULL,
  `faq_section_image` varchar(255) DEFAULT NULL,
  `blog_section_title` varchar(255) DEFAULT NULL,
  `blog_section_subtitle` varchar(255) DEFAULT NULL,
  `room_feature_category_title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_headings`
--

INSERT INTO `section_headings` (`id`, `language_id`, `room_section_title`, `room_section_subtitle`, `room_section_text`, `service_section_title`, `service_section_subtitle`, `booking_section_title`, `booking_section_subtitle`, `booking_section_button`, `booking_section_button_url`, `booking_section_video_url`, `video_img`, `package_section_title`, `package_section_subtitle`, `facility_section_title`, `facility_section_subtitle`, `facility_section_image`, `testimonial_section_title`, `testimonial_section_subtitle`, `testimonial_section_image`, `faq_section_title`, `faq_section_subtitle`, `faq_section_image`, `blog_section_title`, `blog_section_subtitle`, `room_feature_category_title`, `created_at`, `updated_at`) VALUES
(4, 7, 'Featured Rooms', 'Discover A Place Where You\'ll Love To Live', 'Ullam corporis suscipit laboriosam nisi ut aliqucoe modi consequatur Quis autem vel eum iure repreh nderitqui in ea voluptate velit esse quam nihil molestiae', 'Our Services', 'We Provide Most Exclusive Hotel & Room Services', 'Looking For Luxury Hotel', 'Book Right Now', 'Book Now', 'https://codecanyon8.kreativdev.com/multihotel/rooms', 'https://www.youtube.com/watch?v=4eJ8sJGh5dA', '1713351782.jpg', 'Featured Property', 'Take a Look at Our Awesome Property', 'Why Choose Us', 'We Care You & We Feel What’s Needs For Good Living', '1623656923.jpg', 'Clients Feedback', 'What Our Satisfied Clients Say About Us', '1685513578.jpg', 'Frequently Asked Questions', 'Since 1990 We Provides Professional Service', '1685513767.jpg', 'Latest Blogs', 'Take a Look at Our Awesome Blogs', 'See Our Featured Room Category', '2021-06-13 09:20:26', '2024-11-28 18:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `meta_keyword_home` varchar(255) DEFAULT NULL,
  `meta_description_home` text DEFAULT NULL,
  `meta_keyword_blogs` varchar(255) DEFAULT NULL,
  `meta_description_blogs` text DEFAULT NULL,
  `meta_keyword_about_us` text DEFAULT NULL,
  `meta_description_about_us` text DEFAULT NULL,
  `meta_keyword_contact_us` varchar(255) DEFAULT NULL,
  `meta_description_contact_us` text DEFAULT NULL,
  `meta_keyword_gallery` varchar(255) DEFAULT NULL,
  `meta_description_gallery` text DEFAULT NULL,
  `meta_keyword_rooms` varchar(255) DEFAULT NULL,
  `meta_description_rooms` text DEFAULT NULL,
  `meta_keyword_services` varchar(255) DEFAULT NULL,
  `meta_description_services` text DEFAULT NULL,
  `meta_keyword_packages` varchar(255) DEFAULT NULL,
  `meta_description_packages` text DEFAULT NULL,
  `meta_keyword_error_page` varchar(255) DEFAULT NULL,
  `meta_description_error_page` text DEFAULT NULL,
  `meta_keyword_registration` varchar(255) DEFAULT NULL,
  `meta_description_registration` text DEFAULT NULL,
  `meta_keyword_login` varchar(255) DEFAULT NULL,
  `meta_description_login` text DEFAULT NULL,
  `meta_keyword_forget_password` varchar(255) DEFAULT NULL,
  `meta_description_forget_password` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_keyword_faq` text DEFAULT NULL,
  `meta_description_faq` text DEFAULT NULL,
  `meta_keyword_vendor_registration` varchar(255) DEFAULT NULL,
  `meta_description_vendor_registration` text DEFAULT NULL,
  `meta_keyword_vendor_login` varchar(255) DEFAULT NULL,
  `meta_description_vendor_login` text DEFAULT NULL,
  `meta_keyword_vendor_forget_password` varchar(255) DEFAULT NULL,
  `meta_description_vendor_forget_password` text DEFAULT NULL,
  `meta_keyword_vendors` varchar(255) DEFAULT NULL,
  `meta_description_vendors` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `language_id`, `meta_keyword_home`, `meta_description_home`, `meta_keyword_blogs`, `meta_description_blogs`, `meta_keyword_about_us`, `meta_description_about_us`, `meta_keyword_contact_us`, `meta_description_contact_us`, `meta_keyword_gallery`, `meta_description_gallery`, `meta_keyword_rooms`, `meta_description_rooms`, `meta_keyword_services`, `meta_description_services`, `meta_keyword_packages`, `meta_description_packages`, `meta_keyword_error_page`, `meta_description_error_page`, `meta_keyword_registration`, `meta_description_registration`, `meta_keyword_login`, `meta_description_login`, `meta_keyword_forget_password`, `meta_description_forget_password`, `created_at`, `updated_at`, `meta_keyword_faq`, `meta_description_faq`, `meta_keyword_vendor_registration`, `meta_description_vendor_registration`, `meta_keyword_vendor_login`, `meta_description_vendor_login`, `meta_keyword_vendor_forget_password`, `meta_description_vendor_forget_password`, `meta_keyword_vendors`, `meta_description_vendors`) VALUES
(1, 7, 'home', 'Home Page Description', 'Blog Page', 'Blog Page Description', 'About', 'About us Description', 'Contact Us', 'Contact Us Page Description', 'Gallery', 'Gallery Page Description', 'Room', 'Room Page Description', 'Services', 'Services Page Descriptions', 'Property', 'Property Page Description', NULL, NULL, 'Registration', 'Registration Page Description', 'Login', 'Login  page description', 'Forget', 'Forget Password Description', '2022-11-02 03:18:47', '2024-11-28 19:15:47', 'FAQ', 'FAQ Page Description', 'landlord registration', 'landlord registration details', 'landlord login', 'landlord login  DESCRIPTION', 'landlord forget', 'landlord forget password', 'landlord', 'landlord description');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_icon` varchar(255) NOT NULL,
  `details_page_status` tinyint(4) NOT NULL COMMENT '0 - disable, 1 - enable',
  `serial_number` int(11) NOT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - will not show in home page, 1 - will show in home page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_icon`, `details_page_status`, `serial_number`, `is_featured`, `created_at`, `updated_at`) VALUES
(7, 'far fa-building', 1, 1, 1, '2021-06-13 09:07:09', '2021-06-13 09:16:23'),
(8, 'far fa-lemon iconpicker-component', 1, 2, 1, '2021-06-13 09:10:12', '2021-06-13 09:17:21'),
(9, 'fas fa-hiking', 1, 3, 1, '2021-06-13 09:11:44', '2021-06-13 09:16:18'),
(10, 'fas fa-headset', 0, 4, 1, '2021-06-13 09:13:31', '2021-06-13 09:16:16'),
(11, 'far fa-calendar-alt', 0, 5, 1, '2021-06-13 09:14:32', '2021-06-13 09:16:14'),
(12, 'fas fa-dumbbell iconpicker-component', 0, 6, 1, '2021-06-13 09:15:50', '2023-05-25 03:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `service_contents`
--

CREATE TABLE `service_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` blob DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_contents`
--

INSERT INTO `service_contents` (`id`, `language_id`, `service_id`, `title`, `slug`, `summary`, `content`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(17, 7, 7, 'Rooms & Appartment', 'rooms-&-appartment', 'Great explorer of the truth the ter-blde human happiness one reject', 0x3c70207374796c653d22746578742d616c69676e3a6a7573746966793b666f6e742d66616d696c793a274f70656e2053616e73272c20417269616c2c2073616e732d73657269663b223e436f6e747261727920746f20706f70756c61722062656c6965662c204c6f72656d20497073756d206973206e6f742073696d706c792072616e646f6d20746578742e2049742068617320726f6f747320696e2061207069656365206f6620636c6173736963616c204c6174696e206c6974657261747572652066726f6d2034352042432c206d616b696e67206974206f7665722032303030207965617273206f6c642e2052696368617264204d63436c696e746f636b2c2061204c6174696e2070726f666573736f722061742048616d7064656e2d5379646e657920436f6c6c65676520696e2056697267696e69612c206c6f6f6b6564207570206f6e65206f6620746865206d6f7265206f627363757265204c6174696e20776f7264732c20636f6e73656374657475722c2066726f6d2061204c6f72656d20497073756d20706173736167652c20616e6420676f696e67207468726f75676820746865206369746573206f662074686520776f726420696e20636c6173736963616c206c6974657261747572652c20646973636f76657265642074686520756e646f75627461626c6520736f757263652e204c6f72656d20497073756d20636f6d65732066726f6d2073656374696f6e7320312e31302e333220616e6420312e31302e3333206f66202264652046696e6962757320426f6e6f72756d206574204d616c6f72756d2220285468652045787472656d6573206f6620476f6f6420616e64204576696c292062792043696365726f2c207772697474656e20696e2034352042432e205468697320626f6f6b2069732061207472656174697365206f6e20746865207468656f7279206f66206574686963732c207665727920706f70756c617220647572696e67207468652052656e61697373616e63652e20546865206669727374206c696e65206f66204c6f72656d20497073756d2c20224c6f72656d20697073756d20646f6c6f722073697420616d65742e2e222c20636f6d65732066726f6d2061206c696e6520696e2073656374696f6e20312e31302e33322e3c2f703e, NULL, NULL, '2021-06-13 09:07:09', '2021-06-13 09:07:09'),
(19, 7, 8, 'Food & Restaurant', 'food-&-restaurant', 'Great explorer of the truth the ter-blde human happiness one reject', 0x3c703e3c7370616e207374796c653d22666f6e742d66616d696c793a274f70656e2053616e73272c20417269616c2c2073616e732d73657269663b746578742d616c69676e3a6a7573746966793b223e436f6e747261727920746f20706f70756c61722062656c6965662c204c6f72656d20497073756d206973206e6f742073696d706c792072616e646f6d20746578742e2049742068617320726f6f747320696e2061207069656365206f6620636c6173736963616c204c6174696e206c6974657261747572652066726f6d2034352042432c206d616b696e67206974206f7665722032303030207965617273206f6c642e2052696368617264204d63436c696e746f636b2c2061204c6174696e2070726f666573736f722061742048616d7064656e2d5379646e657920436f6c6c65676520696e2056697267696e69612c206c6f6f6b6564207570206f6e65206f6620746865206d6f7265206f627363757265204c6174696e20776f7264732c20636f6e73656374657475722c2066726f6d2061204c6f72656d20497073756d20706173736167652c20616e6420676f696e67207468726f75676820746865206369746573206f662074686520776f726420696e20636c6173736963616c206c6974657261747572652c20646973636f76657265642074686520756e646f75627461626c6520736f757263652e204c6f72656d20497073756d20636f6d65732066726f6d2073656374696f6e7320312e31302e333220616e6420312e31302e3333206f66202264652046696e6962757320426f6e6f72756d206574204d616c6f72756d2220285468652045787472656d6573206f6620476f6f6420616e64204576696c292062792043696365726f2c207772697474656e20696e2034352042432e205468697320626f6f6b2069732061207472656174697365206f6e20746865207468656f7279206f66206574686963732c207665727920706f70756c617220647572696e67207468652052656e61697373616e63652e20546865206669727374206c696e65206f66204c6f72656d20497073756d2c20224c6f72656d20697073756d20646f6c6f722073697420616d65742e2e222c20636f6d65732066726f6d2061206c696e6520696e2073656374696f6e20312e31302e33322e3c2f7370616e3e3c62723e3c2f703e, NULL, NULL, '2021-06-13 09:10:12', '2021-06-13 09:17:21'),
(21, 7, 9, 'Spa & Fitness', 'spa-&-fitness', 'Great explorer of the truth the ter-blde human happiness one reject', 0x3c70207374796c653d22746578742d616c69676e3a6a7573746966793b666f6e742d66616d696c793a274f70656e2053616e73272c20417269616c2c2073616e732d73657269663b223e436f6e747261727920746f20706f70756c61722062656c6965662c204c6f72656d20497073756d206973206e6f742073696d706c792072616e646f6d20746578742e2049742068617320726f6f747320696e2061207069656365206f6620636c6173736963616c204c6174696e206c6974657261747572652066726f6d2034352042432c206d616b696e67206974206f7665722032303030207965617273206f6c642e2052696368617264204d63436c696e746f636b2c2061204c6174696e2070726f666573736f722061742048616d7064656e2d5379646e657920436f6c6c65676520696e2056697267696e69612c206c6f6f6b6564207570206f6e65206f6620746865206d6f7265206f627363757265204c6174696e20776f7264732c20636f6e73656374657475722c2066726f6d2061204c6f72656d20497073756d20706173736167652c20616e6420676f696e67207468726f75676820746865206369746573206f662074686520776f726420696e20636c6173736963616c206c6974657261747572652c20646973636f76657265642074686520756e646f75627461626c6520736f757263652e204c6f72656d20497073756d20636f6d65732066726f6d2073656374696f6e7320312e31302e333220616e6420312e31302e3333206f66202264652046696e6962757320426f6e6f72756d206574204d616c6f72756d2220285468652045787472656d6573206f6620476f6f6420616e64204576696c292062792043696365726f2c207772697474656e20696e2034352042432e205468697320626f6f6b2069732061207472656174697365206f6e20746865207468656f7279206f66206574686963732c207665727920706f70756c617220647572696e67207468652052656e61697373616e63652e20546865206669727374206c696e65206f66204c6f72656d20497073756d2c20224c6f72656d20697073756d20646f6c6f722073697420616d65742e2e222c20636f6d65732066726f6d2061206c696e6520696e2073656374696f6e20312e31302e33322e3c2f703e, NULL, NULL, '2021-06-13 09:11:44', '2021-06-13 09:11:44'),
(23, 7, 10, 'Sports & Gaming', 'sports-&-gaming', 'Great explorer of the truth the ter-blde human happiness one reject', '', NULL, NULL, '2021-06-13 09:13:31', '2021-06-13 09:13:31'),
(25, 7, 11, 'Event & Party', 'event-&-party', 'Great explorer of the truth the ter-blde human happiness one reject', '', NULL, NULL, '2021-06-13 09:14:32', '2021-06-13 09:14:32'),
(27, 7, 12, 'GYM & Yoga', 'gym-&-yoga', 'Great explorer of the truth the ter-blde human happiness one reject', '', NULL, NULL, '2021-06-13 09:15:50', '2021-06-13 09:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitemap_url` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `icon`, `url`, `serial_number`, `created_at`, `updated_at`) VALUES
(1, 'fab fa-facebook-f', 'https://www.facebook.com', 1, '2021-04-12 07:15:06', '2021-04-12 07:15:06'),
(2, 'fab fa-google', 'https://www.google.com', 2, '2021-04-12 07:16:01', '2021-04-12 07:16:01'),
(3, 'fab fa-instagram', 'https://www.instagram.com', 3, '2021-04-12 07:16:44', '2021-04-12 07:16:44'),
(4, 'fab fa-twitter', 'https://www.twitter.com', 4, '2021-04-12 07:17:19', '2023-05-29 00:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `ticket_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1-pending, 2-open, 3-closed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_message` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_statuses`
--

CREATE TABLE `support_ticket_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_statuses`
--

INSERT INTO `support_ticket_statuses` (`id`, `support_ticket_status`, `created_at`, `updated_at`) VALUES
(1, 'active', '2022-06-25 03:52:18', '2023-06-15 05:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `client_image` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_designation` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `border_color` varchar(255) DEFAULT NULL,
  `serial_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `language_id`, `client_image`, `client_name`, `client_designation`, `comment`, `border_color`, `serial_number`, `created_at`, `updated_at`) VALUES
(24, 7, '1623664784.jpg', 'James M. Varney', 'Managing Director, Summly', 'Omnis voluptas assumde est omnis dolor reporibus autem quidam et aut ciise debitiset arerum neces tibus saep on ways feels like ways.', NULL, 1, '2021-06-14 02:00:35', '2021-06-14 03:59:44'),
(25, 7, '1623664805.jpg', 'David K. Vinson', 'CEO, Madchef', 'At vero eos et accusamu way set iusto odio dignis ducimus qui bpraes enum voluptatum deleniti atque corrupti quos dolores others worlds.', NULL, 2, '2021-06-14 02:01:16', '2021-06-14 04:00:05'),
(26, 7, '1623664825.jpg', 'James M. Varney', 'Researcher, MIT', 'Omnis voluptas assumde est omnis dolor reporibus autem quidam et aut ciise debitiset arerum neces tibus saep on ways feels like ways.', NULL, 3, '2021-06-14 02:01:44', '2021-06-14 04:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transcation_id` varchar(255) DEFAULT NULL,
  `booking_id` varchar(255) DEFAULT NULL,
  `transcation_type` int(11) DEFAULT NULL COMMENT '1=Room Booking, 2=Withdraw, 3= balance add, 4 = balance subtract 5 = package booking',
  `user_id` bigint(20) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `commission` float(8,2) DEFAULT 0.00,
  `pre_balance` float(8,2) DEFAULT 0.00,
  `after_balance` float(8,2) DEFAULT 0.00,
  `gateway_type` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `currency_symbol_position` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transcation_id`, `booking_id`, `transcation_type`, `user_id`, `vendor_id`, `payment_status`, `payment_method`, `grand_total`, `commission`, `pre_balance`, `after_balance`, `gateway_type`, `currency_symbol`, `currency_symbol_position`, `created_at`, `updated_at`) VALUES
(52, '1733033743', '131', 5, NULL, 1, '1', 'Xendit', 2000.00, 200.00, 2640.10, 4440.10, 'online', '₱', 'left', '2024-11-30 22:15:43', '2024-11-30 22:15:43'),
(58, '1733214576', '138', 5, NULL, 1, '1', 'Xendit', 2000.00, 200.00, 13125.10, 14925.10, 'online', '₱', 'left', '2024-12-03 00:29:36', '2024-12-03 00:29:36'),
(59, '1733214712', '137', 5, NULL, 1, '1', 'Cash', 2000.00, 200.00, 14925.10, 16725.10, 'offline', '₱', 'left', '2024-12-03 00:31:52', '2024-12-03 00:31:52'),
(60, '1733215458', '1', 2, NULL, 1, '0', '2', 1000.00, 0.00, 16725.10, 15725.10, NULL, '₱', 'left', '2024-12-03 00:44:18', '2024-12-03 00:44:18'),
(61, '1733215609', NULL, 4, NULL, 1, '1', NULL, 11325.10, 0.00, 15725.10, 4400.00, NULL, '₱', 'left', '2024-12-03 00:46:49', '2024-12-03 00:46:49'),
(62, '1733215669', NULL, 4, NULL, 1, '1', NULL, 4400.00, 0.00, 4400.00, 0.00, NULL, '₱', 'left', '2024-12-03 00:47:49', '2024-12-03 00:47:49'),
(63, '1733215689', NULL, 4, NULL, 1, '1', NULL, 4400.00, 0.00, 0.00, -4400.00, NULL, '₱', 'left', '2024-12-03 00:48:09', '2024-12-03 00:48:09'),
(64, '1733215703', NULL, 4, NULL, 1, '1', NULL, NULL, 0.00, -4400.00, -4400.00, NULL, '₱', 'left', '2024-12-03 00:48:23', '2024-12-03 00:48:23'),
(65, '1733215712', NULL, 3, NULL, 1, '1', NULL, NULL, 0.00, -4400.00, -4400.00, NULL, '₱', 'left', '2024-12-03 00:48:32', '2024-12-03 00:48:32'),
(66, '1733215740', NULL, 3, NULL, 1, '1', NULL, 4400.00, 0.00, -4400.00, 0.00, NULL, '₱', 'left', '2024-12-03 00:49:00', '2024-12-03 00:49:00'),
(67, '1733215777', NULL, 4, NULL, 1, '1', NULL, 11000.00, 0.00, 0.00, -11000.00, NULL, '₱', 'left', '2024-12-03 00:49:37', '2024-12-03 00:49:37'),
(68, '1733215792', NULL, 3, NULL, 1, '1', NULL, 11000.00, 0.00, -11000.00, 0.00, NULL, '₱', 'left', '2024-12-03 00:49:52', '2024-12-03 00:49:52'),
(69, '1733215820', NULL, 4, NULL, 1, '1', NULL, 20000.00, 0.00, 0.00, -20000.00, NULL, '₱', 'left', '2024-12-03 00:50:20', '2024-12-03 00:50:20'),
(70, '1733215842', NULL, 3, NULL, 1, '1', NULL, 20000.00, 0.00, -20000.00, 0.00, NULL, '₱', 'left', '2024-12-03 00:50:42', '2024-12-03 00:50:42'),
(71, '1733215867', NULL, 3, NULL, 1, '1', NULL, 11325.10, 0.00, 0.00, 11325.10, NULL, '₱', 'left', '2024-12-03 00:51:07', '2024-12-03 00:51:07'),
(72, '1733215926', NULL, 4, NULL, 1, '1', NULL, 8000.00, 0.00, 11325.10, 3325.10, NULL, '₱', 'left', '2024-12-03 00:52:06', '2024-12-03 00:52:06'),
(73, '1733215971', NULL, 3, NULL, 1, '1', NULL, 1000.00, 0.00, 3325.10, 4325.10, NULL, '₱', 'left', '2024-12-03 00:52:51', '2024-12-03 00:52:51'),
(74, '1733216009', NULL, 4, NULL, 1, '1', NULL, 75.00, 0.00, 4325.10, 4250.10, NULL, '₱', 'left', '2024-12-03 00:53:29', '2024-12-03 00:53:29'),
(75, '1733216030', NULL, 4, NULL, 1, '1', NULL, 150.00, 0.00, 4250.10, 4100.10, NULL, '₱', 'left', '2024-12-03 00:53:50', '2024-12-03 00:53:50'),
(76, '1733216040', NULL, 4, NULL, 1, '1', NULL, 300.00, 0.00, 4100.10, 3800.10, NULL, '₱', 'left', '2024-12-03 00:54:00', '2024-12-03 00:54:00'),
(77, '1733216060', NULL, 3, NULL, 1, '1', NULL, 400.00, 0.00, 3800.10, 4200.10, NULL, '₱', 'left', '2024-12-03 00:54:20', '2024-12-03 00:54:20'),
(78, '1733216070', NULL, 3, NULL, 1, '1', NULL, 200.00, 0.00, 4200.10, 4400.10, NULL, '₱', 'left', '2024-12-03 00:54:30', '2024-12-03 00:54:30'),
(79, '1733216275', NULL, 3, NULL, 1, '1', NULL, 4400.00, 0.00, 4400.10, 8800.10, NULL, '₱', 'left', '2024-12-03 00:57:55', '2024-12-03 00:57:55'),
(80, '1733216303', NULL, 3, NULL, 1, '1', NULL, 2525.00, 0.00, 8800.10, 11325.10, NULL, '₱', 'left', '2024-12-03 00:58:23', '2024-12-03 00:58:23'),
(81, '1733216319', NULL, 3, NULL, 1, '1', NULL, 4400.00, 0.00, 11325.10, 15725.10, NULL, '₱', 'left', '2024-12-03 00:58:39', '2024-12-03 00:58:39'),
(82, '1733216368', NULL, 4, NULL, 1, '1', NULL, 4400.00, 0.00, 15725.10, 11325.10, NULL, '₱', 'left', '2024-12-03 00:59:28', '2024-12-03 00:59:28'),
(83, '1733216395', NULL, 3, NULL, 1, '1', NULL, 4400.00, 0.00, 11325.10, 15725.10, NULL, '₱', 'left', '2024-12-03 00:59:55', '2024-12-03 00:59:55'),
(84, '1733216549', NULL, 4, NULL, 1, '1', NULL, 11325.10, 0.00, 15725.10, 4400.00, NULL, '₱', 'left', '2024-12-03 01:02:29', '2024-12-03 01:02:29'),
(85, '1733304137', '96', 1, NULL, 1, '1', 'Xendit', 150.00, 15.00, 4400.00, 4535.00, 'online', '₱', 'left', '2024-12-04 01:22:17', '2024-12-04 01:22:17'),
(86, '1733398878', '140', 5, NULL, 10, '1', 'Xendit', 1500.00, 150.00, 0.00, 1350.00, 'online', '₱', 'left', '2024-12-05 03:41:18', '2024-12-05 03:41:18'),
(87, '1733400274', '98', 1, NULL, 10, '1', 'Cash', 100.00, 10.00, 1350.00, 1440.00, 'offline', '₱', 'left', '2024-12-05 04:04:34', '2024-12-05 04:04:34'),
(88, '1733402168', '141', 5, NULL, 1, '1', 'Xendit', 2000.00, 200.00, 4535.00, 6335.00, 'online', '₱', 'left', '2024-12-05 04:36:08', '2024-12-05 04:36:08'),
(89, '1733403819', '139', 5, NULL, 1, '1', 'Cash', 2000.00, 200.00, 6335.00, 8135.00, 'offline', '₱', 'left', '2024-12-05 05:03:39', '2024-12-05 05:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - unverified, 1 - verified',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_code` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - active, 0 - banned',
  `verification_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `image`, `username`, `email`, `email_verified`, `email_verified_at`, `password`, `password_code`, `contact_number`, `address`, `city`, `state`, `country`, `status`, `verification_token`, `remember_token`, `created_at`, `updated_at`, `provider`, `provider_id`) VALUES
(36, 'Tenant', 'Tenant2', '6748871ddd25b.jpg', 'tenant.com', 'tenant@gmail.com', 1, NULL, '$2y$10$ctB5WtqYAdVsFAS3hYN7Cu1.ued2asViS3vJrJyJ5ZpagcduAgBFa', NULL, '1234567890', 'Binalbagan Negros Occidental', 'Binalbagan', 'Negros Occidental', 'Philippines', 1, NULL, NULL, '2024-11-28 07:07:09', '2024-11-28 18:00:38', NULL, NULL),
(37, 'Trecia Anne', 'Garcia', '1733033318.jpg', 'Trecia Anne F. Garcia', 'garciatrecia25@gmail.com', 1, NULL, '$2y$10$VPPwfQWpNmH4cGgpGBFGPulnpVgYnDkDUlf4nQW6uEx9mZ1dQTYRu', NULL, '09950598296', 'Prk. 7, Brgy. Aguisan', 'Himamaylan City', 'Negros Occidental', 'Philippines', 1, 'df731a79fe3ba5ad821301da1d6ad2e9', NULL, '2024-11-30 22:06:40', '2024-12-01 19:07:41', NULL, NULL),
(38, 'Yssabelle Marie', 'Zaguirre', '1733210933.jpg', 'Yssabelle Marie R. Zaguirre', 'zyssabelle@gmail.com', 1, '2024-12-02 23:23:53', '$2y$10$BiSeq1xhPr8yNFVN9HRV7eZOQ/htSjl7sOZ5lF/NkgMCJ13xZTHJO', NULL, '09157349957', 'SO. Pucatod, Brgy. Payao, Binalbagan, Negros Occidental', 'Binalbagan', 'Negros Occidental', 'Philippines', 1, '605b2cd188d7798f969dbd38c5488568', NULL, '2024-12-02 23:22:00', '2024-12-02 23:28:53', NULL, NULL),
(39, 'April Joy', 'Aranas', NULL, 'April Joy G. Aranas', 'sba76787@gmail.com', 1, '2024-12-03 00:10:36', '$2y$10$2SMGQnhIvtfu.4JgsVlvYOfkpLrVv2Zi78.NZCUBkxTIoyZigzq3G', 'GVDXexKEUdsPl5fV', '09166248825', 'Purok 5, Brgy. Nabalian', 'Himamaylan City', 'Negros Occidental', 'Philippines', 1, 'c629669c98607de1881c642ede0ca8b1', NULL, '2024-12-03 00:09:45', '2024-12-06 00:07:06', NULL, NULL),
(40, 'Ian', 'Garcia', NULL, 'Ian Alvarez Garcia', 'ian22alvarezgarcia@gmail.com', 1, NULL, '$2y$10$uHzVzzDD2qgtoajlFIcmu.4IdoefpgkP992jawJ6p..Em3Qj2z4Hq', NULL, '09485551236', 'Brgy. Aguisan', 'Himamaylan City', 'Negros Occidental', 'Philippines', 1, 'cb3389d58462f145ed62c686c1d7edca', NULL, '2024-12-05 04:00:05', '2024-12-05 04:02:37', NULL, NULL),
(41, 'Anamaris', 'Gamilla', '1733446531.jpg', 'Ana Maris Gamilla', 'anamarisgamilla304@gmail.com', 1, NULL, '$2y$10$QkjRYJPsZJtNmS3GQjbwdOTwlIQMcVSJw1wieUpd1Ay3w6IQNA9oS', NULL, '09369974017', 'Brgy. Cambugsa', 'Hinigaran', 'Negros Occidental', 'Philippines', 1, 'd3271cfc8e688113af7f9f2ae214f639', NULL, '2024-12-05 16:52:09', '2024-12-05 16:55:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `amount` double(8,2) DEFAULT 0.00,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avg_rating` float(8,2) NOT NULL DEFAULT 0.00,
  `show_email_addresss` tinyint(4) NOT NULL DEFAULT 1,
  `show_phone_number` tinyint(4) NOT NULL DEFAULT 1,
  `show_contact_form` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `photo`, `email`, `phone`, `username`, `password`, `status`, `amount`, `email_verified_at`, `avg_rating`, `show_email_addresss`, `show_phone_number`, `show_contact_form`, `created_at`, `updated_at`) VALUES
(1, '64942a11f10ac.png', 'landlord@gmail.com', '1234567890', 'largo de oro', '$2y$10$RSX2iS2AihFxyIPW0Yh8ZedBE3B6MZu0pgPhVVg/wyyoqpXaNoOvK', 1, 8135.00, '2023-06-22 04:30:42', 0.00, 1, 1, 1, '2023-06-22 04:30:29', '2024-12-05 05:03:39'),
(10, '67518b29950e5.png', 'garciatrecia25@gmail.com', '09950598296', 'Trecia Anne F. Garcia', '$2y$10$ElPUEaqO2CYI50hGR6vIk.zXlJxeCZfl2dFpgVFothmX4XkgrzR1u', 1, 1440.00, '2024-12-02 23:05:21', 0.00, 1, 1, 1, '2024-12-02 22:58:31', '2024-12-06 05:23:56'),
(11, '675280fc9bfcd.png', 'kyleneparacuelles80@gmail.com', '09270612522', 'Kylene Paracuelles', '$2y$10$oL4Q0UQFMTOrdzfTQubmCua/yAp3Ms8rh2rxH/KHENVaMH8E4.FRy', 1, 0.00, '2024-12-03 00:11:23', 0.00, 1, 1, 1, '2024-12-02 23:49:42', '2024-12-05 20:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_infos`
--

CREATE TABLE `vendor_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_infos`
--

INSERT INTO `vendor_infos` (`id`, `language_id`, `vendor_id`, `name`, `country`, `city`, `state`, `zip_code`, `address`, `details`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 'Largo', 'Philippines', 'Binalbagan', 'Negros Occidental', '6107', 'Binalbagan', NULL, '2023-06-22 04:30:29', '2024-11-28 07:02:18'),
(2, 8, 1, 'لارجو', 'الولايات المتحدة', 'جاكسونفيل', 'فلوريدا', NULL, 'جاكسونفيل ، الولايات المتحدة', 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ..', '2023-06-22 04:30:29', '2023-06-22 05:01:53'),
(18, 7, 10, 'Trecia', 'Philippines', 'Himamaylan City', 'Negross Occidental', '6108', 'Prk. 7 Brgy. Aguisan', NULL, '2024-12-02 22:58:31', '2024-12-05 03:14:49'),
(19, 7, 11, 'Kylene', 'Philippines', 'Himamaylan City', 'Negros Occidental', '6108', 'Brgy. San Antonio', NULL, '2024-12-02 23:49:42', '2024-12-05 15:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlistable_type` varchar(255) NOT NULL,
  `wishlistable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `wishlistable_type`, `wishlistable_id`, `created_at`, `updated_at`) VALUES
(59, 36, 'App\\Models\\RoomManagement\\Room', 80, '2024-12-08 01:21:32', '2024-12-08 01:21:32'),
(60, 36, 'App\\Models\\RoomManagement\\Room', 78, '2024-12-08 01:40:26', '2024-12-08 01:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `withdraw_id` varchar(255) DEFAULT NULL,
  `method_id` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payable_amount` float(8,2) NOT NULL DEFAULT 0.00,
  `total_charge` float(8,2) NOT NULL DEFAULT 0.00,
  `additional_reference` text DEFAULT NULL,
  `feilds` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `vendor_id`, `withdraw_id`, `method_id`, `amount`, `payable_amount`, `total_charge`, `additional_reference`, `feilds`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '674ec4e2c145e', 2, '1000', 978.04, 21.96, NULL, '{\"Account_Number\":\"09062669609\"}', 0, '2024-12-03 00:44:18', '2024-12-03 00:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_method_inputs`
--

CREATE TABLE `withdraw_method_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_payment_method_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1-text, 2-select, 3-checkbox, 4-textarea, 5-datepicker, 6-timepicker, 7-number',
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-required, 0- optional',
  `order_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_method_inputs`
--

INSERT INTO `withdraw_method_inputs` (`id`, `withdraw_payment_method_id`, `type`, `label`, `name`, `placeholder`, `required`, `order_number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Account No', 'Account_No', 'Enter Account Number', 1, 1, '2022-11-09 01:12:40', '2023-06-22 00:03:45'),
(3, 4, 1, 'Product Description', 'Product_Description', 'e.g. an AI powered copywriter for small businesses and entrepreneurs', 1, 1, '2023-05-30 23:42:28', '2023-05-30 23:42:28'),
(4, 2, 1, 'Account Number', 'Account_Number', 'Name of Gcash Number', 1, 1, '2024-11-28 07:14:48', '2024-11-28 07:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_method_options`
--

CREATE TABLE `withdraw_method_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_method_input_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_payment_methods`
--

CREATE TABLE `withdraw_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_limit` double(8,2) DEFAULT NULL,
  `max_limit` double(8,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `fixed_charge` float(8,2) DEFAULT 0.00,
  `percentage_charge` float(8,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_payment_methods`
--

INSERT INTO `withdraw_payment_methods` (`id`, `min_limit`, `max_limit`, `name`, `status`, `fixed_charge`, `percentage_charge`, `created_at`, `updated_at`) VALUES
(2, 1000.00, 500000.00, 'Gcash', 1, 2.00, 2.00, '2024-11-28 07:14:14', '2024-12-03 00:43:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `blog_contents`
--
ALTER TABLE `blog_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_contents_language_id_foreign` (`language_id`),
  ADD KEY `blog_contents_blog_category_id_foreign` (`blog_category_id`),
  ADD KEY `blog_contents_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_language_id_foreign` (`language_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cookie_alerts_language_id_foreign` (`language_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilities_language_id_foreign` (`language_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_language_id_foreign` (`language_id`);

--
-- Indexes for table `footer_quick_links`
--
ALTER TABLE `footer_quick_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_quick_links_language_id_foreign` (`language_id`);

--
-- Indexes for table `footer_texts`
--
ALTER TABLE `footer_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_texts_language_id_foreign` (`language_id`);

--
-- Indexes for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_language_id_foreign` (`language_id`),
  ADD KEY `gallery_images_gallery_category_id_foreign` (`gallery_category_id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_sliders`
--
ALTER TABLE `hero_sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hero_sliders_language_id_foreign` (`language_id`);

--
-- Indexes for table `hero_statics`
--
ALTER TABLE `hero_statics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hero_statics_language_id_foreign` (`language_id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intro_count_infos`
--
ALTER TABLE `intro_count_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intro_count_infos_language_id_foreign` (`language_id`);

--
-- Indexes for table `intro_sections`
--
ALTER TABLE `intro_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intro_sections_language_id_foreign` (`language_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_gateways`
--
ALTER TABLE `online_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_bookings`
--
ALTER TABLE `package_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_bookings_package_id_foreign` (`package_id`),
  ADD KEY `package_bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `package_categories`
--
ALTER TABLE `package_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `package_contents`
--
ALTER TABLE `package_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_contents_language_id_foreign` (`language_id`),
  ADD KEY `package_contents_package_category_id_foreign` (`package_category_id`),
  ADD KEY `package_contents_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_coupons`
--
ALTER TABLE `package_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_images`
--
ALTER TABLE `package_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_locations`
--
ALTER TABLE `package_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_locations_language_id_foreign` (`language_id`),
  ADD KEY `package_locations_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_plans`
--
ALTER TABLE `package_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_plans_language_id_foreign` (`language_id`),
  ADD KEY `package_plans_package_id_foreign` (`package_id`);

--
-- Indexes for table `package_reviews`
--
ALTER TABLE `package_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_reviews_package_id_foreign` (`package_id`),
  ADD KEY `package_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_headings`
--
ALTER TABLE `page_headings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_headings_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popups_language_id_foreign` (`language_id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_amenities`
--
ALTER TABLE `room_amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_amenities_language_id_foreign` (`language_id`);

--
-- Indexes for table `room_bookings`
--
ALTER TABLE `room_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_bookings_room_id_foreign` (`room_id`),
  ADD KEY `room_bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `room_categories`
--
ALTER TABLE `room_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `room_contents`
--
ALTER TABLE `room_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_contents_language_id_foreign` (`language_id`),
  ADD KEY `room_contents_room_category_id_foreign` (`room_category_id`),
  ADD KEY `room_contents_room_id_foreign` (`room_id`);

--
-- Indexes for table `room_coupons`
--
ALTER TABLE `room_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_reviews`
--
ALTER TABLE `room_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_reviews_room_id_foreign` (`room_id`),
  ADD KEY `room_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `section_headings`
--
ALTER TABLE `section_headings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_headings_language_id_foreign` (`language_id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seos_language_id_foreign` (`language_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_contents`
--
ALTER TABLE `service_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_contents_language_id_foreign` (`language_id`),
  ADD KEY `service_contents_service_id_foreign` (`service_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_statuses`
--
ALTER TABLE `support_ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_language_id_foreign` (`language_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_infos`
--
ALTER TABLE `vendor_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_wishlistable_id_wishlistable_type_unique` (`user_id`,`wishlistable_id`,`wishlistable_type`),
  ADD KEY `wishlists_wishlistable_type_wishlistable_id_index` (`wishlistable_type`,`wishlistable_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_method_inputs`
--
ALTER TABLE `withdraw_method_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_method_options`
--
ALTER TABLE `withdraw_method_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_payment_methods`
--
ALTER TABLE `withdraw_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `blog_contents`
--
ALTER TABLE `blog_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `footer_quick_links`
--
ALTER TABLE `footer_quick_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `footer_texts`
--
ALTER TABLE `footer_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hero_sliders`
--
ALTER TABLE `hero_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hero_statics`
--
ALTER TABLE `hero_statics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `intro_count_infos`
--
ALTER TABLE `intro_count_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `intro_sections`
--
ALTER TABLE `intro_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `offline_gateways`
--
ALTER TABLE `offline_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online_gateways`
--
ALTER TABLE `online_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `package_bookings`
--
ALTER TABLE `package_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `package_categories`
--
ALTER TABLE `package_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `package_contents`
--
ALTER TABLE `package_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `package_coupons`
--
ALTER TABLE `package_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_images`
--
ALTER TABLE `package_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `package_locations`
--
ALTER TABLE `package_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `package_plans`
--
ALTER TABLE `package_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `package_reviews`
--
ALTER TABLE `package_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `page_headings`
--
ALTER TABLE `page_headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `room_amenities`
--
ALTER TABLE `room_amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `room_bookings`
--
ALTER TABLE `room_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `room_categories`
--
ALTER TABLE `room_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `room_contents`
--
ALTER TABLE `room_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `room_coupons`
--
ALTER TABLE `room_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `room_reviews`
--
ALTER TABLE `room_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_headings`
--
ALTER TABLE `section_headings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_contents`
--
ALTER TABLE `service_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_statuses`
--
ALTER TABLE `support_ticket_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_infos`
--
ALTER TABLE `vendor_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_method_inputs`
--
ALTER TABLE `withdraw_method_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdraw_method_options`
--
ALTER TABLE `withdraw_method_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_payment_methods`
--
ALTER TABLE `withdraw_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `blog_contents`
--
ALTER TABLE `blog_contents`
  ADD CONSTRAINT `blog_contents_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `blog_contents_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  ADD CONSTRAINT `blog_contents_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `cookie_alerts`
--
ALTER TABLE `cookie_alerts`
  ADD CONSTRAINT `cookie_alerts_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
