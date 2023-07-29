-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2023 at 12:14 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlybanhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `chamcong`
--

CREATE TABLE `chamcong` (
  `Thang` tinyint(3) UNSIGNED NOT NULL,
  `Nam` smallint(5) UNSIGNED NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayCong` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chamcong`
--

INSERT INTO `chamcong` (`Thang`, `Nam`, `MaNV`, `NgayCong`) VALUES
(1, 2023, 1, 22),
(1, 2023, 2, 20),
(1, 2023, 3, 25),
(1, 2023, 4, 23),
(1, 2023, 5, 21),
(1, 2023, 6, 18),
(1, 2023, 7, 24),
(1, 2023, 8, 26),
(1, 2023, 9, 19),
(1, 2023, 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `chitietddh`
--

CREATE TABLE `chitietddh` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chitietddh`
--

INSERT INTO `chitietddh` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('DDH01', 1, 5, '0000-00-00'),
('DDH01', 2, 3, '0000-00-00'),
('DDH02', 3, 2, '0000-00-00'),
('DDH02', 4, 4, '0000-00-00'),
('DDH03', 5, 1, '0000-00-00'),
('DDH04', 6, 3, '0000-00-00'),
('DDH05', 7, 2, '0000-00-00'),
('DDH05', 8, 5, '0000-00-00'),
('DDH06', 7, 4, '0000-00-00'),
('DDH07', 5, 2, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayDH` date NOT NULL,
  `NgayGiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('DDH01', 'CODACO', 1, '2023-07-28', '2023-08-02'),
('DDH02', 'COTEC', 2, '2023-07-29', '2023-08-03'),
('DDH03', 'VITICO', 3, '2023-07-30', '2023-08-04'),
('DDH04', 'GIAY32', 4, '2023-07-31', '2023-08-05'),
('DDH05', 'SAMECO', 5, '2023-08-01', '2023-08-06'),
('DDH06', 'DHP', 6, '2023-08-02', '2023-08-07'),
('DDH07', 'SAMECO', 7, '2023-08-03', '2023-08-08'),
('DDH08', 'DHP', 8, '2023-08-04', '2023-08-09'),
('DDH09', 'VITICO', 9, '2023-08-05', '2023-08-10'),
('DDH10', 'VTP', 10, '2023-08-06', '2023-08-11');

-- --------------------------------------------------------

--
-- Table structure for table `donvi`
--

CREATE TABLE `donvi` (
  `MaDV` char(2) NOT NULL,
  `TenDV` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donvi`
--

INSERT INTO `donvi` (`MaDV`, `TenDV`) VALUES
('GD', 'Ban Giám Đốc'),
('KT', 'Kế Toán'),
('NV', 'Nghiệp Vụ'),
('TC', 'Tổ Chức');

-- --------------------------------------------------------

--
-- Table structure for table `giaohang`
--

CREATE TABLE `giaohang` (
  `Ngay` date NOT NULL,
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(40) NOT NULL DEFAULT ' ',
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' ',
  `MaTP` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`, `DienThoai`, `MaTP`) VALUES
('CODACO', 'Cơ Khí Dân Dụng', '388 Hoà Hảo P5', '1757828', 'TP'),
('COTEC', 'Công Nghệ Mới', '388 Hoà Hảo P5', '7657657', 'CT'),
('DHP', 'Đại Hưng Phát', '388 Hoà Hảo P5', '6546565', 'NT'),
('GIAY32', 'Giày 32', '388 Hoà Hảo P5', '6565468', 'CT'),
('RUBIMEX', 'Công Nghiệp Cao Su', '388 Hoà Hảo P5', '2987912', 'NT'),
('SAMACO', 'SXKD Dịch vụ tổng hợp', '388 Hoà Hảo P5', '1987987', 'CT'),
('SAMECO', 'Cơ Khí Sài Gòn', '388 Hoà Hảo P5', '2397997', 'HN'),
('TRACODI', 'Đầu tư phát triển GTVT', '388 Hoà Hảo P5', '0976766', 'HP'),
('VITICO', 'Hoá Nhựa Vĩnh Tiến', '388 Hoà Hảo P5', '3987980', 'TP'),
('VTP', 'Vạn Hưng Phát', '388 Hoà Hảo P5', '3765768', 'HN');

-- --------------------------------------------------------

--
-- Table structure for table `mathang`
--

CREATE TABLE `mathang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(30) NOT NULL,
  `DonViTinh` varchar(20) NOT NULL DEFAULT ' ',
  `DonGia` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `HinhSP` text DEFAULT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mathang`
--

INSERT INTO `mathang` (`MaMH`, `TenMH`, `DonViTinh`, `DonGia`, `HinhSP`, `MaNCC`) VALUES
(1, 'Rượu', 'Chai', 100, '', 7),
(2, 'Tiêu', 'Hộp', 20, '', 7),
(3, 'Bánh kem', 'Cái', 65, '', 3),
(4, 'Bơ', 'Kg', 200, '', 6),
(5, 'Bánh mì', 'Cái', 500, '', 3),
(6, 'Nem', 'Kg', 30, '', 1),
(7, 'Táo', 'Kg', 30, '', 4),
(8, 'Cá Hộp', 'Thùng', 600, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(30) NOT NULL,
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'CTY Đồ hộp Tân Bìn', 'TP.HCM', '123456'),
(2, 'CTY Rượu Bình Tân', 'TP.HCM', '0123456789'),
(3, 'CTY Đức Phát', 'TP.HCM', '0123456789'),
(4, 'CTY Rau Quả Việt Nam', 'Hà Nội', '0123456789'),
(5, 'CTY Thuỷ Sản Tiền Giang', 'Tiền Giang', '0123456789'),
(6, 'CTY VINAMLIK', 'TP.HCM', '0123456789'),
(7, 'CTY Nông Sản Lâm Đồng', 'Đà Lạt', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoLot` varchar(30) NOT NULL DEFAULT ' ',
  `TenNV` varchar(20) NOT NULL DEFAULT ' ',
  `Phai` enum('F','M') NOT NULL DEFAULT 'F',
  `LuongCB` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NgayNViec` date NOT NULL,
  `DiaChiNV` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoaiNV` varchar(11) DEFAULT ' ',
  `HinhNV` int(11) DEFAULT NULL,
  `MaDV` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoLot`, `TenNV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`, `MaDV`) VALUES
(1, 'Nguyen', 'Van A', 'M', 15000000, '2023-07-27', 'Ha Noi', '0987654321', 0, NULL),
(2, 'Le', 'Thi B', 'F', 12000000, '2023-07-26', 'Ho Chi Minh', '0123456789', 0, NULL),
(3, 'Tran', 'Van C', 'M', 18000000, '2023-07-25', 'Da Nang', '0909090909', 0, NULL),
(4, 'Pham', 'Thi D', 'F', 14000000, '2023-07-24', 'Hai Phong', '0912345678', 0, NULL),
(5, 'Hoang', 'Van E', 'M', 20000000, '2023-07-23', 'Can Tho', '0888888888', 0, NULL),
(6, 'Vo', 'Thi F', 'F', 13000000, '2023-07-22', 'Bac Ninh', '0977777777', 0, NULL),
(7, 'Dang', 'Van G', 'M', 16000000, '2023-07-21', 'Hue', '0955555555', 0, NULL),
(8, 'Bui', 'Thi H', 'F', 17000000, '2023-07-20', 'Vinh', '0944444444', 0, NULL),
(9, 'Truong', 'Van I', 'M', 19000000, '2023-07-19', 'Phu Tho', '0933333333', 0, NULL),
(10, 'Nguyen', 'Thi J', 'F', 11000000, '2023-07-18', 'Thai Nguyen', '0922222222', 0, NULL),
(11, 'Nguyen', 'Thi K', 'F', 12500000, '2023-07-17', 'Quang Ninh', '0911111111', 0, NULL),
(12, 'Le', 'Van L', 'M', 18000000, '2023-07-16', 'Hai Duong', '0922222222', 0, NULL),
(13, 'Tran', 'Thi M', 'F', 13500000, '2023-07-15', 'Nam Dinh', '0933333333', 0, NULL),
(14, 'Pham', 'Van N', 'M', 21000000, '2023-07-14', 'Ninh Binh', '0944444444', 0, NULL),
(15, 'Hoang', 'Thi O', 'F', 16000000, '2023-07-13', 'Thanh Hoa', '0955555555', 0, NULL),
(16, 'Vo', 'Van P', 'M', 19000000, '2023-07-12', 'Nghe An', '0966666666', 0, NULL),
(17, 'Dang', 'Thi Q', 'F', 14000000, '2023-07-11', 'Ha Tinh', '0977777777', 0, NULL),
(18, 'Bui', 'Van R', 'M', 20000000, '2023-07-10', 'Quang Binh', '0988888888', 0, NULL),
(19, 'Truong', 'Thi S', 'F', 15000000, '2023-07-09', 'Quang Tri', '0999999999', 0, NULL),
(20, 'Nguyen', 'Van T', 'M', 17000000, '2023-07-08', 'Thua Thien-Hue', '0900000000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtp`
--

CREATE TABLE `tinhtp` (
  `MaTP` char(2) NOT NULL,
  `TenTP` varchar(30) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tinhtp`
--

INSERT INTO `tinhtp` (`MaTP`, `TenTP`) VALUES
('CT', 'Cần Thơ'),
('HN', 'Hà Nội'),
('HP', 'Hải Phòng'),
('HU', 'Huế'),
('ND', 'Nam Định'),
('NT', 'Nha Trang'),
('TP', 'TP.Hồ Chí Minh'),
('VI', 'Vinh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chamcong`
--
ALTER TABLE `chamcong`
  ADD KEY `MaNV` (`MaNV`);

--
-- Indexes for table `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDDH`),
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaNV` (`MaNV`);

--
-- Indexes for table `donvi`
--
ALTER TABLE `donvi`
  ADD PRIMARY KEY (`MaDV`),
  ADD UNIQUE KEY `TenDV_UNIQUE` (`TenDV`);

--
-- Indexes for table `giaohang`
--
ALTER TABLE `giaohang`
  ADD KEY `MaDDH` (`MaDDH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `TenKH_UNIQUE` (`TenKH`),
  ADD KEY `MaTP` (`MaTP`);

--
-- Indexes for table `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH_UNIQUE` (`TenMH`),
  ADD KEY `MaNCC` (`MaNCC`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`),
  ADD UNIQUE KEY `TenNCC_UNIQUE` (`TenNCC`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD KEY `MaDV` (`MaDV`);

--
-- Indexes for table `tinhtp`
--
ALTER TABLE `tinhtp`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mathang`
--
ALTER TABLE `mathang`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `chamcong_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Constraints for table `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD CONSTRAINT `chitietddh_ibfk_1` FOREIGN KEY (`MaDDH`) REFERENCES `dondathang` (`MaDDH`),
  ADD CONSTRAINT `chitietddh_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `dondathang_ibfk_2` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Constraints for table `giaohang`
--
ALTER TABLE `giaohang`
  ADD CONSTRAINT `giaohang_ibfk_1` FOREIGN KEY (`MaDDH`) REFERENCES `chitietddh` (`MaDDH`),
  ADD CONSTRAINT `giaohang_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Constraints for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTP`) REFERENCES `tinhtp` (`MaTP`),
  ADD CONSTRAINT `khachhang_ibfk_2` FOREIGN KEY (`MaTP`) REFERENCES `tinhtp` (`MaTP`);

--
-- Constraints for table `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`);

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaDV`) REFERENCES `donvi` (`MaDV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
