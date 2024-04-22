CREATE DATABASE QuanLyBanHang2;
USE QuanLyBanHang2;

CREATE TABLE KHACHHANG
(
    MaKH     VARCHAR(4) PRIMARY KEY NOT NULL,
    TenKH    VARCHAR(30)            NOT NULL,
    Diachi   VARCHAR(50),
    Ngaysinh DATETIME,
    SoDT     VARCHAR(15) UNIQUE
);

INSERT INTO KHACHHANG (MaKH, TenKH, Diachi, Ngaysinh, SoDT)
VALUES ('KH01', 'Nguyen Van A', '123 Duong ABC, TP HCM', '1985-08-15', '0933123456'),
       ('KH02', 'Tran Thi B', '456 Duong XYZ, Ha Noi', '1990-12-22', '0978654321'),
       ('KH03', 'Le Thi C', '789 Duong DEF, TP HCM', '1993-03-15', '0933456789'),
       ('KH04', 'Hoang Van D', '101 Duong GHI, Ha Noi', '1982-07-24', '0933567890'),
       ('KH05', 'Pham Bao E', '234 Duong JKL, Da Nang', '1988-09-30', '0933678901'),
       ('KH06', 'Tran Phu F', '567 Duong MNO, Hai Phong', '1979-01-17', '0933789012'),
       ('KH07', 'Nguyen Ha G', '890 Duong PQR, Can Tho', '1991-05-25', '0933890123'),
       ('KH08', 'Le Quy H', '321 Duong STU, Gia Lai', '1994-11-02', '0933901234'),
       ('KH09', 'Phan Thu I', '654 Duong VWX, Binh Duong', '1990-03-14', '0933012345'),
       ('KH10', 'Vo Minh J', '987 Duong YZA, Hue', '1987-06-07', '0933123457');

UPDATE KHACHHANG
SET SoDT = '0999123456'
WHERE MaKH = 'KH10';

CREATE TABLE NHANVIEN
(
    MaNV       VARCHAR(4) PRIMARY KEY NOT NULL,
    HoTen      VARCHAR(30)            NOT NULL,
    GioiTinh   BIT                    NOT NULL,
    DiaChi     VARCHAR(50)            NOT NULL,
    NgaySinh   DATETIME               NOT NULL,
    DienThoai  VARCHAR(15),
    Email      TEXT,
    NoiSinh    VARCHAR(20)            NOT NULL,
    NgayVaoLam DATETIME,
    MaNQL      VARCHAR(4)
);

INSERT INTO NHANVIEN (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('NV01', 'Le Hoang', 1, '789 Duong QWE, Da Nang', '1980-05-30', '0987123456', 'lehoang@example.com', 'Da Nang',
        '2005-06-01', 'NV02'),
       ('NV02', 'Hoang Thi C', 0, '321 Duong ASD, Can Tho', '1982-03-25', '0989765432', 'hoangc@example.com', 'Can Tho',
        '2006-07-15', NULL),
       ('NV03', 'Pham Van D', 1, '234 Duong DEF, Hai Phong', '1992-11-08', '0912345678', 'phamvand@example.com',
        'Hai Phong', CURRENT_TIMESTAMP, 'NV01'),
       ('NV04', 'Nguyen Thanh E', 0, '456 Duong GHI, Ninh Binh', '1985-04-22', '0912456789', 'thanhenguyen@example.com',
        'Ninh Binh', CURRENT_TIMESTAMP, 'NV03'),
       ('NV05', 'Do Minh F', 1, '678 Duong JKL, Thanh Hoa', '1990-08-19', '0912567890', 'dominhf@example.com',
        'Thanh Hoa', CURRENT_TIMESTAMP, NULL);

UPDATE NHANVIEN
SET DiaChi = '1000 New Street, TP Ho Chi Minh'
WHERE MaNV = 'NV05';

DELETE
FROM NHANVIEN
WHERE MaNV = 'NV05';

CREATE TABLE NHACUNGCAP
(
    MaNCC     VARCHAR(5) PRIMARY KEY NOT NULL,
    TenNCC    VARCHAR(50)            NOT NULL,
    Diachi    VARCHAR(50)            NOT NULL,
    Dienthoai VARCHAR(15)            NOT NULL,
    Email     VARCHAR(30)            NOT NULL,
    Website   VARCHAR(30)
);

INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Diachi, Dienthoai, Email, Website)
VALUES ('NCC01', 'Cong ty ABC', '1000 Duong GHI, TP HCM', '0293123456', 'contact@abc.com', 'www.abc.com'),
       ('NCC02', 'Cong ty XYZ', '2000 Duong RST, Ha Noi', '0247654321', 'info@xyz.com', 'www.xyz.com');

