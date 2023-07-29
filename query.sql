#câu 1
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang;

#câu 2
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
WHERE DonGia >= 62;

#câu 3
SELECT NC.MaNCC, NC.TenNCC, MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
FROM NhaCungCap NC
JOIN MatHang MH ON NC.MaNCC = MH.MaNCC
WHERE NC.MaNCC IN (2, 4);

#câu 4
SELECT NC.MaNCC, NC.TenNCC, NC.DiaChi, MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
FROM NhaCungCap NC
JOIN MatHang MH ON NC.MaNCC = MH.MaNCC
WHERE NC.DiaChi LIKE '%TP.HCM%';

#câu 5
SELECT DDH.MaDDH, DDH.NgayDH, KH.MaKH, KH.TenKH, CT.MaMH, MH.TenMH, CT.SoLuong
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE DDH.NgayDH BETWEEN '1997-01-01' AND '1997-01-31';

#câu 6
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, NV.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV
FROM DonDatHang DDH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE DDH.NgayDH >= '1997-02-01' AND DDH.NgayDH <= '1997-02-28';

#câu 7
SELECT DDH.MaDDH, DDH.NgayDH, KH.MaKH, KH.TenKH, DDH.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE DDH.NgayGiao < '1997-03-01' AND DDH.MaNV IN (4, 5);

#câu 8
SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
FROM NhanVien
WHERE Phai = 'M';

#câu 9
SELECT MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNViec
FROM NhanVien
WHERE NgayNViec BETWEEN '1991-07-01' AND '1992-11-30' AND LuongCB < 300;

#câu 10
SELECT MaNV, HoLot, TenNV, Phai, DiaChiNV
FROM NhanVien
WHERE Phai = 'F' AND (DiaChiNV LIKE '%Q1%' OR DiaChiNV LIKE '%Q2%');

#câu 11
SELECT CC.MaNV, NV.HoLot, NV.TenNV, NV.MaDV, DV.TenDV, CC.Thang, CC.Nam, CC.NgayCong
FROM ChamCong CC
JOIN NhanVien NV ON CC.MaNV = NV.MaNV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
WHERE CC.Thang = 1 AND CC.Nam = 1999 AND CC.NgayCong < 25;

#câu 12
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, NV.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV, NV.Phai
FROM DonDatHang DDH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE NV.Phai = 'F';

#câu 13
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, KH.MaKH, KH.TenKH,
       DATEDIFF(DDH.NgayDH, DDH.NgayGiao) AS ThoiGianGiaoHang
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
WHERE DATEDIFF(DDH.NgayDH, DDH.NgayGiao) <= 15;

#câu 14
SELECT DDH.MaDDH, DDH.NgayDH, CT.MaMH, MH.TenMH, CT.SoLuong, MH.DonGia, (CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS ThanhTien
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH;

#câu 15
SELECT YEAR(DDH.NgayDH) AS Nam, DAYOFMONTH(DDH.NgayDH) AS Quy,
       DDH.NgayDH, DDH.MaDDH, DDH.MaKH, KH.TenKH, DDH.MaNV, NV.TenNV
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE YEAR(DDH.NgayDH) = 1997 AND DAYOFMONTH(DDH.NgayDH) = 1;

#câu 16
SELECT DDH.MaDDH, DDH.NgayDH, CT.MaMH, MH.TenMH
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE CT.MaMH IN (1, 3, 5, 7);

#câu 17
SELECT MaTP, COUNT(MaKH) AS TongsoKH
FROM KhachHang
GROUP BY MaTP;

#câu 18
SELECT MaDV, COUNT(MaNV) AS TongSoNV
FROM NhanVien
GROUP BY MaDV;

#câu 19
SELECT YEAR(NgayDH) AS Nam, COUNT(MaDDH) AS TongSoDDH
FROM DonDatHang
GROUP BY YEAR(NgayDH);

#câu 20
SELECT YEAR(NgayDH) AS Nam, CT.MaDDH, DDH.NgayDH, DDH.NgayGiao,
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTri
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
GROUP BY YEAR(NgayDH), MaDDH, NgayDH, NgayGiao;

#câu 21
SELECT YEAR(DDH.NgayDH) AS Nam, DDH.MaKH, KH.TenKH,
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
GROUP BY YEAR(DDH.NgayDH), DDH.MaKH, KH.TenKH;

#câu 22
SELECT DDH.MaKH, KH.TenKH, 1998 AS Nam, 
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTienMax
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
WHERE YEAR(DDH.NgayDH) = 1998
GROUP BY DDH.MaKH, KH.TenKH
HAVING SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT DDH.MaKH, SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
        FROM DonDatHang DDH
        JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
        JOIN MatHang MH ON CT.MaMH = MH.MaMH
        WHERE YEAR(DDH.NgayDH) = 1998
        GROUP BY DDH.MaKH
    ) AS T
);

