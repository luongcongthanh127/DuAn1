create database FashionStores3;
go

use FashionStores3;
go

create table TaiKhoan (
    MaTK varchar(10) primary key,
    UserName varchar(20),
    PassWord varchar(20),
    VaiTro varchar(10),
    TrangThai bit
);
go

create table NhanVien (
    MaNV varchar(10) primary key,
    MaTK varchar(10) not null,
    HoTen nvarchar(50),
    GioiTinh bit,
    DiaChi nvarchar(100),
    SoDienThoai varchar(10),
    CCCD nvarchar(50),
    NgayVaoLam date,
    TrangThai bit,
    Anh varchar(MAX),
    foreign key(MaTK) references TaiKhoan(MaTK)
);
go

create table KhachHang (
    MaKH varchar(10) primary key,
    HoTen nvarchar(50),
    NgaySinh date,
    SoDienThoai varchar(10),
    Email varchar(100),
    GioiTinh bit,
    DiaChi nvarchar(100)
);
go

create table SuKien (
    MaSK varchar(10) primary key,
    TenSK nvarchar(50),
    HinhThuc bit,
    MucGiamGia varchar(100),
    ThoiGianBatDau date,
    ThoiGianKetThuc date,
    MoTa nvarchar(100),
    TrangThai bit,
    DieuKienApDung bit,
    DieuKienTongTien nvarchar(50)
);
go

create table HoaDon (
    MaHoaDon varchar(10) primary key,
    MaNV varchar(10) not null,
    MaKH varchar(10),
    NgayTao datetime,
    TongTien Money,
    TongTienKM Money,
    TongTienSauKM Money,
    TrangThai nvarchar(30),
    GhiChu nvarchar(100),
    MaSK varchar(10),
    foreign key(MaSK) references SuKien(MaSK),
    foreign key(MaNV) references NhanVien(MaNV),
    foreign key(MaKH) references KhachHang(MaKH)
);
go

create table LoaiSanPham (
    MaLSP varchar(10) primary key,
    TenLSP nvarchar(50),
    TrangThai bit,
    Mota nvarchar(100)
);
go

create table MauSac (
    MaMauSac varchar(10) primary key,
    TenMauSac nvarchar(50),
    TrangThai bit
);
go

create table ChatLieu (
    MaChatLieu varchar(10) primary key,
    TenChatLieu nvarchar(50),
    TrangThai bit
);
go

create table KichThuoc (
    MaKichThuoc varchar(10) primary key,
    TenKichThuoc nvarchar(50),
    TrangThai bit
);
go

create table SanPham (
    MaSanPham varchar(10) primary key,
    TenSanPham nvarchar(50),
    TrangThai bit,
    MaLSP varchar(10) not null,
    XuatXu nvarchar(50),
    MaMauSac varchar(10) not null,
    MaChatLieu varchar(10) not null,
    MaKichThuoc varchar(10) not null,
    SoLuong int,
    Gia money,
    qrCode varchar(50),
    foreign key(MaLSP) references LoaiSanPham(MaLSP),
    foreign key(MaMauSac) references MauSac(MaMauSac),
    foreign key(MaChatLieu) references ChatLieu(MaChatLieu),
    foreign key(MaKichThuoc) references KichThuoc(MaKichThuoc)
);
go

create table HoaDonChiTiet (
    MaHoaDonChiTiet varchar(20) primary key,
    MaSanPham varchar(10) not null,
    MaHoaDon varchar(10) not null,
    SoLuong int,
    DonGia money,
    GhiChu nvarchar(100),
    TrangThai bit,
    foreign key(MaSanPham) references SanPham(MaSanPham),
    foreign key(MaHoaDon) references HoaDon(MaHoaDon)
);
go

create table DoiHang (
    MaDoiHang varchar(10) primary key,
    MaNV varchar(10) not null,
    MaHoaDon varchar(10) not null,
    NgayDoiTra date,
    TrangThai nvarchar(30),
    foreign key(MaNV) references NhanVien(MaNV),
    foreign key(MaHoaDon) references HoaDon(MaHoaDon)
);
go

create table DoiHangChiTiet (
    MaDHCT varchar(10) primary key,
    MaSanPham varchar(10),
    MaDoiHang varchar(10) not null,
    MaHoaDonChiTiet varchar(20) not null,
    SoLuong int,
    MoTa nvarchar(500),
    TrangThai bit,
    foreign key(MaSanPham) references SanPham(MaSanPham),
    foreign key(MaDoiHang) references DoiHang(MaDoiHang),
    foreign key(MaHoaDonChiTiet) references HoaDonChiTiet(MaHoaDonChiTiet)
);
go