CREATE TABLE LOAISP
(
    MaLoaiSP  VARCHAR(4)   NOT NULL PRIMARY KEY,
    TenloaiSP VARCHAR(30)  NOT NULL,
    Ghichu    VARCHAR(100) NOT NULL
);

INSERT INTO LOAISP (MaLoaiSP, TenloaiSP, Ghichu)
VALUES ('L01', 'Dien thoai', 'Cac san pham dien thoai di dong'),
       ('L02', 'May tinh bang', 'Cac san pham may tinh bang cac loai');

CREATE TABLE SANPHAM
(
    MaSP      VARCHAR(4) PRIMARY KEY NOT NULL,
    MaLoaiSP  VARCHAR(4)             NOT NULL,
    TenSP     VARCHAR(50)            NOT NULL,
    Donvitinh VARCHAR(10)            NOT NULL,
    Ghichu    VARCHAR(100)
);

INSERT INTO SANPHAM (MaSP, MaLoaiSP, TenSP, Donvitinh, Ghichu)
VALUES ('SP01', 'L01', 'Dien thoai iPhone 13', 'Chiec', 'Dien thoai thong minh'),
       ('SP02', 'L02', 'iPad Air', 'Chiec', 'May tinh bang man hinh Retina'),
       ('SP03', 'L01', 'Samsung Galaxy S22', 'Chiec', 'Dien thoai cao cap'),
       ('SP04', 'L01', 'Xiaomi Mi 11', 'Chiec', 'Dien thoai gia re'),
       ('SP05', 'L01', 'OnePlus 9', 'Chiec', 'Dien thoai Android nhanh'),
       ('SP06', 'L02', 'Samsung Tab S7', 'Chiec', 'Tablet Android'),
       ('SP07', 'L02', 'Apple iPad Pro', 'Chiec', 'Tablet manh me'),
       ('SP08', 'L01', 'Google Pixel 6', 'Chiec', 'Dien thoai Pixel moi nhat'),
       ('SP09', 'L01', 'Huawei P50 Pro', 'Chiec', 'Dien thoai co camera tot'),
       ('SP10', 'L02', 'Microsoft Surface Go', 'Chiec', 'May tinh bang Windows'),
       ('SP11', 'L01', 'Sony Xperia 1', 'Chiec', 'Dien thoai cho game thu'),
       ('SP12', 'L02', 'Lenovo Tab P11', 'Chiec', 'Tablet gia dinh'),
       ('SP13', 'L02', 'Dell Venue 11', 'Chiec', 'May tinh bang cho doanh nghiep'),
       ('SP14', 'L02', 'Acer Iconia One', 'Chiec', 'Tablet gia re cho moi nguoi'),
       ('SP15', 'L01', 'Nokia 8.3', 'Chiec', 'Dien thoai gia re tu Nokia');

ALTER TABLE SANPHAM
    ADD CONSTRAINT fk_SANPHAM_MaLoaiSP FOREIGN KEY (MaLoaiSP) REFERENCES LOAISP (MaLoaiSP);

DELETE
FROM SANPHAM
WHERE MaSP = 'SP15';

CREATE TABLE PHIEUNHAP
(
    SoPN     VARCHAR(5) PRIMARY KEY NOT NULL,
    MaNV     VARCHAR(4)             NOT NULL,
    MaNCC    VARCHAR(5)             NOT NULL,
    Ngaynhap DATETIME               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Ghichu   VARCHAR(100)
);

