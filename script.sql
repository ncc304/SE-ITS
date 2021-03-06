USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = OFF
GO
USE [SWP391]
GO
/****** Object:  Schema [SWP391]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE SCHEMA [SWP391]
GO
/****** Object:  Table [SWP391].[Account]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Account](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[Account_Status_idAccount_Status] [int] NOT NULL,
	[name] [nvarchar](150) NULL,
	[phone_number] [nvarchar](11) NULL,
	[isAdmin] [smallint] NULL,
 CONSTRAINT [PK_Account_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[Account_Status_idAccount_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Account_Status]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Account_Status](
	[idAccount_Status] [int] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](45) NULL,
 CONSTRAINT [PK_Account_Status_idAccount_Status] PRIMARY KEY CLUSTERED 
(
	[idAccount_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Company]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Company](
	[idCompany] [int] IDENTITY(6,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_Company_idCompany] PRIMARY KEY CLUSTERED 
(
	[idCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Event_Category]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Event_Category](
	[idEvent_Category] [int] IDENTITY(5,1) NOT NULL,
	[name] [nvarchar](45) NULL,
 CONSTRAINT [PK_Event_Category_idEvent_Category] PRIMARY KEY CLUSTERED 
(
	[idEvent_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Event_Category_has_Events]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Event_Category_has_Events](
	[Event_Category_id] [int] NOT NULL,
	[Events_id] [int] NOT NULL,
	[id] [int] IDENTITY(6,1) NOT NULL,
 CONSTRAINT [PK_Event_Category_has_Events_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Event_Images]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Event_Images](
	[idEvent_Images] [int] IDENTITY(10,1) NOT NULL,
	[link] [nvarchar](max) NULL,
	[Events_id] [int] NOT NULL,
 CONSTRAINT [PK_Event_Images_idEvent_Images] PRIMARY KEY CLUSTERED 
(
	[idEvent_Images] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Event_Videos]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Event_Videos](
	[idEvent_Videos] [int] IDENTITY(3,1) NOT NULL,
	[link] [nvarchar](max) NULL,
	[Events_id] [int] NOT NULL,
 CONSTRAINT [PK_Event_Videos_idEvent_Videos] PRIMARY KEY CLUSTERED 
(
	[idEvent_Videos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Events]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Events](
	[id] [int] IDENTITY(20,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[startDate] [datetime2](0) NULL,
	[endDate] [datetime2](0) NULL,
	[status] [smallint] NULL,
	[description] [nvarchar](max) NULL,
	[owner] [nvarchar](150) NULL,
	[type] [nvarchar](45) NULL,
	[createDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Events_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Events_has_Account]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Events_has_Account](
	[Events_id] [int] NOT NULL,
	[Account_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_Events_has_Account_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Major]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Major](
	[idMajor] [int] IDENTITY(3,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[overview] [nvarchar](max) NULL,
	[Skill] [nvarchar](max) NULL,
	[experience] [nvarchar](max) NULL,
	[job_opportunity] [nvarchar](max) NULL,
 CONSTRAINT [PK_Major_idMajor] PRIMARY KEY CLUSTERED 
(
	[idMajor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[News]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[News](
	[id] [int] IDENTITY(6,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[status] [smallint] NULL,
	[create_time] [datetime] NULL,
	[content] [nvarchar](max) NULL,
	[author] [nvarchar](150) NULL,
	[view] [int] NULL,
 CONSTRAINT [PK_News_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[News_Images]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[News_Images](
	[idNews_Images] [int] IDENTITY(3,1) NOT NULL,
	[link] [nvarchar](max) NULL,
	[News_id] [int] NOT NULL,
 CONSTRAINT [PK_News_Images_idNews_Images] PRIMARY KEY CLUSTERED 
(
	[idNews_Images] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[News_Tags]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[News_Tags](
	[idNews_Tags] [int] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](45) NULL,
 CONSTRAINT [PK_News_Tags_idNews_Tags] PRIMARY KEY CLUSTERED 
(
	[idNews_Tags] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[News_Tags_has_News]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[News_Tags_has_News](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[News_Tags_idNews_Tags] [int] NOT NULL,
	[News_id] [int] NOT NULL,
 CONSTRAINT [PK_News_Tags_has_News_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[News_Videos]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[News_Videos](
	[idNews_Videos] [int] IDENTITY(3,1) NOT NULL,
	[link] [nvarchar](max) NULL,
	[News_id] [int] NOT NULL,
 CONSTRAINT [PK_News_Videos_idNews_Videos] PRIMARY KEY CLUSTERED 
(
	[idNews_Videos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Recruitment]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Recruitment](
	[idRecruitment] [int] IDENTITY(6,1) NOT NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[salary] [real] NULL,
	[description] [nvarchar](max) NULL,
	[Company_id] [int] NOT NULL,
	[status] [smallint] NULL,
	[name] [nvarchar](150) NULL,
	[owner] [nvarchar](150) NULL,
	[createDate] [datetime2](0) NULL,
 CONSTRAINT [PK_Recruitment_idRecruitment] PRIMARY KEY CLUSTERED 
(
	[idRecruitment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Recruitment_Category]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Recruitment_Category](
	[idRecruitment_Category] [int] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Recruitment_Category_idRecruitment_Category] PRIMARY KEY CLUSTERED 
(
	[idRecruitment_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Recruitment_has_Recruitment_Category]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Recruitment_has_Recruitment_Category](
	[Recruitment_id] [int] NOT NULL,
	[Recruitment_Category_id] [int] NOT NULL,
	[id] [int] IDENTITY(3,1) NOT NULL,
 CONSTRAINT [PK_Recruitment_has_Recruitment_Category_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Student_Application]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Student_Application](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[phone] [nvarchar](max) NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_Student_Application_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SWP391].[Subjects]    Script Date: 4/6/2022 9:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SWP391].[Subjects](
	[idSubjects] [int] IDENTITY(3,1) NOT NULL,
	[link] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[Major_idMajor] [int] NOT NULL,
	[status] [smallint] NULL,
 CONSTRAINT [PK_Subjects_idSubjects] PRIMARY KEY CLUSTERED 
(
	[idSubjects] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [SWP391].[Account] ON 

INSERT [SWP391].[Account] ([id], [email], [Account_Status_idAccount_Status], [name], [phone_number], [isAdmin]) VALUES (4, N'nguyenchicuong304@gmail.com', 4, N'CuongNC', N'0909090909', 1)
INSERT [SWP391].[Account] ([id], [email], [Account_Status_idAccount_Status], [name], [phone_number], [isAdmin]) VALUES (24, N'sangndse140959@fpt.edu.vn', 4, N'sangndse140959', N'', 0)
INSERT [SWP391].[Account] ([id], [email], [Account_Status_idAccount_Status], [name], [phone_number], [isAdmin]) VALUES (25, N'cuongncse140042@fpt.edu.vn', 5, N'cuongncse140042', N'', 0)
INSERT [SWP391].[Account] ([id], [email], [Account_Status_idAccount_Status], [name], [phone_number], [isAdmin]) VALUES (26, N'sangndxyz@gmail.com', 6, N'sangndxyz', N'', 0)
SET IDENTITY_INSERT [SWP391].[Account] OFF
GO
SET IDENTITY_INSERT [SWP391].[Account_Status] ON 

INSERT [SWP391].[Account_Status] ([idAccount_Status], [name]) VALUES (4, N'login')
INSERT [SWP391].[Account_Status] ([idAccount_Status], [name]) VALUES (5, N'logout')
INSERT [SWP391].[Account_Status] ([idAccount_Status], [name]) VALUES (6, N'delete')
SET IDENTITY_INSERT [SWP391].[Account_Status] OFF
GO
SET IDENTITY_INSERT [SWP391].[Company] ON 

INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (6, N'FPT Software', N'Đường D1, Đ. D1, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh 715650', N'fsoft.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (7, N'VNG', N'Z06 đường số 13, phường Tân Thuận Đông, Quận 7, TP.HCM', N'vng.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (8, N'KMS Technology', N'Số 123, Đường Cộng Hòa, Phường 12, Quận Tân Bình, Thành phố Hồ Chí Minh, Việt Nam', N'KMS.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (9, N'Momo', N'12 Tân Trào, Tân Phú, Quận 7, Thành phố Hồ Chí Minh', N'momo.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (10, N'Viettel', N'Tầng 5, Tòa nhà Thành Công, 80 Dịch Vọng Hậu, Cầu Giấy, Hà Nội.', N'viettel.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (11, N'Vinova', N'Trụ sở 28/14 Lê Thị Hồng, Phường 17, Quận Gò Vấp, TP Hồ Chí Minh', N'vinova.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (12, N'Harvey Nash', N'Tòa Nhà Etown, Lầu 3, Số 364 Cộng Hòa - Quận Tân Bình - TP Hồ Chí Minh', N'Harvey_Nash.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (13, N'Global CyberSoft', N'1 Tô Ký, Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh', N'Global_CyberSoft.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (14, N'Fujinet Systems JSC', N'51A Phạm Hùng, Phường 9, Quận 8, Thành phố Hồ Chí Minh', N'Fujinet _Systems_JSC.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (15, N'Netcompany', N'90 Đ. Nguyễn Hữu Cảnh, Phường 22, Bình Thạnh, Thành phố Hồ Chí Minh', N'Netcompany.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (16, N'ASUS Viet Nam', N'285 Cách Mạng Tháng Tám, Phường 12, Quận 10, Thành phố Hồ Chí Minh', N'ASUS.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (17, N'NashTech Viet Nam', N'279 Nguyễn Tri Phương, Quận 10', N'NashTech.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (18, N'Techbase Viet Nam', N'Lầu 10, Tháp 2 Tòa nhà Saigon Centre, số 67 Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', N'Techbase.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (19, N'Bosch Viet Nam33', N'Khu Công nghiệp Long Thành, Xã Tam An, Huyện Long Thành, Tỉnh Đồng Nai, Việt Nam33', N'Bosch.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (20, N'Axon Active Viet Nam', N'Số 39B, Đường Trường Sơn, Phường 4, Quận Tân Bình, Thành phố Hồ Chí Minh', N'Axon_Active.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (21, N'Nexus Frontier Tech', N'Số 16A Lý Nam Đế, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội, Việt Nam', N'Nexus_Frontier_Tech.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (22, N'ép sốp', N'quận 9', N'fsoft.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (23, N'BOSCH test', N'BOSCH test HCM', N'Bosch.png', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (24, N'VNG test', N'VNG test hcm', N'vng.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (25, N'ASUS test1', N'ASUS test HCM1', N'ASUS.jpg', 1)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (26, N'test cty', N'hcm', N'Harvey_Nash.jpg', 0)
INSERT [SWP391].[Company] ([idCompany], [name], [address], [image], [status]) VALUES (27, N'MISA', N'Tòa nhà MISA, Lô 5, Công viên phần mềm Quang Trung, 49 Tô Ký, Phường Tân Chánh Hiệp, Quận 12, TP.HCM', N'misa.jpg', 1)
SET IDENTITY_INSERT [SWP391].[Company] OFF
GO
SET IDENTITY_INSERT [SWP391].[Event_Category] ON 

INSERT [SWP391].[Event_Category] ([idEvent_Category], [name]) VALUES (5, N'Trí tuệ nhân tạo')
INSERT [SWP391].[Event_Category] ([idEvent_Category], [name]) VALUES (6, N'Nhạc cụ')
INSERT [SWP391].[Event_Category] ([idEvent_Category], [name]) VALUES (7, N'Hợp tác doanh nghiệp')
INSERT [SWP391].[Event_Category] ([idEvent_Category], [name]) VALUES (8, N'Văn hóa dân tộc')
SET IDENTITY_INSERT [SWP391].[Event_Category] OFF
GO
SET IDENTITY_INSERT [SWP391].[Event_Category_has_Events] ON 

INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (8, 20, 6)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 21, 7)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (7, 22, 9)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (5, 23, 10)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (5, 24, 11)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 25, 12)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (5, 26, 13)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (7, 27, 14)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (8, 28, 15)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 29, 16)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 30, 17)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (8, 31, 18)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 32, 19)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (8, 33, 20)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 34, 21)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 35, 22)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (7, 36, 23)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (7, 37, 24)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (5, 38, 25)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (7, 39, 26)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (6, 40, 27)
INSERT [SWP391].[Event_Category_has_Events] ([Event_Category_id], [Events_id], [id]) VALUES (8, 41, 28)
SET IDENTITY_INSERT [SWP391].[Event_Category_has_Events] OFF
GO
SET IDENTITY_INSERT [SWP391].[Event_Images] ON 

INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (10, N'hoixuan.jpg', 20)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (11, N'cover2.jpg', 21)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (12, N'vng.jpg', 22)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (13, N'banner-Data-Warehouse.png', 23)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (14, N'nguon.jpg', 24)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (15, N'job1.png', 25)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (16, N'1.jpg', 26)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (17, N'Capture.PNG', 27)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (18, N'bg-form-login.jpg', 28)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (19, N'cover2.jpg', 29)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (20, N'1.jpg', 30)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (21, N'hoén.jpg', 31)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (22, N'Capture.PNG', 32)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (23, N'hoén.jpg', 33)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (24, N'cover2.jpg', 34)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (25, N'cover2.jpg', 35)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (26, N'NashTech.jpg', 36)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (27, N'NashTech.jpg', 37)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (28, N'fsoft.jpg', 38)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (29, N'checkmate.jpg', 39)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (30, N'hoén.jpg', 40)
INSERT [SWP391].[Event_Images] ([idEvent_Images], [link], [Events_id]) VALUES (31, N'nhaccu1.jpg', 41)
SET IDENTITY_INSERT [SWP391].[Event_Images] OFF
GO
SET IDENTITY_INSERT [SWP391].[Events] ON 

INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (20, N'Xuân Về', CAST(N'2022-01-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-05T00:00:00.0000000' AS DateTime2), 1, N'<p>C&oacute; lẽ những ng&agrave;y gi&aacute;p Tết đối với rất nhiều đứa trẻ x&oacute;m chợ l&agrave; những ng&agrave;y m&agrave; ch&uacute;ng t&igrave;m thấy niềm vui v&agrave; sự th&iacute;ch th&uacute;. Nhưng những ng&agrave;y Tết lại l&agrave; điều m&agrave; ch&uacute;ng mong đợi hơn bao giờ hết. Ng&agrave;y Tết qu&ecirc; em thực sự &yacute; nghĩa v&agrave; l&agrave; điều đ&aacute;ng nhớ để bắt đầu một năm mới.</p>

<p>&nbsp;</p>

<p>M&ugrave;a xu&acirc;n đến, Tết đ&atilde; g&otilde; của mọi nh&agrave;, niềm vui nh&acirc;n đ&ocirc;i, hạnh ph&uacute;c bội phần. Trẻ con chờ mong ng&agrave;y Tết c&ograve;n nhiều hơn l&agrave; người lớn. Người lớn bảo Tết vui vẻ nhưng c&oacute; nhiều điều phải lo toan hơn, sắm sửa nhiều thứ hơn v&agrave; tốn nhiều tiền hơn. Nhưng trẻ con kh&ocirc;ng quan t&acirc;m điều đ&oacute;, v&igrave; Tết l&agrave; dịp để ch&uacute;ng em c&oacute; th&ecirc;m nhiều quần &aacute;o mới, được nhận l&igrave; x&igrave;, qu&agrave; b&aacute;nh ăn kh&ocirc;ng hết v&agrave; kh&ocirc;ng phải học b&agrave;i. C&oacute; lẽ đ&oacute; l&agrave; điều đứa trẻ n&agrave;o cũng th&iacute;ch th&uacute;.</p>

<p>&nbsp;</p>

<p>Em kh&ocirc;ng biết ng&agrave;y Tết ở những nơi kh&aacute;c như thế n&agrave;o nhưng ng&agrave;y Tết ở qu&ecirc; em lu&ocirc;n tr&agrave;n đầy tiếng cười v&agrave; lời ch&uacute;c ph&uacute;c cho nhau một năm mới an l&agrave;nh, ph&aacute;t t&agrave;i ph&aacute;t lộc. Tr&ecirc;n những con đường nhỏ c&ograve;n bốc m&ugrave;i sỏi đ&aacute;, đ&aacute;m cỏ phủ k&iacute;n lối đ&atilde; được người d&acirc;n ở th&ocirc;n x&oacute;m cắt tỉa rất sạch sẽ. V&igrave; ở x&oacute;m em cứ chiều 30 Tết mọi nh&agrave; lại rủ nhau đi qu&eacute;t dọn đường l&agrave;ng ng&otilde; x&oacute;m để chuẩn bị đ&oacute;n Tết.</p>

<p>&nbsp;</p>

<p>Ai cũng h&aacute;o hức v&agrave; chăm chỉ, kh&ocirc;ng ai tị nạnh ai, mọi người l&agrave;m việc hăng say, nhiệt t&igrave;nh. Đ&aacute;m con n&iacute;t t&iacute;u ta t&iacute;u t&iacute;t kh&ocirc;ng ngờ, cứ đ&ograve;i gi&agrave;nh phần ba mẹ để l&agrave;m, nhưng l&agrave;m được một l&uacute;c l&agrave; ch&aacute;n, l&agrave; bỏ đ&oacute; đi chơi. Những l&aacute; cờ Tổ quốc được treo cao tr&ecirc;n m&aacute;i ng&oacute;i đỏ tươi, bay phấp phới giữa bầu trời tạo n&ecirc;n kh&ocirc;ng kh&iacute; vui tươi, phấn khởi. C&oacute; lẽ m&ugrave;a xu&acirc;n khiến cho kh&ocirc;ng kh&iacute; của mọi nh&agrave; trở n&ecirc;n ấm &aacute;p v&agrave; an l&agrave;nh.</p>

<p>&nbsp;</p>

<p>Mặc d&ugrave; thời tiết vẫn c&ograve;n lạnh, sương đầu ng&agrave;y c&ograve;n lảng bảng b&aacute;m k&iacute;n tr&ecirc;n c&agrave;nh c&acirc;y nhưng nụ cười của mọi người lu&ocirc;n ở tr&ecirc;n m&ocirc;i. Ng&agrave;y Tết, trẻ con h&aacute;o hức, lựa chọn quần &aacute;o đẹp v&agrave; mới nhất để mặc, để đi chơi, để ch&uacute;c thọ &ocirc;ng b&agrave;. Đứa trẻ n&agrave;o cũng kiếm c&aacute;i &aacute;o c&oacute; t&uacute;i thật to v&agrave; rộng để đựng b&aacute;nh kẹo, tiền l&igrave; x&igrave;. Đ&oacute; cũng l&agrave; điều m&agrave; em mong đợi trong suốt những ng&agrave;y Tết.</p>
', N'CuongNC', N'online', CAST(N'2022-04-04T01:17:50.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (21, N'Đêm nhạc bùng cháy', CAST(N'2022-01-10T17:39:02.0000000' AS DateTime2), CAST(N'2022-01-12T00:00:00.0000000' AS DateTime2), 1, N'test nhạc', N'CuongNC', N'online', CAST(N'2022-01-03T09:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (22, N'Giao lưu cùng các cựu sinh viện FPT tại Fsoft', CAST(N'2022-01-15T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), 1, N'test', N'CuongNC', N'offline', CAST(N'2022-01-10T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (23, N'Triển lãm Robot AI', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-23T00:00:00.0000000' AS DateTime2), 1, N'test', N'CuongNC', N'online', CAST(N'2022-03-12T11:23:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (24, N'Name123', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), 0, N'<p>abccc</p>
', N'CuongNC', N'online', CAST(N'2022-04-04T13:47:20.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (25, N'Name2', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), 1, N'test2', N'CuongNC', N'offline', CAST(N'2022-03-13T13:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (26, N'Name3', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), 1, N'test3', N'CuongNC', N'offline', CAST(N'2022-03-13T13:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (27, N'Name4', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), 1, N'test4', N'CuongNC', N'offline', CAST(N'2022-03-13T13:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (28, N'Title số 5', CAST(N'2022-01-20T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-22T00:00:00.0000000' AS DateTime2), 1, N'<p>Công nghệ thông tin (CNTT) đã được Đảng và Chính phủ xác định là hạ tầng của hạ tầng. Từ nay đến năm 2020, Việt Nam cần đến một triệu lao động ngành CNTT trong khi năng lực của hệ thống giáo dục quốc dân chưa đáp ứng đủ về lượng và chất như yêu cầu của các nhà tuyển dụng.</p>', N'CuongNC', N'online', CAST(N'2022-03-13T13:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (29, N'a', CAST(N'2022-03-24T17:00:00.0000000' AS DateTime2), CAST(N'2022-03-27T17:00:00.0000000' AS DateTime2), 1, N'<p>a</p>
', N'CuongNC', N'offline', CAST(N'2022-03-13T13:50:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (30, N'test Title', CAST(N'2022-03-24T21:39:00.0000000' AS DateTime2), CAST(N'2022-03-27T21:39:00.0000000' AS DateTime2), 1, N'<p>b</p>
', N'CuongNC', N'offline', CAST(N'2022-03-13T07:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (31, N'Hồ sen chờ ai?', CAST(N'2022-04-01T10:26:00.0000000' AS DateTime2), CAST(N'2022-04-03T22:26:00.0000000' AS DateTime2), 1, N'<p><strong>Địa điểm: L&ocirc; E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Th&agrave;nh Phố Thủ Đức, Th&agrave;nh phố Hồ Ch&iacute; Minh 700000</strong></p>

<p><strong>Tổng quan ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin:</strong></p>

<p>C&ocirc;ng nghệ th&ocirc;ng tin (CNTT) đ&atilde; được Đảng v&agrave; Ch&iacute;nh phủ x&aacute;c định l&agrave; hạ tầng của hạ tầng. Từ nay đến năm 2020, Việt Nam cần đến một triệu lao động ng&agrave;nh CNTT trong khi năng lực của hệ thống gi&aacute;o dục quốc d&acirc;n chưa đ&aacute;p ứng đủ về lượng v&agrave; chất như y&ecirc;u cầu của c&aacute;c nh&agrave; tuyển dụng.</p>

<p>Tại Trường Đại học FPT, ng&agrave;nh CNTT l&agrave; ng&agrave;nh học c&oacute; tiếng v&agrave; l&acirc;u đời nhất. Chương tr&igrave;nh được thiết kế dựa tr&ecirc;n tham khảo gợi &yacute; chương tr&igrave;nh của Hiệp hội m&aacute;y t&iacute;nh (Association for Computing Machinery-ACM), c&aacute;c trường h&agrave;ng đầu của Mỹ v&agrave; c&aacute;c chuy&ecirc;n gia phần mềm trong c&aacute;c tổ chức v&agrave; doanh nghiệp CNTT như Hiệp hội phần mềm Việt Nam (VINASA), FPT, Chương tr&igrave;nh đ&agrave;o tạo của EC-Council, Học viện mạng v&agrave; phần cứng Jetking (Ấn Độ); c&aacute;c trường Đ&agrave;o tạo Nghệ thuật tr&ecirc;n thế giới, c&aacute;c Hiệp hội về Đ&agrave;o tạo nghệ thuật v&agrave; thiết kế (National Association of Schools of Art and Design &ndash; NASAD).</p>

<p>Sinh vi&ecirc;n được học với những giảng vi&ecirc;n gi&agrave;u kinh nghiệm, trong đ&oacute; c&oacute; nhiều giảng vi&ecirc;n l&agrave; c&aacute;c tiến sỹ, gi&aacute;o sư, chuy&ecirc;n gia đến từ c&aacute;c doanh nghiệp h&agrave;ng đầu trong lĩnh vực CNTT.</p>

<p>Chương tr&igrave;nh ng&agrave;nh CNTT được thiết kế gồm 4 khối kiến thức: Kiến thức chung, kiến thức ng&agrave;nh, chuy&ecirc;n ng&agrave;nh v&agrave; lựa chọn. Chương tr&igrave;nh được thiết kế t&iacute;ch hợp, c&acirc;n bằng giữa kiến thức nền tảng với c&ocirc;ng nghệ, kỹ thuật mới v&agrave; ch&uacute; trọng đến kỹ năng thực h&agrave;nh v&agrave; năng lực ứng dụng, s&aacute;ng tạo. C&aacute;c học phần được gợi &yacute; theo một tiến độ hợp l&yacute; để sinh vi&ecirc;n lựa chọn nhằm th&uacute;c đẩy hứng th&uacute; học tập của sinh vi&ecirc;n ngay từ học kỳ đầu ti&ecirc;n.</p>

<p><strong>Kiến thức chung</strong>: Bao gồm c&aacute;c nội dung về l&yacute; luận ch&iacute;nh trị, ph&aacute;p luật, kỹ năng c&ocirc;ng d&acirc;n thế kỷ 21, ngoại ngữ, gi&aacute;o dục thể chất v&agrave; quốc ph&ograve;ng.</p>

<p><strong>Kiến thức ng&agrave;nh</strong>: Được thiết kế t&iacute;ch hợp c&acirc;n bằng giữa kiến thức nền tảng với c&ocirc;ng nghệ v&agrave; kỹ thuật mới, bao gồm c&aacute;c kiến thức từ nền tảng to&aacute;n học, kiến thức khoa học cơ bản của nh&oacute;m ng&agrave;nh CNTT v&agrave; m&aacute;y t&iacute;nh như ng&ocirc;n ngữ lập tr&igrave;nh, giải thuật, dữ liệu, hệ điều h&agrave;nh, mạng m&aacute;y t&iacute;nh, quy tr&igrave;nh ph&aacute; triển phần mềm, quản trị dự &aacute;n CNTT&hellip; tới c&aacute;c c&ocirc;ng nghệ mới như IOT, tr&iacute; tuệ nh&acirc;n tạo. Với chuy&ecirc;n ng&agrave;nh Thiết kế đồ họa, khối kiến thức ng&agrave;nh gồm c&aacute;c học phần nền tảng về mỹ thuật, thiết kế v&agrave; nền tảng ứng dụng của CNTT trong thiết kế đồ họa.</p>

<p><strong>Kiến thức chuy&ecirc;n ng&agrave;nh</strong>: Sinh vi&ecirc;n ng&agrave;nh CNTT c&oacute; cơ hội lựa chọn một trong s&aacute;u hướng chuy&ecirc;n ng&agrave;nh gồm Kỹ thuật phần mềm, Hệ thống th&ocirc;ng tin, An to&agrave;n th&ocirc;ng tin, Tr&iacute; tuệ nh&acirc;n tạo, IOT, Thiết kế đồ họa.</p>

<p><strong>Khối kiến thức lựa chọn tự do</strong>: Được thiết kế xen kẽ để sinh vi&ecirc;n c&oacute; cơ hội lựa chọn c&aacute;c học phần ưa th&iacute;ch, mở rộng sang lĩnh vực kh&aacute;c hoặc n&acirc;ng cao hơn so với chuy&ecirc;n ng&agrave;nh đ&atilde; học. Sinh vi&ecirc;n c&oacute; thể học từ học phần ri&ecirc;ng lẻ hoặc cả nh&oacute;m học phần về một hướng kỹ thuật, c&ocirc;ng nghệ mới như Blockchain, FinTech, Automative, Data Science,&hellip; Đ&acirc;y l&agrave; c&aacute;c học phần tăng t&iacute;nh chủ động v&agrave; c&aacute; nh&acirc;n h&oacute;a cho từng sinh vi&ecirc;n.</p>

<p><strong>Thời gian học tập</strong></p>

<p>Chương tr&igrave;nh gồm 9 học kỳ chuy&ecirc;n ng&agrave;nh trong đ&oacute;&nbsp;c&oacute; 1 học kỳ học tập tại doanh nghiệp (OJT), chưa kể thời gian r&egrave;n luyện tập trung v&agrave; thời gian học tiếng Anh dự bị (phụ thuộc v&agrave;o tr&igrave;nh độ tiếng Anh đầu v&agrave;o của sinh vi&ecirc;n)</p>

<p>Chương tr&igrave;nh CNTT được ph&acirc;n chia l&agrave;m 4 giai đoạn: giai đoạn chuẩn bị (hời gian r&egrave;n luyện tập trung + thời gian học tiếng Anh dự bị phụ thuộc tr&igrave;nh độ tiếng Anh đầu v&agrave;o của sinh vi&ecirc;n), giai đoạn căn bản (5 học kỳ), giai đoạn học tập thực tế tại doanh nghiệp (OJT, 1 học kỳ) v&agrave; giai đoạn ho&agrave;n th&agrave;nh tốt nghiệp (3 học kỳ cuối).</p>

<p><strong>Y&ecirc;u cầu đầu v&agrave;o</strong></p>

<p>Tốt nghiệp PTTH (hoặc tương đương), đạt quy định tr&uacute;ng tuyển đại học của Bộ GDĐT v&agrave; đủ điều kiện x&eacute;t tuyển của trường Đại học FPT.</p>

<p>Tiếng Anh đạt mức Summit 2 (hoặc tương đương)</p>

<p style="text-align:center"><iframe frameborder="0" height="500" scrolling="no" src="https://drive.google.com/file/d/1fpYS4TT3u1OofKXq2MTENxZPMAhzOvh0/preview" width="500"></iframe></p>

<p style="text-align:center"><iframe frameborder="0" scrolling="no" src="https://www.youtube.com/embed/b7OoE98yj5w"></iframe></p>
', N'CuongNC', N'offline', CAST(N'2022-04-02T15:13:06.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (32, N'd', CAST(N'2022-03-25T17:24:00.0000000' AS DateTime2), CAST(N'2022-04-01T17:24:00.0000000' AS DateTime2), 0, N'<p style="text-align:center"><span style="font-size:22px"><strong>Ch&uacute;c Mừng Sinh Nhật Nguy&ecirc;n Cubu</strong></span></p>

<ul>
	<li>Ch&uacute;c Nguy&ecirc;n sinh nhật vui vẻ</li>
	<li>Khỏe mạnh&nbsp;</li>
	<li>Ch&oacute;ng ra trường</li>
	<li>Mối t&igrave;nh c&agrave;ng s&acirc;u c&agrave;ng đậm</li>
	<li>Kiếm nhiều tiền nu&ocirc;i cường nha :))</li>
</ul>

<p style="text-align:center"><iframe frameborder="0" scrolling="no" src="https://drive.google.com/file/d/1a-I6Tywlc1jaAoJohYik7NM_9dLymTch/preview"></iframe></p>
', N'CuongNC', N'online', CAST(N'2022-04-04T00:10:37.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (33, N'Xuân Về Nơi Ta', CAST(N'2022-03-28T22:36:00.0000000' AS DateTime2), CAST(N'2022-03-31T01:40:00.0000000' AS DateTime2), 1, N'<p>C&oacute; lẽ những ng&agrave;y gi&aacute;p Tết đối với rất nhiều đứa trẻ x&oacute;m chợ l&agrave; những ng&agrave;y m&agrave; ch&uacute;ng t&igrave;m thấy niềm vui v&agrave; sự th&iacute;ch th&uacute;. Nhưng những ng&agrave;y Tết lại l&agrave; điều m&agrave; ch&uacute;ng mong đợi hơn bao giờ hết. Ng&agrave;y Tết qu&ecirc; em thực sự &yacute; nghĩa v&agrave; l&agrave; điều đ&aacute;ng nhớ để bắt đầu một năm mới.</p>

<p>&nbsp;</p>

<p>M&ugrave;a xu&acirc;n đến, Tết đ&atilde; g&otilde; của mọi nh&agrave;, niềm vui nh&acirc;n đ&ocirc;i, hạnh ph&uacute;c bội phần. Trẻ con chờ mong ng&agrave;y Tết c&ograve;n nhiều hơn l&agrave; người lớn. Người lớn bảo Tết vui vẻ nhưng c&oacute; nhiều điều phải lo toan hơn, sắm sửa nhiều thứ hơn v&agrave; tốn nhiều tiền hơn. Nhưng trẻ con kh&ocirc;ng quan t&acirc;m điều đ&oacute;, v&igrave; Tết l&agrave; dịp để ch&uacute;ng em c&oacute; th&ecirc;m nhiều quần &aacute;o mới, được nhận l&igrave; x&igrave;, qu&agrave; b&aacute;nh ăn kh&ocirc;ng hết v&agrave; kh&ocirc;ng phải học b&agrave;i. C&oacute; lẽ đ&oacute; l&agrave; điều đứa trẻ n&agrave;o cũng th&iacute;ch th&uacute;.</p>

<p>&nbsp;</p>

<p>Em kh&ocirc;ng biết ng&agrave;y Tết ở những nơi kh&aacute;c như thế n&agrave;o nhưng ng&agrave;y Tết ở qu&ecirc; em lu&ocirc;n tr&agrave;n đầy tiếng cười v&agrave; lời ch&uacute;c ph&uacute;c cho nhau một năm mới an l&agrave;nh, ph&aacute;t t&agrave;i ph&aacute;t lộc. Tr&ecirc;n những con đường nhỏ c&ograve;n bốc m&ugrave;i sỏi đ&aacute;, đ&aacute;m cỏ phủ k&iacute;n lối đ&atilde; được người d&acirc;n ở th&ocirc;n x&oacute;m cắt tỉa rất sạch sẽ. V&igrave; ở x&oacute;m em cứ chiều 30 Tết mọi nh&agrave; lại rủ nhau đi qu&eacute;t dọn đường l&agrave;ng ng&otilde; x&oacute;m để chuẩn bị đ&oacute;n Tết.</p>

<p>&nbsp;</p>

<p>Ai cũng h&aacute;o hức v&agrave; chăm chỉ, kh&ocirc;ng ai tị nạnh ai, mọi người l&agrave;m việc hăng say, nhiệt t&igrave;nh. Đ&aacute;m con n&iacute;t t&iacute;u ta t&iacute;u t&iacute;t kh&ocirc;ng ngờ, cứ đ&ograve;i gi&agrave;nh phần ba mẹ để l&agrave;m, nhưng l&agrave;m được một l&uacute;c l&agrave; ch&aacute;n, l&agrave; bỏ đ&oacute; đi chơi. Những l&aacute; cờ Tổ quốc được treo cao tr&ecirc;n m&aacute;i ng&oacute;i đỏ tươi, bay phấp phới giữa bầu trời tạo n&ecirc;n kh&ocirc;ng kh&iacute; vui tươi, phấn khởi. C&oacute; lẽ m&ugrave;a xu&acirc;n khiến cho kh&ocirc;ng kh&iacute; của mọi nh&agrave; trở n&ecirc;n ấm &aacute;p v&agrave; an l&agrave;nh.</p>

<p>&nbsp;</p>

<p>Mặc d&ugrave; thời tiết vẫn c&ograve;n lạnh, sương đầu ng&agrave;y c&ograve;n lảng bảng b&aacute;m k&iacute;n tr&ecirc;n c&agrave;nh c&acirc;y nhưng nụ cười của mọi người lu&ocirc;n ở tr&ecirc;n m&ocirc;i. Ng&agrave;y Tết, trẻ con h&aacute;o hức, lựa chọn quần &aacute;o đẹp v&agrave; mới nhất để mặc, để đi chơi, để ch&uacute;c thọ &ocirc;ng b&agrave;. Đứa trẻ n&agrave;o cũng kiếm c&aacute;i &aacute;o c&oacute; t&uacute;i thật to v&agrave; rộng để đựng b&aacute;nh kẹo, tiền l&igrave; x&igrave;. Đ&oacute; cũng l&agrave; điều m&agrave; em mong đợi trong suốt những ng&agrave;y Tết.</p>
', N'CuongNC', N'offline', CAST(N'2022-04-02T15:01:11.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (34, N'Đêm Nhạc Xuân Hạ Thu Đông', CAST(N'2022-03-29T00:41:00.0000000' AS DateTime2), CAST(N'2022-03-31T02:44:00.0000000' AS DateTime2), 1, N'<p><strong>&quot;Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n&quot; l&agrave; một chương tr&igrave;nh truyền h&igrave;nh thực tế về &acirc;m nhạc, với sự g&oacute;p mặt của ba nghệ sĩ ch&iacute;nh: H&ograve;a Minzy, Anh T&uacute;, Hứa Kim Tuyền c&ugrave;ng c&aacute;c kh&aacute;ch mời theo từng tập ph&aacute;t s&oacute;ng.</strong></p>

<p><strong>Anh T&uacute;</strong>,&nbsp;<strong>H&ograve;a Minzy</strong>&nbsp;v&agrave;&nbsp;<strong>Hứa Kim Tuyền</strong>&nbsp;tỏ ra bất ngờ gặp nhau trong<strong>&nbsp;Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>. Cả ba rất h&agrave;o hứng trong lần kết hợp n&agrave;y v&agrave; c&ugrave;ng nhau lập kế hoạch cho buổi diễn đường phố đầu ti&ecirc;n của nh&oacute;m&nbsp;<strong>Đĩa than hồng</strong>&nbsp;hứa hẹn sẽ mang đến nhiều tiết mục bất ngờ cho kh&aacute;n giả.</p>

<p>V&igrave; l&agrave; lần đầu hợp t&aacute;c trong chương tr&igrave;nh truyền h&igrave;nh thực tế, tập 1 của&nbsp;<strong>Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>&nbsp;cũng kh&ocirc;ng tr&aacute;nh khỏi những &quot;s&oacute;ng gi&oacute;&quot; trong nội bộ v&agrave; kế hoạch của nh&oacute;m. Ngay tập đầu, rất nhiều kh&oacute; khăn đ&atilde; xảy ra với nh&oacute;m nhạc ba th&agrave;nh vi&ecirc;n khi H&ograve;a Minzy bị ốm v&agrave; mất giọng, tiếp đ&oacute; l&agrave; những tranh c&atilde;i nảy lửa trong việc chọn b&agrave;i h&aacute;t v&agrave; c&aacute;ch h&aacute;t cho từng ca kh&uacute;c. Xuất ph&aacute;t điểm l&agrave; những nghệ sĩ solo n&ecirc;n khi hoạt động trong c&ugrave;ng một nh&oacute;m bắt buộc phải c&oacute; sự h&ograve;a quyện giữa những c&aacute;i t&ocirc;i đ&oacute;.</p>
', N'CuongNC', N'offline', CAST(N'2022-03-27T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (35, N'Hành trình âm nhạc "Xuân Hạ Thu Đông rồi lại Xuân" bắt đầu!', CAST(N'2022-03-30T22:42:00.0000000' AS DateTime2), CAST(N'2022-03-31T22:42:00.0000000' AS DateTime2), 1, N'<p><strong>&quot;Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n&quot; l&agrave; một chương tr&igrave;nh truyền h&igrave;nh thực tế về &acirc;m nhạc, với sự g&oacute;p mặt của ba nghệ sĩ ch&iacute;nh: H&ograve;a Minzy, Anh T&uacute;, Hứa Kim Tuyền c&ugrave;ng c&aacute;c kh&aacute;ch mời theo từng tập ph&aacute;t s&oacute;ng.</strong></p>

<p><strong>Anh T&uacute;</strong>,&nbsp;<strong>H&ograve;a Minzy</strong>&nbsp;v&agrave;&nbsp;<strong>Hứa Kim Tuyền</strong>&nbsp;tỏ ra bất ngờ gặp nhau trong<strong>&nbsp;Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>. Cả ba rất h&agrave;o hứng trong lần kết hợp n&agrave;y v&agrave; c&ugrave;ng nhau lập kế hoạch cho buổi diễn đường phố đầu ti&ecirc;n của nh&oacute;m&nbsp;<strong>Đĩa than hồng</strong>&nbsp;hứa hẹn sẽ mang đến nhiều tiết mục bất ngờ cho kh&aacute;n giả.</p>

<p>V&igrave; l&agrave; lần đầu hợp t&aacute;c trong chương tr&igrave;nh truyền h&igrave;nh thực tế, tập 1 của&nbsp;<strong>Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>&nbsp;cũng kh&ocirc;ng tr&aacute;nh khỏi những &quot;s&oacute;ng gi&oacute;&quot; trong nội bộ v&agrave; kế hoạch của nh&oacute;m. Ngay tập đầu, rất nhiều kh&oacute; khăn đ&atilde; xảy ra với nh&oacute;m nhạc ba th&agrave;nh vi&ecirc;n khi H&ograve;a Minzy bị ốm v&agrave; mất giọng, tiếp đ&oacute; l&agrave; những tranh c&atilde;i nảy lửa trong việc chọn b&agrave;i h&aacute;t v&agrave; c&aacute;ch h&aacute;t cho từng ca kh&uacute;c. Xuất ph&aacute;t điểm l&agrave; những nghệ sĩ solo n&ecirc;n khi hoạt động trong c&ugrave;ng một nh&oacute;m bắt buộc phải c&oacute; sự h&ograve;a quyện giữa những c&aacute;i t&ocirc;i đ&oacute;.</p>
', N'CuongNC', N'offline', CAST(N'2022-03-27T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (36, N'Chuyến Tham Quan NASHTECH', CAST(N'2022-04-06T22:44:00.0000000' AS DateTime2), CAST(N'2022-04-10T22:44:00.0000000' AS DateTime2), 1, N'<p>V&igrave; l&agrave; lần đầu hợp t&aacute;c trong chương tr&igrave;nh truyền h&igrave;nh thực tế, tập 1 của&nbsp;<strong>Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>&nbsp;cũng kh&ocirc;ng tr&aacute;nh khỏi những &quot;s&oacute;ng gi&oacute;&quot; trong nội bộ v&agrave; kế hoạch của nh&oacute;m. Ngay tập đầu, rất nhiều kh&oacute; khăn đ&atilde; xảy ra với nh&oacute;m nhạc ba th&agrave;nh vi&ecirc;n khi H&ograve;a Minzy bị ốm v&agrave; mất giọng, tiếp đ&oacute; l&agrave; những tranh c&atilde;i nảy lửa trong việc chọn b&agrave;i h&aacute;t v&agrave; c&aacute;ch h&aacute;t cho từng ca kh&uacute;c. Xuất ph&aacute;t điểm l&agrave; những nghệ sĩ solo n&ecirc;n khi hoạt động trong c&ugrave;ng một nh&oacute;m bắt buộc phải c&oacute; sự h&ograve;a quyện giữa những c&aacute;i t&ocirc;i đ&oacute;.</p>
', N'CuongNC', N'offline', CAST(N'2022-03-27T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (37, N'Chuyến Tham Quan NASHTECH 2', CAST(N'2022-04-06T22:44:00.0000000' AS DateTime2), CAST(N'2022-04-10T22:44:00.0000000' AS DateTime2), 0, N'<p>V&igrave; l&agrave; lần đầu hợp t&aacute;c trong chương tr&igrave;nh truyền h&igrave;nh thực tế, tập 1 của&nbsp;<strong>Xu&acirc;n Hạ Thu Đ&ocirc;ng rồi lại Xu&acirc;n</strong>&nbsp;cũng kh&ocirc;ng tr&aacute;nh khỏi những &quot;s&oacute;ng gi&oacute;&quot; trong nội bộ v&agrave; kế hoạch của nh&oacute;m. Ngay tập đầu, rất nhiều kh&oacute; khăn đ&atilde; xảy ra với nh&oacute;m nhạc ba th&agrave;nh vi&ecirc;n khi H&ograve;a Minzy bị ốm v&agrave; mất giọng, tiếp đ&oacute; l&agrave; những tranh c&atilde;i nảy lửa trong việc chọn b&agrave;i h&aacute;t v&agrave; c&aacute;ch h&aacute;t cho từng ca kh&uacute;c. Xuất ph&aacute;t điểm l&agrave; những nghệ sĩ solo n&ecirc;n khi hoạt động trong c&ugrave;ng một nh&oacute;m bắt buộc phải c&oacute; sự h&ograve;a quyện giữa những c&aacute;i t&ocirc;i đ&oacute;.</p>
', N'CuongNC', N'offline', CAST(N'2022-03-27T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (38, N'hh5', CAST(N'2022-04-05T00:11:00.0000000' AS DateTime2), CAST(N'2022-04-08T00:11:00.0000000' AS DateTime2), 0, N'<p>hh5</p>
', N'CuongNC', N'online', CAST(N'2022-04-03T22:09:18.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (39, N'Đại học FPT trao thưởng gần 100 triệu đồng ươm mầm tài năng làm phim trẻ', CAST(N'2022-04-05T21:27:00.0000000' AS DateTime2), CAST(N'2022-04-07T21:27:00.0000000' AS DateTime2), 1, N'<p><strong><em>Ng&agrave;y 25/3 vừa qua, Trường Đại học FPT tổ chức Li&ecirc;n hoan phim 5 Minutes Short Film Festival 2022, với mục đ&iacute;ch tạo cơ hội trải nghiệm thực tế v&agrave; chuy&ecirc;n nghiệp cho c&aacute;c bạn học sinh, sinh vi&ecirc;n hứng th&uacute; với m&ocirc;n nghệ thuật thứ bảy.</em></strong></p>

<p><strong><em>&nbsp;</em></strong></p>

<p><strong><em>&nbsp;</em></strong>Li&ecirc;n hoan phim được chia th&agrave;nh hai bảng ri&ecirc;ng biệt: Bảng d&agrave;nh cho học sinh THPT với chủ đề &ldquo;Drama vs Karma&rdquo;&nbsp; v&agrave; bảng d&agrave;nh cho sinh vi&ecirc;n c&oacute; chủ đề &ldquo;Survival&rdquo;. Tổng giải thưởng của Li&ecirc;n hoan phim c&oacute; gi&aacute; trị gần 100 triệu đồng.&nbsp;&nbsp;<br />
<br />
Sau hơn một th&aacute;ng tổ chức, Li&ecirc;n hoan phim đ&atilde; nhận được nhiều sự quan t&acirc;m từ c&aacute;c đội học sinh, sinh vi&ecirc;n tr&ecirc;n địa b&agrave;n TP.HCM v&agrave; c&aacute;c tỉnh l&acirc;n cận. Mặc d&ugrave; lần đầu ti&ecirc;n thử sức với việc l&agrave;m phim ngắn giới hạn thời lượng chỉ 5 ph&uacute;t, những sản phẩm của c&aacute;c bạn trẻ vẫn đảm bảo được c&aacute;c ti&ecirc;u ch&iacute; khắt khe m&agrave; Ban Tổ chức đưa ra - lồng gh&eacute;p nhiều tầng th&ocirc;ng điệp &yacute; nghĩa, s&aacute;ng tạo.</p>
', N'CuongNC', N'online', CAST(N'2022-04-03T21:53:25.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (40, N'test sự kiện', CAST(N'2022-04-05T18:04:00.0000000' AS DateTime2), CAST(N'2022-04-05T22:08:00.0000000' AS DateTime2), 0, N'<p>test sự kiện 123 456789</p>

<p style="text-align:center"><iframe frameborder="0" scrolling="no" src="https://drive.google.com/file/d/1TTQapU6uCrMaAJtUxc9Sz3SY9XiSZDmF/preview"></iframe></p>

<p style="text-align:center"><iframe class="w-100" frameborder="0" scrolling="no" src="https://www.youtube.com/embed/B9l24rywshk"></iframe></p>

<p>&nbsp;</p>
', N'CuongNC', N'online', CAST(N'2022-04-05T18:07:46.0000000' AS DateTime2))
INSERT [SWP391].[Events] ([id], [name], [startDate], [endDate], [status], [description], [owner], [type], [createDate]) VALUES (41, N'Chuỗi sự kiện triển lãm nhạc cụ dân tộc đã quay trở lại', CAST(N'2022-04-06T07:30:00.0000000' AS DateTime2), CAST(N'2022-04-06T20:31:00.0000000' AS DateTime2), 0, N'<p><strong><span style="font-size:13.0pt"><span style="background-color:white"><span style="color:#333333">Với mong muốn giới thiệu đến sinh vi&ecirc;n, giảng vi&ecirc;n v&agrave; những người quan t&acirc;m đến &acirc;m nhạc d&acirc;n tộc biết th&ecirc;m những th&ocirc;ng tin về nhiều loại nhạc cụ d&acirc;n tộc của Việt Nam v&agrave; c&aacute;c nước tr&ecirc;n thế giới, chuỗi sự kiện triển l&atilde;m Nhạc cụ d&acirc;n tộc &ndash; Cung đ&agrave;n đất nước m&ugrave;a 2 đ&atilde; quay trở lại. Sự kiện lần n&agrave;y sẽ đem đến những hoạt động v&ocirc; c&ugrave;ng th&uacute; vị:</span></span></span></strong></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">H&agrave;ng trăm nhạc cụ d&acirc;n tộc c&oacute; gi&aacute; trị lịch sử được trưng b&agrave;y, hứa hẹn l&agrave; một điểm check in độc đ&aacute;o th&uacute; vị.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Lần đầu ti&ecirc;n tổ chức Hội l&agrave;ng Quan Họ với chủ đề &ldquo;M&ugrave;a hẹn&rdquo; c&oacute; c&aacute;c hoạt động ẩm thực , văn h&oacute;a d&acirc;n gian đi k&egrave;m đầy hấp dẫn.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Talkshow t&igrave;m hiểu về văn h&oacute;a &acirc;m nhạc d&acirc;n gian Celtic, gi&uacute;p ch&uacute;ng ta hiểu th&ecirc;m về văn h&oacute;a d&acirc;n gian c&aacute;c nước.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Chương tr&igrave;nh biểu diễn nhạc cụ d&acirc;n tộc với sự tham gia của nhiều nghệ sĩ nổi tiếng v&agrave; c&aacute;c bạn sinh vi&ecirc;n Đại học FPT TP.HCM. Đặc biệt trong chương tr&igrave;nh c&ograve;n c&oacute; phần biểu diễn c&aacute;c bộ sưu tập &aacute;o d&agrave;i của NTK Việt H&ugrave;ng, c&aacute;c người mẫu l&agrave; Đại sứ &aacute;o d&agrave;i Việt Nam sẽ tr&igrave;nh diễn c&ugrave;ng c&aacute;c Nhạc cụ d&acirc;n tộc.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Đặc biệt, th&aacute;ng 3 l&agrave; th&aacute;ng của Lễ hội &aacute;o D&agrave;i cả nước buổi biểu diễn l&agrave; sự kết hợp giữa nhạc cụ truyền thống v&agrave; trang phục d&acirc;n tộc hứa hẹn sẽ đem đến cho người xem nhiều cung bậc cảm x&uacute;c.</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Chuỗi Triển l&atilde;m &ldquo;Cung đ&agrave;n đất nước&rdquo; diễn ra từ ng&agrave;y 13/03 đến 18/03/2022 tại Sảnh thư viện Trường Đại học FPT TP. Hồ Ch&iacute; Minh.</span></span></span></span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Dưới đ&acirc;y l&agrave; c&aacute;c cột mốc thời gian diễn ra c&aacute;c hoạt động của chuỗi sự kiện lần n&agrave;y, h&atilde;y nhanh tay ghi lại để kh&ocirc;ng phải để lỡ bất kỳ điều th&uacute; vị g&igrave; tại Cung đ&agrave;n đất nước m&ugrave;a 2 &ndash; 2022 lần n&agrave;y nh&eacute;!</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">&nbsp;8:30 ng&agrave;y 13/03/2022: Khai mạc v&agrave; bắt đầu chuỗi sự kiện</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">14:30 ng&agrave;y 16/03/2022: Hội l&agrave;ng quan họ &ndash; chủ đề &ldquo;M&ugrave;a hẹn&rdquo; sẽ được diễn ra với c&aacute;c hoạt dộng v&ocirc; c&ugrave;ng hấp dẫn như:</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">Biểu diễn H&aacute;t Quan họ; Thầy đồ Ch&iacute; Trọng cho chữ v&agrave; tặng nhiều phần qu&agrave; đầy &yacute; nghĩa; Thưởng thức tr&agrave; đạo; Ẩm thực d&acirc;n gian c&ugrave;ng với nhiều m&oacute;n ăn hấp dẫn v&agrave; ngon miệng</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:13.0pt"><span style="color:#333333">14:00 ng&agrave;y 17/03/2022: Diễn ra buổi Talkshow về Nghệ thuật Celtic</span></span></span></span></span></p>

<p><span style="font-size:13.0pt"><span style="color:#333333">14:30 ng&agrave;y 18/03/2022: Chương tr&igrave;nh biểu diễn giao lưu bế mạc triển l&atilde;m&nbsp; 1234</span></span></p>
', N'CuongNC', N'online', CAST(N'2022-04-06T07:32:43.0000000' AS DateTime2))
SET IDENTITY_INSERT [SWP391].[Events] OFF
GO
SET IDENTITY_INSERT [SWP391].[Events_has_Account] ON 

INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (30, 24, 9, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (25, 24, 10, 1)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (22, 24, 11, 1)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (26, 24, 12, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (29, 24, 13, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (30, 25, 14, 1)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (29, 25, 15, 1)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (27, 25, 16, 1)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (24, 24, 27, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (36, 24, 28, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (38, 24, 36, 0)
INSERT [SWP391].[Events_has_Account] ([Events_id], [Account_id], [id], [status]) VALUES (39, 24, 37, 0)
SET IDENTITY_INSERT [SWP391].[Events_has_Account] OFF
GO
SET IDENTITY_INSERT [SWP391].[Major] ON 

INSERT [SWP391].[Major] ([idMajor], [name], [overview], [Skill], [experience], [job_opportunity]) VALUES (3, N'SE', N'<p>C&ocirc;ng nghệ th&ocirc;ng tin l&agrave; một ng&agrave;nh học được đ&agrave;o tạo để sử dụng m&aacute;y t&iacute;nh v&agrave; c&aacute;c phần mềm m&aacute;y t&iacute;nh để ph&acirc;n phối v&agrave; xử l&yacute; c&aacute;c dữ liệu th&ocirc;ng tin, đồng thời d&ugrave;ng để trao đổi, lưu trữ v&agrave; chuyển đổi c&aacute;c dữ liệu th&ocirc;ng tin dưới nhiều h&igrave;nh thức kh&aacute;c nhau.</p>
', N'<p>Hiện tại, sinh vi&ecirc;n Đại học FPT đ&atilde; v&agrave; đang l&agrave;m việc tại Mỹ, Đức, Nhật Bản, Singapore &ndash; những thị trường C&ocirc;ng nghệ Th&ocirc;ng tin h&agrave;ng đầu của thế giới. Tốt nghiệp ng&agrave;nh Kỹ thuật Phần mềm, sinh vi&ecirc;n trở th&agrave;nh Chuy&ecirc;n vi&ecirc;n giải ph&aacute;p phần mềm; Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch dữ liệu; Chuy&ecirc;n vi&ecirc;n kiểm thử phần mềm; Chuy&ecirc;n vi&ecirc;n đảm bảo chất lượng phần mềm; Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch nghiệp vụ sản phẩm phần mềm; Chuy&ecirc;n vi&ecirc;n ph&aacute;t triển ứng dụng di động. Sinh vi&ecirc;n l&agrave; những Kỹ sư lập tr&igrave;nh, Kỹ sư ph&aacute;t triển hệ thống nh&uacute;ng tương lai tại c&aacute;c doanh nghiệp phần mềm, doanh nghiệp ứng dụng C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave;o vận h&agrave;nh.</p>
', N'', N'<p>- Quản trị vi&ecirc;n dự &aacute;n phần mềm v&agrave; CNTT - Kỹ sư đảm bảo chất lượng phần mềm - Quản l&yacute; dự &aacute;n C&ocirc;ng nghệ Th&ocirc;ng tin</p>
')
INSERT [SWP391].[Major] ([idMajor], [name], [overview], [Skill], [experience], [job_opportunity]) VALUES (4, N'ITS', N'<p>C&ocirc;ng nghệ th&ocirc;ng tin l&agrave; một ng&agrave;nh học được đ&agrave;o tạo để sử dụng m&aacute;y t&iacute;nh v&agrave; c&aacute;c phần mềm m&aacute;y t&iacute;nh để ph&acirc;n phối v&agrave; xử l&yacute; c&aacute;c dữ liệu th&ocirc;ng tin, đồng thời d&ugrave;ng để trao đổi, lưu trữ v&agrave; chuyển đổi c&aacute;c dữ liệu th&ocirc;ng tin dưới nhiều h&igrave;nh thức kh&aacute;c nhau. Hello c&aacute;c bạn</p>
', N'<p>Hiện tại, sinh vi&ecirc;n Đại học FPT đ&atilde; v&agrave; đang l&agrave;m việc tại Mỹ, Đức, Nhật Bản, Singapore &ndash; những thị trường C&ocirc;ng nghệ Th&ocirc;ng tin h&agrave;ng đầu của thế giới. Tốt nghiệp ng&agrave;nh Kỹ thuật Phần mềm, sinh vi&ecirc;n trở th&agrave;nh Chuy&ecirc;n vi&ecirc;n giải ph&aacute;p phần mềm; Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch dữ liệu; Chuy&ecirc;n vi&ecirc;n kiểm thử phần mềm; Chuy&ecirc;n vi&ecirc;n đảm bảo chất lượng phần mềm; Chuy&ecirc;n vi&ecirc;n ph&acirc;n t&iacute;ch nghiệp vụ sản phẩm phần mềm; Chuy&ecirc;n vi&ecirc;n ph&aacute;t triển ứng dụng di động. Sinh vi&ecirc;n l&agrave; những Kỹ sư lập tr&igrave;nh, Kỹ sư ph&aacute;t triển hệ thống nh&uacute;ng tương lai tại c&aacute;c doanh nghiệp phần mềm, doanh nghiệp ứng dụng C&ocirc;ng nghệ Th&ocirc;ng tin v&agrave;o vận h&agrave;nh. Hello c&aacute;c bạn</p>
', N'', N'<p>- Quản trị vi&ecirc;n dự &aacute;n phần mềm v&agrave; CNTT 999</p>

<p>- Kỹ sư đảm bảo chất lượng phần mềm999</p>

<p>- Quản l&yacute; dự &aacute;n C&ocirc;ng nghệ Th&ocirc;ng tin9</p>

<p>-&nbsp;Hello c&aacute;c bạn</p>
')
SET IDENTITY_INSERT [SWP391].[Major] OFF
GO
SET IDENTITY_INSERT [SWP391].[News] ON 

INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (6, N'Tư duy phản biện và những cách để cải thiện
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Tham gia Workshop “Phản biện – Nghệ thuật của sự phản tư” do bộ môn Kỹ năng mềm, Trường Đại học FPT TP. HCM tổ chức, các bạn sinh viên đã có cách nhìn dễ hiểu về phản biện và trang bị các kỹ năng để phản biện hiệu quả. 

Hiểu đúng về phản biện 

Workshop “Phản biện – Nghệ thuật của sự phản tư” do anh Nguyễn Chiến Trường (Chuyên viên Ban Tôn giáo TP. HCM) làm diễn giả. Tại đây, anh Chiến Trường đã mang đến cho khán giả những bài học, kiến thức sâu sắc về phản biện, đồng thời kích hoạt tư duy phản biện bằng hàng loạt vấn đề thực tiễn và hấp dẫn. 

Theo diễn giả Nguyễn Chiến Trường, “phản biện” trở thành từ khoá xuất hiện dày đặc trong 10 năm trở lại đây. Giữa thời đại công nghệ thông tin và mạng xã hội phát triển, chỉ cần một cú nhấp chuột sẽ có hàng trăm các kết quả liên quan đến từ khóa “phản biện” hiện ra.

Tuy nhiên, không ít người hiểu sai về phản biện và thường “sa đà” vào việc tranh luận hay cãi nhau bởi không phân biệt rạch ròi ranh giới giữa 3 quá trình này. Bằng việc đưa ra các ví dụ, anh Chiến Trường đã chỉ ra rằng, đứng trước một câu hỏi cần phát biểu hay đóng góp ý kiến, nếu câu trả lời chỉ để chứng minh ý kiến của bạn đúng và người khác sai thì kết quả cuối cùng là để tranh luận. Còn đối với phản biện, cốt lõi là mang tính góp ý xây dựng, phục vụ mục đích chung nhằm giải quyết vấn đề tốt hơn. 

Một mặt khác, cho dù mục đích ban đầu của mỗi người tốt, nhưng kỹ năng giao tiếp chưa tốt, thái độ và lời nói chưa phù hợp khiến việc truyền đạt thông tin bị hiểu lầm, cũng khiến cho kết quả của quá trình phản biện đi lệch hướng. Do đó, để có tư duy phản biện tốt, ngoài kỹ năng giao tiếp tốt, biết lắng nghe thì cần phải nắm rõ các cấu trúc của một lập luận, quá trình tư duy để đưa ra lập luận và “nằm lòng”những tiêu chuẩn cần có. 

Quy trình cho một lần phản biện 

Thông qua các ví dụ như hình ảnh người đàn ông gom trứng ở siêu thị, câu nói “Lịch sử được viết nên bởi người chiến thắng” xuất phát từ lập trường của phe nào, giai cấp nào hay tục ngữ “con hư tại mẹ, cháu hư tại bà”,… anh Chiến Trường đã cho các bạn sinh viên thực hành làm quen tư duy phản biện. Sau khi tổng hợp và phân tích những lập luận mà sinh viên trình bày, diễn giả đã chỉ ra cấu trúc lập luận trong tư duy phản biện bao gồm các thao tác xác định: luận đề, luận điểm, luận cứ và dẫn chứng. Trong đó, luận đề là xác định đề bài, đối tượng cần phân tích mà chúng ta tham gia phản biện; luận điểm là những tư tưởng, lập luận chính của vấn đề đang thảo luận và luận cứ là những căn cứ để bảo vệ cho luận điểm. 

Có 5 bước để cho quá trình tư duy để đưa ra lập luận mà chúng ta có thể tham khảo: Xác định vấn đề và biểu đạt vấn đề để tránh lạc hướng; huy động tất cả các khái niệm, tri thức và kinh nghiệm liên quan đến vấn đề phản biện; sàng lọc sự liên tưởng, liên kết phù hợp với đối tượng; kiểm tra giả thiết bằng nhiều phương pháp và cuối cùng là giải quyết vấn đề. Muốn quá trình phản biện có kết quả, hiệu quả và mang tính góp ý xây dựng cần đảm bảo các bước trên. Đây chính là cán cân tạo nên sức mạnh cho ý kiến phản biện của mỗi người. 

Ngoaì ra, tư duy phản biện đảm bảo tính khách quan, thuyết phục khi được đánh giá qua khung tiêu chuẩn: Tính rõ ràng, tính đúng đắn, tính chính xác, tính liên kết, tính chiều sâu, tính chiều rộng, tính logic và tính phi chủ tính. Khi tiếp cận với 8 tiêu chuẩn này, thoạt đầu chúng ta sẽ có cảm giác đơn giản, nhưng đòi hỏi phải nỗ lực rèn luyện mới có thể áp dụng một cách linh hoạt và hiệu quả.

Sôi nổi, bất ngờ và đầy gợi mở là không khí mà Workshop “Phản biện – Nghệ thuật của sự phản tư” mang lại. Qua chương trình, các bạn sinh viên Đại học FPT TP. HCM đã nhận được những kiến thức bổ ích để hình thành một lối tư duy đa chiều cũng như có cái nhìn tổng quan, sâu sắc hơn về những gì đang diễn ra trong cuộc sống. ', N'CuongNC', 97)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (7, N'Khi cựu sinh viên làm cán bộ', 1, CAST(N'2022-03-15T16:56:30.847' AS DateTime), N'Nguyễn Thanh Thủy - cựu sinh viên khóa 9 chuyên ngành Marketing, ngành Quản trị kinh doanh Đại học FPT - vốn dĩ đã có một thời sinh viên sôi nổi, gắn bó với mọi "mặt trận" phong trào với trường. Sau tốt nghiệp, cô nàng nhanh chóng có được công việc tốt nhưng rồi còn "nặng nợ", cô sinh viên ngày nào vẫn ngày ngày đến trường để làm cán bộ phòng Hợp tác quốc tế.

 

Cùng gặp gỡ nàng cựu sinh viên này nhé!

 


Chào Thủy, cơ duyên đưa Thủy đến với công việc hiện tại của Thủy là gì?


Trước đây vì Thủy không làm tốt nghiệp ngay sau khi bảo vệ đồ án mà dự định "làm một điều gì đó" rồi mới xét tốt nghiệp, chấm dứt thời sinh viên. Sau khi hoàn thành chương trình học, Thủy ra Đà Nẵng, làm quản lý đội bóng rổ Đà Nẵng Dragon, quản lý chung các việc cần cho đội bóng vận hành trong mùa thi đấu ấy. Sau đó, Thủy về lại TP.HCM đi làm ở một công ty khác rồi mới xét tốt nghiệp.

 

Một ngày đẹp trời, Thủy nhận được lời mời làm việc ở phòng Hợp Tác Quốc Tế từ anh Trưởng phòng thì ngọn lửa từ thời sinh viên bùng lên nên Thủy đồng ý cái rụp, bàn giao công việc và về trường làm.', N'CuongNC', 4)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (8, N'Neocareer Group has come !', 1, CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'CuongNC', 4)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (9, N'TestNews4', 0, CAST(N'2022-03-15T16:57:42.637' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 8)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (10, N'TestNews5', 0, CAST(N'2022-03-15T16:58:24.213' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 2)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (11, N'TestNews6', 0, CAST(N'2022-03-15T16:58:31.437' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 3)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (12, N'TestNews7', 0, CAST(N'2022-03-17T10:30:54.343' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 11)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (13, N'TestNew8', 0, CAST(N'2022-03-17T10:32:44.333' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 5)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (14, N'TestNews9', 0, CAST(N'2022-03-17T10:33:09.753' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 4)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (15, N'Lê Ngọc Hiếu - Thủ khoa 30 tuổi', 1, CAST(N'2022-03-17T14:23:13.000' AS DateTime), N'Thủ khoa Lê Ngọc Hiếu – khoá 9C ngành Kỹ thuật phần mềm đã có một thời sinh viên đáng nể với 2 lần nhận danh hiệu Cóc Vàng và 5 lần được tôn vinh Sinh viên xuất sắc tại ĐH FPT. Thành tích này là sự khởi đầu lại sau khi cựu học sinh giỏi Toán mất đi 8 năm học vẫn không thể tốt nghiệp tại trường đại học thuộc khối ĐH Quốc gia.
Game online đổi 8 năm đại học

Từ khi còn là học sinh phổ thông, cậu học sinh lớp chuyên Toán thích suy luận đã thích được tiếp xúc với máy tính và xác định sẽ theo đuổi ngành công nghệ thông tin. Kỳ thi đại học năm đó, Hiếu đậu lớp kỹ sư chất lượng cao Việt Pháp ĐH Bách Khoa với số điểm rất cao - 29,5.


Một mình vào Sài Gòn nhập học, Hiếu như “chim sổ lồng” khi được rời khỏi tầm mắt của ba mẹ. Vốn thích game online đã lâu, ban đầu Hiếu chơi chỉ để giải trí rồi nghiện lúc nào không hay. “Kết quả là lúc bạn bè cùng lớp tốt nghiệp thì khi đó mình còn nợ tới gần 30 môn” – Hiếu nhớ lại.

Nhận ra sai lầm, Hiếu lao vào học ngày đêm để trả nợ môn nhưng đã muộn. Đồ án tốt nghiệp được hoàn thành khi Hiếu đã vượt mốc 8 năm – số năm học tối đa tại trường.

Nhìn bạn bè cùng trang lứa đã đi làm được vài năm, có người đã vươn đến vị trí quản lý còn bản thân lại “tay trắng”, chàng sinh viên Buôn Ma Thuột đã từng cảm thấy “hoang mang và mất định hướng vào tương lai”. Không thể bỏ dở chuyện học, Hiếu tự nhủ bản thân: “Mình chỉ còn một cơ hội cuối cùng” nên tạm cất nỗi chạnh lòng hay ân hận qua một bên, Hiếu chấp nhận lại là sinh viên năm nhất, tiếp tục theo đuổi đam mê ngành CNTT của mình.

Làm lại, phải làm tốt hơn

“Tình cờ đọc được thông tin rằng trường FPT đang tuyển sinh đợt bổ sung, lúc đó đã là tháng 10, qua kì thi đại học. Mình xin phép gia đình đăng ký vào ĐH FPT để làm lại từ đầu với ngành CNTT mà mình yêu thích.” – Hiếu kể về cơ duyên để đến với ngôi trường hiện tại của mình. Kết quả kỳ thi bổ sung vào ĐH FPT của Hiếu đạt 102/105. Học xong chương trình Tiếng Anh dự bị và sau đó bảo lưu, thi lại ĐH vào năm sau để bổ sung hồ sơ, học kỳ Fall năm 2014, Hiếu chính thức trở thành sinh viên ĐH FPT với kết quả 25 điểm.', N'CuongNC', 13)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (16, N'TestNews11', 0, CAST(N'2022-03-17T17:45:00.000' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 31)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (17, N'Sinh viên FPT hào hứng với học kỳ tiếng Anh tại Malaysia', 1, CAST(N'2022-03-17T18:38:00.000' AS DateTime), N'Không chỉ giảng dạy, học tập bằng giáo trình tiếng Anh 100%, ngay từ năm 1, sinh viên Đại học FPT còn được tham gia học kỳ tiếng Anh tại nước ngoài.
Ngày 28/3, 59 sinh viên Đại học FPT HCM tham gia học kì tiếng Anh tại nước ngoài (SUMMIT 2) đã khởi hành đến Đại học KDU, Malaysia. Học kì kéo dài từ ngày 28/3 đến ngày 26/4. SUMMIT 2 là level tiếng Anh cuối cùng trong tổng số 5 level mà sinh viên phải vượt qua trước khi bắt đầu chương trình học chuyên ngành hoàn toàn bằng tiếng Anh.

 

Trước ngày lên đường, sinh viên được hướng dẫn cụ thể về: lịch trình, hành trang cá nhân và các hoạt động sẽ diễn ra trong suốt thời gian học tập tại Malaysia. Nhiều sinh viên tỏ ra hào hứng bởi ngay từ năm nhất, sinh viên đã có cơ hội giao lưu và học tập tại nước ngoài.

 

Phạm Thanh Giàu – Sinh viên ngành Quản trị kinh doanh cho biết: “1 tháng học tiếng Anh tại Đại học KDU Malaysia không quá dài nhưng việc sinh sống và học tập trong môi trường quốc tế sẽ giúp bản thân mình trưởng thành hơn. Mình sẽ có thêm những trải nghiệm mới, hiểu biết mới từ việc tự quản lý bản thân và kỹ năng làm việc tập thể”.

 

Bác Huỳnh Tấn Hiệp (ông ngoại của bạn Giàu) dù khá lo lắng vì đây là lần đầu tiên cháu ngoại ra nước ngoài nhưng cũng rất vui vẻ: “Đây là cơ hội học tập tốt cho sinh viên nếu sau này muốn làm việc ở môi trường quốc tế. Mô hình liên kết đào tạo của Đại học FPT với các trường Đại học quốc tế cần được khuyến khích phát triển. Việt Nam và các nước đang cùng nhau xây dựng ASEAN vững mạnh, cần đẩy mạnh công tác giao lưu văn hóa, giáo dục và kinh tế”.', N'CuongNC', 71)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (18, N'a', 0, CAST(N'2022-03-27T00:00:00.000' AS DateTime), N'<p>ddd</p>
', N'CuongNC', 4)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (19, N'Thăm Quan BOSCH', 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), N'<h2><strong>Bosch Engineering and Business Solutions Vietnam (RBVH) l&agrave; c&ocirc;ng ty 100% vốn của c&ocirc;ng ty Robert Bosch GmbH một trong những nh&agrave; cung cấp c&ocirc;ng nghệ v&agrave; dịch vụ h&agrave;ng đầu tr&ecirc;n thế giới. Bosch Việt Nam cần tuyển dụng:</strong></h2>

<p><strong>Embedded SW Test Engineer ( Transmission Control Unit)</strong></p>

<p><strong>Quyền lợi:</strong></p>

<ul>
	<li>Lương th&aacute;ng 13&nbsp;v&agrave; c&aacute;c chế độ thưởng h&agrave;ng năm</li>
	<li>Bảo hiểm n&acirc;ng cao cho nh&acirc;n vi&ecirc;n v&agrave; gia đ&igrave;nh</li>
	<li>Cơ hội du lịch v&agrave; đ&agrave;o tạo ở nước ngo&agrave;i</li>
</ul>

<p><strong>M&ocirc; tả c&ocirc;ng việc:</strong></p>

<ul>
	<li>Chịu tr&aacute;ch nhiệm quản l&yacute;&nbsp;tất cả c&aacute;c hoạt động thử nghiệm của một sản phẩm cụ thể về &ocirc; t&ocirc;.</li>
	<li>X&aacute;c định, kiểm tra&nbsp;v&agrave; duy tr&igrave; chiến lược của dự &aacute;n</li>
	<li>X&aacute;c định v&agrave; duy tr&igrave; kế hoạch của&nbsp;dự &aacute;n test&nbsp;&nbsp;(nội dung, lập kế hoạch v&agrave; c&aacute;c nguồn lực).</li>
	<li>X&aacute;c định c&aacute;c hoạt động thử nghiệm v&agrave; chỉ định cho c&aacute;c nh&agrave; thiết kế thử nghiệm của nh&oacute;m dự &aacute;n.</li>
	<li>Kiểm tra xem thử nghiệm n&agrave;y c&oacute; đi k&egrave;m với sự ph&aacute;t triển phần mềm trong tất cả c&aacute;c giai đoạn.</li>
	<li>Huấn luyện c&aacute;c th&agrave;nh vi&ecirc;n dự &aacute;n về c&aacute;c kh&iacute;a cạnh chất lượng của c&aacute;c quy tr&igrave;nh kỹ thuật.</li>
</ul>

<p><strong>Y&ecirc;u cầu bắt buộc:</strong></p>

<ul>
	<li>Tr&ecirc;n 1-5 năm kinh nghiệm trong ph&aacute;t triển Embedded Software Development/Testing.&nbsp;</li>
	<li>L&agrave;m việc tốt với&nbsp;ng&ocirc;n ngữ lập tr&igrave;nh C.</li>
	<li>Kiến thức về Microcontroller.</li>
	<li>Biết về v&ograve;ng đời ph&aacute;t triển SW</li>
	<li>C&oacute; kỹ năng quản l&yacute;, l&agrave;m việc nh&oacute;m</li>
	<li>Biết đọc sơ đồ&nbsp;hardware</li>
	<li>Tiếng Anh tốt (Nghe, N&oacute;i, Đọc v&agrave; Viết)</li>
</ul>

<p><strong>Li&ecirc;n hệ:&nbsp;</strong></p>

<p>Telephone: (848).38128000</p>

<p>Email: career.RBVH@vn.bosch.com&nbsp;</p>
', N'CuongNC', 4)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (20, N'ASUS Bùng Nổ Vô Số VOUCHER', 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), N'<h2>Với thiết kế m&agrave;n h&igrave;nh k&eacute;p vượt mọi khu&ocirc;n khổ, kết hợp với hiệu năng đầu bảng v&agrave; h&agrave;ng loạt c&aacute;c trang bị thiết thực, ZenBook Pro Duo OLED l&agrave; c&ocirc;ng cụ to&agrave;n năng cho c&aacute;c content creator hiện thực h&oacute;a c&aacute;c &yacute; tưởng của m&igrave;nh.</h2>

<p><strong>Thiết kế tối ưu d&agrave;nh cho thế hệ s&aacute;ng tạo nội dung</strong></p>

<p>Với nh&agrave; s&aacute;ng tạo nội dung (content creator), k&iacute;ch thước m&agrave;n h&igrave;nh l&agrave; yếu tố cực kỳ quan trọng. Bởi lẽ, c&aacute;c ứng dụng chỉnh sửa h&igrave;nh ảnh, video hay &acirc;m thanh lu&ocirc;n đ&ograve;i hỏi kh&ocirc;ng gian rộng lớn để hiển thị nội dung v&agrave; h&agrave;ng loạt c&aacute;c c&ocirc;ng cụ phức tạp.</p>

<p>Khi sử dụng desktop, kh&ocirc;ng &iacute;t content creator thường trang bị nhiều m&agrave;n h&igrave;nh để n&acirc;ng cao hiệu quả c&ocirc;ng việc. Thế nhưng, họ lại kh&ocirc;ng c&oacute; được trải nghiệm tương tự tr&ecirc;n những chiếc laptop. Hầu hết c&aacute;c sản phẩm hiện nay phải đ&aacute;nh đổi k&iacute;ch thước m&agrave;n h&igrave;nh để ưu ti&ecirc;n sự mỏng nhẹ, từ đ&oacute; kh&oacute; l&ograve;ng đ&aacute;p ứng nhu cầu của c&aacute;c content creator.</p>

<p>Vượt qua những giới hạn truyền thống, ASUS đ&atilde; mang đến cho content creator thứ m&agrave; họ vẫn hằng kh&aacute;t khao: ZenBook Pro Duo OLED (UX582). Ấn tượng mạnh mẽ của ZenBook Pro Duo OLED đến từ thiết kế hai m&agrave;n h&igrave;nh &quot;c&oacute;-một-kh&ocirc;ng-hai&quot;, kết hợp giữa m&agrave;n h&igrave;nh ch&iacute;nh 15.6 inch v&agrave; m&agrave;n h&igrave;nh phụ ScreenPad+ 14 inch cực lớn.</p>
', N'CuongNC', 5)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (21, N'FSOSFT Làm Nên Edunext', 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), N'FPT Software thành lập năm 1999, là công ty thành viên của FPT, Tập đoàn Công nghệ hàng đầu của Việt Nam. Sau 17 năm thành lập FPT Software hiện đang là công ty phần mềm lớn nhất của Việt Nam và đứng trong Top 100 Nhà cung cấp dịch vụ Outsourcing toàn cầu do International Association of Outsourcing Professionals (IAOP) đánh giá.

Là công ty chuyên xuất khẩu dịch vụ phần mềm, FPT Software cung cấp các dịch vụ phát triển phần mềm và bảo trì, triển khai ERP, QA, chuyển đổi ứng dụng, hệ thống nhúng, điện toán di động, điện toán đám mây… trong nhiều lĩnh vực như: Tài chính ngân hàng, Viễn thông, Y tế, Chế tạo, Công nghiệp xe hơi, Dịch vụ công… Hiện FPT Software đang tập trung nghiên cứu và phát triển dịch vụ CNTT dựa trên những nền tảng công nghệ mới như IoT, S.M.A.C, cho các lĩnh vực sản xuất máy bay, sản xuất ô tô, ngân hàng, truyền hình vệ tinh, viễn thông trên phạm vi toàn cầu. Công ty hiện đã và đang cung cấp dịch vụ cho khoảng 450 khách hàng là các tập đoàn lớn trên thế giới, trong đó có 43 khách hàng nằm trong danh sách Fortune Global 500.

Từ 13 lập trình viên với giấc mơ đưa trí tuệ Việt Nam đi khắp năm châu, đội quân FSOFT ở tuổi 18 với hơn 10.000 người, doanh thu hơn 230 triệu USD, tiếp tục biến giấc mơ biến Việt Nam trở thành điểm sáng về CNTT trên bản đồ thế giới thành hiện thực với mục tiêu đạt 1 tỉ USD doanh số năm 2020 và 30.000 người.

Sau 17 năm phát triển thị trường toàn cầu, đến nay FPT Software đã có 23 văn phòng tại 14 quốc gia bao gồm Việt Nam, Nhật Bản, Singapore, Mỹ, Pháp, Đức, Slovakia, Malaysia, Úc, Trung Quốc, Hàn Quốc, Myanmar, Philippines, Thái Lan.', N'CuongNC', 8)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (22, N'Thăm Quan Cùng Huyền Thoại VNG', 1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), N'<p><strong>VNG (viết tắt của chữ Vinagame)</strong>&nbsp;l&agrave; một c&ocirc;ng ty c&ocirc;ng nghệ Việt Nam, th&agrave;nh lập v&agrave;o năm 2004 với 4 mảng sản phẩm ch&iacute;nh l&agrave; Tr&ograve; chơi trực tuyến, Nền tảng kết nối, Thanh to&aacute;n điện tử v&agrave; Dịch vụ điện to&aacute;n đ&aacute;m m&acirc;y.</p>

<p>Sau 15 năm hoạt động, VNG l&agrave; doanh nghiệp khởi nghiệp kỳ l&acirc;n (unicorn start-up) duy nhất tại Việt Nam khi được định gi&aacute; tr&ecirc;n 1 tỷ USD (World Start-up Report)</p>

<h2>Lịch sử</h2>

<p>VNG được th&agrave;nh lập v&agrave;o ng&agrave;y 9 th&aacute;ng 9 năm 2004 với t&ecirc;n gọi VinaGame.</p>

<p>Th&aacute;ng 7 năm 2005, VinaGame k&yacute; hợp đồng với Kingsoft để mang game V&otilde; L&acirc;m Truyền Kỳ về Việt Nam. Trong v&ograve;ng 1 th&aacute;ng, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; tạo n&ecirc;n cơn sốt tại Việt Nam với con số 200,000 người chơi truy cập tại c&ugrave;ng một thời điểm.</p>

<p>Năm 2006-2007, c&ocirc;ng ty ph&aacute;t h&agrave;nh phần mềm CSM, trang thương mại điện tử 123 mua cổng th&ocirc;ng tin Zing.</p>

<p>Năm 2008, c&ocirc;ng ty đổi t&ecirc;n thương hiệu th&agrave;nh&nbsp;<strong>VNG Corporation</strong>.</p>

<p>Giữa năm 2009, sản phẩm mạng x&atilde; hội Zing Me ra đời với hơn 4 triệu th&agrave;nh vi&ecirc;n hoạt động thường xuy&ecirc;n h&agrave;ng th&aacute;ng v&agrave;o cuối năm.</p>

<p>Năm 2010, tr&ograve; chơi trực tuyến Thuận Thi&ecirc;n Kiếm ra đời.</p>

<p>Năm 2011, VNG xuất khẩu tr&ograve; chơi Ủn Ỉn sang Nhật Bản.</p>

<p>Năm 2012 &amp; 2013, VNG đưa ra sản phẩm Zalo &ndash; ứng dụng nhắn tin v&agrave; gọi điện miễn ph&iacute; hoạt động tr&ecirc;n nền tảng di động.</p>

<p>Năm 2015, VNG được vinh danh &ldquo;Doanh nghiệp ph&aacute;t triển nhanh to&agrave;n cầu tại khu vực Đ&ocirc;ng &Aacute;&rdquo; tại Diễn đ&agrave;n Kinh tế Thế giới 2015 (Manila, Philippines)</p>

<p>Cuối năm 2016, VNG ra mắt ZaloPay, ứng dụng thanh to&aacute;n tr&ecirc;n di động.</p>

<p>Năm 2017,&nbsp;k&yacute; Bản ghi nhớ về việc ni&ecirc;m yết tr&ecirc;n s&agrave;n chứng kho&aacute;n Nasdaq (Mỹ)</p>

<p>Năm 2018:</p>

<ul>
	<li>&nbsp;X&aacute;c định bổ sung c&aacute;c mảng kinh doanh chiến lược mới như T&agrave;i ch&iacute;nh v&agrave; thanh to&aacute;n, Dịch vụ Đ&aacute;m m&acirc;y</li>
	<li>&nbsp;Nền tảng Zalo c&aacute;n mốc 100 triệu người d&ugrave;ng, kh&ocirc;ng chỉ ở Việt Nam</li>
	<li>&nbsp;Tiếp tục được Google v&agrave; Temasek c&ocirc;ng bố l&agrave; 1 trong 9 unicorn (kỳ l&acirc;n) c&ocirc;ng nghệ của khu vực Đ&ocirc;ng Nam &Aacute;, c&ugrave;ng với Grab, Go-Jek&hellip;.</li>
</ul>

<h2>Sản phẩm v&agrave; dịch vụ</h2>

<p>H&ecirc; sinh th&aacute;i sản phẩm của VNG hiện bao gồm 4 nh&oacute;m sản phẩm ch&iacute;nh, tập trung v&agrave;o c&aacute;c ứng dụng, giải ph&aacute;p mang đến trải nghiệm phong ph&uacute; v&agrave; tiện &iacute;ch thường ng&agrave;y cho người sử dụng:</p>

<h3>Dịch vụ đ&aacute;m m&acirc;y</h3>

<p>Cung cấp c&aacute;c dịch vụ đ&aacute;m m&acirc;y to&agrave;n diện cho c&aacute;c tổ chức, doanh nghiệp, địa phương. C&aacute;c hệ thống, giải ph&aacute;p c&ocirc;ng nghệ th&ocirc;ng minh dựa tr&ecirc;n kết nối Internet v&agrave; c&ocirc;ng nghệ đ&aacute;m m&acirc;y.</p>

<p>Một số sản phẩm ti&ecirc;u biểu: vCloudcam, 123CS, Cloud server, IoT Hub, vCloudStack,&hellip;</p>

<h3>Data Center</h3>

<p>VNG c&oacute; hai Data Center đạt ti&ecirc;u chuẩn Tier-3, đặt tại TP.HCM (C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, Q. 12) v&agrave; H&agrave; Nội (khu C&ocirc;ng nghệ cao H&ograve;a Lạc) với tổng diện t&iacute;ch tr&ecirc;n 1.700 m<sup>2</sup>, c&ocirc;ng suất điện sử dụng tr&ecirc;n 1.2 MW.</p>

<h3>VNG Games</h3>

<p>VNG Games l&agrave; một nh&aacute;nh trực thuộc c&ocirc;ng ty VNG, bao gồm việc xin giấy ph&eacute;p v&agrave; ph&aacute;t h&agrave;nh c&aacute;c tựa game từ thị trường quốc tế tại Việt Nam hoặc ph&aacute;t h&agrave;nh c&aacute;c tựa game Việt Nam ra thị trường quốc tế. Ngo&agrave;i ra c&ograve;n tổ chức c&aacute;c sự kiện v&agrave; giải đấu game tại khu vực Việt Nam.</p>

<p>Kể từ 2005 đến nay, VNG Games đ&atilde; t&iacute;ch lũy được nhiều sản phẩm tr&ograve; chơi hấp dẫn v&agrave; hiện c&oacute; đến 8 Studio vận h&agrave;nh game.</p>

<h4>Tr&ograve; chơi</h4>

<p>B&agrave;i chi tiết: Danh s&aacute;ch tr&ograve; chơi của c&ocirc;ng ty VNG</p>

<h4>Tr&ograve; chơi nổi bật</h4>

<h5>V&otilde; L&acirc;m Truyền Kỳ</h5>

<p>B&agrave;i chi tiết: V&otilde; L&acirc;m Truyền Kỳ</p>

<p>Sau khi ph&aacute;t h&agrave;nh ở thị trường Trung Quốc với t&ecirc;n gọi&nbsp;<em>Justice Xwar</em>, VNG đ&atilde; mua lại bản quyền&nbsp;<em>V&otilde; L&acirc;m Truyền Kỳ</em>&nbsp;v&agrave; ra mắt phi&ecirc;n bản đầu ti&ecirc;n v&agrave;o năm 2005. T&iacute;nh đến th&aacute;ng 4 năm 2014, V&otilde; L&acirc;m Truyền Kỳ đ&atilde; c&oacute; tổng cộng gần 20 triệu người chơi với 86 server trong một thời điểm.&nbsp;C&aacute;c cuộc thi Thập Đại Mỹ Nh&acirc;n trong game đ&atilde; gi&uacute;p một số nh&acirc;n vật trong lĩnh vực giải tr&iacute; tại Việt Nam trở n&ecirc;n nổi tiếng như Bảo Thy, Ng&acirc;n Kh&aacute;nh, B&iacute;ch Ly, Ngọc H&acirc;n.</p>

<h5>Auto Chess</h5>

<p>Auto Chess VN &ndash; Cờ nh&acirc;n phẩm l&agrave; tựa game đấu tr&iacute; chiến thuật được Dragonnest ủy quyền ph&aacute;t h&agrave;nh game cho VNG GAMES v&agrave; ch&iacute;nh thức ra mắt tại Việt Nam ng&agrave;y 16 th&aacute;ng 8 năm 2019. Kể từ khi ra mắt, đến nay Auto Chess VN đ&atilde; tổ chức được giải đấu đầu ti&ecirc;n Auto Chess Vietnam Championship 2019&nbsp;v&agrave; đoạt được giải thưởng đầu ti&ecirc;n &ldquo;Best Innovative 2019&rdquo; do Google Play b&igrave;nh chọn.</p>
', N'CuongNC', 7)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (23, N'Chân dung tỷ phú đô la công nghệ đầu tiên của Việt Nam', 1, CAST(N'2022-03-28T00:08:42.000' AS DateTime), N'Sau 3 năm ra đời startup Sky Mavis đã đạt giá trị vốn hóa lên 2,44 tỷ USD, một thời gian kỷ lục trong giới công nghệ Châu Á. Là một nhà sáng lập, Trung Nguyễn, CEO công ty Sky Mavis, cựu sinh viên Đại học FPT có thể trở thành tỷ phú (USD) ở tuổi 29 (sinh 1992) và sẽ là tỷ phú công nghệ đầu tiên của Việt Nam.
Mới đây, startup Sky Mavis với tựa game Axie Infinity đã khiến cả giới khởi nghiệp Việt Nam nở mặt, khi tổng giá trị vốn hóa của Axie Infinity hiện đạt mức xấp xỉ  2,4 tỷ USD.

Startup Sky Mavis được thành lập năm 2018 bởi CEO Trung Nguyễn cùng 2 nhà đồng sáng lập khác là Aleksander Leonard Larsen và Jeffrey Zirlin.

Trung Nguyễn nảy ra ý tưởng phát triển game Axie Infinity vào năm 2017 sau khi cảm thấy bị một trò chơi blockchain khác là CryptoKitties lôi cuốn. Axie Infinity là game được xây dựng trên blockchain lấy cảm hứng từ game Pokémon nổi tiếng trên toàn cầu, nơi người chơi có thể chiến đấu, thu thập, nuôi và xây dựng một vương quốc trên đất liền cho thú cưng của mình.

Cũng giống với trò CryptoKitties, Axie Infinity sử dụng công nghệ NFT (Non-fungible token) để phát triển. Hiểu nôm na là với công nghệ mới này, các vật phẩm ảo trong game sẽ chỉ có một không hai, không thể bị thao túng hoặc làm nhái, từ đó sẽ có giá trị cao trên thị trường. Trong khi ở các game thông thường, vật phẩm ảo là thứ có thể bị nhân bản vô hạn, dễ dàng bị kiểm soát bởi nhà phát hành/nhà phát triển và mất giá trị nếu game đóng cửa.

Để chơi game Axie Infinity, người chơi mới sẽ phải bỏ ra một khoản chi phí nhất định nhằm thu mua các Axie. Đây cũng là một nguồn thu đáng kể của các game thủ trong tựa game này.

Chính vì chơi game được “tiền”, Axie Infinity đang trở thành một hiện tượng quốc tế khi thu hút hàng trăm nghìn người chơi. Đồng “tiền ảo” AXS (mã token tiện ích của Axie Infinity) cũng rất được nhà đầu tư săn đón trên các sàn giao dịch “tiền ảo”.

Biểu đồ giá trị vốn hóa của Axie Infinity tăng liên tục trong 7 ngày qua. Từ mốc 600 triệu USD ngày 7/7, vốn hóa của Axie Infinity đã vượt mốc 2,4 tỷ USD trong ngày 23/7.


Ở thời điểm hiện tại, bên cạnh những người có nhu cầu chơi game, nhiều người còn mua AXS (mã token tiện ích của Axie Infinity) như một kênh đầu tư nhằm đón bắt trào lưu và kiếm lời. Nhờ doanh thu tăng trưởng cực nhanh giá của đồng AXS cũng tăng chóng mặt, tăng 600% trong vòng 1 tháng. Diễn biến giá của đồng AXS và vốn hoá của Sky Mavis như sau:

- 07/07 giá 9,69$, 0,6 tỷ USD

- 14/07 giá 21$, 1,3 tỷ USD

- 15/07 giá 29,13$, 1,8 tỷ USD

- 20/07 giá 14,19$, 0,88 tỷ USD

- 23/07 giá 40,01$, 2,44 tỷ USD

Với mức giá như hiện tại, tổng giá trị vốn hóa của Axie Infinity hiện đạt mức xấp xỉ 2,4 tỷ USD. Axie Infinity cũng trở thành dự án “tiền ảo” Việt Nam có tổng vốn hóa lớn nhất từng được biết tới. Biểu đồ giá trị vốn hóa của Axie Infinity tăng liên tục trong 7 ngày qua. Từ mốc 600 triệu USD ngày 7/7, vốn hóa của Axie Infinity đã vượt mốc 2,4 tỷ USD vào ngày 23/7.', N'CuongNC', 12)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (24, N'Ba Giám khảo khách mời của cuộc thi ', 1, CAST(N'2022-04-01T21:36:54.000' AS DateTime), N'<p>&ldquo;Ho&agrave; thấy mừng khi c&aacute;c bạn trẻ hiện nay đang quan t&acirc;m đến nghề l&agrave;m phim, đ&oacute; l&agrave; điều rất quan trọng trong việc kế thừa c&aacute;c anh chị đi trước trong ng&agrave;nh c&ocirc;ng nghiệp phim của Việt Nam. C&acirc;u chuyện l&agrave;m phim trong 5 ph&uacute;t l&agrave; một trong những b&agrave;i tập cơ bản của người l&agrave;m phim, để c&aacute;c bạn gửi gắm được th&ocirc;ng điệp của m&igrave;nh đến x&atilde; hội, n&oacute;i l&ecirc;n tiếng n&oacute;i của m&igrave;nh trước những vấn đề trong cuộc sống. Học g&igrave; th&igrave; phải thực h&agrave;nh đ&oacute;, học l&agrave;m phim th&igrave; c&aacute;c bạn cứ mạnh dạn tham gia những cuộc thi để biết năng lực của m&igrave;nh đến đ&acirc;u v&agrave; nhận về nhiều b&agrave;i học qu&yacute; gi&aacute; để theo đuổi con đường l&agrave;m nghề&rdquo; - Đạo diễn V&otilde; Thanh Ho&agrave; chia sẻ.&nbsp;</p>
', N'CuongNC', 7)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (25, N'Tổng thống Sierra Leone đến thăm ĐH FPT cùng ký kết hợp tác chuyển đổi số', 1, CAST(N'2022-04-02T06:54:34.000' AS DateTime), N'<p>Thỏa thuận hợp t&aacute;c được k&yacute; kết trong bối cảnh kỷ niệm 40 năm quan hệ ngoại giao giữa Việt Nam-Sierra Leone (24/6/1982-24/6/2022) v&agrave; lần đầu ti&ecirc;n thực hiện chuyến thăm trao đổi đo&agrave;n cấp nguy&ecirc;n thủ của hai nước. Đ&acirc;y cũng l&agrave; lần đầu ti&ecirc;n FPT k&yacute; kết thỏa thuận hợp t&aacute;c th&uacute;c đẩy chuyển đổi số tầm quốc gia cho một quốc gia b&ecirc;n ngo&agrave;i Việt Nam.<br />
<br />
FPT sẽ phối hợp với c&aacute;c c&ocirc;ng ty tư vấn h&agrave;ng đầu thế giới để tham vấn Ch&iacute;nh phủ Sierra Leone về chiến lược ph&aacute;t triển kinh tế - x&atilde; hội v&agrave; chiến lược chuyển đổi số. Trong lĩnh vực đ&agrave;o tạo nguồn nh&acirc;n lực, FPT sẽ cung cấp c&aacute;c chương tr&igrave;nh Cử nh&acirc;n C&ocirc;ng nghệ chất lượng cao tại Việt Nam cho c&aacute;c sinh vi&ecirc;n t&agrave;i năng do Ch&iacute;nh phủ Sierra Leone tuyển chọn v&agrave; t&agrave;i trợ.<br />
<br />
Trước đ&oacute;, ng&agrave;y 15/3, trong khu&ocirc;n khổ chuyến thăm Việt Nam, Tổng thống Julius Maada Bio v&agrave; phu nh&acirc;n c&ugrave;ng Đo&agrave;n đại biểu cấp cao Cộng h&ograve;a Sierra Leone cũng đ&atilde; thăm Đại học FPT tại Khu c&ocirc;ng nghệ cao H&ograve;a Lạc, H&agrave; Nội.</p>

', N'CuongNC', 3)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (26, N'Sinh viên Đại học FPT đón năm mới trên đất Mỹ', 1, CAST(N'2022-04-02T07:01:38.000' AS DateTime), N'<p><strong>C&aacute;c c&oacute;c nh&agrave; m&igrave;nh l&agrave;m g&igrave; m&agrave; lặn lội cả nửa v&ograve;ng tr&aacute;i đất vậy ta? Kh&ocirc;ng c&ograve;n l&agrave; những chuyến đi ngắn hạn v&ograve;ng quanh Ch&acirc;u &Aacute;, nay Ph&ograve;ng hợp t&aacute;c quốc tế IC của FPTU HCM đ&atilde; kết hợp c&ugrave;ng đối t&aacute;c IUP (Indiana University of Pennsylvania) đưa sinh vi&ecirc;n của m&igrave;nh bước v&agrave;o 3 tuần trải nghiệm cuộc sống của du học sinh tại đất Mỹ. Đến với kho&aacute; học lần n&agrave;y, c&aacute;c bạn vừa được trải nghiệm văn ho&aacute; đặc biệt, lại tăng khả năng th&iacute;ch nghi tốt hơn bởi điều kiện thời tiết khắc nghiệt, cũng như cho những ai c&oacute; đam m&ecirc; về kinh tế, muốn thử sức m&igrave;nh ở một m&ocirc;i trường ho&agrave;n to&agrave;n mới. H&atilde;y c&ugrave;ng xem mọi người n&oacute;i g&igrave; sau chuyến đi n&agrave;y nh&eacute;?</strong></p>

<p>Đầu ti&ecirc;n c&ugrave;ng điểm qua một ch&uacute;t về ng&ocirc;i trường m&agrave; c&aacute;c c&oacute;c đ&atilde; đặt ch&acirc;n đến. Viện Đại học Pennsylvania hay c&ograve;n gọi l&agrave; Đại học Pennsylvania l&agrave; một viện đại học tư thục toạ lạc ở bang Pennsylvania, Hoa Kỳ. Thế mạnh của trường l&agrave; về c&aacute;c ng&agrave;nh khoa học cơ bản, nh&acirc;n học, gi&aacute;o dục học, kinh doanh&hellip;</p>

<p>Thời điểm m&agrave; c&aacute;c bạn sinh vi&ecirc;n đổ bộ, rơi đ&uacute;ng v&agrave;o Lễ Gi&aacute;ng sinh v&agrave; Năm mới, v&igrave; vậy kh&iacute; hậu cực k&igrave; lạnh. C&aacute;c c&oacute;c đ&atilde; gặp kh&oacute; khăn trong việc l&agrave;m quen với điều kiện thời tiết cực k&igrave; lạnh b&ecirc;n n&agrave;y. Đ&agrave; Lạt ư? Kh&ocirc;ng! Ban ng&agrave;y cho tới chiều sinh hoạt học tập th&igrave; vẫn c&ograve;n ổn, nhưng đến đ&ecirc;m muốn đi bộ l&ecirc;n downtown l&agrave; &ldquo;phải full gi&aacute;p mới d&aacute;m đi ra ngo&agrave;i&rdquo;.&nbsp;</p>

<p>Bạn H.Tr. T&agrave;i, K12, ng&agrave;nh Ng&ocirc;n ngữ Anh chia sẻ một kỉ niệm vui: &ldquo;Ở khu vực anh ở lạnh lắm, nhiệt độ trung b&igrave;nh từ -10&deg;C tới 2&deg;C. Mặc d&ugrave; trời lạnh run cầm cập nhưng tinh thần sống ảo vẫn rất cao. Nhớ như in ng&agrave;y đ&oacute; trời -12&deg;C, thấy trời tuyết rơi đẹp qu&aacute; n&ecirc;n anh lột c&aacute;i &aacute;o ấm ra khỏi người trước sự chứng kiến đầy kinh ngạc của mọi người chỉ để&hellip; chụp h&igrave;nh&rdquo;.</p>

<p><br />
Quả thật, thời tiết lạnh gi&aacute; kh&ocirc;ng thể ngăn cản bước ch&acirc;n của mọi người tham gia c&aacute;c hoạt động ngo&agrave;i trời, kh&ocirc;ng chỉ l&agrave; chụp h&igrave;nh sống ảo, c&ograve;n c&oacute; cả snow tubing (trượt tuyết bằng phao). Đ&acirc;y cũng ch&iacute;nh l&agrave; hoạt động đ&aacute;ng nhớ nhất của đo&agrave;n sinh vi&ecirc;n m&igrave;nh khi sang Mỹ sau những giờ học tập căng thẳng.</p>

<p><br />
B&ecirc;n cạnh c&aacute;c hoạt động th&acirc;n thiện với thời tiết lạnh gi&aacute;, ắt hẳn mọi người cũng biết Mỹ c&oacute; kha kh&aacute; cửa h&agrave;ng Apple store, hơn nữa c&aacute;c mặt h&agrave;ng gi&aacute; cả cũng nhẹ hơn khi về Việt Nam, n&ecirc;n tinh thần shopping của mọi người cũng cứ thế được thời như c&aacute; gặp nước.&nbsp;</p>

<p><br />
Bạn N.V. Qu&yacute;, K10B, ng&agrave;nh An to&agrave;n Th&ocirc;ng tin cho biết một trong những điều đ&aacute;ng nhớ nhất của m&igrave;nh đ&oacute; l&agrave;: &rdquo;C&ograve;n 5 ph&uacute;t nữa Apple store đ&oacute;ng cửa nhưng tụi anh vẫn kịp mua v&agrave;i m&oacute;n m&agrave; tụi anh muốn mua khi sang Mỹ&rdquo;.</p>

<p><br />
&ldquo;Mỹ l&agrave; một đất nước rất đ&aacute;ng để đi du học, nhưng c&aacute;c bạn n&ecirc;n chọn trường n&agrave;o đ&oacute; ph&ugrave; hợp với m&igrave;nh. Nếu như c&aacute;c bạn th&iacute;ch dịch chuyển, muốn được ăn những m&oacute;n ăn ngon hay muốn đi đ&acirc;u cũng gần th&igrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n chọn IUP. C&ograve;n ai muốn c&oacute; sự y&ecirc;n b&igrave;nh, tiếp x&uacute;c với trời lạnh v&agrave; tuyết th&igrave; m&igrave;nh nghĩ IUP l&agrave; một nơi đ&aacute;ng để thử!&rdquo; &ndash; bạn H.Tr. T&agrave;i chia sẻ.</p>

<p><br />
Cũng đồng quan điểm, bạn Đ.N.G. Thanh, K12, ng&agrave;nh Kinh doanh Quốc tế cho biết mặc d&ugrave; cũng kh&aacute; bối rối trước lịch tr&igrave;nh chuyến đi nhiều bất ngờ v&agrave; ch&oacute;ng v&aacute;nh, nhưng nếu được lựa chọn lại, bạn vẫn sẽ lựa chọn đăng k&yacute; h&agrave;nh tr&igrave;nh k&eacute;o d&agrave;i 3 tuần n&agrave;y. Đi để trải nghiệm, đi để thu về cho m&igrave;nh những kiến thức, v&agrave; biết đ&acirc;u trong tương lai, bạn sẽ c&oacute; dịp quay lại đất Mỹ để tiếp tục trau dồi học vấn của m&igrave;nh l&ecirc;n tầm cao hơn.</p>
', N'CuongNC', 3)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (27, N'Đúng cam kết, HoSE chính thức vận hành hệ thống giao dịch mới do FPT cung cấp', 0, CAST(N'2022-04-02T08:13:43.000' AS DateTime), N'<p><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><strong><em><span style="font-family:&quot;Mulish&quot;,&quot;serif&quot;"><span style="color:#212529">S&aacute;ng 5/7, hệ thống giao dịch mới do FPT cung cấp ch&iacute;nh thức đi v&agrave;o vận h&agrave;nh sau 100 ng&agrave;y triển khai dự &aacute;n, khắc phục t&igrave;nh trạng qu&aacute; tải tại Sở Giao dịch Chứng kho&aacute;n TP HCM (HoSE).</span></span></em></strong></span></span></span></p>

<p><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><strong><em>&nbsp;</em></strong></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-family:&quot;Mulish&quot;,&quot;serif&quot;"><span style="color:#212529">8h30 ng&agrave;y 5/7, to&agrave;n bộ 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống, sẵn s&agrave;ng cho phi&ecirc;n giao dịch đầu tuần. Qu&aacute; tr&igrave;nh kết nối bắt đầu từ 7h30. Khoảng 15 ph&uacute;t sau, 61 trong số 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống. C&aacute;c c&ocirc;ng ty đ&atilde; được thử nghiệm nhiều lần trong ba tuần cuối th&aacute;ng 6 v&agrave; gần nhất l&agrave; hai ng&agrave;y cuối tuần qua.<br />
<br />
Ngay từ đầu phi&ecirc;n giao dịch, &aacute;p lực b&aacute;n mạnh đ&atilde; xuất hiện, khiến nhiều cổ phiếu vốn h&oacute;a lớn lao dốc v&agrave; điều n&agrave;y khiến c&aacute;c chỉ số l&ugrave;i xuống dưới mốc tham chiếu. Trong đ&oacute;, c&aacute;c m&atilde; chứng kho&aacute;n như HCM, BVS, MBS, VND... đều ch&igrave;m trong sắc đỏ. C&aacute;c cổ phiếu lớn như MSN, VCB, SAB, GAS... cũng đồng loạt giảm gi&aacute; v&agrave; t&aacute;c động xấu đến thị trường chung. Ở chiều ngược lại, FPT, MWG, HDB, SHB, ACB... l&agrave; những c&aacute;i t&ecirc;n đang đ&oacute;ng vai tr&ograve; n&acirc;ng đỡ thị trường chung v&agrave; gi&uacute;p c&aacute;c chỉ số thu hẹp đ&agrave; giảm.&nbsp;&nbsp;</span></span></span></span></span></p>

<p style="text-align:justify"><iframe frameborder="0" scrolling="no" src="https://drive.google.com/file/d/131iMsRIx7kQrMoC9vY0nXY4_W2uMLTRO/preview"></iframe></p>
', N'CuongNC', 2)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (28, N'test tin tức', 0, CAST(N'2022-04-05T00:00:00.000' AS DateTime), N'<p>test tin tức1 123</p>
', N'CuongNC', 0)
INSERT [SWP391].[News] ([id], [name], [status], [create_time], [content], [author], [view]) VALUES (29, N'Đúng cam kết, VNG chính thức vận hành hệ thống giao dịch mới do FPT cung cấp', 0, CAST(N'2022-04-06T00:00:00.000' AS DateTime), N'<p><span style="font-size:12pt"><span style="background-color:white"><strong><em><span style="font-size:13.0pt"><span style="color:#212529">S&aacute;ng 5/7, hệ thống giao dịch mới do FPT cung cấp ch&iacute;nh thức đi v&agrave;o vận h&agrave;nh sau 100 ng&agrave;y triển khai dự &aacute;n, khắc phục t&igrave;nh trạng qu&aacute; tải tại Sở Giao dịch Chứng kho&aacute;n TP HCM (HoSE).</span></span></em></strong></span></span></p>

<p><span style="font-size:12pt"><span style="background-color:white"><strong><em>&nbsp;</em></strong></span></span></p>

<p><span style="font-size:13.0pt"><span style="color:#212529">8h30 ng&agrave;y 5/7, to&agrave;n bộ 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống, sẵn s&agrave;ng cho phi&ecirc;n giao dịch đầu tuần. Qu&aacute; tr&igrave;nh kết nối bắt đầu từ 7h30. Khoảng 15 ph&uacute;t sau, 61 trong số 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống. C&aacute;c c&ocirc;ng ty đ&atilde; được thử nghiệm nhiều lần trong ba tuần cuối th&aacute;ng 6 v&agrave; gần nhất l&agrave; hai ng&agrave;y cuối tuần qua.<br />
<br />
Ngay từ đầu phi&ecirc;n giao dịch, &aacute;p lực b&aacute;n mạnh đ&atilde; xuất hiện, khiến nhiều cổ phiếu vốn h&oacute;a lớn lao dốc v&agrave; điều n&agrave;y khiến c&aacute;c chỉ số l&ugrave;i xuống dưới mốc tham chiếu. Trong đ&oacute;, c&aacute;c m&atilde; chứng kho&aacute;n như HCM, BVS, MBS, VND... đều ch&igrave;m trong sắc đỏ. C&aacute;c cổ phiếu lớn như MSN, VCB, SAB, GAS... cũng đồng loạt giảm gi&aacute; v&agrave; t&aacute;c động xấu đến thị trường chung. Ở chiều ngược lại, FPT, MWG, HDB, SHB, ACB... l&agrave; những c&aacute;i t&ecirc;n đang đ&oacute;ng vai tr&ograve; n&acirc;ng đỡ thị trường chung v&agrave; gi&uacute;p c&aacute;c chỉ số thu hẹp đ&agrave; giảm.</span></span></p>

<p><span style="font-size:12pt"><span style="background-color:white"><strong><em><span style="font-size:13.0pt"><span style="color:#212529">S&aacute;ng 5/7, hệ thống giao dịch mới do FPT cung cấp ch&iacute;nh thức đi v&agrave;o vận h&agrave;nh sau 100 ng&agrave;y triển khai dự &aacute;n, khắc phục t&igrave;nh trạng qu&aacute; tải tại Sở Giao dịch Chứng kho&aacute;n TP HCM (HoSE).</span></span></em></strong></span></span></p>

<p><span style="font-size:12pt"><span style="background-color:white"><strong><em>&nbsp;</em></strong></span></span></p>

<p><span style="font-size:13.0pt"><span style="color:#212529">8h30 ng&agrave;y 5/7, to&agrave;n bộ 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống, sẵn s&agrave;ng cho phi&ecirc;n giao dịch đầu tuần. Qu&aacute; tr&igrave;nh kết nối bắt đầu từ 7h30. Khoảng 15 ph&uacute;t sau, 61 trong số 73 c&ocirc;ng ty chứng kho&aacute;n đ&atilde; kết nối th&agrave;nh c&ocirc;ng v&agrave;o hệ thống. C&aacute;c c&ocirc;ng ty đ&atilde; được thử nghiệm nhiều lần trong ba tuần cuối th&aacute;ng 6 v&agrave; gần nhất l&agrave; hai ng&agrave;y cuối tuần qua.<br />
<br />
Ngay từ đầu phi&ecirc;n giao dịch, &aacute;p lực b&aacute;n mạnh đ&atilde; xuất hiện, khiến nhiều cổ phiếu vốn h&oacute;a lớn lao dốc v&agrave; điều n&agrave;y khiến c&aacute;c chỉ số l&ugrave;i xuống dưới mốc tham chiếu. Trong đ&oacute;, c&aacute;c m&atilde; chứng kho&aacute;n như HCM, BVS, MBS, VND... đều ch&igrave;m trong sắc đỏ. C&aacute;c cổ phiếu lớn như MSN, VCB, SAB, GAS... cũng đồng loạt giảm gi&aacute; v&agrave; t&aacute;c động xấu đến thị trường chung. Ở chiều ngược lại, FPT, MWG, HDB, SHB, ACB... l&agrave; những c&aacute;i t&ecirc;n đang đ&oacute;ng vai tr&ograve; n&acirc;ng đỡ thị trường chung v&agrave; gi&uacute;p c&aacute;c chỉ số thu hẹp đ&agrave; giảm.</span></span></p>

<p style="text-align:center"><iframe frameborder="0" scrolling="no" src="https://drive.google.com/file/d/131iMsRIx7kQrMoC9vY0nXY4_W2uMLTRO/preview"></iframe></p>

<p style="text-align:center"><iframe frameborder="0" scrolling="no" src="https://www.youtube.com/embed/b7OoE98yj5w"></iframe>&nbsp;&nbsp;<iframe frameborder="0" scrolling="no" src="https://www.youtube.com/embed/b7OoE98yj5w"></iframe></p>

<p style="text-align:center">&nbsp;</p>

<p>&nbsp;</p>
', N'CuongNC', 3)
SET IDENTITY_INSERT [SWP391].[News] OFF
GO
SET IDENTITY_INSERT [SWP391].[News_Images] ON 

INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (4, N'DSSV.jpg
', 6)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (5, N'DSSV3.png', 7)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (6, N'job3.png', 8)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (7, N'Capture.PNG', 9)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (8, N'hoixuan.jpg', 10)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (9, N'cover2.jpg', 11)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (10, N'DSSV4.jpg', 12)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (11, N'blue-technology-background_23-2147514332.jpg', 13)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (12, N'DSSV4.jpg', 14)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (13, N'DSSV4.jpg', 15)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (14, N'bg-form-login.jpg', 16)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (15, N'HNQT5.png', 17)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (16, N'hoixuan.jpg', 18)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (17, N'Bosch.png', 19)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (18, N'ASUS.jpg', 20)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (19, N'fsoft.png', 21)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (20, N'vng.jpg', 22)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (21, N'DSSV2.jpeg', 23)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (22, N'tintuc1.jpg', 24)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (23, N'HNQT1.jpeg', 25)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (24, N'HNQT3.png', 26)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (25, N'hitech.jpg', 27)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (26, N'HNQT2.png', 28)
INSERT [SWP391].[News_Images] ([idNews_Images], [link], [News_id]) VALUES (27, N'hitech.jpg', 29)
SET IDENTITY_INSERT [SWP391].[News_Images] OFF
GO
SET IDENTITY_INSERT [SWP391].[News_Tags] ON 

INSERT [SWP391].[News_Tags] ([idNews_Tags], [name]) VALUES (4, N'Đời sống sinh viên')
INSERT [SWP391].[News_Tags] ([idNews_Tags], [name]) VALUES (5, N'FPT High-tech')
INSERT [SWP391].[News_Tags] ([idNews_Tags], [name]) VALUES (6, N'Hội nhập quốc tế')
SET IDENTITY_INSERT [SWP391].[News_Tags] OFF
GO
SET IDENTITY_INSERT [SWP391].[News_Tags_has_News] ON 

INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (3, 4, 6)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (4, 4, 7)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (5, 6, 8)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (6, 4, 9)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (7, 5, 10)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (8, 6, 11)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (9, 4, 12)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (10, 5, 13)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (11, 6, 14)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (12, 4, 15)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (13, 5, 16)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (14, 6, 17)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (15, 4, 18)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (16, 5, 19)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (17, 5, 20)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (18, 5, 21)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (19, 5, 22)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (20, 4, 23)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (21, 6, 24)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (22, 6, 25)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (23, 6, 26)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (24, 5, 27)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (25, 5, 28)
INSERT [SWP391].[News_Tags_has_News] ([id], [News_Tags_idNews_Tags], [News_id]) VALUES (26, 5, 29)
SET IDENTITY_INSERT [SWP391].[News_Tags_has_News] OFF
GO
SET IDENTITY_INSERT [SWP391].[Recruitment] ON 

INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (6, CAST(N'2022-03-26' AS Date), CAST(N'2022-04-27' AS Date), 40, N'<p>FPT Software Academy ch&iacute;nh l&agrave; nơi khởi đầu cho những th&agrave;nh c&ocirc;ng của c&aacute;c kỹ sư CNTT trong tương lai, cung cấp v&agrave; đ&agrave;o tạo nguồn nh&acirc;n lực IT chất lượng cao cho c&aacute;c dự &aacute;n lớn tr&ecirc;n to&agrave;n cầu</p>
', 6, 1, N'Front-End Developer 1', N'CuongNC', CAST(N'2022-04-04T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (8, CAST(N'2022-03-26' AS Date), CAST(N'2022-04-26' AS Date), 7, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 7, 1, N'Front-End Developer 2', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (12, CAST(N'2022-03-27' AS Date), CAST(N'2022-04-27' AS Date), 8, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 8, 1, N'Front-End Developer 3', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (14, CAST(N'2022-04-10' AS Date), CAST(N'2022-05-10' AS Date), 9.5, N'- Salary: up to 10.000$
- Địa điểm: AP Tower, 518B Điện Biên Phủ, Phường 21, Quận Bình Thạnh, Thành phố Hồ Chí Minh
- Kinh nghiệm: 3 năm
- Chức vụ: nhân viên
- Full time
- Skills: Javascript, Front-end, ReactJS
If you are looking for a company where you can show your skills in a dynamic environment, please come to us! Being part of our company, you will work with a funny and happy team Additionally, you will also be able to contribute your skills, experience and knowledge to other project teams.

Your role & responsibilities:
Develop custom data driven application using Newest Technology.
Operate in an Agile/Scrum Environment.
Participate in team brainstorming and design sessions.
Communicate well with all team members, non-technical as well as technical.
Suggest and give feedback within the team to improve performance and product.
Your skills & qualifications:
Must be used to Modern Javascript (Common JS and ES6 or later)
At least 3 years of career.
Willing to learn a new thing.
Back-end: good at handling Node.js with express, nest, koa). Be used to RDMS and SQL. Be able to make the service architecture quickly on AWS.
Front-end: good at using React.js (next.js) with redux or another else. Be able to make any reusable components. Be able to make structural JSX with detail finishing.
We don’t prefer:
Someone says I’m right always without persuading or reasonable reason.
Someone is stubborn or cynical, complain or blame without a solution.
Someone wants to be an artist: we have deadlines and limited-condition for each project and situation. We want an ‘Engineer’. Not an artist.
Communicate well with all team members, non-technical as well as technical.
Someone thinks TDD or BDD is time-wasting.
Contact:
Phone: 09090909
Email: FPTsoftware@gmail.com
Someone wants to be an artist: we have deadlines and limited-condition for each project and situation. We want an ‘Engineer’. Not an artist.
Address: AP Tower, 518B Điện Biên Phủ, Phường 21, Quận Bình Thạnh, Thành phố Hồ Chí Minh', 9, 1, N'Front-End Developer 4', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (15, CAST(N'2022-04-15' AS Date), CAST(N'2022-05-15' AS Date), 10, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 10, 1, N'Node JS Developer Fulltime 1', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (16, CAST(N'2022-04-21' AS Date), CAST(N'2022-05-21' AS Date), 11, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 11, 1, N'Node JS Developer Fulltime 2', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (17, CAST(N'2022-04-23' AS Date), CAST(N'2022-05-23' AS Date), 7.5, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 12, 1, N'Node JS Developer Fulltime 3', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (18, CAST(N'2022-04-25' AS Date), CAST(N'2022-05-25' AS Date), 8.9, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 13, 1, N'Node JS Developer Fulltime 4', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (19, CAST(N'2022-04-26' AS Date), CAST(N'2022-05-26' AS Date), 9.4, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 14, 1, N'Mobile Developer (IOS/Android/React Native) 1', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (20, CAST(N'2022-04-27' AS Date), CAST(N'2022-05-27' AS Date), 7.2, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 15, 1, N'Mobile Developer (IOS/Android/React Native) 2', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (21, CAST(N'2022-04-27' AS Date), CAST(N'2022-05-27' AS Date), 9.8, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 16, 1, N'Mobile Developer (IOS/Android/React Native) 3', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (22, CAST(N'2022-04-27' AS Date), CAST(N'2022-05-27' AS Date), 12, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 17, 1, N'Mobile Developer (IOS/Android/React Native) 4', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (23, CAST(N'2022-04-27' AS Date), CAST(N'2022-05-27' AS Date), 12.5, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 18, 1, N'Full-Stack Developer (Mobile/Web Developer) - Lương Lên Tới 40 Triệu 1', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (24, CAST(N'2022-04-30' AS Date), CAST(N'2022-05-30' AS Date), 13.3, N'<p>FPT Software Academy ch&iacute;nh l&agrave; nơi khởi đầu cho những th&agrave;nh c&ocirc;ng của c&aacute;c kỹ sư CNTT trong tương lai, cung cấp v&agrave; đ&agrave;o tạo nguồn nh&acirc;n lực IT chất lượng cao cho c&aacute;c dự &aacute;n lớn tr&ecirc;n to&agrave;n cầu</p>
', 19, 1, N'Full-Stack Developer (Mobile/Web Developer) - Lương Lên Tới 40 Triệu 2', N'CuongNC', CAST(N'2022-04-05T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (25, CAST(N'2022-04-30' AS Date), CAST(N'2022-05-30' AS Date), 15, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 20, 0, N'Full-Stack Developer (Mobile/Web Developer) - Lương Lên Tới 40 Triệu 3', N'CuongNC', CAST(N'2022-03-21T14:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (26, CAST(N'2022-04-30' AS Date), CAST(N'2022-04-30' AS Date), 40, N'FPT Software Academy chính là nơi khởi đầu cho những thành công của các kỹ sư CNTT trong tương lai, cung cấp và đào tạo nguồn nhân lực IT chất lượng cao cho các dự án lớn trên toàn cầu', 21, 0, N'Full-Stack Developer (Mobile/Web Developer) - Lương Lên Tới 40 Triệu 4', N'CuongNC', CAST(N'2022-03-21T20:38:12.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (28, CAST(N'2022-03-29' AS Date), CAST(N'2022-03-31' AS Date), 11, N'<p>u</p>
', 9, 1, N'u', N'CuongNC', CAST(N'2022-03-28T01:45:15.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (29, CAST(N'2022-04-13' AS Date), CAST(N'2022-04-17' AS Date), 10, N'<h2>M&Ocirc; TẢ C&Ocirc;NG VIỆC</h2>

<p>- Ph&aacute;t triển c&aacute;c giải ph&aacute;p ứng dụng (Website/Mobile) cho Vinpearl v&agrave; c&aacute;c c&ocirc;ng ty th&agrave;nh vi&ecirc;n trong tập đo&agrave;n<br />
- Hỗ trợ người d&ugrave;ng c&aacute;c hệ thống phần mềm nghiệp vụ<br />
- Triển khai c&aacute;c hệ thống<br />
- Phối hợp với c&aacute;c đơn vị hoặc c&aacute;c c&ocirc;ng ty trong tập đo&agrave;n để xử l&yacute; khi c&oacute; c&ocirc;ng việc ph&aacute;t sinh.<br />
<br />
* Th&ocirc;ng tin kh&aacute;c:<br />
- SL tuyển dụng: 02<br />
- H&igrave;nh thức l&agrave;m việc: to&agrave;n thời gian<br />
- Mức lương v&agrave; CĐPL: thỏa thuận</p>

<h2>Y&Ecirc;U CẦU C&Ocirc;NG VIỆC</h2>

<p>- C&oacute; 2-3 năm kinh nghiệm ở vị tr&iacute; tương đương<br />
- C&oacute; kinh nghiệm .Net (.Net Core, .Net Framework) x&acirc;y dựng v&agrave; tối ưu một dự &aacute;n ho&agrave;n chỉnh (BE, FE)<br />
- C&oacute; khả năng thiết kế v&agrave; quản trị cơ sở dữ liệu: SQL Server, MySQL, NoSQL,..<br />
- C&oacute; khả năng tư vấn về kiến tr&uacute;c giải ph&aacute;p cho người d&ugrave;ng dựa tr&ecirc;n y&ecirc;u cầu nghiệp vụ<br />
- Ưu ti&ecirc;n UV c&oacute; hiểu biết về hạ tầng Cloud &amp; On Premise, triển khai CICD<br />
- Ưu ti&ecirc;n c&oacute; hiểu biết về c&aacute;c ng&ocirc;n ngữ kh&aacute;c: PHP, JS, Python, Reactjs,..<br />
- Ưu ti&ecirc;n UV sử dụng tốt cả 2 nền tảng Windows v&agrave; Linux</p>

<h2>ĐỊA ĐIỂM L&Agrave;M VIỆC</h2>

<p>&nbsp;</p>
', 10, 1, N'[Viettel] Full-Stack Developer', N'CuongNC', CAST(N'2022-04-02T07:24:50.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (30, CAST(N'2022-04-28' AS Date), CAST(N'2022-04-29' AS Date), 19, N'<p>test tuyển dụng 123</p>
', 9, 0, N'test tuyển dụng', N'CuongNC', CAST(N'2022-04-05T00:00:00.0000000' AS DateTime2))
INSERT [SWP391].[Recruitment] ([idRecruitment], [startDate], [endDate], [salary], [description], [Company_id], [status], [name], [owner], [createDate]) VALUES (31, CAST(N'2022-04-06' AS Date), CAST(N'2022-05-06' AS Date), 15.5, N'<h2><span style="font-size:13pt"><span style="background-color:white"><span style="color:#2e74b5"><strong><span style="font-size:16.0pt"><span style="color:#333333">C&Aacute;C PH&Uacute;C LỢI D&Agrave;NH CHO BẠN</span></span></strong></span></span></span></h2>

<p><span style="font-size:11pt"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="background-color:white"><span style="color:#333333">13 Month Bonus system based on profitability</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="background-color:white"><span style="color:#333333">Personal Accident and Healthcare insurance, yearly health-check and other benefits</span></span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="background-color:white"><span style="color:#333333">Yearly salary review</span></span></span></span></span></p>

<p>&nbsp;</p>

<h2><span style="font-size:13pt"><span style="background-color:white"><span style="color:#2e74b5"><strong><span style="font-size:16.0pt"><span style="color:#333333">M&Ocirc; TẢ C&Ocirc;NG VIỆC</span></span></strong></span></span></span></h2>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="color:#333333">The Representative Office of Four Hands LLC in HCMC is seeking for a dynamic and motivated Senior Full Stack.NET developer for our International team. In this role, you will be responsible for delivering best in class solutions to your internal stakeholders.<br />
<br />
***CORE RESPONSIBILITIES:<br />
&bull; Work as International Team Member of the application development service, with special emphasis on implementing the UI components, the business logic and data access layer of application code (HTML, CSS, ReactJS, TSQL, C#, and ASP.NET, etc.)<br />
&bull; Review, analyze, and modify existing proprietary applications to correct errors, improve performance and add new features</span></span></span></span></span></p>

<h2><span style="font-size:13pt"><span style="background-color:white"><span style="color:#2e74b5"><strong><span style="font-size:16.0pt"><span style="color:#333333">Y&Ecirc;U CẦU C&Ocirc;NG VIỆC</span></span></strong></span></span></span></h2>

<p><span style="font-size:11pt"><span style="background-color:white"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="color:#333333">DESIRED SKILLS AND EXPERIENCE<br />
&bull; Plus 5 years of experience in the same field<br />
&bull; English communication proficiency<br />
&bull; B.S. Degree in Information Technology/Computer Science/Software Engineering or equivalent<br />
&bull; Strong back-end development skills in C# and SQL Server (5+ years): ASP.NET 4.8 - C#, ASP.NET Core 3.1 - C#<br />
&bull; Solid front-end development experience working with UI &amp; JavaScript frameworks (3+ years): JavaScript, HTML, CSS / LESS / SASS, ReactJS, TypeScript, Bootstrap UI/ Office Fabric UI / Material UI<br />
<br />
WHAT&rsquo;S A PLUS BUT NOT MANDATORY:<br />
- Experienced with Microsoft 365 and SharePoint Online<br />
- Experienced with Azure Services: Azure apps, Blob Storage, etc.<br />
- Experienced with CI/CD and Azure DevOps<br />
<br />
REMUNERATION &amp; BENEFITS:<br />
*Competitive Salary<br />
*13th month salary and quarterly international profit share bonus<br />
*Annual Salary review &amp; Health check-up<br />
*Opportunities working with our global stakeholders</span></span></span></span></span></p>

<h2><span style="font-size:13pt"><span style="background-color:white"><span style="color:#2e74b5"><strong><span style="font-size:16.0pt"><span style="color:#333333">ĐỊA ĐIỂM L&Agrave;M VIỆC</span></span></strong></span></span></span></h2>

<p><span style="font-size:11pt"><span style="font-family:Calibri,"><span style="font-size:10.5pt"><span style="background-color:white"><span style="color:#333333">Ho Chi Minh City, Vietnam 123</span></span></span></span></span></p>
', 27, 1, N'[MISA] Tuyển BACK-END', N'CuongNC', CAST(N'2022-04-06T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [SWP391].[Recruitment] OFF
GO
SET IDENTITY_INSERT [SWP391].[Recruitment_Category] ON 

INSERT [SWP391].[Recruitment_Category] ([idRecruitment_Category], [name]) VALUES (4, N'Frontend')
INSERT [SWP391].[Recruitment_Category] ([idRecruitment_Category], [name]) VALUES (5, N'Backend')
INSERT [SWP391].[Recruitment_Category] ([idRecruitment_Category], [name]) VALUES (6, N'Mobile')
INSERT [SWP391].[Recruitment_Category] ([idRecruitment_Category], [name]) VALUES (7, N'FullStack')
SET IDENTITY_INSERT [SWP391].[Recruitment_Category] OFF
GO
SET IDENTITY_INSERT [SWP391].[Recruitment_has_Recruitment_Category] ON 

INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (6, 4, 3)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (8, 4, 6)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (12, 4, 7)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (14, 4, 8)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (15, 5, 9)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (16, 5, 10)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (17, 5, 11)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (18, 5, 12)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (19, 6, 13)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (20, 6, 14)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (21, 6, 15)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (22, 6, 16)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (23, 7, 17)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (24, 7, 18)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (25, 7, 19)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (26, 7, 20)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (28, 6, 21)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (29, 7, 22)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (30, 5, 23)
INSERT [SWP391].[Recruitment_has_Recruitment_Category] ([Recruitment_id], [Recruitment_Category_id], [id]) VALUES (31, 5, 24)
SET IDENTITY_INSERT [SWP391].[Recruitment_has_Recruitment_Category] OFF
GO
SET IDENTITY_INSERT [SWP391].[Student_Application] ON 

INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (5, N'Nguyễn Chí Cường', N'0902527421', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (6, N'Nguyễn Thị Loan', N'0923952847', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (7, N'Lê Hoàng Nhi', N'0937572849', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (8, N'Nguyễn Đăng Khoa', N'9238710311', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (9, N'Trần Hải Yến', N'0348728947', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (10, N'Nguyễn Vũ Long', N'0284816384', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (11, N'Nguyễn Quốc Bửu', N'0295827416', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (12, N'Nguyễn Thị Mẫn Nhi', N'0182748593', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (13, N'Lê Anh Tú', N'0947432786', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (14, N'Nguyễn Quốc Hoài', N'0924716381', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (15, N'Nguyễn Yến Linh', N'0927153848', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (16, N'Đào hồng Sơn', N'0912345678', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (17, N'Lê Cao Kiến', N'0923871283', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (18, N'Đoàn Hữu Khánh Hưng', N'0948721471', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (19, N'Nguyễn Khánh Hòa', N'0923784881', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (20, N'Đào Việt Bắc', N'0932484372', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (21, N'Nguyễn Văn Bách', N'0934871743', 1)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (22, N'Hà Thị Tuyết Như', N'0128374827', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (23, N'Lê Thúy Hằng', N'0923871837', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (24, N'Lê Tấn Huy', N'0923183721', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (25, N'Lê Thúy Hằng', N'0923871837', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (26, N'Trần Quốc Toản', N'0934719834', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (27, N'Trần Nhung', N'0931287321', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (28, N'Phương Hoa', N'0923217382', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (29, N'Lý Kim Ngân', N'0934819478', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (30, N'Nguyễn Tuyết Nhung', N'0923821738', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (31, N'Mai Đình Hào', N'0923218371', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (32, N'Bành Thị Trướng', N'0928371467', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (33, N'Nguyễn Văn Lang', N'09834923', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (34, N'Nguyễn Thị Dọi', N'0909090909', 0)
INSERT [SWP391].[Student_Application] ([id], [name], [phone], [status]) VALUES (35, N'Võ Thị Thanh Long', N'0902222222', 0)
SET IDENTITY_INSERT [SWP391].[Student_Application] OFF
GO
SET IDENTITY_INSERT [SWP391].[Subjects] ON 

INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (3, N'https://drive.google.com/drive/folders/1jtHVY8GgenAGH4rL1ZqIuu7yuaoQ67l2', N'MAE101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (5, N'https://drive.google.com/file/d/1Txye9eD_UoC1Po6OpJriLj6Zx5y_j4qv/view', N'CEA201', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (6, N'https://drive.google.com/file/d/1BblCxGDlzgwuTNtosO-R-GMoEmv2PG3y/view', N'CSI101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (7, N'https://drive.google.com/drive/folders/1FyboAPGD96WV2_JtT22yPuT5coTq1hi1', N'DBI202', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (8, N'https://drive.google.com/drive/folders/1WZtmLd-Tb20BZ_N2lBG22hbL1B18G1fi', N'OSG202', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (9, N'https://github.com/thaycacac/java/tree/master/%5BCSD201%5D%20Data%20Structures%20and%20Algorithms', N'CSD201', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (10, N'https://drive.google.com/drive/folders/1V5ax-ej6xR-WHeGyHsdcHEJ40gBt5n2t', N'NWC202', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (11, N'https://drive.google.com/drive/u/1/folders/1WAdhmGobI5TTfNHJAV8thcO48t4KxVlw', N'SYB303c', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (12, N'https://drive.google.com/drive/folders/1s4HH-_fPGw_DLQEHFSdgXBKWVSc4TWdU', N'ACC101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (13, N'https://quizlet.com/433386576/isc301-flash-cards/', N'ISC301', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (14, N'https://drive.google.com/drive/folders/1vtBhYIJ9sRgOZQoI9HR2Cu6An9GsPEVg', N'PMG201c', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (15, N'https://drive.google.com/drive/u/1/folders/1ETHAR-W406vtn3C8i3j2m_CUwivBjo5l', N'DBW301', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (16, N'https://quizlet.com/608504111/ite302c-coursera-flash-cards/', N'ITE302c', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (17, N'https://drive.google.com/drive/folders/1-VqdveudcIXH3u-dQumI_jx7t221m_f3', N'SSC102', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (18, N'https://drive.google.com/drive/folders/1vZ4bLE2de4DUXx7178bfgT1JxPDDi_lQ', N'SWD391', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (19, N'https://quizlet.com/243222059/ssg101-full-flash-cards/', N'SSG101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (20, N'https://drive.google.com/drive/folders/1ewFnvNXu1FsJAsBMlllb2225dPhY76Cu', N'MAD101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (21, N'https://www.youtube.com/watch?v=PlFM8P5_NFY&t=642s', N'MLN101', 4, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (27, N'https://www.youtube.com/watch?v=7rreX5GaBjw&list=PLxNMBnO9F8FO9-Kg2xOXO2BkRQOhgr-Vz&index=20', N'PRF192', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (28, N'https://drive.google.com/drive/folders/1R0dOhVNsh4grSCKmInMovTqwzm-3E8em', N'PRO201', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (29, N'https://drive.google.com/drive/folders/1IGLmaOCREQgKDwJ8BnlUo0GEMvkhyibO', N'PRO192', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (30, N'https://drive.google.com/drive/folders/1VXCUqOPP2JZUtEptxHp6OgUPfDGqh-2q', N'LAB101', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (31, N'https://drive.google.com/drive/folders/1g67dJBCV2LhY1vrjsJQ_0y9ZcUW4RQ1g', N'PRJ311', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (32, N'https://drive.google.com/drive/folders/1RWdf3SON-aiVAiJ0mojzwaOCuumtNCqu', N'LAB211', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (33, N'https://github.com/thaycacac/java/tree/master/%5BPRJ321%5D%20Web-based%20Java%20Applications/INCLASS', N'PRJ321', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (34, N'https://drive.google.com/drive/u/1/folders/1yqCng1FRqCmHjfIuvoPQTjzdzG_PmFKn', N'SWE102', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (35, N'https://drive.google.com/drive/folders/1mz8xB9b5Ebb-Bp3cTctD08tuNpPav-_v', N'LAB221', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (36, N'https://drive.google.com/drive/folders/1wF_D3vA0eOlauP9-mR0dYG28pNSVwftK', N'LAB231', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (37, N'https://github.com/Sharp-Team/ma-di-tuan', N'SWT301', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (38, N'https://www.youtube.com/watch?v=Mi33qK8TsCk', N'PRN292', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (39, N'https://drive.google.com/drive/folders/1Y44jhTCGZYLQGWmDPxum-_CcKpQ9aSou', N'HCI201', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (40, N'https://drive.google.com/file/d/1_1-mBHtDmriwDyoUDu1tr4Au-9nh9bsu/view', N'PRM391', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (41, N'https://drive.google.com/drive/u/1/folders/1jsWIfp-JATXT8NDARK5R8MHeBej9RWU1', N'SWR302', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (42, N'https://github.com/thaycacac/xml-learning', N'PRX301', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (43, N'https://quizlet.com/598460495/prc391-flash-cards/', N'PRC391', 3, 1)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (45, N'https://fap.fpt.edu.vn/', N'ABC', 3, 0)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (46, N'https://www.google.com.vn/', N'DEF', 4, 0)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (47, N'https://www.google.com.vn/', N'FGH', 4, 0)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (48, N'https://www.google.com.vn/', N'JKL', 4, 0)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (49, N'https://www.google.com.vn/', N'KOE123', 4, 0)
INSERT [SWP391].[Subjects] ([idSubjects], [link], [name], [Major_idMajor], [status]) VALUES (50, N'https://www.google.com.vn/', N'AKO301c', 4, 0)
SET IDENTITY_INSERT [SWP391].[Subjects] OFF
GO
/****** Object:  Index [fk_Account_Account_Status1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Account_Account_Status1_idx] ON [SWP391].[Account]
(
	[Account_Status_idAccount_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Event_Category_has_Events_Event_Category1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Event_Category_has_Events_Event_Category1_idx] ON [SWP391].[Event_Category_has_Events]
(
	[Event_Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Event_Category_has_Events_Events1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Event_Category_has_Events_Events1_idx] ON [SWP391].[Event_Category_has_Events]
(
	[Events_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Event_Images_Events1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Event_Images_Events1_idx] ON [SWP391].[Event_Images]
(
	[Events_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Event_Videos_Events1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Event_Videos_Events1_idx] ON [SWP391].[Event_Videos]
(
	[Events_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Events_has_Account_Account1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Events_has_Account_Account1_idx] ON [SWP391].[Events_has_Account]
(
	[Account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Events_has_Account_Events1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Events_has_Account_Events1_idx] ON [SWP391].[Events_has_Account]
(
	[Events_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_News_Images_News1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_News_Images_News1_idx] ON [SWP391].[News_Images]
(
	[News_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_News_Tags_has_News_News_Tags1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_News_Tags_has_News_News_Tags1_idx] ON [SWP391].[News_Tags_has_News]
(
	[News_Tags_idNews_Tags] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_News_Tags_has_News_News1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_News_Tags_has_News_News1_idx] ON [SWP391].[News_Tags_has_News]
(
	[News_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_News_Videos_News1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_News_Videos_News1_idx] ON [SWP391].[News_Videos]
(
	[News_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Recruitment_Company1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Recruitment_Company1_idx] ON [SWP391].[Recruitment]
(
	[Company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Recruitment_has_Recruitment_Category_Recruitment_Categor_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Recruitment_has_Recruitment_Category_Recruitment_Categor_idx] ON [SWP391].[Recruitment_has_Recruitment_Category]
(
	[Recruitment_Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Recruitment_has_Recruitment_Category_Recruitment1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Recruitment_has_Recruitment_Category_Recruitment1_idx] ON [SWP391].[Recruitment_has_Recruitment_Category]
(
	[Recruitment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_Subjects_Major1_idx]    Script Date: 4/6/2022 9:02:42 AM ******/
