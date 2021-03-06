USE [master]
GO
/****** Object:  Database [QuanLyBanGiay]    Script Date: 27/11/2019 2:30:49 PM ******/
CREATE DATABASE [QuanLyBanGiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanGiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyBanGiay.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyBanGiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyBanGiay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyBanGiay] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanGiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanGiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanGiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanGiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanGiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanGiay] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanGiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanGiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanGiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanGiay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyBanGiay]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 27/11/2019 2:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoDien_Anh]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDien_Anh](
	[Id] [int] NOT NULL,
	[Ten] [nvarchar](200) NULL,
	[Anh] [nvarchar](200) NULL,
 CONSTRAINT [PK_GiaoDien_Anh] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayLap] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiao] [bit] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [char](3) NULL,
	[DienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[MaNguoiDung] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhoHang]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoHang](
	[MaNhapKho] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_KhoHang] PRIMARY KEY CLUSTERED 
(
	[MaNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiBaiViet]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiBaiViet](
	[MaBaiViet] [varchar](10) NOT NULL,
	[TenBaiViet] [nvarchar](500) NULL,
 CONSTRAINT [PK_TheLoaiTin] PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_NguoiDung_1] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](150) NULL,
 CONSTRAINT [PK_PhanLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[Mau] [nvarchar](20) NULL,
	[Size] [int] NULL,
	[MaNCC] [nvarchar](10) NULL,
	[DanhGia] [float] NULL,
	[MoTa] [nvarchar](500) NULL,
	[Gia] [float] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[AnhBia] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [varchar](10) NOT NULL,
	[MaBaiViet] [varchar](10) NULL,
	[TieuDeTin] [nvarchar](100) NULL,
	[NoiDungTinRutGon] [ntext] NULL,
	[NoiDungTin] [ntext] NULL,
	[AnhTin] [varchar](50) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[cthd]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cthd]
as
select HoaDon.MaHD, TenSP, SoLuong, DonGia, TongTien
from ChiTietDonHang, HoaDon, SanPham
where ChiTietDonHang.MaHD = HoaDon.MaHD
and ChiTietDonHang.MaSP = SanPham.MaSP