#câu 24
SELECT CT.MaMH, MH.TenMH, 1997 AS Nam, 
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTienMax
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE YEAR(DDH.NgayDH) = 1997
GROUP BY CT.MaMH, MH.TenMH
HAVING SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT CT.MaMH, SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
        FROM DonDatHang DDH
        JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
        JOIN MatHang MH ON CT.MaMH = MH.MaMH
        WHERE YEAR(DDH.NgayDH) = 1997
        GROUP BY CT.MaMH
    ) AS T
);

#câu 25
SELECT DDH.MaKH, KH.TenKH, KH.DiaChi,
       COUNT(DDH.MaDDH) AS SoDDH,
       COUNT(DDH.MaDDH) / 2 AS SoLichTang
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
GROUP BY DDH.MaKH, KH.TenKH, KH.DiaChi;

#câu 26
SELECT NV.MaDV, DV.TenDV, 1999 AS Nam, 
       SUM(NV.LuongCB * CC.NgayCong) AS TongLuong
FROM NhanVien NV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
JOIN ChamCong CC ON NV.MaNV = CC.MaNV
WHERE CC.Nam = 1999
GROUP BY NV.MaDV, DV.TenDV;

#câu 27
SELECT NV.MaDV, DV.TenDV, 1999 AS Nam, 
       SUM(NV.LuongCB * CC.NgayCong) AS TongLuongMax
FROM NhanVien NV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
JOIN ChamCong CC ON NV.MaNV = CC.MaNV
WHERE CC.Nam = 1999
GROUP BY NV.MaDV, DV.TenDV
ORDER BY TongLuongMax DESC;

#câu 28
CREATE TABLE `LuuDDH` (
  `MaDDH` int NOT NULL,
  `MaKH` int NOT NULL,
   `NgayDH` date NOT NULL,
    `NgayGiao` date NOT NULL,
    `MaMH` int NOT NULL,
    `Soluong` int NOT NULL DEFAULT '0',
    `GiamGia` int NOT NULL
    );

INSERT
INTO LuuDDH (`MaDDH`, `MaKH`,  `NgayDH` , `NgayGiao`, `MaMH`, `Soluong`, `GiamGia`)
SELECT a.`MaDDH`, a.`MaKH`,  a.`NgayDH` , a.`NgayGiao`, a.`MaMH` FROM DonDatHang a 
WHERE YEAR(a.NgayDH) IN (1997, 1998, 1999);



DELETE FROM LuuDDH
WHERE YEAR(NgayDH) = 1997;

#câu 29
UPDATE LuuDDH
SET GiamGia = GiamGia + 0.02
WHERE YEAR(NgayDH) = 1999;

#câu 30
SELECT 1 AS Thang, 1999 AS Nam, MaNV, HoLot + ' ' + TenNV AS HoTen,
       LuongCB, NgayCong, LuongCB * NgayCong AS Luong
INTO Luong9901
FROM NhanVien
WHERE DATEPART(MONTH, NgayNViec) = 1 AND YEAR(NgayNViec) = 1999;

#câu 31
UPDATE Luong9901
SET LuongCB = LuongCB * 1.1
WHERE Phai = 'M' AND NgayCong > 20;

UPDATE Luong9901
SET LuongCB = LuongCB * 1.

#câu 32
SELECT MH.MaMH, MH.TenMH
FROM MatHang MH
LEFT JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
LEFT JOIN DonDatHang DDH ON CT.MaDDH = DDH.MaDDH
WHERE (DDH.NgayDH IS NULL OR DDH.NgayDH < '1998-05-01') AND (DDH.NgayGiao IS NULL OR DDH.NgayGiao >= '1997-05-01');#câu 1
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang;

#câu 2
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
WHERE DonGia >= 62;

#câu 3
SELECT NC.MaNCC, NC.TenNCC, MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
FROM NhaCungCap NC
JOIN MatHang MH ON NC.MaNCC = MH.MaNCC
WHERE NC.MaNCC IN (2, 4);

