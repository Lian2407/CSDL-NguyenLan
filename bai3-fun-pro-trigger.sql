DELIMITER $$
--
-- Procedures
--
PROCEDURE `LietKeDonDatHangTheoKhoangThoiGian` (`NgayBatDau` DATE, `NgayKetThuc` DATE)   BEGIN
    SELECT MaDDH, NgayDH, NgayGiao, MaKH, TenKH, MaMH, TenMH, SoLuong
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
    WHERE NgayDH >= `NgayBatDau` AND NgayDH <= `NgayKetThuc`;
END$$

PROCEDURE `LietKeMatHangTheoMaDDH` (`MaDDH` CHAR(5))   BEGIN
    SELECT MH.MaMH, MH.TenMH, CT.SoLuong
    FROM MatHang MH
    JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
    WHERE CT.MaDDH = `MaDDH`;
END$$

PROCEDURE `LietKeMatHangTheoNhaCungCap` (`MaNCC` INT)   BEGIN
    SELECT MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
    FROM MatHang MH
    WHERE MH.MaNCC = `MaNCC`;
END$$

PROCEDURE `LietKeNhanVienTheoPhai` (`Phai` CHAR(1))   BEGIN
    SELECT `MaNV`, `HoLot`, `TenNV`, `DiaChiNV`, `NgayNViec`, `Phai`
    FROM nhanvien
    WHERE Phai = `Phai`;
END$$

--
-- Functions
--
FUNCTION `TongDoanhThuNam1997` () RETURNS INT(11)  BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = 1997;

    RETURN `TongDoanhThu`;
END$$

FUNCTION `TongDoanhThuTheoMaNV` (`MaNV` INT) RETURNS INT(11)  BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT  SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = `MaNV`;

    RETURN `TongDoanhThu`;
END$$

FUNCTION `TongDoanhThuTheoNam` (`Nam` INT) RETURNS INT(11)  BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = `Nam`;

    RETURN `TongDoanhThu`;
END$$

FUNCTION `TongThanhTienTheoMaDDH` (`MaDDH` CHAR(5)) RETURNS INT(11)  BEGIN
    DECLARE `TongThanhTien` INT;

    SELECT SUM(SoLuong * DonGia * (1 - GiamGia)) into `TongThanhTien`
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = `MaDDH`;

    RETURN `TongThanhTien`;
END$$