INSERT INTO PHIEUNHAP (SoPN, MaNV, MaNCC, Ngaynhap, Ghichu)
VALUES ('PN03', 'NV01', 'NCC01', CURRENT_TIMESTAMP, 'Nhap hang dau thang moi'),
       ('PN04', 'NV02', 'NCC02', CURRENT_TIMESTAMP, 'Nhap hang giua thang');

CREATE TABLE CTPHIEUNHAP
(
    MaSP    VARCHAR(4) NOT NULL,
    SoPN    VARCHAR(5) NOT NULL,
    Soluong SMALLINT   NOT NULL DEFAULT 0,
    Gianhap REAL       NOT NULL CHECK (Gianhap >= 0)
);

INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES ('SP01', 'PN03', 50, 1000),
       ('SP02', 'PN03', 30, 800),
       ('SP01', 'PN04', 70, 950),
       ('SP02', 'PN04', 40, 850);

ALTER TABLE CTPHIEUNHAP
    ADD CONSTRAINT fk_CTPHIEUNHAP_MaSP FOREIGN KEY (MaSP) REFERENCES SANPHAM (MaSP),
    ADD CONSTRAINT fk_CTPHIEUNHAP_SoPN FOREIGN KEY (SoPN) REFERENCES PHIEUNHAP (SoPN);

CREATE TABLE PHIEUXUAT
(
    SoPX    VARCHAR(5) PRIMARY KEY NOT NULL,
    MaNV    VARCHAR(4)             NOT NULL,
    MaKH    VARCHAR(4)             NOT NULL,
    NgayBan DATETIME               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    GhiChu  TEXT
);

INSERT INTO PHIEUXUAT (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('PX01', 'NV01', 'KH01', CURRENT_TIMESTAMP, 'Xuat hang cho khach hang thuong xuyen'),
       ('PX02', 'NV02', 'KH02', CURRENT_TIMESTAMP, 'Xuat hang dot khuyen mai');

CREATE TABLE CTPHIEUXUAT
(
    SoPX    VARCHAR(5) NOT NULL,
    MaSP    VARCHAR(4) NOT NULL,
    SoLuong SMALLINT   NOT NULL CHECK (SoLuong > 0),
    GiaBan  REAL       NOT NULL CHECK (GiaBan > 0)
);

INSERT INTO CTPHIEUXUAT (SoPX, MaSP, SoLuong, GiaBan)
VALUES ('PX01', 'SP01', 1, 1200),
       ('PX01', 'SP02', 2, 900),
       ('PX01', 'SP01', 3, 1200),
       ('PX02', 'SP01', 2, 1150),
       ('PX02', 'SP02', 1, 950),
       ('PX02', 'SP01', 4, 1150);

ALTER TABLE CTPHIEUXUAT
    ADD CONSTRAINT fk_CTPHIEUXUAT_SoPX FOREIGN KEY (SoPX) REFERENCES PHIEUXUAT (SoPX),
    ADD CONSTRAINT fk_CTPHIEUXUAT_MaSP FOREIGN KEY (MaSP) REFERENCES SANPHAM (MaSP);

# 1
SELECT MaNV                                                                                                AS 'Mã nhân viên',
        HoTen                                                                                               AS 'Họ tên',
        CASE WHEN GioiTinh = 1 THEN 'Nam' ELSE 'Nữ' END                                                     AS 'Giới tính',
        NgaySinh                                                                                            AS 'Ngày sinh',
        DiaChi                                                                                              AS 'Địa chỉ',
        DienThoai                                                                                           AS 'Số điện thoại',
       YEAR(CURDATE()) - YEAR(NgaySinh) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(NgaySinh, '%m%d')) AS 'Tuổi'
FROM NHANVIEN
ORDER BY Tuổi;

