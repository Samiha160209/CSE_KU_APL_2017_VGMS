USE [master]
GO
/****** Object:  Database [VgmsDb]    Script Date: 4/12/17 10:32:46 AM ******/
CREATE DATABASE [VgmsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VgmsDb', FILENAME = N'D:\C# Projects\VideoGallery\VgmsDb\VgmsDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VgmsDb_log', FILENAME = N'D:\C# Projects\VideoGallery\VgmsDb\VgmsDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VgmsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VgmsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VgmsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VgmsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VgmsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VgmsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [VgmsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VgmsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VgmsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VgmsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VgmsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VgmsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VgmsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VgmsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VgmsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VgmsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VgmsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VgmsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VgmsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VgmsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VgmsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VgmsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VgmsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VgmsDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VgmsDb] SET  MULTI_USER 
GO
ALTER DATABASE [VgmsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VgmsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VgmsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VgmsDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VgmsDb]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [int] NOT NULL,
	[GenderEnumId] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Diposite] [float] NOT NULL,
	[CreateById] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateById] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalItem] [int] NOT NULL,
	[TotalSellingPrice] [real] NOT NULL,
	[CreateById] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateById] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tranjection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[DurationInMin] [float] NOT NULL,
	[VideoTypeId] [int] NOT NULL,
	[Actors] [nvarchar](max) NOT NULL,
	[Directors] [nvarchar](max) NOT NULL,
	[Producers] [nvarchar](max) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[StatusEnumId] [int] NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((0)),
	[TotalItem] [int] NOT NULL CONSTRAINT [DF_Product_Stock]  DEFAULT ((0)),
	[TotalSold] [int] NOT NULL CONSTRAINT [DF_Product_SoldCount]  DEFAULT ((0)),
	[BuyPrice] [real] NOT NULL CONSTRAINT [DF_Product_BuyPrice]  DEFAULT ((50.00)),
	[SellingPrice] [real] NOT NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0.00)),
 CONSTRAINT [PK_VideoInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rented]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rented](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[TranjectionId] [int] NOT NULL,
	[RentDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[PriceAmount] [float] NOT NULL,
	[RentAmount] [float] NOT NULL,
 CONSTRAINT [PK_Rented] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sold]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sold](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitSellingPrice] [real] NOT NULL,
	[TotalPrice] [real] NOT NULL,
	[SaleDate] [datetime] NOT NULL CONSTRAINT [DF_Sold_SaleDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Sold] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 4/12/17 10:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](256) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Mobile] [nvarchar](256) NOT NULL CONSTRAINT [DF_UserInfo_Mobile]  DEFAULT ((880)),
	[Dob] [datetime] NOT NULL CONSTRAINT [DF_UserInfo_Dob]  DEFAULT (getdate()),
	[GenderEnumId] [int] NOT NULL CONSTRAINT [DF_UserInfo_Gender]  DEFAULT ((0)),
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Address], [MobileNumber], [GenderEnumId], [Email], [Diposite], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (1, N'Kabir Ahmed', N'Farazipara,Khulna', 195569401, 0, N'kabirkpcl@gmail.com', 300, 1, CAST(N'2017-04-04 02:28:08.237' AS DateTime), 1, CAST(N'2017-04-04 02:28:08.237' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [MobileNumber], [GenderEnumId], [Email], [Diposite], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (2, N'Moushan', N'Rupsa, Khulna', 1772121415, 1, N'Mousannaznin@gmail.com', 250, 1, CAST(N'2017-04-11 10:51:03.843' AS DateTime), 1, CAST(N'2017-04-11 10:51:03.843' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (1, 3, 180, 0, CAST(N'2017-04-09 21:29:03.173' AS DateTime), 0, CAST(N'2017-04-09 21:29:03.173' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (2, 3, 120, 0, CAST(N'2017-04-02 21:37:32.863' AS DateTime), 0, CAST(N'2017-04-09 21:37:32.863' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (3, 7, 360, 0, CAST(N'2017-04-07 21:41:55.537' AS DateTime), 0, CAST(N'2017-04-09 21:42:17.183' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (4, 2, 60, 0, CAST(N'2017-04-09 21:47:14.460' AS DateTime), 0, CAST(N'2017-04-09 21:47:14.460' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (5, 4, 180, 0, CAST(N'2017-04-10 12:37:32.540' AS DateTime), 0, CAST(N'2017-04-10 12:37:32.540' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (6, 2, 120, 0, CAST(N'2017-04-10 21:59:25.227' AS DateTime), 0, CAST(N'2017-04-10 21:59:25.227' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (7, 6, 360, 0, CAST(N'2017-04-11 01:08:17.230' AS DateTime), 0, CAST(N'2017-04-11 01:08:17.230' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (8, 3, 180, 0, CAST(N'2017-04-11 11:26:50.820' AS DateTime), 0, CAST(N'2017-04-11 11:26:50.820' AS DateTime))
INSERT [dbo].[Invoice] ([Id], [TotalItem], [TotalSellingPrice], [CreateById], [CreateDate], [UpdateById], [UpdateDate]) VALUES (9, 5, 300, 0, CAST(N'2017-04-11 11:52:00.560' AS DateTime), 0, CAST(N'2017-04-11 11:52:00.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (1, N'Iron Man', 120, 0, N'Robert Downeyjr', N'Jhon Favrean', N'Maek Fergw', CAST(N'2008-05-02 12:41:30.493' AS DateTime), N'\ProductImage\34.jpg', 0, 30, 9, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (2, N'The Avengers', 110, 0, N'Chris Evans', N'Joss Whedon', N'Zak Penn', CAST(N'2012-05-04 12:41:30.493' AS DateTime), N'\ProductImage\2.jpg', 0, 30, 6, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (3, N'Captain America', 125, 0, N'Chris Evans', N'Joe Johnston', N'Jack Kirby', CAST(N'2011-07-22 12:41:30.493' AS DateTime), N'\ProductImage\36.jpg', 0, 30, 4, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (4, N'Thor', 100, 0, N'Chris Hemsworth', N'Kenneth Branagh', N'Ashley Miller', CAST(N'2011-05-06 12:41:30.493' AS DateTime), N'\ProductImage\37.jpg', 0, 30, 6, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (5, N'Big Hero 6', 110, 0, N'Ryan Potter', N'Dan Hall', N'Jordon Roberts', CAST(N'2014-11-04 12:41:30.000' AS DateTime), N'\ProductImage\5.jpg', 0, 30, 2, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (6, N'Kung Fu Panda', 110, 0, N'Jack Black', N'Marke Osborne', N'Ethen Rief', CAST(N'2008-06-06 12:41:30.493' AS DateTime), N'\ProductImage\6.jpg', 0, 30, 2, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (7, N'Kung Fu Panda 2', 100, 0, N'Jack Black', N'Jenifer Yu', N'Goln Berger', CAST(N'2011-05-26 12:41:30.493' AS DateTime), N'\ProductImage\7.jpg', 0, 30, 0, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (8, N'Moana', 95, 0, N'Dwayne Jonson', N'Dan Hall', N'Jored Bush', CAST(N'2016-11-23 12:41:30.493' AS DateTime), N'\ProductImage\8.jpg', 0, 30, 1, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (9, N'Kung Fu Panda 3', 100, 0, N'Jack Black', N'Jennifer Yuh Nelson', N'Golnn Berger', CAST(N'2016-01-23 12:41:30.493' AS DateTime), N'\ProductImage\9.jpg', 0, 30, 2, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (10, N'Iron Man 2', 125, 0, N'Robert Downey Jr.', N'Jon Faveau', N'Stan Lee', CAST(N'2010-05-07 12:41:30.493' AS DateTime), N'\ProductImage\10.jpg', 0, 30, 0, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (11, N'Iron Man 3', 130, 0, N'Robert Downey Jr.', N'Shane Black', N'Shane Black', CAST(N'2012-05-03 12:41:30.493' AS DateTime), N'\ProductImage\11.jpg', 0, 30, 2, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (12, N'The Avengers : Age Of Ultron', 130, 0, N'Chris Hemswath', N'Joss Whedon', N'Stan Lee', CAST(N'2015-05-01 12:41:30.493' AS DateTime), N'\ProductImage\12.jpg', 0, 30, 0, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (13, N'Captain America : The Winter Soilder', 130, 0, N'Chirs Evans ', N'Anthony Russo', N'Jack Kirby', CAST(N'2014-07-22 12:41:30.493' AS DateTime), N'\ProductImage\13.jpg', 0, 30, 0, 50, 60)
INSERT [dbo].[Product] ([Id], [Title], [DurationInMin], [VideoTypeId], [Actors], [Directors], [Producers], [ReleaseDate], [ImagePath], [StatusEnumId], [TotalItem], [TotalSold], [BuyPrice], [SellingPrice]) VALUES (14, N'Captain America : Civil War ', 130, 0, N'Chris Evans  ', N'Joe Russo', N'Joe Simon ', CAST(N'2016-05-06 12:41:30.493' AS DateTime), N'\ProductImage\14.jpg', NULL, 10, 0, 100, 110)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Sold] ON 

INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (1, 3, 1, 3, 60, 180, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (2, 2, 2, 2, 60, 120, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (3, 4, 3, 3, 60, 180, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (4, 3, 3, 1, 60, 60, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (5, 5, 3, 2, 60, 120, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (6, 1, 4, 1, 60, 60, CAST(N'2017-04-09 23:32:12.793' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (7, 4, 5, 3, 60, 180, CAST(N'2017-04-10 12:37:32.630' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (8, 2, 6, 2, 60, 120, CAST(N'2017-04-10 21:59:25.327' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (9, 11, 7, 2, 60, 120, CAST(N'2017-04-11 01:08:17.247' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (10, 9, 7, 2, 60, 120, CAST(N'2017-04-11 01:08:17.247' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (11, 1, 7, 2, 60, 120, CAST(N'2017-04-11 01:08:17.247' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (12, 6, 8, 2, 60, 120, CAST(N'2017-04-11 11:26:50.867' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (13, 8, 8, 1, 60, 60, CAST(N'2017-04-11 11:26:50.880' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (14, 1, 9, 3, 60, 180, CAST(N'2017-04-11 11:52:00.577' AS DateTime))
INSERT [dbo].[Sold] ([Id], [ProductId], [InvoiceId], [Quantity], [UnitSellingPrice], [TotalPrice], [SaleDate]) VALUES (15, 2, 9, 2, 60, 120, CAST(N'2017-04-11 11:52:00.577' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sold] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [FullName], [UserName], [Password], [Email], [Mobile], [Dob], [GenderEnumId]) VALUES (15, N'Samiha Ahmed', N'SamihaSaint', N'sami1234', N'samihasaint@gmail.com', N'01735973674', CAST(N'1998-05-13 10:54:55.000' AS DateTime), 1)
INSERT [dbo].[UserInfo] ([Id], [FullName], [UserName], [Password], [Email], [Mobile], [Dob], [GenderEnumId]) VALUES (16, N'Fatimatuj Jhora', N'Mesu13', N'160213', N'fatimamesu16@gmail.com', N'01625668814', CAST(N'1998-05-02 11:05:25.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_UserName]    Script Date: 4/12/17 10:32:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_UserName] ON [dbo].[UserInfo]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Customer]
GO
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Product]
GO
ALTER TABLE [dbo].[Sold]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[Sold] CHECK CONSTRAINT [FK_Sold_Invoice]
GO
ALTER TABLE [dbo].[Sold]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Sold] CHECK CONSTRAINT [FK_Sold_Product]
GO
USE [master]
GO
ALTER DATABASE [VgmsDb] SET  READ_WRITE 
GO