#câu 4
SELECT NC.MaNCC, NC.TenNCC, NC.DiaChi, MH.MaMH, MH.TenMH, MH.DonViTinh, MH.DonGia
FROM NhaCungCap NC
JOIN MatHang MH ON NC.MaNCC = MH.MaNCC
WHERE NC.DiaChi LIKE '%TP.HCM%';

#câu 5
SELECT DDH.MaDDH, DDH.NgayDH, KH.MaKH, KH.TenKH, CT.MaMH, MH.TenMH, CT.SoLuong
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE DDH.NgayDH BETWEEN '1997-01-01' AND '1997-01-31';

#câu 6
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, NV.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV
FROM DonDatHang DDH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE DDH.NgayDH >= '1997-02-01' AND DDH.NgayDH <= '1997-02-28';

#câu 7
SELECT DDH.MaDDH, DDH.NgayDH, KH.MaKH, KH.TenKH, DDH.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE DDH.NgayGiao < '1997-03-01' AND DDH.MaNV IN (4, 5);

#câu 8
SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
FROM NhanVien
WHERE Phai = 'M';

#câu 9
SELECT MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNViec
FROM NhanVien
WHERE NgayNViec BETWEEN '1991-07-01' AND '1992-11-30' AND LuongCB < 300;

#câu 10
SELECT MaNV, HoLot, TenNV, Phai, DiaChiNV
FROM NhanVien
WHERE Phai = 'F' AND (DiaChiNV LIKE '%Q1%' OR DiaChiNV LIKE '%Q2%');

#câu 11
SELECT CC.MaNV, NV.HoLot, NV.TenNV, NV.MaDV, DV.TenDV, CC.Thang, CC.Nam, CC.NgayCong
FROM ChamCong CC
JOIN NhanVien NV ON CC.MaNV = NV.MaNV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
WHERE CC.Thang = 1 AND CC.Nam = 1999 AND CC.NgayCong < 25;

#câu 12
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, NV.MaNV, NV.HoLot + ' ' + NV.TenNV AS HoTenNV, NV.Phai
FROM DonDatHang DDH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE NV.Phai = 'F';

#câu 13
SELECT DDH.MaDDH, DDH.NgayDH, DDH.NgayGiao, KH.MaKH, KH.TenKH,
       DATEDIFF(DDH.NgayDH, DDH.NgayGiao) AS ThoiGianGiaoHang
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
WHERE DATEDIFF(DDH.NgayDH, DDH.NgayGiao) <= 15;

#câu 14
SELECT DDH.MaDDH, DDH.NgayDH, CT.MaMH, MH.TenMH, CT.SoLuong, MH.DonGia, (CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS ThanhTien
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH;

#câu 15
SELECT YEAR(DDH.NgayDH) AS Nam, DAYOFMONTH(DDH.NgayDH) AS Quy,
       DDH.NgayDH, DDH.MaDDH, DDH.MaKH, KH.TenKH, DDH.MaNV, NV.TenNV
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
JOIN NhanVien NV ON DDH.MaNV = NV.MaNV
WHERE YEAR(DDH.NgayDH) = 1997 AND DAYOFMONTH(DDH.NgayDH) = 1;

#câu 16
SELECT DDH.MaDDH, DDH.NgayDH, CT.MaMH, MH.TenMH
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE CT.MaMH IN (1, 3, 5, 7);

#câu 17
SELECT MaTP, COUNT(MaKH) AS TongsoKH
FROM KhachHang
GROUP BY MaTP;

#câu 18
SELECT MaDV, COUNT(MaNV) AS TongSoNV
FROM NhanVien
GROUP BY MaDV;

#câu 19
SELECT YEAR(NgayDH) AS Nam, COUNT(MaDDH) AS TongSoDDH
FROM DonDatHang
GROUP BY YEAR(NgayDH);

#câu 20
SELECT YEAR(NgayDH) AS Nam, CT.MaDDH, DDH.NgayDH, DDH.NgayGiao,
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTri
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
GROUP BY YEAR(NgayDH), MaDDH, NgayDH, NgayGiao;

#câu 21
SELECT YEAR(DDH.NgayDH) AS Nam, DDH.MaKH, KH.TenKH,
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
GROUP BY YEAR(DDH.NgayDH), DDH.MaKH, KH.TenKH;

#câu 22
SELECT DDH.MaKH, KH.TenKH, 1998 AS Nam, 
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTienMax
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
WHERE YEAR(DDH.NgayDH) = 1998
GROUP BY DDH.MaKH, KH.TenKH
HAVING SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT DDH.MaKH, SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
        FROM DonDatHang DDH
        JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
        JOIN MatHang MH ON CT.MaMH = MH.MaMH
        WHERE YEAR(DDH.NgayDH) = 1998
        GROUP BY DDH.MaKH
    ) AS T
);