# 2
SELECT PHIEUNHAP.SoPN     AS 'Số phiếu nhập',
        PHIEUNHAP.MaNV     AS 'Mã nhân viên',
        NHANVIEN.HoTen     AS 'Họ tên nhân viên',
        NHACUNGCAP.TenNCC  AS 'Họ tên nhà cung cấp',
        PHIEUNHAP.Ngaynhap AS 'Ngày nhập hàng',
        PHIEUNHAP.Ghichu   AS 'Ghi chú'
FROM PHIEUNHAP
         JOIN NHANVIEN ON PHIEUNHAP.MaNV = NHANVIEN.MaNV
         JOIN NHACUNGCAP ON PHIEUNHAP.MaNCC = NHACUNGCAP.MaNCC
WHERE YEAR(PHIEUNHAP.Ngaynhap) = 2018
  AND MONTH(PHIEUNHAP.Ngaynhap) = 6;

# 3
SELECT *
FROM SANPHAM
WHERE Donvitinh = 'Chai';

# 4
SELECT PHIEUNHAP.SoPN,
       CTPHIEUNHAP.MaSP,
       SANPHAM.TenSP,
       LOAISP.TenloaiSP,
       SANPHAM.Donvitinh,
       CTPHIEUNHAP.Soluong,
       CTPHIEUNHAP.Gianhap,
       CTPHIEUNHAP.Soluong * CTPHIEUNHAP.Gianhap AS ThanhTien
FROM PHIEUNHAP
         JOIN CTPHIEUNHAP ON PHIEUNHAP.SoPN = CTPHIEUNHAP.SoPN
         JOIN SANPHAM ON CTPHIEUNHAP.MaSP = SANPHAM.MaSP
         JOIN LOAISP ON SANPHAM.MaLoaiSP = LOAISP.MaLoaiSP
WHERE MONTH(PHIEUNHAP.Ngaynhap) = MONTH(CURRENT_DATE())
  AND YEAR(PHIEUNHAP.Ngaynhap) = YEAR(CURRENT_DATE());

# 5
SELECT NHACUNGCAP.MaNCC,
       NHACUNGCAP.TenNCC,
       NHACUNGCAP.Diachi,
       NHACUNGCAP.Dienthoai,
       NHACUNGCAP.Email,
       PHIEUNHAP.SoPN,
       PHIEUNHAP.Ngaynhap
FROM NHACUNGCAP
         JOIN PHIEUNHAP ON NHACUNGCAP.MaNCC = PHIEUNHAP.MaNCC
WHERE MONTH(PHIEUNHAP.Ngaynhap) = MONTH(CURRENT_DATE())
  AND YEAR(PHIEUNHAP.Ngaynhap) = YEAR(CURRENT_DATE())
ORDER BY PHIEUNHAP.Ngaynhap;

# 6
SELECT PHIEUXUAT.SoPX,
       NHANVIEN.HoTen                           AS NhanVienBanHang,
       PHIEUXUAT.NgayBan,
       CTPHIEUXUAT.MaSP,
       SANPHAM.TenSP,
       SANPHAM.Donvitinh,
       CTPHIEUXUAT.SoLuong,
       CTPHIEUXUAT.GiaBan,
       CTPHIEUXUAT.SoLuong * CTPHIEUXUAT.GiaBan AS DoanhThu
FROM PHIEUXUAT
         JOIN CTPHIEUXUAT ON PHIEUXUAT.SoPX = CTPHIEUXUAT.SoPX
         JOIN SANPHAM ON CTPHIEUXUAT.MaSP = SANPHAM.MaSP
         JOIN NHANVIEN ON PHIEUXUAT.MaNV = NHANVIEN.MaNV
WHERE YEAR(PHIEUXUAT.NgayBan) = 2018
  AND MONTH(PHIEUXUAT.NgayBan) <= 6;

# 7
SELECT *
FROM KHACHHANG
WHERE MONTH(Ngaysinh) = MONTH(CURRENT_DATE())
  AND DAY(Ngaysinh) = DAY(CURRENT_DATE());