CREATE NONCLUSTERED INDEX [fk_Subjects_Major1_idx] ON [SWP391].[Subjects]
(
	[Major_idMajor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [SWP391].[Account] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [SWP391].[Account] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Account] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [SWP391].[Account] ADD  DEFAULT (NULL) FOR [isAdmin]
GO
ALTER TABLE [SWP391].[Account_Status] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Company] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Event_Category] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [startDate]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [endDate]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [owner]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [type]
GO
ALTER TABLE [SWP391].[Events] ADD  DEFAULT (NULL) FOR [createDate]
GO
ALTER TABLE [SWP391].[Major] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[News] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [SWP391].[News] ADD  DEFAULT (getdate()) FOR [create_time]
GO
ALTER TABLE [SWP391].[News] ADD  DEFAULT (NULL) FOR [author]
GO
ALTER TABLE [SWP391].[News] ADD  DEFAULT (NULL) FOR [view]
GO
ALTER TABLE [SWP391].[News_Tags] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Recruitment] ADD  DEFAULT (NULL) FOR [startDate]
GO
ALTER TABLE [SWP391].[Recruitment] ADD  DEFAULT (NULL) FOR [endDate]
GO
ALTER TABLE [SWP391].[Recruitment] ADD  DEFAULT (NULL) FOR [salary]
GO
ALTER TABLE [SWP391].[Recruitment_Category] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [SWP391].[Account]  WITH CHECK ADD  CONSTRAINT [Account$fk_Account_Account_Status1] FOREIGN KEY([Account_Status_idAccount_Status])
REFERENCES [SWP391].[Account_Status] ([idAccount_Status])
GO
ALTER TABLE [SWP391].[Account] CHECK CONSTRAINT [Account$fk_Account_Account_Status1]
GO
ALTER TABLE [SWP391].[Event_Category_has_Events]  WITH CHECK ADD  CONSTRAINT [Event_Category_has_Events$fk_Event_Category_has_Events_Event_Category1] FOREIGN KEY([Event_Category_id])
REFERENCES [SWP391].[Event_Category] ([idEvent_Category])
GO
ALTER TABLE [SWP391].[Event_Category_has_Events] CHECK CONSTRAINT [Event_Category_has_Events$fk_Event_Category_has_Events_Event_Category1]
GO
ALTER TABLE [SWP391].[Event_Category_has_Events]  WITH CHECK ADD  CONSTRAINT [Event_Category_has_Events$fk_Event_Category_has_Events_Events1] FOREIGN KEY([Events_id])
REFERENCES [SWP391].[Events] ([id])
GO
ALTER TABLE [SWP391].[Event_Category_has_Events] CHECK CONSTRAINT [Event_Category_has_Events$fk_Event_Category_has_Events_Events1]
GO
ALTER TABLE [SWP391].[Event_Images]  WITH CHECK ADD  CONSTRAINT [Event_Images$fk_Event_Images_Events1] FOREIGN KEY([Events_id])
REFERENCES [SWP391].[Events] ([id])
GO
ALTER TABLE [SWP391].[Event_Images] CHECK CONSTRAINT [Event_Images$fk_Event_Images_Events1]
GO
ALTER TABLE [SWP391].[Event_Videos]  WITH CHECK ADD  CONSTRAINT [Event_Videos$fk_Event_Videos_Events1] FOREIGN KEY([Events_id])
REFERENCES [SWP391].[Events] ([id])
GO
ALTER TABLE [SWP391].[Event_Videos] CHECK CONSTRAINT [Event_Videos$fk_Event_Videos_Events1]
GO
ALTER TABLE [SWP391].[Events_has_Account]  WITH CHECK ADD  CONSTRAINT [Events_has_Account$fk_Events_has_Account_Events1] FOREIGN KEY([Events_id])
REFERENCES [SWP391].[Events] ([id])
GO
ALTER TABLE [SWP391].[Events_has_Account] CHECK CONSTRAINT [Events_has_Account$fk_Events_has_Account_Events1]
GO
ALTER TABLE [SWP391].[News_Images]  WITH CHECK ADD  CONSTRAINT [News_Images$fk_News_Images_News1] FOREIGN KEY([News_id])
REFERENCES [SWP391].[News] ([id])
GO
ALTER TABLE [SWP391].[News_Images] CHECK CONSTRAINT [News_Images$fk_News_Images_News1]
GO
ALTER TABLE [SWP391].[News_Tags_has_News]  WITH CHECK ADD  CONSTRAINT [News_Tags_has_News$fk_News_Tags_has_News_News_Tags1] FOREIGN KEY([News_Tags_idNews_Tags])
REFERENCES [SWP391].[News_Tags] ([idNews_Tags])
GO
ALTER TABLE [SWP391].[News_Tags_has_News] CHECK CONSTRAINT [News_Tags_has_News$fk_News_Tags_has_News_News_Tags1]
GO
ALTER TABLE [SWP391].[News_Tags_has_News]  WITH CHECK ADD  CONSTRAINT [News_Tags_has_News$fk_News_Tags_has_News_News1] FOREIGN KEY([News_id])
REFERENCES [SWP391].[News] ([id])
GO
ALTER TABLE [SWP391].[News_Tags_has_News] CHECK CONSTRAINT [News_Tags_has_News$fk_News_Tags_has_News_News1]
GO
ALTER TABLE [SWP391].[News_Videos]  WITH CHECK ADD  CONSTRAINT [News_Videos$fk_News_Videos_News1] FOREIGN KEY([News_id])
REFERENCES [SWP391].[News] ([id])
GO
ALTER TABLE [SWP391].[News_Videos] CHECK CONSTRAINT [News_Videos$fk_News_Videos_News1]
GO
ALTER TABLE [SWP391].[Recruitment]  WITH CHECK ADD  CONSTRAINT [Recruitment$fk_Recruitment_Company1] FOREIGN KEY([Company_id])
REFERENCES [SWP391].[Company] ([idCompany])
GO
ALTER TABLE [SWP391].[Recruitment] CHECK CONSTRAINT [Recruitment$fk_Recruitment_Company1]
GO
ALTER TABLE [SWP391].[Recruitment_has_Recruitment_Category]  WITH CHECK ADD  CONSTRAINT [Recruitment_has_Recruitment_Category$fk_Recruitment_has_Recruitment_Category_Recruitment_Category1] FOREIGN KEY([Recruitment_Category_id])
REFERENCES [SWP391].[Recruitment_Category] ([idRecruitment_Category])
GO
ALTER TABLE [SWP391].[Recruitment_has_Recruitment_Category] CHECK CONSTRAINT [Recruitment_has_Recruitment_Category$fk_Recruitment_has_Recruitment_Category_Recruitment_Category1]
GO
ALTER TABLE [SWP391].[Recruitment_has_Recruitment_Category]  WITH CHECK ADD  CONSTRAINT [Recruitment_has_Recruitment_Category$fk_Recruitment_has_Recruitment_Category_Recruitment1] FOREIGN KEY([Recruitment_id])
REFERENCES [SWP391].[Recruitment] ([idRecruitment])
GO
ALTER TABLE [SWP391].[Recruitment_has_Recruitment_Category] CHECK CONSTRAINT [Recruitment_has_Recruitment_Category$fk_Recruitment_has_Recruitment_Category_Recruitment1]
GO
ALTER TABLE [SWP391].[Subjects]  WITH CHECK ADD  CONSTRAINT [Subjects$fk_Subjects_Major1] FOREIGN KEY([Major_idMajor])
REFERENCES [SWP391].[Major] ([idMajor])
GO
ALTER TABLE [SWP391].[Subjects] CHECK CONSTRAINT [Subjects$fk_Subjects_Major1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Account' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Account_Status' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Account_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Company' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Event_Category' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Event_Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Event_Category_has_Events' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Event_Category_has_Events'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Event_Images' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Event_Images'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Event_Videos' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Event_Videos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Events' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Events'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Events_has_Account' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Events_has_Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Major' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Major'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.News' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'News'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.News_Images' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'News_Images'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.News_Tags' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'News_Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.News_Tags_has_News' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'News_Tags_has_News'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.News_Videos' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'News_Videos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Recruitment' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Recruitment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Recruitment_Category' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Recruitment_Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Recruitment_has_Recruitment_Category' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Recruitment_has_Recruitment_Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SWP391.Subjects' , @level0type=N'SCHEMA',@level0name=N'SWP391', @level1type=N'TABLE',@level1name=N'Subjects'
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