#câu 24
SELECT CT.MaMH, MH.TenMH, 1997 AS Nam, 
       SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTienMax
FROM DonDatHang DDH
JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
JOIN MatHang MH ON CT.MaMH = MH.MaMH
WHERE YEAR(DDH.NgayDH) = 1997
GROUP BY CT.MaMH, MH.TenMH
HAVING SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT CT.MaMH, SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongTien
        FROM DonDatHang DDH
        JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
        JOIN MatHang MH ON CT.MaMH = MH.MaMH
        WHERE YEAR(DDH.NgayDH) = 1997
        GROUP BY CT.MaMH
    ) AS T
);

#câu 25
SELECT DDH.MaKH, KH.TenKH, KH.DiaChi,
       COUNT(DDH.MaDDH) AS SoDDH,
       COUNT(DDH.MaDDH) / 2 AS SoLichTang
FROM DonDatHang DDH
JOIN KhachHang KH ON DDH.MaKH = KH.MaKH
GROUP BY DDH.MaKH, KH.TenKH, KH.DiaChi;

#câu 26
SELECT NV.MaDV, DV.TenDV, 1999 AS Nam, 
       SUM(NV.LuongCB * CC.NgayCong) AS TongLuong
FROM NhanVien NV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
JOIN ChamCong CC ON NV.MaNV = CC.MaNV
WHERE CC.Nam = 1999
GROUP BY NV.MaDV, DV.TenDV;

#câu 27
SELECT NV.MaDV, DV.TenDV, 1999 AS Nam, 
       SUM(NV.LuongCB * CC.NgayCong) AS TongLuongMax
FROM NhanVien NV
JOIN DonVi DV ON NV.MaDV = DV.MaDV
JOIN ChamCong CC ON NV.MaNV = CC.MaNV
WHERE CC.Nam = 1999
GROUP BY NV.MaDV, DV.TenDV
ORDER BY TongLuongMax DESC;

#câu 28
CREATE TABLE `LuuDDH` (
  `MaDDH` int NOT NULL,
  `MaKH` int NOT NULL,
   `NgayDH` date NOT NULL,
    `NgayGiao` date NOT NULL,
    `MaMH` int NOT NULL,
    `Soluong` int NOT NULL DEFAULT '0',
    `GiamGia` int NOT NULL
    );

INSERT
INTO LuuDDH (`MaDDH`, `MaKH`,  `NgayDH` , `NgayGiao`, `MaMH`, `Soluong`, `GiamGia`)
SELECT a.`MaDDH`, a.`MaKH`,  a.`NgayDH` , a.`NgayGiao`, a.`MaMH` FROM DonDatHang a 
WHERE YEAR(a.NgayDH) IN (1997, 1998, 1999);



DELETE FROM LuuDDH
WHERE YEAR(NgayDH) = 1997;

#câu 29
UPDATE LuuDDH
SET GiamGia = GiamGia + 0.02
WHERE YEAR(NgayDH) = 1999;

#câu 30
SELECT 1 AS Thang, 1999 AS Nam, MaNV, HoLot + ' ' + TenNV AS HoTen,
       LuongCB, NgayCong, LuongCB * NgayCong AS Luong
INTO Luong9901
FROM NhanVien
WHERE DATEPART(MONTH, NgayNViec) = 1 AND YEAR(NgayNViec) = 1999;

#câu 31
UPDATE Luong9901
SET LuongCB = LuongCB * 1.1
WHERE Phai = 'M' AND NgayCong > 20;

UPDATE Luong9901
SET LuongCB = LuongCB * 1.

#câu 32
SELECT MH.MaMH, MH.TenMH
FROM MatHang MH
LEFT JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
LEFT JOIN DonDatHang DDH ON CT.MaDDH = DDH.MaDDH
WHERE (DDH.NgayDH IS NULL OR DDH.NgayDH < '1998-05-01') AND (DDH.NgayGiao IS NULL OR DDH.NgayGiao >= '1997-05-01');