# 8
SELECT PX.SoPX,
       NV.HoTen               AS 'NhanVienBanHang',
        PX.NgayBan,
       CT.MaSP,
       SP.TenSP,
       SP.Donvitinh,
       CT.SoLuong,
       CT.GiaBan,
       CT.SoLuong * CT.GiaBan AS 'DoanhThu'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN NHANVIEN NV ON PX.MaNV = NV.MaNV
         JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
WHERE PX.NgayBan BETWEEN '2018-04-15' AND '2018-05-15';

# 9
SELECT PX.SoPX, PX.NgayBan, PX.MaKH, KH.TenKH, SUM(CT.SoLuong * CT.GiaBan) AS 'TriGia'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN KHACHHANG KH ON PX.MaKH = KH.MaKH
GROUP BY PX.SoPX, PX.NgayBan, PX.MaKH, KH.TenKH;

# 10
SELECT SUM(CT.SoLuong) AS TongSoLuong
FROM CTPHIEUXUAT CT
         JOIN PHIEUXUAT PX ON CT.SoPX = PX.SoPX
         JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
         JOIN LOAISP LP ON SP.MaLoaiSP = LP.MaLoaiSP
WHERE LP.TenloaiSP = 'Comfort'
    AND YEAR(PX.NgayBan) = 2018
  AND MONTH(PX.NgayBan) <= 6;

# 11
SELECT MONTH(PX.NgayBan)           AS Thang,
    PX.MaKH,
    KH.TenKH,
    KH.Diachi,
    SUM(CT.SoLuong * CT.GiaBan) AS TongTien
FROM PHIEUXUAT PX
    JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
    JOIN KHACHHANG KH ON PX.MaKH = KH.MaKH
GROUP BY Thang, PX.MaKH, KH.TenKH, KH.Diachi
ORDER BY Thang, PX.MaKH;

# 12
SELECT YEAR(PX.NgayBan)  AS Nam,
    MONTH(PX.NgayBan) AS Thang,
    CT.MaSP,
    SP.TenSP,
    SP.Donvitinh,
    SUM(CT.SoLuong)   AS TongSoLuong
FROM PHIEUXUAT PX
    JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
    JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
GROUP BY Nam, Thang, CT.MaSP, SP.TenSP, SP.Donvitinh
ORDER BY Nam, Thang, CT.MaSP;

# 13
SELECT MONTH(NgayBan)        AS Thang,
    SUM(SoLuong * GiaBan) AS DoanhThu
FROM PHIEUXUAT PX
    JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
WHERE YEAR(NgayBan) = 2018
  AND MONTH(NgayBan) <= 6
GROUP BY MONTH(NgayBan)
ORDER BY MONTH(NgayBan);

# 14
SELECT PX.SoPX                     AS 'Số phiếu',
        PX.NgayBan                  AS 'Ngày bán',
        NV.HoTen                    AS 'Họ tên nhân viên bán hàng',
        KH.TenKH                    AS 'Họ tên khách hàng',
        SUM(CT.SoLuong * CT.GiaBan) AS 'Tổng trị giá'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN NHANVIEN NV ON PX.MaNV = NV.MaNV
         JOIN KHACHHANG KH ON PX.MaKH = KH.MaKH
WHERE YEAR(PX.NgayBan) = 2018
  AND MONTH(PX.NgayBan) IN (5, 6)
GROUP BY PX.SoPX, PX.NgayBan, NV.HoTen, KH.TenKH
ORDER BY PX.NgayBan;

# 15
SELECT PX.SoPX                     AS 'Số phiếu xuất',
        PX.MaKH                     AS 'Mã khách hàng',
        KH.TenKH                    AS 'Tên khách hàng',
        NV.HoTen                    AS 'Họ tên nhân viên bán hàng',
        PX.NgayBan                  AS 'Ngày bán',
        SUM(CT.SoLuong * CT.GiaBan) AS 'Trị giá'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN NHANVIEN NV ON PX.MaNV = NV.MaNV
         JOIN KHACHHANG KH ON PX.MaKH = KH.MaKH
WHERE DATE(PX.NgayBan) = DATE(NOW())
GROUP BY PX.SoPX, PX.MaKH, KH.TenKH, NV.HoTen, PX.NgayBan;

