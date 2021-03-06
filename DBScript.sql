USE [master]
GO
/****** Object:  Database [PROG7311T2]    Script Date: 2021/06/14 20:39:54 ******/
CREATE DATABASE [PROG7311T2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROG7311T2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PROG7311T2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PROG7311T2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PROG7311T2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PROG7311T2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROG7311T2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROG7311T2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROG7311T2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROG7311T2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROG7311T2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROG7311T2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROG7311T2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROG7311T2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROG7311T2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROG7311T2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROG7311T2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROG7311T2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROG7311T2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROG7311T2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROG7311T2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROG7311T2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROG7311T2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROG7311T2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROG7311T2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROG7311T2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROG7311T2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROG7311T2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROG7311T2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROG7311T2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROG7311T2] SET  MULTI_USER 
GO
ALTER DATABASE [PROG7311T2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROG7311T2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROG7311T2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROG7311T2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PROG7311T2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Description] [varchar](128) NULL,
	[Price] [money] NOT NULL,
	[CID] [int] NOT NULL,
	[ImageUrl] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrder]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrder](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Qty] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[PID] [int] NOT NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RID] [int] IDENTITY(10,1) NOT NULL,
	[RoleName] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[SID] [int] IDENTITY(10,1) NOT NULL,
	[Qty] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[PID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UID] [int] IDENTITY(100,1) NOT NULL,
	[Username] [varchar](32) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 2021/06/14 20:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WID] [int] IDENTITY(10,1) NOT NULL,
	[UID] [int] NOT NULL,
	[PID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613182245_ImageURLAdded', N'5.0.7')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CID], [CategoryName]) VALUES (1, N'Car Posters')
INSERT [dbo].[Category] ([CID], [CategoryName]) VALUES (2, N'Wheels')
INSERT [dbo].[Category] ([CID], [CategoryName]) VALUES (3, N'Body Kits')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (1, N'Subaru Impreza WRC', N'Subaru Impreza Featuring "Battle Scars" WRC Livery', 69.0000, 1, N'./images/subaru.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (2, N'Rotiform CBC', N'Rotiform Cast Block Custom Race Wheels (Set of 4)', 45000.0000, 2, N'./images/rotiform.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (3, N'Porsche 911 GT3 RS', N'Porsche 911 GT3 RS with ILLEST Livery', 50.0000, 1, N'./images/porsche.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (4, N'Mazda RX7', N'Mazda RX7 Drift build with Rotiform Livery', 75.0000, 1, N'./images/rx7.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (5, N'Nissan Skyline', N'Nissan Skyline R32 in Junkyard', 65.0000, 1, N'./images/r32.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (6, N'Nextech TF', N'Nextech Turbofan Concave Wheels (Set of 2)', 15000.0000, 2, N'./images/nexttech.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (7, N'Work Meister', N'Work Meister Wheels (Set of 4)', 60000.0000, 2, N'./images/work.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (8, N'RS Watanabe', N'RS Watanabe Deep Dish Wheels (Set of 4)', 20000.0000, 2, N'./images/watanabe.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (9, N'BMW M2', N'Speedhunters Flared Arch Kit', 250000.0000, 3, N'./images/m2.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (10, N'Lamborghini Huracan', N'Liberty Walk Wide Body Kit', 2500000.0000, 3, N'./images/lambo.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (11, N'Nissan 180SX(S13)', N'BN Sports Aero Package', 100000.0000, 3, N'./images/s13.jpg')
INSERT [dbo].[Product] ([PID], [Name], [Description], [Price], [CID], [ImageUrl]) VALUES (12, N'Nissan Silvia (S15)', N'Rocket Bunny Stage 2', 1500000.0000, 3, N'./images/s15.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductOrder] ON 

INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (10, CAST(N'2021-06-02T20:31:00.000' AS DateTime), 1, 634299.0000, 4, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (11, CAST(N'2021-06-09T07:16:00.000' AS DateTime), 1, 1524879.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (12, CAST(N'2021-06-20T12:52:00.000' AS DateTime), 1, 83262.0000, 8, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (13, CAST(N'2021-06-15T00:40:00.000' AS DateTime), 1, 1177350.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (14, CAST(N'2021-06-29T06:02:00.000' AS DateTime), 1, 491264.0000, 11, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (15, CAST(N'2021-06-25T20:21:00.000' AS DateTime), 1, 796202.0000, 6, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (16, CAST(N'2021-06-08T18:32:00.000' AS DateTime), 1, 552069.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (17, CAST(N'2021-06-07T02:43:00.000' AS DateTime), 1, 665748.0000, 6, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (18, CAST(N'2021-06-01T20:01:00.000' AS DateTime), 1, 1016421.0000, 8, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (19, CAST(N'2021-06-28T10:36:00.000' AS DateTime), 1, 1157948.0000, 2, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (20, CAST(N'2021-06-24T20:14:00.000' AS DateTime), 1, 707023.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (21, CAST(N'2021-06-05T23:27:00.000' AS DateTime), 1, 681572.0000, 8, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (22, CAST(N'2021-06-02T09:14:00.000' AS DateTime), 1, 111321.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (23, CAST(N'2021-06-25T22:58:00.000' AS DateTime), 1, 994760.0000, 7, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (24, CAST(N'2021-06-29T07:56:00.000' AS DateTime), 1, 275039.0000, 10, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (25, CAST(N'2021-06-25T19:10:00.000' AS DateTime), 1, 236387.0000, 5, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (26, CAST(N'2021-06-06T08:09:00.000' AS DateTime), 1, 595611.0000, 8, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (27, CAST(N'2021-06-04T19:03:00.000' AS DateTime), 1, 1136027.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (28, CAST(N'2021-06-24T05:24:00.000' AS DateTime), 1, 1956799.0000, 7, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (29, CAST(N'2021-06-20T03:50:00.000' AS DateTime), 1, 285262.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (30, CAST(N'2021-06-21T17:22:00.000' AS DateTime), 1, 1330060.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (31, CAST(N'2021-06-24T07:05:00.000' AS DateTime), 1, 623233.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (32, CAST(N'2021-06-02T07:12:00.000' AS DateTime), 1, 1647080.0000, 8, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (33, CAST(N'2021-06-15T20:41:00.000' AS DateTime), 1, 1112675.0000, 10, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (34, CAST(N'2021-06-10T04:45:00.000' AS DateTime), 1, 489514.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (35, CAST(N'2021-06-23T23:28:00.000' AS DateTime), 1, 144844.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (36, CAST(N'2021-06-13T02:44:00.000' AS DateTime), 1, 842185.0000, 6, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (37, CAST(N'2021-06-24T07:27:00.000' AS DateTime), 1, 851651.0000, 2, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (38, CAST(N'2021-06-15T03:09:00.000' AS DateTime), 1, 1691463.0000, 3, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (39, CAST(N'2021-06-20T15:35:00.000' AS DateTime), 1, 164343.0000, 8, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (40, CAST(N'2021-06-19T10:48:00.000' AS DateTime), 1, 253205.0000, 10, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (41, CAST(N'2021-06-17T18:29:00.000' AS DateTime), 1, 1375573.0000, 5, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (42, CAST(N'2021-06-24T05:54:00.000' AS DateTime), 1, 1565940.0000, 2, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (43, CAST(N'2021-06-29T08:48:00.000' AS DateTime), 1, 429283.0000, 6, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (44, CAST(N'2021-06-15T14:34:00.000' AS DateTime), 1, 1769250.0000, 5, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (45, CAST(N'2021-06-27T12:59:00.000' AS DateTime), 1, 584133.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (46, CAST(N'2021-06-07T17:45:00.000' AS DateTime), 1, 1342277.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (47, CAST(N'2021-06-28T04:45:00.000' AS DateTime), 1, 578703.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (48, CAST(N'2021-06-10T06:50:00.000' AS DateTime), 1, 488257.0000, 7, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (49, CAST(N'2021-06-04T19:36:00.000' AS DateTime), 1, 271130.0000, 2, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (50, CAST(N'2021-06-20T02:18:00.000' AS DateTime), 1, 980963.0000, 8, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (51, CAST(N'2021-06-25T12:59:00.000' AS DateTime), 1, 1785464.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (52, CAST(N'2021-06-23T15:51:00.000' AS DateTime), 1, 1785904.0000, 8, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (53, CAST(N'2021-06-08T23:50:00.000' AS DateTime), 1, 122072.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (54, CAST(N'2021-06-17T14:11:00.000' AS DateTime), 1, 12644.0000, 6, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (55, CAST(N'2021-06-13T18:23:00.000' AS DateTime), 1, 474176.0000, 10, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (56, CAST(N'2021-06-06T09:07:00.000' AS DateTime), 1, 1359266.0000, 6, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (57, CAST(N'2021-06-04T08:03:00.000' AS DateTime), 1, 568902.0000, 10, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (58, CAST(N'2021-06-18T19:31:00.000' AS DateTime), 1, 470760.0000, 2, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (59, CAST(N'2021-06-10T00:57:00.000' AS DateTime), 1, 1815689.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (60, CAST(N'2021-06-18T01:50:00.000' AS DateTime), 1, 613438.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (61, CAST(N'2021-06-04T11:04:00.000' AS DateTime), 1, 1479114.0000, 7, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (62, CAST(N'2021-06-20T18:36:00.000' AS DateTime), 1, 1145380.0000, 6, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (63, CAST(N'2021-06-15T18:08:00.000' AS DateTime), 1, 1602176.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (64, CAST(N'2021-06-18T11:53:00.000' AS DateTime), 1, 708571.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (65, CAST(N'2021-06-22T07:30:00.000' AS DateTime), 1, 1662659.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (66, CAST(N'2021-06-26T16:13:00.000' AS DateTime), 1, 962329.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (67, CAST(N'2021-06-29T15:03:00.000' AS DateTime), 1, 234422.0000, 4, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (68, CAST(N'2021-06-06T09:07:00.000' AS DateTime), 1, 1552299.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (69, CAST(N'2021-06-07T15:30:00.000' AS DateTime), 1, 740154.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (70, CAST(N'2021-06-06T06:30:00.000' AS DateTime), 1, 987196.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (71, CAST(N'2021-06-15T15:16:00.000' AS DateTime), 1, 1245472.0000, 4, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (72, CAST(N'2021-06-06T05:17:00.000' AS DateTime), 1, 229410.0000, 8, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (73, CAST(N'2021-06-12T03:59:00.000' AS DateTime), 1, 779194.0000, 1, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (74, CAST(N'2021-06-13T09:18:00.000' AS DateTime), 1, 482627.0000, 2, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (75, CAST(N'2021-06-17T11:10:00.000' AS DateTime), 1, 650972.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (76, CAST(N'2021-06-01T18:10:00.000' AS DateTime), 1, 576557.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (77, CAST(N'2021-06-10T23:20:00.000' AS DateTime), 1, 1131359.0000, 1, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (78, CAST(N'2021-06-26T13:35:00.000' AS DateTime), 1, 257952.0000, 6, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (79, CAST(N'2021-06-15T15:29:00.000' AS DateTime), 1, 1782890.0000, 2, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (80, CAST(N'2021-06-28T10:45:00.000' AS DateTime), 1, 126177.0000, 1, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (81, CAST(N'2021-06-04T20:41:00.000' AS DateTime), 1, 1553654.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (82, CAST(N'2021-06-03T21:00:00.000' AS DateTime), 1, 893578.0000, 4, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (83, CAST(N'2021-06-05T16:47:00.000' AS DateTime), 1, 809576.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (84, CAST(N'2021-06-14T23:03:00.000' AS DateTime), 1, 1897467.0000, 8, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (85, CAST(N'2021-06-16T15:22:00.000' AS DateTime), 1, 1766541.0000, 9, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (86, CAST(N'2021-06-29T05:29:00.000' AS DateTime), 1, 309231.0000, 10, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (87, CAST(N'2021-06-23T18:06:00.000' AS DateTime), 1, 1989333.0000, 2, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (88, CAST(N'2021-06-02T23:56:00.000' AS DateTime), 1, 1879843.0000, 3, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (89, CAST(N'2021-06-11T17:45:00.000' AS DateTime), 1, 854783.0000, 6, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (90, CAST(N'2021-06-24T16:58:00.000' AS DateTime), 1, 644066.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (91, CAST(N'2021-06-21T09:11:00.000' AS DateTime), 1, 210883.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (92, CAST(N'2021-06-22T08:22:00.000' AS DateTime), 1, 1639290.0000, 3, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (93, CAST(N'2021-06-20T04:21:00.000' AS DateTime), 1, 1008663.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (94, CAST(N'2021-06-27T14:40:00.000' AS DateTime), 1, 1781654.0000, 10, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (95, CAST(N'2021-06-27T02:10:00.000' AS DateTime), 1, 424964.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (96, CAST(N'2021-06-20T01:36:00.000' AS DateTime), 1, 256484.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (97, CAST(N'2021-06-19T02:42:00.000' AS DateTime), 1, 1393194.0000, 6, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (98, CAST(N'2021-06-03T04:53:00.000' AS DateTime), 1, 1840002.0000, 3, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (99, CAST(N'2021-06-15T13:27:00.000' AS DateTime), 1, 441802.0000, 8, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (100, CAST(N'2021-06-04T00:36:00.000' AS DateTime), 1, 1428418.0000, 7, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (101, CAST(N'2021-06-15T20:39:00.000' AS DateTime), 1, 1546695.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (102, CAST(N'2021-06-08T09:12:00.000' AS DateTime), 1, 203567.0000, 6, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (103, CAST(N'2021-06-17T20:42:00.000' AS DateTime), 1, 1889393.0000, 3, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (104, CAST(N'2021-06-02T16:33:00.000' AS DateTime), 1, 1950538.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (105, CAST(N'2021-06-08T17:52:00.000' AS DateTime), 1, 720153.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (106, CAST(N'2021-06-24T21:43:00.000' AS DateTime), 1, 808992.0000, 1, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (107, CAST(N'2021-06-12T13:10:00.000' AS DateTime), 1, 777698.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (108, CAST(N'2021-06-01T07:58:00.000' AS DateTime), 1, 1544974.0000, 6, 105)
GO
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (109, CAST(N'2021-06-05T04:37:00.000' AS DateTime), 1, 682645.0000, 2, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (110, CAST(N'2021-06-27T17:24:00.000' AS DateTime), 1, 343745.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (111, CAST(N'2021-06-18T11:28:00.000' AS DateTime), 1, 418257.0000, 3, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (112, CAST(N'2021-06-19T04:20:00.000' AS DateTime), 1, 879347.0000, 7, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (113, CAST(N'2021-06-29T05:17:00.000' AS DateTime), 1, 761981.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (114, CAST(N'2021-06-01T03:39:00.000' AS DateTime), 1, 339384.0000, 5, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (115, CAST(N'2021-06-04T03:33:00.000' AS DateTime), 1, 1821867.0000, 8, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (116, CAST(N'2021-06-09T23:43:00.000' AS DateTime), 1, 1953811.0000, 1, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (117, CAST(N'2021-06-28T03:42:00.000' AS DateTime), 1, 1872269.0000, 9, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (118, CAST(N'2021-06-19T02:54:00.000' AS DateTime), 1, 1401405.0000, 1, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (119, CAST(N'2021-06-10T17:41:00.000' AS DateTime), 1, 1109490.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (120, CAST(N'2021-06-20T20:38:00.000' AS DateTime), 1, 1350628.0000, 3, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (121, CAST(N'2021-06-21T04:34:00.000' AS DateTime), 1, 1633879.0000, 8, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (122, CAST(N'2021-06-10T07:41:00.000' AS DateTime), 1, 1602908.0000, 2, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (123, CAST(N'2021-06-07T08:42:00.000' AS DateTime), 1, 531549.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (124, CAST(N'2021-06-23T03:15:00.000' AS DateTime), 1, 1502152.0000, 9, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (125, CAST(N'2021-06-22T20:40:00.000' AS DateTime), 1, 85302.0000, 6, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (126, CAST(N'2021-06-09T01:23:00.000' AS DateTime), 1, 809283.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (127, CAST(N'2021-06-27T17:42:00.000' AS DateTime), 1, 981583.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (128, CAST(N'2021-06-20T23:23:00.000' AS DateTime), 1, 1645238.0000, 3, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (129, CAST(N'2021-06-09T06:29:00.000' AS DateTime), 1, 335703.0000, 9, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (130, CAST(N'2021-06-22T07:42:00.000' AS DateTime), 1, 388965.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (131, CAST(N'2021-06-12T08:42:00.000' AS DateTime), 1, 640555.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (132, CAST(N'2021-06-18T10:20:00.000' AS DateTime), 1, 1067323.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (133, CAST(N'2021-06-06T19:28:00.000' AS DateTime), 1, 349824.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (134, CAST(N'2021-06-26T10:10:00.000' AS DateTime), 1, 52449.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (135, CAST(N'2021-06-28T05:45:00.000' AS DateTime), 1, 515414.0000, 4, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (136, CAST(N'2021-06-19T17:30:00.000' AS DateTime), 1, 1333525.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (137, CAST(N'2021-06-02T20:52:00.000' AS DateTime), 1, 842725.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (138, CAST(N'2021-06-25T10:52:00.000' AS DateTime), 1, 958614.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (139, CAST(N'2021-06-12T18:22:00.000' AS DateTime), 1, 429327.0000, 2, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (140, CAST(N'2021-06-06T18:55:00.000' AS DateTime), 1, 397961.0000, 7, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (141, CAST(N'2021-06-05T12:54:00.000' AS DateTime), 1, 132040.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (142, CAST(N'2021-06-23T12:51:00.000' AS DateTime), 1, 1926004.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (143, CAST(N'2021-06-05T01:12:00.000' AS DateTime), 1, 156545.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (144, CAST(N'2021-06-09T13:17:00.000' AS DateTime), 1, 645521.0000, 5, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (145, CAST(N'2021-06-10T19:44:00.000' AS DateTime), 1, 51498.0000, 5, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (146, CAST(N'2021-06-27T15:46:00.000' AS DateTime), 1, 1204230.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (147, CAST(N'2021-06-23T08:57:00.000' AS DateTime), 1, 494335.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (148, CAST(N'2021-06-20T14:21:00.000' AS DateTime), 1, 1808758.0000, 6, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (149, CAST(N'2021-06-07T09:08:00.000' AS DateTime), 1, 230626.0000, 10, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (150, CAST(N'2021-06-28T01:12:00.000' AS DateTime), 1, 1306995.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (151, CAST(N'2021-06-05T07:52:00.000' AS DateTime), 1, 1708441.0000, 4, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (152, CAST(N'2021-06-29T13:31:00.000' AS DateTime), 1, 145099.0000, 3, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (153, CAST(N'2021-06-14T19:55:00.000' AS DateTime), 1, 595824.0000, 10, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (154, CAST(N'2021-06-13T11:13:00.000' AS DateTime), 1, 1547705.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (155, CAST(N'2021-06-15T13:13:00.000' AS DateTime), 1, 423838.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (156, CAST(N'2021-06-06T21:48:00.000' AS DateTime), 1, 1746141.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (157, CAST(N'2021-06-08T21:08:00.000' AS DateTime), 1, 879460.0000, 3, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (158, CAST(N'2021-06-08T10:07:00.000' AS DateTime), 1, 263841.0000, 1, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (159, CAST(N'2021-06-14T10:34:00.000' AS DateTime), 1, 1395512.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (160, CAST(N'2021-06-06T07:52:00.000' AS DateTime), 1, 1172914.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (161, CAST(N'2021-06-12T14:34:00.000' AS DateTime), 1, 1711875.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (162, CAST(N'2021-06-27T06:12:00.000' AS DateTime), 1, 856602.0000, 10, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (163, CAST(N'2021-06-14T10:37:00.000' AS DateTime), 1, 1544995.0000, 5, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (164, CAST(N'2021-06-14T18:10:00.000' AS DateTime), 1, 1518689.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (165, CAST(N'2021-06-14T09:52:00.000' AS DateTime), 1, 1600583.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (166, CAST(N'2021-06-04T00:58:00.000' AS DateTime), 1, 385129.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (167, CAST(N'2021-06-16T20:15:00.000' AS DateTime), 1, 897574.0000, 4, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (168, CAST(N'2021-06-13T08:32:00.000' AS DateTime), 1, 823159.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (169, CAST(N'2021-06-15T06:43:00.000' AS DateTime), 1, 1251407.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (170, CAST(N'2021-06-27T00:59:00.000' AS DateTime), 1, 1345709.0000, 6, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (171, CAST(N'2021-06-14T08:46:00.000' AS DateTime), 1, 507313.0000, 10, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (172, CAST(N'2021-06-09T08:07:00.000' AS DateTime), 1, 503360.0000, 10, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (173, CAST(N'2021-06-27T15:13:00.000' AS DateTime), 1, 1225855.0000, 2, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (174, CAST(N'2021-06-15T12:35:00.000' AS DateTime), 1, 264036.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (175, CAST(N'2021-06-02T09:55:00.000' AS DateTime), 1, 1994023.0000, 9, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (176, CAST(N'2021-06-23T05:13:00.000' AS DateTime), 1, 1031448.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (177, CAST(N'2021-06-11T09:51:00.000' AS DateTime), 1, 899966.0000, 1, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (178, CAST(N'2021-06-06T22:49:00.000' AS DateTime), 1, 1404520.0000, 7, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (179, CAST(N'2021-06-29T02:45:00.000' AS DateTime), 1, 1887405.0000, 2, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (180, CAST(N'2021-06-28T03:03:00.000' AS DateTime), 1, 527563.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (181, CAST(N'2021-06-03T04:27:00.000' AS DateTime), 1, 1546026.0000, 3, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (182, CAST(N'2021-06-21T20:39:00.000' AS DateTime), 1, 914618.0000, 5, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (183, CAST(N'2021-06-19T11:18:00.000' AS DateTime), 1, 412850.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (184, CAST(N'2021-06-17T17:33:00.000' AS DateTime), 1, 1703725.0000, 6, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (185, CAST(N'2021-06-29T15:53:00.000' AS DateTime), 1, 556043.0000, 1, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (186, CAST(N'2021-06-20T16:39:00.000' AS DateTime), 1, 77187.0000, 1, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (187, CAST(N'2021-06-12T03:45:00.000' AS DateTime), 1, 1818073.0000, 8, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (188, CAST(N'2021-06-14T10:29:00.000' AS DateTime), 1, 663020.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (189, CAST(N'2021-06-03T00:09:00.000' AS DateTime), 1, 397856.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (190, CAST(N'2021-06-09T22:18:00.000' AS DateTime), 1, 398287.0000, 9, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (191, CAST(N'2021-06-17T20:59:00.000' AS DateTime), 1, 58418.0000, 9, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (192, CAST(N'2021-06-17T22:12:00.000' AS DateTime), 1, 225662.0000, 8, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (193, CAST(N'2021-06-07T09:31:00.000' AS DateTime), 1, 909707.0000, 1, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (194, CAST(N'2021-06-11T23:07:00.000' AS DateTime), 1, 180304.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (195, CAST(N'2021-06-26T19:22:00.000' AS DateTime), 1, 723182.0000, 10, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (196, CAST(N'2021-06-05T06:19:00.000' AS DateTime), 1, 1224866.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (197, CAST(N'2021-06-21T17:26:00.000' AS DateTime), 1, 1360993.0000, 7, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (198, CAST(N'2021-06-04T22:45:00.000' AS DateTime), 1, 1110916.0000, 11, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (199, CAST(N'2021-06-08T02:35:00.000' AS DateTime), 1, 1654589.0000, 2, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (200, CAST(N'2021-06-17T15:26:00.000' AS DateTime), 1, 1261240.0000, 9, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (201, CAST(N'2021-06-23T06:56:00.000' AS DateTime), 1, 1137150.0000, 9, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (202, CAST(N'2021-06-26T18:17:00.000' AS DateTime), 1, 1556782.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (203, CAST(N'2021-06-28T07:09:00.000' AS DateTime), 1, 572310.0000, 5, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (204, CAST(N'2021-06-27T03:55:00.000' AS DateTime), 1, 1075367.0000, 10, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (205, CAST(N'2021-06-02T19:16:00.000' AS DateTime), 1, 443645.0000, 2, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (206, CAST(N'2021-06-21T20:51:00.000' AS DateTime), 1, 1873007.0000, 5, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (207, CAST(N'2021-06-15T23:01:00.000' AS DateTime), 1, 1918170.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (208, CAST(N'2021-06-20T14:52:00.000' AS DateTime), 1, 1508308.0000, 3, 102)
GO
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (209, CAST(N'2021-06-07T04:55:00.000' AS DateTime), 1, 1174679.0000, 2, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (210, CAST(N'2021-06-05T06:47:00.000' AS DateTime), 1, 519334.0000, 8, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (211, CAST(N'2021-06-01T08:10:00.000' AS DateTime), 1, 1156809.0000, 4, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (212, CAST(N'2021-06-22T04:09:00.000' AS DateTime), 1, 982089.0000, 9, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (213, CAST(N'2021-06-24T00:33:00.000' AS DateTime), 1, 1275045.0000, 1, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (214, CAST(N'2021-06-20T01:07:00.000' AS DateTime), 1, 891076.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (215, CAST(N'2021-06-23T05:54:00.000' AS DateTime), 1, 735538.0000, 10, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (216, CAST(N'2021-06-07T22:44:00.000' AS DateTime), 1, 1414711.0000, 4, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (217, CAST(N'2021-06-23T05:24:00.000' AS DateTime), 1, 1198767.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (218, CAST(N'2021-06-13T22:44:00.000' AS DateTime), 1, 1791322.0000, 5, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (219, CAST(N'2021-06-10T04:16:00.000' AS DateTime), 1, 394088.0000, 10, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (220, CAST(N'2021-06-20T19:01:00.000' AS DateTime), 1, 748988.0000, 7, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (221, CAST(N'2021-06-24T02:43:00.000' AS DateTime), 1, 81894.0000, 2, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (222, CAST(N'2021-06-04T12:49:00.000' AS DateTime), 1, 405546.0000, 2, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (223, CAST(N'2021-06-15T04:03:00.000' AS DateTime), 1, 805686.0000, 10, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (224, CAST(N'2021-06-29T00:38:00.000' AS DateTime), 1, 375869.0000, 3, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (225, CAST(N'2021-06-07T22:02:00.000' AS DateTime), 1, 510047.0000, 1, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (226, CAST(N'2021-06-01T20:43:00.000' AS DateTime), 1, 12126.0000, 9, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (227, CAST(N'2021-06-02T14:22:00.000' AS DateTime), 1, 1248218.0000, 7, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (228, CAST(N'2021-06-11T17:52:00.000' AS DateTime), 1, 120730.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (229, CAST(N'2021-06-27T14:24:00.000' AS DateTime), 1, 52393.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (230, CAST(N'2021-06-02T01:33:00.000' AS DateTime), 1, 1367053.0000, 8, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (231, CAST(N'2021-06-28T22:19:00.000' AS DateTime), 1, 1434070.0000, 2, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (232, CAST(N'2021-06-05T17:44:00.000' AS DateTime), 1, 330573.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (233, CAST(N'2021-06-04T14:14:00.000' AS DateTime), 1, 1799982.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (234, CAST(N'2021-06-07T14:12:00.000' AS DateTime), 1, 532503.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (235, CAST(N'2021-06-24T12:30:00.000' AS DateTime), 1, 113011.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (236, CAST(N'2021-06-08T06:39:00.000' AS DateTime), 1, 1339390.0000, 9, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (237, CAST(N'2021-06-20T10:06:00.000' AS DateTime), 1, 250027.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (238, CAST(N'2021-06-21T22:14:00.000' AS DateTime), 1, 413690.0000, 7, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (239, CAST(N'2021-06-05T05:04:00.000' AS DateTime), 1, 94660.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (240, CAST(N'2021-06-17T14:22:00.000' AS DateTime), 1, 1883633.0000, 3, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (241, CAST(N'2021-06-02T02:05:00.000' AS DateTime), 1, 917816.0000, 7, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (242, CAST(N'2021-06-06T14:12:00.000' AS DateTime), 1, 1443030.0000, 5, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (243, CAST(N'2021-06-27T16:03:00.000' AS DateTime), 1, 469969.0000, 5, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (244, CAST(N'2021-06-16T05:14:00.000' AS DateTime), 1, 859626.0000, 7, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (245, CAST(N'2021-06-04T04:06:00.000' AS DateTime), 1, 302580.0000, 1, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (246, CAST(N'2021-06-19T01:06:00.000' AS DateTime), 1, 757742.0000, 10, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (247, CAST(N'2021-06-15T19:34:00.000' AS DateTime), 1, 1284495.0000, 7, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (248, CAST(N'2021-06-12T09:59:00.000' AS DateTime), 1, 1904473.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (249, CAST(N'2021-06-15T22:15:00.000' AS DateTime), 1, 1888517.0000, 3, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (250, CAST(N'2021-06-22T16:23:00.000' AS DateTime), 1, 1772972.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (251, CAST(N'2021-06-26T14:25:00.000' AS DateTime), 1, 1856790.0000, 2, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (252, CAST(N'2021-06-29T09:53:00.000' AS DateTime), 1, 1960962.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (253, CAST(N'2021-06-05T21:04:00.000' AS DateTime), 1, 310340.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (254, CAST(N'2021-06-28T16:48:00.000' AS DateTime), 1, 137369.0000, 1, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (255, CAST(N'2021-06-15T15:18:00.000' AS DateTime), 1, 1868046.0000, 2, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (256, CAST(N'2021-06-05T06:56:00.000' AS DateTime), 1, 927638.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (257, CAST(N'2021-06-27T18:55:00.000' AS DateTime), 1, 453521.0000, 8, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (258, CAST(N'2021-06-26T20:05:00.000' AS DateTime), 1, 1940289.0000, 8, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (259, CAST(N'2021-06-05T17:18:00.000' AS DateTime), 1, 277477.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (260, CAST(N'2021-06-14T23:53:00.000' AS DateTime), 1, 1452134.0000, 11, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (261, CAST(N'2021-06-09T15:10:00.000' AS DateTime), 1, 1344688.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (262, CAST(N'2021-06-01T09:32:00.000' AS DateTime), 1, 1131902.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (263, CAST(N'2021-06-23T14:54:00.000' AS DateTime), 1, 1204328.0000, 2, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (264, CAST(N'2021-06-25T09:12:00.000' AS DateTime), 1, 1511460.0000, 9, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (265, CAST(N'2021-06-02T18:11:00.000' AS DateTime), 1, 1210523.0000, 9, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (266, CAST(N'2021-06-19T02:19:00.000' AS DateTime), 1, 1131857.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (267, CAST(N'2021-06-02T07:12:00.000' AS DateTime), 1, 222327.0000, 9, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (268, CAST(N'2021-06-07T15:17:00.000' AS DateTime), 1, 669767.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (269, CAST(N'2021-06-02T14:45:00.000' AS DateTime), 1, 932530.0000, 11, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (270, CAST(N'2021-06-25T17:18:00.000' AS DateTime), 1, 1741500.0000, 6, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (271, CAST(N'2021-06-26T20:04:00.000' AS DateTime), 1, 333409.0000, 5, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (272, CAST(N'2021-06-12T18:25:00.000' AS DateTime), 1, 122499.0000, 3, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (273, CAST(N'2021-06-07T18:19:00.000' AS DateTime), 1, 1000188.0000, 1, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (274, CAST(N'2021-06-23T02:22:00.000' AS DateTime), 1, 1382983.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (275, CAST(N'2021-06-04T01:01:00.000' AS DateTime), 1, 1019017.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (276, CAST(N'2021-06-08T12:03:00.000' AS DateTime), 1, 1862255.0000, 7, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (277, CAST(N'2021-06-25T13:42:00.000' AS DateTime), 1, 1270771.0000, 7, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (278, CAST(N'2021-06-20T01:31:00.000' AS DateTime), 1, 1836686.0000, 3, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (279, CAST(N'2021-06-16T10:18:00.000' AS DateTime), 1, 1555108.0000, 4, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (280, CAST(N'2021-06-05T03:13:00.000' AS DateTime), 1, 1572173.0000, 2, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (281, CAST(N'2021-06-20T09:50:00.000' AS DateTime), 1, 860722.0000, 3, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (282, CAST(N'2021-06-07T01:45:00.000' AS DateTime), 1, 1137356.0000, 1, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (283, CAST(N'2021-06-06T12:52:00.000' AS DateTime), 1, 657221.0000, 3, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (284, CAST(N'2021-06-05T17:39:00.000' AS DateTime), 1, 545535.0000, 11, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (285, CAST(N'2021-06-25T08:46:00.000' AS DateTime), 1, 146908.0000, 4, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (286, CAST(N'2021-06-20T21:49:00.000' AS DateTime), 1, 1958836.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (287, CAST(N'2021-06-22T20:36:00.000' AS DateTime), 1, 1473927.0000, 6, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (288, CAST(N'2021-06-13T16:29:00.000' AS DateTime), 1, 661859.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (289, CAST(N'2021-06-29T13:49:00.000' AS DateTime), 1, 1050988.0000, 2, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (290, CAST(N'2021-06-06T05:57:00.000' AS DateTime), 1, 561462.0000, 11, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (291, CAST(N'2021-06-01T08:41:00.000' AS DateTime), 1, 762644.0000, 6, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (292, CAST(N'2021-06-12T09:02:00.000' AS DateTime), 1, 352845.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (293, CAST(N'2021-06-28T00:17:00.000' AS DateTime), 1, 1171766.0000, 4, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (294, CAST(N'2021-06-23T12:35:00.000' AS DateTime), 1, 700946.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (295, CAST(N'2021-06-18T07:23:00.000' AS DateTime), 1, 41508.0000, 4, 103)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (296, CAST(N'2021-06-09T02:53:00.000' AS DateTime), 1, 787942.0000, 9, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (297, CAST(N'2021-06-29T19:23:00.000' AS DateTime), 1, 588367.0000, 11, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (298, CAST(N'2021-06-11T08:29:00.000' AS DateTime), 1, 337243.0000, 11, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (299, CAST(N'2021-06-23T22:08:00.000' AS DateTime), 1, 1334802.0000, 3, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (300, CAST(N'2021-06-13T23:46:00.000' AS DateTime), 1, 179486.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (301, CAST(N'2021-06-11T15:45:00.000' AS DateTime), 1, 879565.0000, 2, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (302, CAST(N'2021-06-29T02:31:00.000' AS DateTime), 1, 1365606.0000, 1, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (303, CAST(N'2021-06-02T23:14:00.000' AS DateTime), 1, 850572.0000, 6, 107)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (304, CAST(N'2021-06-21T03:56:00.000' AS DateTime), 1, 1541878.0000, 5, 104)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (305, CAST(N'2021-06-18T07:02:00.000' AS DateTime), 1, 1164276.0000, 5, 102)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (306, CAST(N'2021-06-11T12:49:00.000' AS DateTime), 1, 1295435.0000, 8, 106)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (307, CAST(N'2021-06-13T22:01:00.000' AS DateTime), 1, 1843709.0000, 6, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (308, CAST(N'2021-06-27T06:19:00.000' AS DateTime), 1, 1057253.0000, 10, 106)
GO
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (309, CAST(N'2021-06-28T12:47:00.000' AS DateTime), 1, 1653174.0000, 5, 105)
INSERT [dbo].[ProductOrder] ([OID], [Date], [Qty], [Price], [PID], [UID]) VALUES (310, CAST(N'2021-06-17T12:46:00.000' AS DateTime), 1, 125848.0000, 1, 105)
SET IDENTITY_INSERT [dbo].[ProductOrder] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RID], [RoleName]) VALUES (10, N'test')
INSERT [dbo].[Role] ([RID], [RoleName]) VALUES (11, N'test 2')
INSERT [dbo].[Role] ([RID], [RoleName]) VALUES (12, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (102, N'admin', N'd4024f4de8599324ae0b5d88166b1747370694a1', 10)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (103, N'user', N'5aeab491111c7f36312ea910735acd437901939f', 12)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (104, N'user2', N'7dfc58314aaf31da82a1049fada36a129fc37016', 12)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (105, N'user3', N'e9e7afbe422ea61c3039fe864a6811cb0d34e0bc', 12)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (106, N'user123', N'2583d8f21124feb0776a3c58a8ba19ef8a77f1cf', 12)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (107, N'user1234', N'48b659882d6759ccb42e2bb0702de6adc1b4c45b', 12)
INSERT [dbo].[User] ([UID], [Username], [Password], [RID]) VALUES (108, N'Username', N'49893021ca90b5b0c95a8e15bdac343e14bb72eb', 12)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E402946CCB]    Script Date: 2021/06/14 20:39:55 ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[Category] ([CID])
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[ProductOrder]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([UID])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([UID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Role] ([RID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Product] ([PID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([UID])
GO
USE [master]
GO
ALTER DATABASE [PROG7311T2] SET  READ_WRITE 
GO
