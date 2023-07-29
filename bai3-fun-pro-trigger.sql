
#câu 1
CREATE FUNCTION dbo.TongDoanhThuNam1997()
RETURNS INT
AS
BEGIN
    DECLARE @TongDoanhThu INT;

    SELECT @TongDoanhThu = SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia))
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = 1997;

    RETURN @TongDoanhThu;
END;
SELECT dbo.TongDoanhThuNam1997() AS TongDoanhThu1997;


#câu 2
CREATE FUNCTION dbo.TongDoanhThuTheoNam(@Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongDoanhThu INT;

    SELECT @TongDoanhThu = SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia))
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = @Nam;

    RETURN @TongDoanhThu;
END;
DECLARE @Nam INT = 1997;
SELECT dbo.TongDoanhThuTheoNam(@Nam) AS TongDoanhThu;


#câu 3
CREATE FUNCTION dbo.TongThanhTienTheoMaDDH(@MaDDH CHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @TongThanhTien INT;

    SELECT @TongThanhTien = SUM(SoLuong * DonGia * (1 - GiamGia))
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = @MaDDH;

    RETURN @TongThanhTien;
END;
DECLARE @MaDDH CHAR(5) = 'ABC01';
SELECT dbo.TongThanhTienTheoMaDDH(@MaDDH) AS TongThanhTien;


#câu 4
CREATE FUNCTION dbo.TongDoanhThuTheoMaNV(@MaNV INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongDoanhThu INT;

    SELECT @TongDoanhThu = SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia))
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = @MaNV;

    RETURN @TongDoanhThu;
END;
DECLARE @MaNV INT = 1;
SELECT dbo.TongDoanhThuTheoMaNV(@MaNV) AS TongDoanhThu;


#câu 5
#cau 5.1
CREATE PROCEDURE dbo.TongDoanhThuNam1997
AS
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = 1997;
END;
EXEC dbo.TongDoanhThuNam1997;

#câu 5.2
CREATE PROCEDURE dbo.TongDoanhThuTheoNam
    @Nam INT
AS
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = @Nam;
END;
DECLARE @Nam INT = 1998;
EXEC dbo.TongDoanhThuTheoNam @Nam;

#câu 5.3
CREATE PROCEDURE dbo.TongThanhTienTheoMaDDH
    @MaDDH CHAR(5)
AS
BEGIN
    SELECT SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongThanhTien
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = @MaDDH;
END;
DECLARE @MaDDH CHAR(5) = 'ABC01';
EXEC dbo.TongThanhTienTheoMaDDH @MaDDH;

#câu 5.4
CREATE PROCEDURE dbo.TongDoanhThuTheoMaNV
    @MaNV INT
AS
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = @MaNV;
END;
DECLARE @MaNV INT = 1;
EXEC dbo.TongDoanhThuTheoMaNV @MaNV;


#câu 6
CREATE PROCEDURE dbo.LietKeNhanVienTheoPhai
    @Phai CHAR(1)
AS
BEGIN
    SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
    FROM NhanVien
    WHERE Phai = @Phai;
END;
DECLARE @Phai CHAR(1) = 'M'; -- Hoặc 'F' tùy thuộc vào phái cần tìm
EXEC dbo.LietKeNhanVienTheoPhai @Phai;


#câu 7
CREATE PROCEDURE dbo.LietKeMatHangTheoMaDDH
    @MaDDH CHAR(5)
AS
BEGIN
    SELECT MH.MaMH, MH.TenMH, CT.SoLuong
    FROM MatHang MH
    JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
    WHERE CT.MaDDH = @MaDDH;
END;
DECLARE @MaDDH CHAR(5) = 'ABC01'; -- Thay thế 'ABC01' bằng mã đơn đặt hàng cần tìm
EXEC dbo.LietKeMatHangTheoMaDDH @MaDDH;

#câu 9
CREATE PROCEDURE dbo.LietKeMatHangTheoNhaCungCap
    @MaNCC INT
AS
BEGIN
    SELECT MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
    FROM MatHang MH
    WHERE MH.MaNCC = @MaNCC;
END;
DECLARE @MaNCC INT = 1; -- Thay thế 1 bằng mã nhà cung cấp cần tìm
EXEC dbo.LietKeMatHangTheoNhaCungCap @MaNCC;


#câu 10
CREATE PROCEDURE dbo.LietKeDonDatHangTheoKhoangThoiGian
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
BEGIN
    SELECT MaDDH, NgayDH, NgayGiao, MaKH, TenKH, MaMH, TenMH, SoLuong
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
    WHERE NgayDH >= @NgayBatDau AND NgayDH <= @NgayKetThuc;
END;
DECLARE @NgayBatDau DATE = '2023-01-01'; -- Thay thế '2023-01-01' bằng ngày bắt đầu cần tìm
DECLARE @NgayKetThuc DATE = '2023-01-31'; -- Thay thế '2023-01-31' bằng ngày kết thúc cần tìm
EXEC dbo.LietKeDonDatHangTrongKhoangNgay @NgayBatDau, @NgayKetThuc;