# 16
SELECT NV.MaNV         AS 'Mã nhân viên',
        NV.HoTen        AS 'Họ tên nhân viên',
        CT.MaSP         AS 'Mã sản phẩm',
        SP.TenSP        AS 'Tên sản phẩm',
        SP.Donvitinh    AS 'Đơn vị tính',
        SUM(CT.SoLuong) AS 'Tổng số lượng'
FROM NHANVIEN NV
         JOIN PHIEUXUAT PX ON NV.MaNV = PX.MaNV
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
GROUP BY NV.MaNV, NV.HoTen, CT.MaSP, SP.TenSP, SP.Donvitinh;

# 17
SELECT PX.SoPX                AS 'Số phiếu xuất',
        PX.NgayBan             AS 'Ngày bán',
        CT.MaSP                AS 'Mã sản phẩm',
        SP.TenSP               AS 'Tên sản phẩm',
        SP.Donvitinh           AS 'Đơn vị tính',
        CT.SoLuong             AS 'Số lượng',
        CT.GiaBan              AS 'Đơn giá',
        CT.SoLuong * CT.GiaBan AS 'Thành tiền'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN SANPHAM SP ON CT.MaSP = SP.MaSP
WHERE PX.MaKH = 'KH01'
    AND YEAR(PX.NgayBan) = 2018
  AND QUARTER(PX.NgayBan) = 2;

# 18
SELECT SP.MaSP      AS 'Mã sản phẩm',
        SP.TenSP     AS 'Tên sản phẩm',
        LP.TenloaiSP AS 'Loại sản phẩm',
        SP.Donvitinh AS 'Đơn vị tính'
FROM SANPHAM SP
         LEFT JOIN LOAISP LP ON SP.MaLoaiSP = LP.MaLoaiSP
WHERE SP.MaSP NOT IN (SELECT DISTINCT CT.MaSP
                      FROM CTPHIEUXUAT CT
                               JOIN PHIEUXUAT PX ON CT.SoPX = PX.SoPX
                      WHERE YEAR(PX.NgayBan) = 2018
  AND MONTH(PX.NgayBan) <= 6);

# 19
SELECT NC.MaNCC     AS 'Mã nhà cung cấp',
        NC.TenNCC    AS 'Tên nhà cung cấp',
        NC.Diachi    AS 'Địa chỉ',
        NC.Dienthoai AS 'Số điện thoại'
FROM NHACUNGCAP NC
         LEFT JOIN PHIEUNHAP PN ON NC.MaNCC = PN.MaNCC
WHERE PN.MaNCC IS NULL
    AND YEAR(PN.Ngaynhap) = 2018
  AND MONTH(PN.Ngaynhap) >= 4
  AND MONTH(PN.Ngaynhap) <= 6;

# 20
SELECT PX.MaKH                     AS 'Mã khách hàng',
        KH.TenKH                    AS 'Tên khách hàng',
        SUM(CT.SoLuong * CT.GiaBan) AS 'Tổng trị giá đơn hàng'
FROM PHIEUXUAT PX
         JOIN CTPHIEUXUAT CT ON PX.SoPX = CT.SoPX
         JOIN KHACHHANG KH ON PX.MaKH = KH.MaKH
WHERE YEAR(PX.NgayBan) = 2018
  AND MONTH(PX.NgayBan) <= 6
GROUP BY PX.MaKH
ORDER BY SUM(CT.SoLuong * CT.GiaBan) DESC
    LIMIT 1;

# 21
SELECT MaKH AS 'Mã khách hàng', COUNT(*) AS 'Số lượng đơn đặt hàng'
FROM PHIEUXUAT
GROUP BY MaKH;

# 22
SELECT NV.MaNV AS 'Mã nhân viên', NV.HoTen AS 'Tên nhân viên', PX.MaKH AS 'Tên khách hàng'
FROM NHANVIEN NV
         LEFT JOIN PHIEUXUAT PX ON NV.MaNV = PX.MaNV;