GO
/****** Object:  View [dbo].[DonHang_KhachHang]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DonHang_KhachHang]
AS
SELECT dbo.HoaDon.MaHD, dbo.KhachHang.MaKH, dbo.KhachHang.TenKH, dbo.KhachHang.NgaySinh, dbo.KhachHang.GioiTinh, dbo.KhachHang.DienThoai, dbo.KhachHang.DiaChi, dbo.KhachHang.Email, dbo.KhachHang.MaNguoiDung, 
                  dbo.HoaDon.NgayLap, dbo.HoaDon.TongTien, dbo.HoaDon.TinhTrangGiao
FROM     dbo.HoaDon INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKH = dbo.KhachHang.MaKH


GO
/****** Object:  View [dbo].[kho]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[kho] 
as
select MaNhapKho, SanPham.MaSP, TenSP, SoLuong, NgayNhap
from SanPham, KhoHang
Where SanPham.MaSP = KhoHang.MaSP




GO
/****** Object:  View [dbo].[TTNguoiDung]    Script Date: 27/11/2019 2:30:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TTNguoiDung]
as
select NguoiDung.MaNguoiDung, TenDN, MatKhau, MaKH, TenKH, NgaySinh, GioiTinh, DienThoai, DiaChi, Email, LoaiNguoiDung.MaLoai, TenLoai
from KhachHang, NguoiDung, LoaiNguoiDung
where KhachHang.MaNguoiDung = NguoiDung.MaNguoiDung
and NguoiDung.Maloai = LoaiNguoiDung.MaLoai




GO
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (1, 21, 5, 5800000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (1, 24, 3, 3600000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (1, 26, 2, 5000000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (2, 19, 1, 4500000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (2, 21, 1, 5800000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (2, 26, 1, 5000000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (3, 22, 1, 5800000)
INSERT [dbo].[ChiTietDonHang] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (4, 21, 1, 5800000)
INSERT [dbo].[GiaoDien_Anh] ([Id], [Ten], [Anh]) VALUES (1, N'Main Banner', N'banner')
INSERT [dbo].[GiaoDien_Anh] ([Id], [Ten], [Anh]) VALUES (2, N'Banner Trai', N'banner')
INSERT [dbo].[GiaoDien_Anh] ([Id], [Ten], [Anh]) VALUES (3, N'Banner Phai', N'banner')
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [NgayGiao], [DaThanhToan], [TinhTrangGiao], [TongTien]) VALUES (1, 6, CAST(N'2019-11-26 22:52:24.000' AS DateTime), CAST(N'2019-11-29 00:00:00.000' AS DateTime), 1, 1, 12000000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [NgayGiao], [DaThanhToan], [TinhTrangGiao], [TongTien]) VALUES (2, 7, CAST(N'2019-11-26 22:58:30.000' AS DateTime), CAST(N'2019-11-28 00:00:00.000' AS DateTime), NULL, 0, 21000000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [NgayGiao], [DaThanhToan], [TinhTrangGiao], [TongTien]) VALUES (3, 8, CAST(N'2019-11-27 12:57:13.000' AS DateTime), CAST(N'2019-11-28 00:00:00.000' AS DateTime), 1, 1, 12000000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [NgayGiao], [DaThanhToan], [TinhTrangGiao], [TongTien]) VALUES (4, 6, CAST(N'2019-11-27 13:34:16.930' AS DateTime), CAST(N'2019-11-28 00:00:00.000' AS DateTime), 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (2, N'Nguyễn Thị Ngọc Thu', CAST(N'1998-11-06 00:00:00.000' AS DateTime), N'N? ', N'0123456789', N'nthu240@gmail.com', N'140 Lê Trọng Tấn', 3)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (3, N'Phạm Thị Bích Thuỳ', CAST(N'1999-07-04 00:00:00.000' AS DateTime), N'N? ', N'0123456987', N'thuylovei113@gmail.com', N'140 Lê Trọng Tấn', 4)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (4, N'Vương Trung Thuận', CAST(N'1999-07-04 00:00:00.000' AS DateTime), N'Nam', N'0123654789', N'trungthuan@gmail.com', N'140 Lê Trọng Tấn', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (6, N'Nguyễn Văn A', CAST(N'1999-01-01 00:00:00.000' AS DateTime), N'Nam', N'0126478992', N'a123@gmail.com', N'140 Lê Trọng Tấn', 7)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (7, N'Nguyễn Văn A', CAST(N'1999-01-01 00:00:00.000' AS DateTime), N'Nam', N'0126478992', N'a123@gmail.com', N'140 Lê Trọng Tấn', 8)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [MaNguoiDung]) VALUES (8, N'Nguyễn Thị C', CAST(N'2008-06-11 00:00:00.000' AS DateTime), N'N? ', N'0123456789', N'c@gmail.com', N'123123123', 9)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[KhoHang] ON 

INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (7, 1, 100, CAST(N'2019-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (8, 2, 100, CAST(N'2019-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (9, 3, 100, CAST(N'2019-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (12, 4, 100, CAST(N'2019-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (13, 5, 101, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (15, 6, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (16, 7, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (17, 8, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (18, 9, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (19, 10, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (20, 11, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (21, 12, 100, CAST(N'2019-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[KhoHang] ([MaNhapKho], [MaSP], [SoLuong], [NgayNhap]) VALUES (22, 17, 100, CAST(N'2019-02-21 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhoHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([Id], [DiaChi], [SDT], [Email]) VALUES (1, N'140 Lê Trọng Tấn, phường Tây Thạnh, quận Tân Phú, Tp.HCM', N'0123456789', N'nthu061199@gmail.com')
SET IDENTITY_INSERT [dbo].[LienHe] OFF
INSERT [dbo].[LoaiBaiViet] ([MaBaiViet], [TenBaiViet]) VALUES (N'BaiViet01 ', N'Thể thao')
INSERT [dbo].[LoaiBaiViet] ([MaBaiViet], [TenBaiViet]) VALUES (N'BaiViet02 ', N'Giày đá bóng')
INSERT [dbo].[LoaiBaiViet] ([MaBaiViet], [TenBaiViet]) VALUES (N'BaiViet03 ', N'Giày Sneaker')
INSERT [dbo].[LoaiBaiViet] ([MaBaiViet], [TenBaiViet]) VALUES (N'BaiViet04 ', N'Thời Trang')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (1, N'Admin')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'nthu240', N'nthu240', 3, 1)
INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'thuylovei113', N'thuylovei113', 4, 1)
INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'trungthuan', N'trungthuan', 5, 1)
INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'a123', N'a123', 7, 2)
INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'a1234', N'a1234', 8, 2)
INSERT [dbo].[NguoiDung] ([TenDN], [MatKhau], [MaNguoiDung], [MaLoai]) VALUES (N'c123', N'c123', 9, 2)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'A', N'Adidas', N'140 Lê Trọng Tấn', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'B', N'Biti''s', N' 140 Lê Trọng Tấn', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'Bo', N'Boom', N' 140 Lê Trọng Tấn', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'C', N'Converst', N' 140 Lê Trọng Tấn', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'N', N'Nike', N' 140 Lê Trọng Tấn', N'0123654789')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'P', N'Puma', N' 140 Lê Trọng Tấn', N'0123654789')
SET IDENTITY_INSERT [dbo].[PhanLoai] ON 

INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai]) VALUES (1, N'Giày Bata')
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai]) VALUES (2, N'Giày Đá Banh')
INSERT [dbo].[PhanLoai] ([MaLoai], [TenLoai]) VALUES (6, N'Giày Quai')
SET IDENTITY_INSERT [dbo].[PhanLoai] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (1, N'Convert_36', N'Trắng - Đen', 36, N'A', 5, N'gfhadjf', 1500000, N'Còn Hàng', N'Converse001.JPG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (2, N'Convert_37', N'Trắng-Đen', 37, N'A', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 750, N'Còn Hàng', N'Converse002.JPG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (3, N'Boom_37', N'Trắng', 37, N'A', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 750000, N'Còn Hàng', N'Boom001.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (4, N'Boom_38', N'Hồng', 38, N'A', 4.7, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 1800000, N'Còn Hàng', N'Boom002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (5, N'Bitis_39', N'Xanh - Đen', 39, N'B', 4.9, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 800000, N'Còn Hàng', N'Bitis001.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (6, N'Bitis_40', N'Xanh - Đen', 40, N'B', 4.6, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 650000, N'Còn Hàng', N'Bitis002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (7, N'Nike_39', N'Xanh Dương', 39, N'N', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 650000, N'Còn Hàng', N'Nike001.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (8, N'Nike_38', N'Đỏ', 38, N'N', 4.7, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 450000, N'Còn Hàng', N'Nike002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (9, N'Adidas_36', N'Trắng - Đen', 36, N'A', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 550000, N'Còn Hàng', N'Adidas001.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (10, N'Adidas_38', N'Trắng - Đen', 38, N'A', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 500000, N'Còn Hàng', N'Adidas002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (11, N'Puma_41', N'Trắng Đen', 41, N'P', 4.7, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 350000, N'Còn Hàng', N'Puma001.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (12, N'Puma_38', N'Đen', 38, N'P', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 400000, N'Còn Hàng', N'Puma002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (14, N'DaBanh_37_N', N'Trắng - Xanh Dương', 37, N'N', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 550000, N'Còn Hàng', N'Dabanh0010.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (15, N'DaBanh_37_P', N'Trắng - Xanh Lá', 37, N'A', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 450000, N'Còn Hàng', N'Dabanh0011.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (16, N'DaBanh_36_A', N'Đen', 36, N'A', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 450000, N'Còn Hàng', N'Dabanh0012.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (17, N'DaBanh_37_A', N'Trắng - Cam', 37, N'A', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 350000, N'Còn Hàng', N'Dabanh0013.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (18, N'Convert_36', N'Trắng - Đen', 36, N'A', 4.9, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 3000000, N'Còn Hàng', N'Converse005.JPG', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (19, N'Boom_37', N'Vàng Đen', 37, N'B', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 4500000, N'Còn Hàng', N'Boom005.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (20, N'Adidas_36', N'Xám Trắng', 36, N'A', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 4500000, N'Còn Hàng', N'Adidas008.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (21, N'Adidas_37', N'Trắng Đen', 37, N'A', 4.8, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 5800000, N'Còn Hàng', N'Adidas009.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (22, N'Bitis_36', N'Xanh Rêu', 36, N'B', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 5800000, N'Còn Hàng', N'Bitis002.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (23, N'Nike_36', N'Vàng Xanh', 36, N'N', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 3600000, N'Còn Hàng', N'Nike003.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (24, N'Nike_36', N'Xanh Dương', 36, N'N', 4.7, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 3600000, N'Còn Hàng', N'Nike004.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (25, N'Puma_36', N'Trắng ', 36, N'P', 4.6, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 3600000, N'Còn Hàng', N'Puma003.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Mau], [Size], [MaNCC], [DanhGia], [MoTa], [Gia], [TinhTrang], [AnhBia], [MaLoai]) VALUES (26, N'Nike_37', N'Trắng', 37, N'N', 5, N'Hàng đẹp như mô tả, Chất lượng tốt miễn chê...', 5000000, N'Còn Hàng', N'Nike007.jpg', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[TinTuc] ([MaTin], [MaBaiViet], [TieuDeTin], [NoiDungTinRutGon], [NoiDungTin], [AnhTin]) VALUES (N'Tin001    ', N'BaiViet01 ', N'SNEAKER LÀ GÌ?', N'Sneaker hay giày sneaker là một tên gọi khác của “giày thể thao” ...', N'Sneaker hay giày sneaker là một tên gọi khác của “giày thể thao” dùng để chỉ các loại giày phục vụ cho vận động thể thao. Tuy nhiên, hiện nay sneaker thường được dùng để chỉ những đôi giày thể thao được mang cho hoạt động hằng ngày. Sneakers luôn là sự lựa chọn hoàn hảo cho những ai yêu thích sự thoải mái, trẻ trung, năng động mà nó mang lại. Có lẽ vì vậy mà có những đôi giày sneaker đã ra đời từ rất lâu nhưng nay vẫn luôn chiếm một vị trí “ưu tiên” trong tủ giày của nhiều bạn trẻ. Sneakers và phong cách streetstyle được tôn sùng như một “cặp đôi hoàn hảo” trong giới fashionista trẻ. Những đôi giày Sneakers mang đến cảm giác bình dân (casual), ít trang trọng (informal) nên hầu như có thể xuất hiện trong các dịp khác nhau như một tổng thể trong bộ trang phục của các bạn trẻ, đặc biệt ở độ tuổi 18 đến dưới 30.

Một số thương hiệu giày sneaker nổi tiếng trên thế giới như: Nike, Adidas, New Balance, Puma', N'0001.jpg')
INSERT [dbo].[TinTuc] ([MaTin], [MaBaiViet], [TieuDeTin], [NoiDungTinRutGon], [NoiDungTin], [AnhTin]) VALUES (N'Tin002    ', N'BaiViet02 ', N'CÁCH ĐO SIZE GIÀY', N'Với những dụng cụ đơn giản có sẵn ngay tại nhà: bút chì, tờ giấy...', N'Với những dụng cụ đơn giản có sẵn ngay tại nhà: bút chì, tờ giấy và thước đo bạn có thể áp dụng hướng dẫn dưới đây để tự tìm được size giày của mình một cách dễ dàng.

Chuẩn bị: 1 tờ giấy trắng lớn, phải to hơn bàn chân bạn, 1 cây bút chì, 1 cây thước đo.', N'0002.jpg')
INSERT [dbo].[TinTuc] ([MaTin], [MaBaiViet], [TieuDeTin], [NoiDungTinRutGon], [NoiDungTin], [AnhTin]) VALUES (N'Tin003    ', N'BaiViet03 ', N'CHỌN SIZE', N'Tốt nhất bạn nên đo size giày vào cuối ngày vì lúc này...', N'Tốt nhất bạn nên đo size giày vào cuối ngày vì lúc này đôi chân bạn đã giãn nở ở mức tối đa.
Bạn nên đo cả 2 chân, nếu có sai số giữa 2 bàn chân thì hãy chọn đôi giày có cỡ bằng với chân lớn hơn của bạn.
Nếu bạn là người thích mang giày hơi rộng để thoải mái. Hãy cộng thêm vào 1cm – 1.5cm khi đo chiều dài chân.
Nếu chân bạn mập, dày và có bề ngang rộng thì bạn chọn size theo hướng dẫn bên trên cộng thêm 1 đến 1.5 size.
 *Lưu ý:
Người Việt Nam hay dùng size US và EU
UK là United Kingdom hay vương quốc Anh
US là United State, tức là Mĩ
EU là the European Union: Liên minh châu Âu
Xin lưu ý rằng bảng chuyển đổi size giày trên đây là chỉ số tương đối dựa trên kích thước lý tưởng, mỗi thương hiệu đều có một kích thước size riêng biệt. Do đó, size của bạn có thể thay đổi tùy từng thương hiệu (ví dụ: size giày nike của bạn là 40, nhưng size giày adidas của bạn có thể là 40.5 hoặc 39). SaigonSneaker không tuyên bố bảng size giày này là chính xác 100% cho tất cả thương hiệu giày.

Mục đích đưa ra bảng size này là nhằm giúp bạn có thông tin để tham khảo và xem xét size tương đối cho mình. Bạn có thể chật hơn hoặc rộng hơn khi áp dụng bảng size này vào việc chọn size khi mua giày. Nếu bạn cảm thấy không chắc mình nên chọn size nào khi đặt hàng, đừng ngại liên hệ trực tiếp với nhân viên của chúng tôi. SaigonSneaker sẽ làm hết sức để giúp bạn tìm được size giày phù hợp nhất.', N'0003.jpg')
INSERT [dbo].[TinTuc] ([MaTin], [MaBaiViet], [TieuDeTin], [NoiDungTinRutGon], [NoiDungTin], [AnhTin]) VALUES (N'Tin004', N'BaiViet04', N'15+ MẪU GIÀY HOT', N'Chỉ những đôi giày “sống sót” qua nhiều chu kỳ phong cách...', N'Bạn đang tìm những mẫu giày thể thao nữ đẹp và hot nhất mọi thời đại? Những đôi giày nào khiến nàng mê đắm bất chấp thời gian? Để trả lời cho những câu hỏi này chúng ta cần phải xem xét thật kỹ lưỡng.

Chỉ những đôi giày “sống sót” qua nhiều chu kỳ phong cách, hoặc đã được bán hết trong vài giây ngay khi chúng được tung ra mới được coi là hot và phổ biến nhất.

Hầu hết các chị em chúng ta đều dành tình yêu cho giày một cách mãnh liệt (giống như cách các nàng yêu thương và chiều chuộng quần áo hay túi xách).

Chính vì vậy, bài viết này quyết định đi sâu vào thế giới “điên cuồng” của giày thể thao nữ để tìm ra những đôi giày tốt nhất qua mọi thời đại.

Nếu bạn đang băn khoăn lựa chọn cho mình một đôi giày ưng ý nhất, thì đừng bỏ qua chủ đề này nha.

Danh sách giày dưới đây được SaigonSneaker.com liên tục theo dõi và cập nhật. Chính vì vậy, nó sẽ bao gồm cả những mẫu mới nhất xứng đáng được lọt vào danh sách này.', N'0004.jpg')
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_NguoiDung]
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD  CONSTRAINT [FK_KhoHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[KhoHang] CHECK CONSTRAINT [FK_KhoHang_SanPham]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_LoaiNguoiDung] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiNguoiDung] ([MaLoai])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_LoaiNguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[PhanLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoai]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_LoaiBaiViet] FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[LoaiBaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_LoaiBaiViet]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DonHang_KhachHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DonHang_KhachHang'
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanGiay] SET  READ_WRITE 
GO
