CREATE DATABASE P001_QuanLyCuaHang
GO

USE P001_QuanLyCuaHang
GO

--BANG TINHTRANG
CREATE TABLE DonViTinh
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenDonViTinh NVARCHAR(100)
) 
GO


--BANG TIVI
CREATE TABLE Hang
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	TenHang nvarchar(200),
	GiaBan int,
	SoLuongTon int,
	IdDVT INT,
	An INT,

	FOREIGN KEY (IdDVT) REFERENCES DonViTinh(Id)
)
GO


--BANG KHACHHANG
CREATE TABLE KhachHang
(
	MaKh int identity(1,1) PRIMARY KEY,
	HoTen NVARCHAR(200),
	GioiTinh NVARCHAR(5),
	NamSinh DATE,
	DiaChi NVARCHAR(200),
	Sdt NVARCHAR(20),
	An INT,
)
GO

--BANG NCC
CREATE TABLE NhaCungCap
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Ten NVARCHAR(200),
	DiaChi NVARCHAR(200),
	Sdt NVARCHAR(20),
	Email NVARCHAR(200),
	An INT,
)
GO


--BANG HDN
CREATE TABLE HoaDonNhap
(
	SoHD varchar(20) PRIMARY KEY,
	NgayNhap DATE,
	IdNCC INT,

	FOREIGN KEY (IdNCC) REFERENCES NhaCungCap(Id)
)
GO

--BANG CTHDN
CREATE TABLE ChiTietHDN
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHDN varchar(20),
	IdHang INT,
	SoLuong INT,
	DonGiaNhap INT,

	FOREIGN KEY (IdHDN) REFERENCES HoaDonNhap(SoHD),
	FOREIGN KEY (IdHang) REFERENCES Hang(Id)
)
GO

--BANG HDX
CREATE TABLE HoaDonBan
(
	SoHD varchar(20) PRIMARY KEY,
	NgayBan DATE,
	Makh int,

	FOREIGN KEY (Makh) REFERENCES KhachHang(Makh)
)
GO

--BANG CTHDB
CREATE TABLE ChiTietHDB
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	IdHDB varchar(20),
	IdHang INT,
	SoLuong INT,
	DonGiaBan INT,
	KhuyenMai FLOAT,

	FOREIGN KEY (IdHDB) REFERENCES HoaDonBan(SoHD),
	FOREIGN KEY (IdHang) REFERENCES Hang(Id)
) 
GO


--insert
insert into DonViTinh values(N'Cái')
insert into DonViTinh values(N'Túi')
insert into DonViTinh values(N'Thùng')