# 23
SELECT SUM(CASE WHEN GioiTinh = 1 THEN 1 ELSE 0 END) AS 'Số lượng nam',
        SUM(CASE WHEN GioiTinh = 0 THEN 1 ELSE 0 END) AS 'Số lượng nữ'
FROM NHANVIEN;

# 24
SELECT MaNV,
       HoTen                                      AS 'Tên nhân viên',
        TIMESTAMPDIFF(YEAR, NgayVaoLam, CURDATE()) AS 'Số năm làm việc'
FROM NHANVIEN
ORDER BY TIMESTAMPDIFF(YEAR, NgayVaoLam, CURDATE()) DESC
    LIMIT 1;

# 25
SELECT HoTen AS 'Họ tên nhân viên'
FROM NHANVIEN
WHERE (GioiTinh = 1 AND TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) >= 60)
   OR (GioiTinh = 0 AND TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) >= 55);

# 26
SELECT HoTen   AS 'Họ tên nhân viên',
        CASE
            WHEN GioiTinh = 1 THEN YEAR(NgaySinh) + 60
           ELSE YEAR(NgaySinh) + 55
END AS 'Năm về hưu'
FROM NHANVIEN;

# 27
SELECT MaNV       AS 'Mã nhân viên',
        HoTen      AS 'Họ tên nhân viên',
        NgayVaoLam AS 'Ngày vào làm',
        CASE
            WHEN DATEDIFF(CURDATE(), NgayVaoLam) < 365 THEN 200000
            WHEN DATEDIFF(CURDATE(), NgayVaoLam) >= 365 AND DATEDIFF(CURDATE(), NgayVaoLam) < 1095 THEN 400000
            WHEN DATEDIFF(CURDATE(), NgayVaoLam) >= 1095 AND DATEDIFF(CURDATE(), NgayVaoLam) < 1825 THEN 600000
            WHEN DATEDIFF(CURDATE(), NgayVaoLam) >= 1825 AND DATEDIFF(CURDATE(), NgayVaoLam) < 3650 THEN 800000
            ELSE 1000000
            END    AS 'Tiền thưởng tết dương lịch'
FROM NHANVIEN;

# 28
SELECT SANPHAM.MaSP      AS 'Mã sản phẩm',
        SANPHAM.TenSP     AS 'Tên sản phẩm',
        LOAISP.TenloaiSP  AS 'Loại sản phẩm',
        SANPHAM.Donvitinh AS 'Đơn vị tính'
FROM SANPHAM
         INNER JOIN LOAISP ON SANPHAM.MaLoaiSP = LOAISP.MaLoaiSP
WHERE LOAISP.TenloaiSP = 'Hóa mỹ phẩm';

# 29
SELECT SANPHAM.MaSP      AS 'Mã sản phẩm',
        SANPHAM.TenSP     AS 'Tên sản phẩm',
        LOAISP.TenloaiSP  AS 'Loại sản phẩm',
        SANPHAM.Donvitinh AS 'Đơn vị tính'
FROM SANPHAM
         INNER JOIN LOAISP ON SANPHAM.MaLoaiSP = LOAISP.MaLoaiSP
WHERE LOAISP.TenloaiSP = 'Quần áo';

# 30
SELECT COUNT(*) AS 'Số lượng sản phẩm Quần áo'
FROM SANPHAM
         INNER JOIN LOAISP ON SANPHAM.MaLoaiSP = LOAISP.MaLoaiSP
WHERE LOAISP.TenloaiSP = 'Quần áo';

# 31
SELECT COUNT(*) AS 'Số lượng loại sản phẩm Hóa mỹ phẩm'
FROM LOAISP
WHERE LOAISP.TenloaiSP = 'Hóa mỹ phẩm';

# 32
SELECT SANPHAM.MaLoaiSP, TenloaiSP, COUNT(*) AS 'Số lượng sản phẩm'
FROM SANPHAM
         JOIN LOAISP ON SANPHAM.MaLoaiSP = LOAISP.MaLoaiSP
GROUP BY SANPHAM.MaLoaiSP, TenloaiSP;