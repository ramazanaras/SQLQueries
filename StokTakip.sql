USE [master]
GO
/****** Object:  Database [StokTakip]    Script Date: 16.10.2016 16:39:07 ******/
CREATE DATABASE [StokTakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StokTakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StokTakip.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StokTakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StokTakip_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StokTakip] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StokTakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StokTakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StokTakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StokTakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [StokTakip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StokTakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StokTakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StokTakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StokTakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StokTakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StokTakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StokTakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StokTakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StokTakip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StokTakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StokTakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StokTakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StokTakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StokTakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StokTakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StokTakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StokTakip] SET RECOVERY FULL 
GO
ALTER DATABASE [StokTakip] SET  MULTI_USER 
GO
ALTER DATABASE [StokTakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StokTakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StokTakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StokTakip] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StokTakip] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StokTakip', N'ON'
GO
USE [StokTakip]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[ManagerID] [int] NOT NULL,
	[TownID] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[EmailAddress] [varchar](30) NOT NULL,
	[RecordStatusID] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[TownID] [int] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[MobilePhone] [varchar](20) NOT NULL,
	[EmailAddress] [varchar](30) NOT NULL,
	[Balance] [money] NOT NULL,
	[RecordStatusID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[BirthPlaceID] [int] NOT NULL,
	[HireDate] [datetime] NOT NULL,
	[BranchID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[TownID] [int] NOT NULL,
	[MobilePhone] [varchar](20) NOT NULL,
	[EmailAddress] [varchar](30) NOT NULL,
	[RecordStatusID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShipVia] [int] NOT NULL,
	[Freight] [money] NOT NULL,
	[ShipTown] [int] NOT NULL,
	[ShipCity] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [smallint] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecordStatuses]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordStatuses](
	[RecordStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RecordStatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RecordStatuses] PRIMARY KEY CLUSTERED 
(
	[RecordStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownID] [int] NOT NULL,
	[TownName] [nvarchar](100) NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (3, N'B bayisi', 1, 1101, N'gümüşpala caddesi Rızabey Sokak No:50', N'053698745216', N'bbayisi@hotmail.com', 1, CAST(N'1993-01-01' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (4, N'A bayisi', 2, 1104, N'gümüşpala caddesi Rızabey Sokak', N'053698745216', N'abayisi@hotmail.com', 2, CAST(N'1992-01-01' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (5, N'A bayisi', 3, 1101, N'gümüşpala caddesi Rızabey Sokak', N'053698745216', N'abayisi@hotmail.com', 1, CAST(N'1992-05-10' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (6, N'A bayisi', 1, 1101, N'gümüşpala caddesi Rızabey Sokak', N'053698745216', N'abayisi@hotmail.com', 1, CAST(N'2016-10-15' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (7, N'A bayisi', 1, 1101, N'gümüşpala caddesi Rızabey Sokak', N'053698745216', N'abayisi@hotmail.com', 1, CAST(N'2016-10-15' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (8, N'C Şubesiii', 1, 1183, N'güzelyurt caddesi', N'234234', N'csubesi@hotmail.com', 2, CAST(N'2016-10-15' AS Date))
INSERT [dbo].[Branches] ([BranchID], [BranchName], [ManagerID], [TownID], [Address], [Phone], [EmailAddress], [RecordStatusID], [CreateDate]) VALUES (9, N'A bayisi', 1, 1101, N'gümüşpala caddesi Rızabey Sokak', N'053698745216', N'abayisi@hotmail.com', 1, CAST(N'2016-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[Branches] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Meyve', N'karpuz,üzüm vs ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Sebze', N'domates,patlıcan vs ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Meyve', N'karpuz,üzüm vs ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Mobilya', N'koltuk,baza')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Bilgisayar', N'laptop,masaüstü vs')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Sebze', N'domates,patlıcan vs ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'Adana')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'Adıyaman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'Afyon')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (4, N'Ağrı')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (5, N'Amasya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (6, N'Ankara')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (7, N'Antalya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (8, N'Artvin')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (9, N'Aydın')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (10, N'Balıkesir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (11, N'Bilecik')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (12, N'Bingöl')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (13, N'Bitlis')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (14, N'Bolu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (15, N'Burdur')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (16, N'Bursa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (17, N'Çanakkale')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (18, N'Çankırı')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (19, N'Çorum')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (20, N'Denizli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (21, N'Diyarbakır')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (22, N'Edirne')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (23, N'Elazığ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (24, N'Erzincan')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (25, N'Erzurum')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (26, N'Eskişehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (27, N'Gaziantep')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (28, N'Giresun')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (29, N'Gümüşhane')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (30, N'Hakkari')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (31, N'Hatay')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (32, N'Isparta')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (33, N'İçel')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (34, N'İstanbul')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (35, N'İzmir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (36, N'Kars')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (37, N'Kastamonu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (38, N'Kayseri')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (39, N'Kırklareli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (40, N'Kırşehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (41, N'Kocaeli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (42, N'Konya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (43, N'Kütahya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (44, N'Malatya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (45, N'Manisa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (46, N'Kahramanmaraş')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (47, N'Mardin')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (48, N'Muğla')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (49, N'Muş')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (50, N'Nevşehir')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (51, N'Niğde')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (52, N'Ordu')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (53, N'Rize')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (54, N'Sakarya')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (55, N'Samsun')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (56, N'Siirt')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (57, N'Sinop')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (58, N'Sivas')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (59, N'Tekirdağ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (60, N'Tokat')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (61, N'Trabzon')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (62, N'Tunceli')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (63, N'Şanlıurfa')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (64, N'Uşak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (65, N'Van')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (66, N'Yozgat')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (67, N'Zonguldak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (68, N'Aksaray')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (69, N'Bayburt')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (70, N'Karaman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (71, N'Kırıkkale')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (72, N'Batman')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (73, N'Şırnak')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (74, N'Bartın')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (75, N'Ardahan')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (76, N'Iğdır')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (77, N'Yalova')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (78, N'Karabük')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (79, N'Kilis')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (80, N'Osmaniye')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (81, N'Düzce')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (999, N'Yurt Dışı')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (1, N'Fatih', N'Yılmaz ', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, N'ali rıza caddesi', N'213', N'ali@hotmail.com', 357.0000, 1, CAST(N'2016-10-15 19:16:05.267' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (2, N'Ramazan', N'Aras', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, N'ali rıza caddesi', N'213', N'ali@hotmail.com', 285.0000, 1, CAST(N'2016-10-15 18:55:32.670' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (3, N'Enes', N'Aksu', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, N'ali rıza caddesi', N'213', N'ali@hotmail.com', 400.0000, 1, CAST(N'2016-10-15 18:55:49.690' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (4, N'Kadir ', N'Yazıcı', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, N'ali rıza caddesi', N'213', N'ali@hotmail.com', 400.0000, 1, CAST(N'2016-10-15 19:16:05.237' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (5, N'Mehmettt', N'Yıldırımmm', CAST(N'2016-10-15 23:12:11.167' AS DateTime), 1103, N'yenimahalle', N'12313', N'mehmet@hotmail.com', 15.0000, 2, CAST(N'2016-10-15 23:12:52.393' AS DateTime))
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [BirthDate], [TownID], [Address], [MobilePhone], [EmailAddress], [Balance], [RecordStatusID], [CreateDate]) VALUES (6, N'Fatih', N'Yılmaz ', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, N'ali rıza caddesi', N'213', N'ali@hotmail.com', 400.0000, 1, CAST(N'2016-10-16 03:09:02.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [BirthPlaceID], [HireDate], [BranchID], [Title], [Address], [TownID], [MobilePhone], [EmailAddress], [RecordStatusID], [CreateDate], [UserName], [Password]) VALUES (1, N'Hasan', N'Yılmaz ', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, CAST(N'1996-02-02 00:00:00.000' AS DateTime), 3, N'satış pazarlama', N'ali rıza caddesi', 1101, N'213', N'ali@hotmail.com', 1, CAST(N'2016-10-16 03:09:02.667' AS DateTime), N'fatih.yilmaz', N'1234')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [BirthPlaceID], [HireDate], [BranchID], [Title], [Address], [TownID], [MobilePhone], [EmailAddress], [RecordStatusID], [CreateDate], [UserName], [Password]) VALUES (2, N'Ali', N'Korkmaz', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, CAST(N'1996-02-02 00:00:00.000' AS DateTime), 3, N'satış pazarlama', N'ali rıza caddesi', 1101, N'213', N'ali@hotmail.com', 1, CAST(N'2016-10-15 19:05:25.280' AS DateTime), N'ali.korkmaz', N'123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [BirthPlaceID], [HireDate], [BranchID], [Title], [Address], [TownID], [MobilePhone], [EmailAddress], [RecordStatusID], [CreateDate], [UserName], [Password]) VALUES (3, N'Fatih', N'Han', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, CAST(N'1996-02-02 00:00:00.000' AS DateTime), 3, N'satış pazarlama', N'ali rıza caddesi', 1101, N'213', N'ali@hotmail.com', 1, CAST(N'2016-10-15 19:16:13.257' AS DateTime), N'fatih.han', N'123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [BirthPlaceID], [HireDate], [BranchID], [Title], [Address], [TownID], [MobilePhone], [EmailAddress], [RecordStatusID], [CreateDate], [UserName], [Password]) VALUES (4, N'Melihhh', N'Altınnn', CAST(N'2016-10-15 23:47:52.183' AS DateTime), 1104, CAST(N'2010-10-15 23:47:52.000' AS DateTime), 5, N'Satış Pazarlamacııı', N'topkapı', 1104, N'234234', N'melih@hotmail.com', 2, CAST(N'2016-10-15 23:59:46.400' AS DateTime), N'melih.altin', N'123')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [BirthPlaceID], [HireDate], [BranchID], [Title], [Address], [TownID], [MobilePhone], [EmailAddress], [RecordStatusID], [CreateDate], [UserName], [Password]) VALUES (5, N'Fatih', N'Yılmaz ', CAST(N'1995-01-02 00:00:00.000' AS DateTime), 1101, CAST(N'1996-02-02 00:00:00.000' AS DateTime), 3, N'satış pazarlama', N'ali rıza caddesi', 1101, N'213', N'ali@hotmail.com', 1, CAST(N'2016-10-16 03:09:02.663' AS DateTime), N'fatih.yilmaz', N'1234')
SET IDENTITY_INSERT [dbo].[Employees] OFF
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 1, 18.0000, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 3, 15.0000, 7)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 5, 21.0000, 9)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 1, 11.0000, 10)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 3, 20.0000, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 6, 14.0000, 7)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 7, 4.0000, 8)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 5, 10.0000, 50)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 7, 15.0000, 26)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 1, 18.0000, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 3, 15.0000, 7)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 5, 21.0000, 9)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (6, 1, 3.0000, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (6, 3, 5.0000, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (7, 1, 5.0000, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (7, 3, 5.0000, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (7, 5, 10.0000, 6)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (2, 1, 1, CAST(N'2016-10-15 20:05:55.653' AS DateTime), 1, 30.0000, 1101, 37)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (3, 2, 4, CAST(N'2016-10-16 01:40:13.557' AS DateTime), 3, 29.0000, 2003, 34)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (4, 4, 3, CAST(N'2016-10-16 03:04:44.043' AS DateTime), 2, 75.0000, 1193, 12)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (5, 1, 1, CAST(N'2016-10-16 03:09:02.690' AS DateTime), 1, 30.0000, 1101, 37)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (6, 1, 4, CAST(N'2016-10-16 16:31:02.560' AS DateTime), 1, 3.0000, 1104, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipTown], [ShipCity]) VALUES (7, 2, 4, CAST(N'2016-10-16 16:35:17.880' AS DateTime), 1, 3.0000, 1104, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (1, N'Armut', 1, 1, 10.0000, 15)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (3, N'Elma', 2, 1, 12.0000, 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (5, N'Havuççç', 1, 1, 14.0000, 32)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (6, N'Muz', 1, 3, 17.0000, 26)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (7, N'Şeftaliii', 1, 4, 11.0000, 13)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (8, N'Elma', 1, 1, 10.0000, 15)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RecordStatuses] ON 

INSERT [dbo].[RecordStatuses] ([RecordStatusID], [RecordStatusName]) VALUES (1, N'Aktif')
INSERT [dbo].[RecordStatuses] ([RecordStatusID], [RecordStatusName]) VALUES (2, N'Pasif')
SET IDENTITY_INSERT [dbo].[RecordStatuses] OFF
SET IDENTITY_INSERT [dbo].[Shippers] ON 

INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (1, N'Yurtiçi Kargo', N'333333')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (2, N'MNG Kargo', N'5555')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (3, N'Aras Kargooo', N'77779')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone]) VALUES (4, N'MNG Kargo', N'654655')
SET IDENTITY_INSERT [dbo].[Shippers] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [CityID], [Phone]) VALUES (1, N'A Gıda Şirketi', N'kadıköy', 34, N'123')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [CityID], [Phone]) VALUES (2, N'B Tedarikçisi', N'gülseren sokak', 34, N'654655')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [CityID], [Phone]) VALUES (3, N'F Tedarikçisi', N'gümüşpala mahallesi', 9, N'12321')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [CityID], [Phone]) VALUES (4, N'K  Tedarikçisii', N'gülseren sokakkkk', 64, N'222')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [CityID], [Phone]) VALUES (5, N'A Tedarikçisi', N'rızabey sokak', 34, N'654655')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1101, N'Abana', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1102, N'Acıpayam', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1103, N'Adalar', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1104, N'Seyhan', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1105, N'Adıyaman Merkez', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1106, N'Adilcevaz', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1107, N'Afşin', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1108, N'Afyonkarahisar Merkez', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1109, N'Ağlasun', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1110, N'Ağın', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1111, N'Ağrı Merkez', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1112, N'Ahlat', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1113, N'Akçaabat', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1114, N'Akçadağ', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1115, N'Akçakale', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1116, N'Akçakoca', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1117, N'Akdağmadeni', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1118, N'Akhisar', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1119, N'Akkuş', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1120, N'Aksaray Merkez', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1121, N'Akseki', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1122, N'Akşehir', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1123, N'Akyazı', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1124, N'Alaca', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1125, N'Alaçam', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1126, N'Alanya', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1127, N'Alaşehir', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1128, N'Aliağa', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1129, N'Almus', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1130, N'Altındağ', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1131, N'Altınözü', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1132, N'Altıntaş', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1133, N'Alucra', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1134, N'Amasya Merkez', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1135, N'Anamur', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1136, N'Andırın', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1139, N'Araban', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1140, N'Araç', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1141, N'Araklı', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1142, N'Aralık', 76)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1143, N'Arapgir', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1144, N'Ardahan Merkez', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1145, N'Ardanuç', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1146, N'Ardeşen', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1147, N'Arhavi', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1148, N'Arguvan', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1149, N'Arpaçay', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1150, N'Arsin', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1151, N'Artova', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1152, N'Artvin Merkez', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1153, N'Aşkale', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1154, N'Atabey', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1155, N'Avanos', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1156, N'Ayancık', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1157, N'Ayaş', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1158, N'Aybastı', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1160, N'Ayvacık / Çanakkale', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1161, N'Ayvalık', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1162, N'Azdavay', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1163, N'Babaeski', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1164, N'Bafra', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1165, N'Bahçe', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1166, N'Bakırköy', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1167, N'Bala', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1169, N'Balya', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1170, N'Banaz', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1171, N'Bandırma', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1172, N'Bartın Merkez', 74)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1173, N'Baskil', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1174, N'Batman Merkez', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1175, N'Başkale', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1176, N'Bayburt Merkez', 69)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1177, N'Bayat / Çorum', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1178, N'Bayındır', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1179, N'Baykan', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1180, N'Bayramiç', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1181, N'Bergama', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1182, N'Besni', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1183, N'Beşiktaş', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1184, N'Beşiri', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1185, N'Beykoz', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1186, N'Beyoğlu', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1187, N'Beypazarı', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1188, N'Beyşehir', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1189, N'Beytüşşebap', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1190, N'Biga', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1191, N'Bigadiç', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1192, N'Bilecik Merkez', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1193, N'Bingöl Merkez', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1194, N'Birecik', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1195, N'Bismil', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1196, N'Bitlis Merkez', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1197, N'Bodrum', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1198, N'Boğazlıyan', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1199, N'Bolu Merkez', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1200, N'Bolvadin', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1201, N'Bor', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1202, N'Borçka', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1203, N'Bornova', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1204, N'Boyabat', 57)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1205, N'Bozcaada', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1206, N'Bozdoğan', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1207, N'Bozkır', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1208, N'Bozkurt / Kastamonu', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1209, N'Bozova', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1210, N'Bozüyük', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1211, N'Bucak', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1212, N'Bulancak', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1213, N'Bulanık', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1214, N'Buldan', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1215, N'Burdur Merkez', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1216, N'Burhaniye', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1218, N'Bünyan', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1219, N'Ceyhan', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1220, N'Ceylanpınar', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1221, N'Cide', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1222, N'Cihanbeyli', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1223, N'Cizre', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1224, N'Çal', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1225, N'Çamardı', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1226, N'Çameli', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1227, N'Çamlıdere', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1228, N'Çamlıhemşin', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1229, N'Çan', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1230, N'Çanakkale Merkez', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1231, N'Çankaya', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1232, N'Çankırı Merkez', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1233, N'Çardak', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1234, N'Çarşamba', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1235, N'Çat', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1236, N'Çatak', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1237, N'Çatalca', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1238, N'Çatalzeytin', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1239, N'Çay', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1240, N'Çaycuma', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1241, N'Çayeli', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1242, N'Çayıralan', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1243, N'Çayırlı', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1244, N'Çaykara', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1245, N'Çekerek', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1246, N'Çelikhan', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1247, N'Çemişgezek', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1248, N'Çerkeş', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1249, N'Çermik', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1250, N'Çerkezköy', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1251, N'Çeşme', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1252, N'Çıldır', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1253, N'Çınar', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1254, N'Çiçekdağı', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1255, N'Çifteler', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1256, N'Çine', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1257, N'Çivril', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1258, N'Çorlu', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1259, N'Çorum Merkez', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1260, N'Çubuk', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1261, N'Çukurca', 30)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1262, N'Çumra', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1263, N'Çüngüş', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1264, N'Daday', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1265, N'Darende', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1266, N'Datça', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1267, N'Dazkırı', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1268, N'Delice', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1269, N'Demirci', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1270, N'Demirköy', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1272, N'Dereli', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1273, N'Derik', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1274, N'Derinkuyu', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1275, N'Develi', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1276, N'Devrek', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1277, N'Devrekani', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1278, N'Dicle', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1279, N'Digor', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1280, N'Dikili', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1281, N'Dinar', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1282, N'Divriği', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1283, N'Diyadin', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1285, N'Doğanhisar', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1286, N'Doğanşehir', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1287, N'Doğubayazıt', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1288, N'Domaniç', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1289, N'Dörtyol', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1290, N'Durağan', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1291, N'Dursunbey', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1292, N'Düzce Merkez', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1293, N'Eceabat', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1294, N'Edremit / Balıkesir', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1295, N'Edirne Merkez', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1296, N'Eflani', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1297, N'Eğirdir', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1298, N'Elazığ Merkez', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1299, N'Elbistan', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1300, N'Eldivan', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1301, N'Eleşkirt', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1302, N'Elmadağ', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1303, N'Elmalı', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1304, N'Emet', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1306, N'Emirdağ', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1307, N'Enez', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1308, N'Erbaa', 60)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1309, N'Erciş', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1310, N'Erdek', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1311, N'Erdemli', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1312, N'Ereğli / Konya', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1313, N'Ereğli / Zonguldak', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1314, N'Erfelek', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1315, N'Ergani', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1316, N'Ermenek', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1317, N'Eruh', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1318, N'Erzincan Merkez', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1320, N'Espiye', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1321, N'Eskipazar', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1323, N'Eşme', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1324, N'Eynesil', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1325, N'Eyüp', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1326, N'Ezine', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1327, N'Fatih', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1328, N'Fatsa', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1329, N'Feke', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1330, N'Felahiye', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1331, N'Fethiye', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1332, N'Fındıklı', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1333, N'Finike', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1334, N'Foça', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1336, N'Gaziosmanpaşa', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1337, N'Gazipaşa', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1338, N'Gebze', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1339, N'Gediz', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1340, N'Gelibolu', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1341, N'Gelendost', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1342, N'Gemerek', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1343, N'Gemlik', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1344, N'Genç', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1345, N'Gercüş', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1346, N'Gerede', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1347, N'Gerger', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1348, N'Germencik', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1349, N'Gerze', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1350, N'Gevaş', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1351, N'Geyve', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1352, N'Giresun Merkez', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1353, N'Göksun', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1354, N'Gölbaşı / Adıyaman', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1355, N'Gölcük', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1356, N'Göle', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1357, N'Gölhisar', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1358, N'Gölköy', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1359, N'Gölpazarı', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1360, N'Gönen / Balıkesir', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1361, N'Görele', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1362, N'Gördes', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1363, N'Göynücek', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1364, N'Göynük', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1365, N'Güdül', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1366, N'Gülnar', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1367, N'Gülşehir', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1368, N'Gümüşhacıköy', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1369, N'Gümüşhane Merkez', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1370, N'Gündoğmuş', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1371, N'Güney', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1372, N'Gürpınar', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1373, N'Gürün', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1374, N'Hacıbektaş', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1375, N'Hadim', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1376, N'Hafik', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1377, N'Hakkari Merkez', 30)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1378, N'Halfeti', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1379, N'Hamur', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1380, N'Hanak', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1381, N'Hani', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1382, N'Hassa', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1384, N'Havran', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1385, N'Havsa', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1386, N'Havza', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1387, N'Haymana', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1388, N'Hayrabolu', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1389, N'Hazro', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1390, N'Hekimhan', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1391, N'Hendek', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1392, N'Hınıs', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1393, N'Hilvan', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1394, N'Hizan', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1395, N'Hopa', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1396, N'Horasan', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1397, N'Hozat', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1398, N'Iğdır Merkez', 76)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1399, N'Ilgaz', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1400, N'Ilgın', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1401, N'Isparta Merkez', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1403, N'İdil', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1404, N'İhsaniye', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1405, N'İkizdere', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1406, N'İliç', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1407, N'İmranlı', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1408, N'Gökçeada', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1409, N'İncesu', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1410, N'İnebolu', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1411, N'İnegöl', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1412, N'İpsala', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1413, N'İskenderun', 31)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1414, N'İskilip', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1415, N'İslahiye', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1416, N'İspir', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1418, N'İvrindi', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1420, N'İznik', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1421, N'Kadıköy', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1422, N'Kadınhanı', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1423, N'Kadirli', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1424, N'Kağızman', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1425, N'Kahta', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1426, N'Kale / Denizli', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1427, N'Kalecik', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1428, N'Kalkandere', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1429, N'Kaman', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1430, N'Kandıra', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1431, N'Kangal', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1432, N'Karaburun', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1433, N'Karabük Merkez', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1434, N'Karacabey', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1435, N'Karacasu', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1436, N'Karahallı', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1437, N'Karaisalı', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1438, N'Karakoçan', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1439, N'Karaman Merkez', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1440, N'Karamürsel', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1441, N'Karapınar', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1442, N'Karasu', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1443, N'Karataş', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1444, N'Karayazı', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1445, N'Kargı', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1446, N'Karlıova', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1447, N'Kars Merkez', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1448, N'Karşıyaka', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1449, N'Kartal', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1450, N'Kastamonu Merkez', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1451, N'Kaş', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1452, N'Kavak', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1453, N'Kaynarca', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1455, N'Keban', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1456, N'Keçiborlu', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1457, N'Keles', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1458, N'Kelkit', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1459, N'Kemah', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1460, N'Kemaliye', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1461, N'Kemalpaşa', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1462, N'Kepsut', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1463, N'Keskin', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1464, N'Keşan', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1465, N'Keşap', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1466, N'Kıbrıscık', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1467, N'Kınık', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1468, N'Kırıkhan', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1469, N'Kırıkkale Merkez', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1470, N'Kırkağaç', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1471, N'Kırklareli Merkez', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1472, N'Kırşehir Merkez', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1473, N'Kızılcahamam', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1474, N'Kızıltepe', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1475, N'Kiğı', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1476, N'Kilis Merkez', 79)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1477, N'Kiraz', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1479, N'Koçarlı', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1480, N'Kofçaz', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1482, N'Korgan', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1483, N'Korkuteli', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1484, N'Koyulhisar', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1485, N'Kozaklı', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1486, N'Kozan', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1487, N'Kozluk', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1488, N'Köyceğiz', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1489, N'Kula', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1490, N'Kulp', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1491, N'Kulu', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1492, N'Kumluca', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1493, N'Kumru', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1494, N'Kurşunlu', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1495, N'Kurtalan', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1496, N'Kurucaşile', 74)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1497, N'Kuşadası', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1498, N'Kuyucak', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1499, N'Küre', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1500, N'Kütahya Merkez', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1501, N'Ladik', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1502, N'Lalapaşa', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1503, N'Lapseki', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1504, N'Lice', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1505, N'Lüleburgaz', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1506, N'Maden', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1507, N'Maçka', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1508, N'Mahmudiye', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1510, N'Malazgirt', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1511, N'Malkara', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1512, N'Manavgat', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1514, N'Manyas', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1517, N'Marmaris', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1518, N'Mazgirt', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1519, N'Mazıdağı', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1520, N'Mecitözü', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1521, N'Menemen', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1522, N'Mengen', 14)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1523, N'Meriç', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1524, N'Merzifon', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1525, N'Mesudiye', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1526, N'Midyat', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1527, N'Mihalıççık', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1528, N'Milas', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1529, N'Mucur', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1530, N'Mudanya', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1531, N'Mudurnu', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1533, N'Muradiye', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1534, N'Muş Merkez', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1535, N'Mustafakemalpaşa', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1536, N'Mut', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1537, N'Mutki', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1538, N'Muratlı', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1539, N'Nallıhan', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1540, N'Narman', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1541, N'Nazımiye', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1542, N'Nazilli', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1543, N'Nevşehir Merkez', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1544, N'Niğde Merkez', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1545, N'Niksar', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1546, N'Nizip', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1547, N'Nusaybin', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1548, N'Of', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1549, N'Oğuzeli', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1550, N'Oltu', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1551, N'Olur', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1553, N'Orhaneli', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1554, N'Orhangazi', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1555, N'Orta', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1556, N'Ortaköy / Çorum', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1557, N'Ortaköy / Aksaray', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1558, N'Osmancık', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1559, N'Osmaneli', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1560, N'Osmaniye Merkez', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1561, N'Ovacık / Karabük', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1562, N'Ovacık / Tunceli', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1563, N'Ödemiş', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1564, N'Ömerli', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1565, N'Özalp', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1566, N'Palu', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1567, N'Pasinler', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1568, N'Patnos', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1569, N'Pazar / Rize', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1570, N'Pazarcık', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1571, N'Pazaryeri', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1572, N'Pehlivanköy', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1573, N'Perşembe', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1574, N'Pertek', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1575, N'Pervari', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1576, N'Pınarbaşı / Kayseri', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1577, N'Pınarhisar', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1578, N'Polatlı', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1579, N'Posof', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1580, N'Pozantı', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1581, N'Pülümür', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1582, N'Pütürge', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1583, N'Refahiye', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1584, N'Reşadiye', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1585, N'Reyhanlı', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1586, N'Rize Merkez', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1587, N'Safranbolu', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1588, N'Saimbeyli', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1590, N'Salihli', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1591, N'Samandağ', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1592, N'Samsat', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1594, N'Sandıklı', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1595, N'Sapanca', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1596, N'Saray / Tekirdağ', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1597, N'Sarayköy', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1598, N'Sarayönü', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1599, N'Sarıcakaya', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1600, N'Sarıgöl', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1601, N'Sarıkamış', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1602, N'Sarıkaya', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1603, N'Sarıoğlan', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1604, N'Sarıyer', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1605, N'Sarız', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1606, N'Saruhanlı', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1607, N'Sason', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1608, N'Savaştepe', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1609, N'Savur', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1610, N'Seben', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1611, N'Seferihisar', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1612, N'Selçuk', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1613, N'Selendi', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1614, N'Selim', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1615, N'Senirkent', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1616, N'Serik', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1617, N'Seydişehir', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1618, N'Seyitgazi', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1619, N'Sındırgı', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1620, N'Siirt Merkez', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1621, N'Silifke', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1622, N'Silivri', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1623, N'Silopi', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1624, N'Silvan', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1625, N'Simav', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1626, N'Sinanpaşa', 3)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1627, N'Sinop Merkez', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1628, N'Sivas Merkez', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1629, N'Sivaslı', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1630, N'Siverek', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1631, N'Sivrice', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1632, N'Sivrihisar', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1633, N'Solhan', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1634, N'Soma', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1635, N'Sorgun', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1636, N'Söğüt', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1637, N'Söke', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1638, N'Sulakyurt', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1639, N'Sultandağı', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1640, N'Sultanhisar', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1641, N'Suluova', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1642, N'Sungurlu', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1643, N'Suruç', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1644, N'Susurluk', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1645, N'Susuz', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1646, N'Suşehri', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1647, N'Sürmene', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1648, N'Sütçüler', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1649, N'Şabanözü', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1650, N'Şarkışla', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1651, N'Şarkikaraağaç', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1652, N'Şarköy', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1653, N'Şavşat', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1654, N'Şebinkarahisar', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1655, N'Şefaatli', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1656, N'Şemdinli', 30)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1657, N'Şenkaya', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1658, N'Şereflikoçhisar', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1659, N'Şile', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1660, N'Şiran', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1661, N'Şırnak Merkez', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1662, N'Şirvan', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1663, N'Şişli', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1664, N'Şuhut', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1665, N'Tarsus', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1666, N'Taşköprü', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1667, N'Taşlıçay', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1668, N'Taşova', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1669, N'Tatvan', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1670, N'Tavas', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1671, N'Tavşanlı', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1672, N'Tefenni', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1674, N'Tekman', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1675, N'Tercan', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1676, N'Terme', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1677, N'Tire', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1678, N'Tirebolu', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1679, N'Tokat Merkez', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1680, N'Tomarza', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1681, N'Tonya', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1682, N'Torbalı', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1683, N'Tortum', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1684, N'Torul', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1685, N'Tosya', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1687, N'Tufanbeyli', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1688, N'Tunceli Merkez', 62)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1689, N'Turgutlu', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1690, N'Turhal', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1691, N'Tutak', 4)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1692, N'Tuzluca', 76)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1693, N'Türkeli', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1694, N'Türkoğlu', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1695, N'Ula', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1696, N'Ulubey / Ordu', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1697, N'Ulubey / Uşak', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1698, N'Uludere', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1699, N'Uluborlu', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1700, N'Ulukışla', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1701, N'Ulus', 74)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1703, N'Urla', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1704, N'Uşak Merkez', 64)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1705, N'Uzunköprü', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1706, N'Ünye', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1707, N'Ürgüp', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1708, N'Üsküdar', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1709, N'Vakfıkebir', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1711, N'Varto', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1712, N'Vezirköprü', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1713, N'Viranşehir', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1714, N'Vize', 39)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1715, N'Yahyalı', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1716, N'Yalova Merkez', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1717, N'Yalvaç', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1718, N'Yapraklı', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1719, N'Yatağan', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1720, N'Yavuzeli', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1721, N'Yayladağı', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1722, N'Yenice / Çanakkale', 17)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1723, N'Yenimahalle', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1724, N'Yenipazar / Aydın', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1725, N'Yenişehir / Bursa', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1726, N'Yerköy', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1727, N'Yeşilhisar', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1728, N'Yeşilova', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1729, N'Yeşilyurt / Malatya', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1730, N'Yığılca', 81)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1731, N'Yıldızeli', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1732, N'Yomra', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1733, N'Yozgat Merkez', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1734, N'Yumurtalık', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1735, N'Yunak', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1736, N'Yusufeli', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1737, N'Yüksekova', 30)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1738, N'Zara', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1739, N'Zeytinburnu', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1740, N'Zile', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1741, N'Zonguldak Merkez', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1742, N'Dalaman', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1743, N'Düziçi', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1744, N'Gölbaşı / Ankara', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1745, N'Keçiören', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1746, N'Mamak', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1747, N'Sincan', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1748, N'Yüreğir', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1749, N'Acıgöl', 50)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1750, N'Adaklı', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1751, N'Ahmetli', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1752, N'Akkışla', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1753, N'Akören', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1754, N'Akpınar', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1755, N'Aksu / Isparta', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1756, N'Akyaka', 36)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1757, N'Aladağ', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1758, N'Alaplı', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1759, N'Alpu', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1760, N'Altınekin', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1761, N'Amasra', 74)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1762, N'Arıcak', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1763, N'Asarcık', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1764, N'Aslanapa', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1765, N'Atkaracalar', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1766, N'Aydıncık / Mersin', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1767, N'Aydıntepe', 69)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1768, N'Ayrancı', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1769, N'Babadağ', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1770, N'Bahçesaray', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1771, N'Başmakçı', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1772, N'Battalgazi', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1773, N'Bayat / Afyonkarahisar', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1774, N'Bekilli', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1775, N'Beşikdüzü', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1776, N'Beydağ', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1777, N'Beylikova', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1778, N'Boğazkale', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1779, N'Bozyazı', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1780, N'Buca', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1781, N'Buharkent', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1782, N'Büyükçekmece', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1783, N'Büyükorhan', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1784, N'Cumayeri', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1785, N'Çağlayancerit', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1786, N'Çaldıran', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1787, N'Dargeçit', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1788, N'Demirözü', 69)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1789, N'Derebucak', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1790, N'Dumlupınar', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1791, N'Eğil', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1792, N'Erzin', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1793, N'Gölmarmara', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1794, N'Gölyaka', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1795, N'Gülyalı', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1796, N'Güneysu', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1797, N'Gürgentepe', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1798, N'Güroymak', 13)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1799, N'Harmancık', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1800, N'Harran', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1801, N'Hasköy', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1802, N'Hisarcık', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1803, N'Honaz', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1804, N'Hüyük', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1805, N'İhsangazi', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1806, N'İmamoğlu', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1807, N'İncirliova', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1808, N'İnönü', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1809, N'İscehisar', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1810, N'Kağıthane', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1811, N'Demre', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1812, N'Karaçoban', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1813, N'Karamanlı', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1814, N'Karatay', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1815, N'Kazan', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1816, N'Kemer / Burdur', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1817, N'Kızılırmak', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1818, N'Kocaali', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1819, N'Konak', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1820, N'Kovancılar', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1821, N'Körfez', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1822, N'Köse', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1823, N'Küçükçekmece', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1824, N'Marmara', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1825, N'Marmaraereğlisi', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1826, N'Menderes', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1827, N'Meram', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1828, N'Murgul', 8)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1829, N'Nilüfer', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1830, N'19 Mayıs', 55)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1831, N'Ortaca', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1832, N'Osmangazi', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1833, N'Pamukova', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1834, N'Pazar / Tokat', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1835, N'Pendik', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1836, N'Pınarbaşı / Kastamonu', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1837, N'Piraziz', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1838, N'Salıpazarı', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1839, N'Selçuklu', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1840, N'Serinhisar', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1841, N'Şahinbey', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1842, N'Şalpazarı', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1843, N'Şaphane', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1844, N'Şehitkamil', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1845, N'Şenpazar', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1846, N'Talas', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1847, N'Taraklı', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1848, N'Taşkent', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1849, N'Tekkeköy', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1850, N'Uğurludağ', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1851, N'Uzundere', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1852, N'Ümraniye', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1853, N'Üzümlü', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1854, N'Yağlıdere', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1855, N'Yayladere', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1856, N'Yenice / Karabük', 78)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1857, N'Yenipazar / Bilecik', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1858, N'Yeşilyurt / Tokat', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1859, N'Yıldırım', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1860, N'Ağaçören', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1861, N'Güzelyurt', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1862, N'Kazımkarabekir', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1863, N'Kocasinan', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1864, N'Melikgazi', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1865, N'Pazaryolu', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1866, N'Sarıyahşi', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1867, N'Ağlı', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1868, N'Ahırlı', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1869, N'Akçakent', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1870, N'Akıncılar', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1871, N'Pamukkale', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1872, N'Akyurt', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1873, N'Alacakaya', 23)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1874, N'Altınyayla / Burdur', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1875, N'Altınyayla / Sivas', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1876, N'Altunhisar', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1877, N'Aydıncık / Yozgat', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1878, N'Tillo', 56)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1879, N'Ayvacık / Samsun', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1880, N'Bahşili', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1881, N'Baklan', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1882, N'Balışeyh', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1883, N'Başçiftlik', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1884, N'Başyayla', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1885, N'Bayramören', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1886, N'Bayrampaşa', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1887, N'Belen', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1888, N'Beyağaç', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1889, N'Bozkurt / Denizli', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1890, N'Boztepe', 40)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1891, N'Çamaş', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1892, N'Çamlıyayla', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1893, N'Çamoluk', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1894, N'Çanakçı', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1895, N'Çandır', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1896, N'Çarşıbaşı', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1897, N'Çatalpınar', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1898, N'Çavdarhisar', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1899, N'Çavdır', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1900, N'Çaybaşı', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1901, N'Çelebi', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1902, N'Çeltik', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1903, N'Çeltikçi', 15)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1904, N'Çiftlik', 51)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1905, N'Çilimli', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1906, N'Çobanlar', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1907, N'Derbent', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1908, N'Derepazarı', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1909, N'Dernekpazarı', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1910, N'Dikmen', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1911, N'Dodurga', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1912, N'Doğankent', 28)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1913, N'Doğanşar', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1914, N'Doğanyol', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1915, N'Doğanyurt', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1916, N'Dörtdivan', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1917, N'Düzköy', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1918, N'Edremit / Van', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1919, N'Ekinözü', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1920, N'Emirgazi', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1921, N'Eskil', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1922, N'Etimesgut', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1923, N'Evciler', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1924, N'Evren', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1925, N'Ferizli', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1926, N'Gökçebey', 67)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1927, N'Gölova', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1928, N'Gömeç', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1929, N'Gönen / Isparta', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1930, N'Güce', 28)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1931, N'Güçlükonak', 73)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1932, N'Gülağaç', 68)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1933, N'Güneysınır', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1934, N'Günyüzü', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1935, N'Gürsu', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1936, N'Hacılar', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1937, N'Halkapınar', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1938, N'Hamamözü', 5)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1939, N'Han', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1940, N'Hanönü', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1941, N'Hasankeyf', 72)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1942, N'Hayrat', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1943, N'Hemşin', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1944, N'Hocalar', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1945, N'Aziziye', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1946, N'İbradı', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1947, N'İkizce', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1948, N'İnhisar', 11)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1949, N'İyidere', 53)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1950, N'Kabadüz', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1951, N'Kabataş', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1952, N'Kadışehri', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1953, N'Kale / Malatya', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1954, N'Karakeçili', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1955, N'Karapürçek', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1956, N'Karkamış', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1957, N'Karpuzlu', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1958, N'Kavaklıdere', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1959, N'Kemer / Antalya', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1960, N'Kestel', 16)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1961, N'Kızılören', 3)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1962, N'Kocaköy', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1963, N'Korgun', 18)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1964, N'Korkut', 49)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1965, N'Köprübaşı / Manisa', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1966, N'Köprübaşı / Trabzon', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1967, N'Köprüköy', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1968, N'Köşk', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1969, N'Kuluncak', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1970, N'Kumlu', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1971, N'Kürtün', 29)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1972, N'Laçin', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1973, N'Mihalgazi', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1974, N'Nurdağı', 27)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1975, N'Nurhak', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1976, N'Oğuzlar', 19)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1977, N'Otlukbeli', 24)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1978, N'Özvatan', 38)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1979, N'Pazarlar', 43)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1980, N'Saray / Van', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1981, N'Saraydüzü', 57)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1982, N'Saraykent', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1983, N'Sarıveliler', 70)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1984, N'Seydiler', 37)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1985, N'Sincik', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1986, N'Söğütlü', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1987, N'Sulusaray', 60)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1988, N'Süloğlu', 22)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1989, N'Tut', 2)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1990, N'Tuzlukçu', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1991, N'Ulaş', 58)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1992, N'Yahşihan', 71)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1993, N'Yakakent', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1994, N'Yalıhüyük', 42)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1995, N'Yazıhan', 44)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1996, N'Yedisu', 12)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1997, N'Yeniçağa', 14)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (1998, N'Yenifakılı', 66)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2000, N'Didim', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2001, N'Yenişarbademli', 32)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2002, N'Yeşilli', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2003, N'Avcılar', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2004, N'Bağcılar', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2005, N'Bahçelievler', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2006, N'Balçova', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2007, N'Çiğli', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2008, N'Damal', 75)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2009, N'Gaziemir', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2010, N'Güngören', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2011, N'Karakoyunlu', 76)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2012, N'Maltepe', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2013, N'Narlıdere', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2014, N'Sultanbeyli', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2015, N'Tuzla', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2016, N'Esenler', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2017, N'Gümüşova', 81)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2018, N'Güzelbahçe', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2019, N'Altınova', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2020, N'Armutlu', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2021, N'Çınarcık', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2022, N'Çiftlikköy', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2023, N'Elbeyli', 79)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2024, N'Musabeyli', 79)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2025, N'Polateli', 79)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2026, N'Termal', 77)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2027, N'Hasanbeyli', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2028, N'Sumbas', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2029, N'Toprakkale', 80)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2030, N'Derince', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2031, N'Kaynaşlı', 81)
GO
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2032, N'Sarıçam', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2033, N'Çukurova', 1)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2034, N'Pursaklar', 6)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2035, N'Aksu / Antalya', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2036, N'Döşemealtı', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2037, N'Kepez', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2038, N'Konyaaltı', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2039, N'Muratpaşa', 7)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2040, N'Bağlar', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2041, N'Kayapınar', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2042, N'Sur', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2043, N'Yenişehir / Diyarbakır', 21)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2044, N'Palandöken', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2045, N'Yakutiye', 25)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2046, N'Odunpazarı', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2047, N'Tepebaşı', 26)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2048, N'Arnavutköy', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2049, N'Ataşehir', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2050, N'Başakşehir', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2051, N'Beylikdüzü', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2052, N'Çekmeköy', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2053, N'Esenyurt', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2054, N'Sancaktepe', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2055, N'Sultangazi', 34)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2056, N'Bayraklı', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2057, N'Karabağlar', 35)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2058, N'Başiskele', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2059, N'Çayırova', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2060, N'Darıca', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2061, N'Dilovası', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2062, N'İzmit', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2063, N'Kartepe', 41)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2064, N'Akdeniz', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2065, N'Mezitli', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2066, N'Toroslar', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2067, N'Yenişehir / Mersin', 33)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2068, N'Adapazarı', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2069, N'Arifiye', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2070, N'Erenler', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2071, N'Serdivan', 54)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2072, N'Atakum', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2073, N'Canik', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2074, N'İlkadım', 55)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2076, N'Efeler', 9)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2077, N'Altıeylül', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2078, N'Karesi', 10)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2079, N'Merkezefendi', 20)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2080, N'Antakya', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2081, N'Arsuz', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2082, N'Defne', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2083, N'Payas', 31)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2084, N'Dulkadiroğlu', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2085, N'Onikişubat', 46)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2086, N'Şehzadeler', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2087, N'Yunusemre', 45)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2088, N'Artuklu', 47)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2089, N'Menteşe', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2090, N'Seydikemer', 48)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2091, N'Eyyübiye', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2092, N'Haliliye', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2093, N'Karaköprü', 63)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2094, N'Ergene', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2096, N'Süleymanpaşa', 59)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2097, N'Ortahisar', 61)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2098, N'İpekyolu', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2099, N'Tuşba', 65)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (2103, N'Altınordu', 52)
INSERT [dbo].[Towns] ([TownID], [TownName], [CityID]) VALUES (9999, N'Yurtdışı', 999)
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_RecordStatuses] FOREIGN KEY([RecordStatusID])
REFERENCES [dbo].[RecordStatuses] ([RecordStatusID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_RecordStatuses]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Towns]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_RecordStatuses] FOREIGN KEY([RecordStatusID])
REFERENCES [dbo].[RecordStatuses] ([RecordStatusID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_RecordStatuses]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_RecordStatuses1] FOREIGN KEY([RecordStatusID])
REFERENCES [dbo].[RecordStatuses] ([RecordStatusID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_RecordStatuses1]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Towns]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([BranchID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Branches]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_RecordStatuses] FOREIGN KEY([RecordStatusID])
REFERENCES [dbo].[RecordStatuses] ([RecordStatusID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_RecordStatuses]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Towns] FOREIGN KEY([BirthPlaceID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Towns]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Towns1] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Towns1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cities] FOREIGN KEY([ShipCity])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cities]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Towns1] FOREIGN KEY([ShipTown])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Towns1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Cities]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Cities]
GO
/****** Object:  StoredProcedure [dbo].[SP_BayiBazindaSatisRaporu]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BayiBazindaSatisRaporu]
as
begin
select b.BranchName,p.ProductName,sum(Quantity) as [Satış Adeti],sum(od.Quantity*od.UnitPrice) as [Toplam Satış Tutarı] from Employees e inner join Branches b on e.BranchID=b.BranchID inner join Orders o on o.EmployeeID=e.EmployeeID inner join OrderDetails od on o.OrderID=od.OrderID inner join Products p on p.ProductID=od.ProductID group by b.BranchName,p.ProductName

end

GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_CATEGORY]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_DELETE_CATEGORY]
  @CategoryID int

 AS
 BEGIN
	DELETE FROM Categories where CategoryID=@CategoryID
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BRANCH]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_BRANCH]
@BranchID int
AS
BEGIN
SELECT * from Branches where BranchID=@BranchID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BRANCHES]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_BRANCHES]
AS
BEGIN
SELECT * from Branches
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CATEGORIES]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_CATEGORIES]
AS
BEGIN
SELECT * from Categories
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CATEGORY]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_CATEGORY]
@CategoryId int 
as
begin

select *from Categories where CategoryID=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CITIES]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_CITIES]
AS
BEGIN

select *from Cities  


END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CUSTOMER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_CUSTOMER]
@CustomerId int
as
begin

select*from Customers where CustomerID=@CustomerId

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CUSTOMERS]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_CUSTOMERS]
as
begin

select*from Customers

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EMPLOYEE]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_EMPLOYEE]
@EmployeeID int 
as
begin

select *from Employees where EmployeeID=@EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EMPLOYEES]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GET_EMPLOYEES]
as
begin

select*from Employees

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ORDER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_ORDER]
AS
BEGIN

SELECT*FROM Orders

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ORDERDETAIL]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_ORDERDETAIL]
@OrderID int
as
begin
select  od.*,p.ProductName from OrderDetails od inner join Products p on p.ProductID=od.ProductID  where od.OrderID=@OrderID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRODUCT]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROC [dbo].[SP_GET_PRODUCT]

 @ProductID int
 AS
 BEGIN
	SELECT *FROM  Products where ProductID=@ProductID
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRODUCTS]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROC [dbo].[SP_GET_PRODUCTS]


 AS
 BEGIN
	SELECT *FROM  Products
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SHIPPER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_SHIPPER]
@ShipperID int
AS
BEGIN
SELECT *FROM Shippers where ShipperID=@ShipperID
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SHIPPERS]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GET_SHIPPERS]
AS
BEGIN
SELECT *FROM Shippers
END


GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SUPPLIER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_SUPPLIER]
@SupplierID int
as
begin
 
select*from Suppliers where SupplierID=@SupplierID

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SUPPLIERS]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GET_SUPPLIERS]
as
begin

select*from Suppliers

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_TOWNSBYCITY]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GET_TOWNSBYCITY]
@CityID int 

AS
BEGIN

select *from Towns  where CityID=@CityID


END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_BRANCH]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_INSERT_BRANCH]
@BranchName nvarchar(50), 
@ManagerID int,
@TownID int,
@Address nvarchar(50), 
@Phone nvarchar(50), 
@EmailAddress varchar(30),
@RecordStatusID int, 
@CreateDate datetime
 AS
 BEGIN
	insert into Branches 
	values(@BranchName, @ManagerID, @TownID, @Address, @Phone, @EmailAddress, @RecordStatusID, @CreateDate)
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_CATEGORY]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_INSERT_CATEGORY]
 @CategoryName nvarchar(50),
 @Description nvarchar(50)
 AS
 BEGIN
	insert into Categories(CategoryName,[Description])
	values(@CategoryName, @Description)
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_CUSTOMER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_INSERT_CUSTOMER]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@BirthDate datetime, 
@TownID int, 
@Address nvarchar(50), 
@MobilePhone varchar(20),
@EmailAddress varchar(30), 
@Balance money,
@RecordStatusID int,
@CreateDate datetime
 
 AS
 BEGIN
	insert into Customers 
	values(@FirstName, @LastName, @BirthDate, @TownID, @Address, @MobilePhone, @EmailAddress, @Balance, @RecordStatusID, @CreateDate)
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_EMPLOYEE]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[SP_INSERT_EMPLOYEE]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@BirthDate datetime, 
@BirthPlaceID int,
@HireDate datetime,
@BranchID int, 
@Title nvarchar(50),
@Address nvarchar(50), 
@TownID int, 
@MobilePhone varchar(20),
@EmailAddress varchar(30), 
@RecordStatusID int,
@CreateDate datetime,
@UserName nvarchar(50),
@Password nvarchar(50)
 AS
 BEGIN
	insert into Employees 
	values(@FirstName, @LastName, @BirthDate, @BirthPlaceID, @HireDate, @BranchID, @Title, @Address, @TownID, @MobilePhone, @EmailAddress, @RecordStatusID, @CreateDate,@UserName,@Password)
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_ORDER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[SP_INSERT_ORDER] 
@CustomerID nchar(5),
@EmployeeID int,
@OrderDate DATETIME, 
@ShipVia INT, 
@Freight MONEY, 
@ShipTown int,
@ShipCity int,
@OrderID INT OUTPUT  
AS
BEGIN

insert into Orders(CustomerID,EmployeeID,OrderDate,ShipVia,Freight,ShipTown,ShipCity)
 output inserted.* --eklenen kaydı gösterir.
 values(@CustomerID,@EmployeeID,@OrderDate,@ShipVia,@Freight,@ShipTown,@ShipCity)

select @OrderID=SCOPE_IDENTITY()--eklenen kaydın identity değerini verir.

END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_ORDERDETAIL]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_ORDERDETAIL]
@OrderID INT,
@ProductID int,
@UnitPrice money,
@Quantity INT
AS
BEGIN

insert into OrderDetails (OrderID,ProductID,UnitPrice,Quantity) values(@OrderID,@ProductID,@UnitPrice,@Quantity)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PRODUCT]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[SP_INSERT_PRODUCT]
@ProductName nvarchar(50), 
@SupplierID int, 
@CategoryID int,
@UnitPrice money, 
@UnitsInStock smallint
 AS
 BEGIN
	insert into Products
	values(@ProductName, @SupplierID,@CategoryID,@UnitPrice,@UnitsInStock)
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SHIPPERS]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INSERT_SHIPPERS]
@CompanyName nvarchar(50),
@Phone nvarchar(24)
AS
BEGIN
INSERT INTO Shippers values(@CompanyName,@Phone)

END


GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_SUPPLIER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_INSERT_SUPPLIER]
@CompanyName nvarchar(40),
@Address nvarchar(60),
@CityID int, 
@Phone nvarchar(24)
AS 
BEGIN

insert into Suppliers(CompanyName, Address,CityID,Phone)
	values(@CompanyName, @Address, @CityID, @Phone)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_KargoGiderRaporu]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KargoGiderRaporu]
as
begin
select Shippers.CompanyName,sum(Freight) as [Toplam Tutar] from Shippers inner join Orders on Orders.ShipVia=ShipperID group by Shippers.CompanyName
end


GO
/****** Object:  StoredProcedure [dbo].[SP_PersonelBazindaSatisRaporu]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_PersonelBazindaSatisRaporu]
as
begin

--hangi personel hangi üründen toplamda kaç dolarlık satış yapmıştır.
select e.FirstName+' '+e.LastName as  [Personel Adı Soyadı] ,p.ProductName,sum(Quantity) as [SatisAdeti] ,sum(od.UnitPrice*od.Quantity) as [Toplam Satış Tutarı] from Employees e inner join Orders o on e.EmployeeID=o.EmployeeID inner join OrderDetails od on o.OrderID= od.OrderID inner join Products p on od.ProductID=p.ProductID group by e.FirstName+' '+e.LastName ,p.ProductName

end
GO
/****** Object:  StoredProcedure [dbo].[SP_PersonelListesi]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_PersonelListesi]
as
begin

select e.FirstName+' '+e.LastName as [Personel Adı Soyadı],e.UserName,e.Password ,b.BranchName from Employees e inner join Branches b on b.BranchID=e.BranchID 

end
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_BRANCH]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_UPDATE_BRANCH]
 @BranchID int,
@BranchName nvarchar(50), 
@ManagerID int,
@TownID int,
@Address nvarchar(50), 
@Phone nvarchar(50), 
@EmailAddress varchar(30),
@RecordStatusID int
 AS
 BEGIN
update Branches set BranchName=@BranchName,ManagerID=@ManagerID,TownID=@TownID,Address=@Address,Phone=@Phone,EmailAddress=@EmailAddress,RecordStatusID=@RecordStatusID where BranchID=@BranchID
 END 
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_CATEGORY]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_UPDATE_CATEGORY]
  @CategoryID int,
 @CategoryName nvarchar(50),
 @Description nvarchar(50)
 AS
 BEGIN
	update Categories set CategoryName=@CategoryName,Description=@Description where CategoryID=@CategoryID
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_CUSTOMER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[SP_UPDATE_CUSTOMER]
@CustomerID int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@BirthDate datetime, 
@TownID int, 
@Address nvarchar(50), 
@MobilePhone varchar(20),
@EmailAddress varchar(30), 
@Balance money,
@RecordStatusID int

 
 AS
 BEGIN
		update Customers set FirstName=@FirstName,LastName=@LastName,BirthDate=@BirthDate,TownID=@TownID,Address=@Address,MobilePhone=@MobilePhone,EmailAddress=@EmailAddress,Balance=@Balance,RecordStatusID=@RecordStatusID where CustomerID=@CustomerID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_CUSTOMER_BALANCE]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE PROC [dbo].[SP_UPDATE_CUSTOMER_BALANCE]
@AzalacakBakiye int, 
@CustomerID int
 AS
 BEGIN
		update Customers set Balance=Balance-@AzalacakBakiye where CustomerID=@CustomerID
 END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_EMPLOYEE]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[SP_UPDATE_EMPLOYEE]
@EmployeeID int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@BirthDate datetime, 
@BirthPlaceID int, 
@HireDate datetime, 
@BranchID int, 
@Title nvarchar(50),
@Address nvarchar(50),
@TownID int, 
@MobilePhone varchar(20),
@EmailAddress varchar(30), 
@RecordStatusID int,
@CreateDate datetime,
@UserName nvarchar(50),
@Password nvarchar(50)
 AS
 BEGIN
		update Employees set FirstName=@FirstName,LastName=@LastName,BirthDate=@BirthDate,BirthPlaceID=@BirthPlaceID,HireDate=@HireDate,BranchID=@BranchID,Title=@Title,TownID=@TownID,Address=@Address,MobilePhone=@MobilePhone,EmailAddress=@EmailAddress,RecordStatusID=@RecordStatusID,CreateDate=@CreateDate,UserName=@UserName,Password=@Password where EmployeeID=@EmployeeID
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PRODUCT]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   CREATE PROC [dbo].[SP_UPDATE_PRODUCT]
   @ProductID int,
@ProductName nvarchar(50), 
@SupplierID int, 
@CategoryID int,
@UnitPrice money, 
@UnitsInStock smallint
 AS
 BEGIN
	update  Products set ProductName=@ProductName,SupplierID=@SupplierID,CategoryID=@CategoryID,UnitPrice=@UnitPrice,UnitsInStock=@UnitsInStock where ProductID=@ProductID
	
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_SHIPPER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_SHIPPER]
@ShipperID INT,
@CompanyName nvarchar(50),
@Phone nvarchar(24)
AS
BEGIN
UPDATE Shippers set CompanyName=@CompanyName,Phone=@Phone where ShipperID=@ShipperID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_SUPPLIER]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_UPDATE_SUPPLIER]
@SupplierID int,
@CompanyName nvarchar(40),
@Address nvarchar(60),
@CityID int, 
@Phone nvarchar(24)
AS 
BEGIN

update Suppliers set CompanyName=@CompanyName,Address=@Address,CityID=@CityID,Phone=@Phone where SupplierID=@SupplierID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UrunBazindaSatisRaporu]    Script Date: 16.10.2016 16:39:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UrunBazindaSatisRaporu]
as
begin

-- üründen toplamda kaç dolarlık satış yapmıştır.
select p.ProductName,sum(Quantity) as [SatışAdeti],sum(od.UnitPrice*od.Quantity) as [Toplam Satış Tutarı] from Employees e inner join Orders o on e.EmployeeID=o.EmployeeID inner join OrderDetails od on o.OrderID= od.OrderID inner join Products p on od.ProductID=p.ProductID group by p.ProductName

end

GO
USE [master]
GO
ALTER DATABASE [StokTakip] SET  READ_WRITE 
GO
