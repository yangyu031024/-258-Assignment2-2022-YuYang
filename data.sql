USE [master]
GO
/****** Object:  Database [WuyeProject]    Script Date: 2023/11/10 18:46:54 ******/
CREATE DATABASE [WuyeProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WuyeProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WuyeProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WuyeProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\WuyeProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WuyeProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WuyeProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WuyeProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WuyeProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WuyeProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WuyeProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WuyeProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [WuyeProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WuyeProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WuyeProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WuyeProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WuyeProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WuyeProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WuyeProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WuyeProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WuyeProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WuyeProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WuyeProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WuyeProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WuyeProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WuyeProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WuyeProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WuyeProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WuyeProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WuyeProject] SET RECOVERY FULL 
GO
ALTER DATABASE [WuyeProject] SET  MULTI_USER 
GO
ALTER DATABASE [WuyeProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WuyeProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WuyeProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WuyeProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WuyeProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WuyeProject', N'ON'
GO
ALTER DATABASE [WuyeProject] SET QUERY_STORE = OFF
GO
USE [WuyeProject]
GO
/****** Object:  Table [dbo].[w_admin]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[pass] [varchar](30) NULL,
	[nickname] [varchar](30) NULL,
	[power] [int] NULL,
	[createtime] [date] NULL,
 CONSTRAINT [PK_w_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_w_admin] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_announcement]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_announcement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NULL,
	[title] [varchar](100) NULL,
	[createtime] [date] NULL,
	[contents] [text] NULL,
	[uid] [int] NULL,
	[nickname] [varchar](50) NULL,
 CONSTRAINT [PK_w_announcement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_building]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_building](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [varchar](50) NULL,
	[floors] [int] NULL,
	[height] [decimal](18, 2) NULL,
	[area] [decimal](18, 2) NULL,
	[createtime] [date] NULL,
	[sp_id] [int] NULL,
	[remark] [varchar](50) NULL,
 CONSTRAINT [PK_w_building] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_complaint]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_complaint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[uid] [int] NULL,
	[address] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[describe] [varchar](200) NULL,
	[state] [varchar](50) NULL,
	[createtime] [date] NULL,
	[title] [varchar](50) NULL,
	[is_use] [int] NULL,
	[result] [varchar](50) NULL,
	[house_id] [int] NULL,
	[pass_detail] [varchar](50) NULL,
 CONSTRAINT [PK_w_complaint] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_device]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_device](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[device_id] [bigint] NULL,
	[device_name] [varchar](50) NULL,
	[device_desc] [varchar](200) NULL,
	[createtime] [date] NULL,
 CONSTRAINT [PK_w_device] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_house]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_house](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[b_id] [int] NOT NULL,
	[d_id] [int] NOT NULL,
	[d_room] [int] NULL,
	[c_id] [int] NOT NULL,
	[r_id] [int] NULL,
	[g_id] [int] NULL,
	[bz_id] [int] NULL,
	[area] [decimal](10, 2) NULL,
	[use_area] [decimal](10, 2) NULL,
	[is_use] [int] NULL,
 CONSTRAINT [PK_w_house] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_installation]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_installation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sp_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[main_name] [varchar](50) NULL,
	[contents] [text] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_w_installation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_packing]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_packing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[packing_name] [varchar](50) NULL,
	[packing_lot] [varchar](50) NULL,
	[packing_lotID] [bigint] NULL,
	[packing_state] [int] NULL,
	[packing_type] [int] NULL,
	[packing_area] [decimal](18, 2) NULL,
	[packing_uid] [int] NULL,
 CONSTRAINT [PK_w_packing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_property_user]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_property_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wy_number] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[sex] [int] NOT NULL,
	[work_name] [varchar](50) NOT NULL,
	[id_number] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[pic] [text] NOT NULL,
	[work_info] [varchar](50) NOT NULL,
 CONSTRAINT [PK_w_property_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_repair]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_repair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[unit_name] [varchar](50) NULL,
	[uid] [int] NULL,
	[describe] [text] NULL,
	[state] [int] NULL,
	[createtime] [date] NULL,
	[repeat_info] [text] NULL,
	[state_type] [int] NULL,
	[louyu_id] [int] NULL,
	[danyuan_id] [int] NULL,
	[repair_number] [varchar](50) NULL,
	[house_id] [int] NULL,
	[finaly_repair_user] [varchar](50) NULL,
	[repair_work_info] [varchar](50) NULL,
	[main_repair_user] [varchar](50) NULL,
	[repair_phone] [varchar](20) NULL,
	[repair_pass] [int] NULL,
	[pass_detail] [text] NULL,
	[repair_info] [varchar](50) NULL,
 CONSTRAINT [PK_w_repair] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_room]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [varchar](50) NULL,
	[floor] [varchar](50) NULL,
	[owner] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[construction_area] [varchar](50) NULL,
	[actual_area] [varchar](50) NULL,
	[home_state] [varchar](50) NULL,
 CONSTRAINT [PK_w_room_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_room_info]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_room_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[phone] [varchar](16) NOT NULL,
	[link_name] [varchar](10) NULL,
	[stop_car_area] [int] NULL,
	[construct_date] [date] NULL,
	[road_area] [int] NULL,
	[room_area] [int] NULL,
	[lh_area] [int] NULL,
	[room_number] [int] NULL,
	[address] [varchar](50) NOT NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK_w_room_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_system_params]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_system_params](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NOT NULL,
	[name] [varchar](20) NULL,
	[type] [varchar](10) NULL,
 CONSTRAINT [PK_w_system_params] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_user]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[building_id] [int] NULL,
	[danyuan_id] [int] NULL,
	[house_id] [int] NULL,
	[user_name] [varchar](50) NOT NULL,
	[house_number] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[id_number] [varchar](50) NOT NULL,
	[work_address] [varchar](50) NOT NULL,
	[link_address] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[remark] [varchar](50) NULL,
	[createtime] [varchar](50) NULL,
 CONSTRAINT [PK_w_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_w_user] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[w_user_paymoney]    Script Date: 2023/11/10 18:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[w_user_paymoney](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[house_id] [int] NULL,
	[number] [int] NULL,
	[price] [decimal](18, 2) NULL,
	[should_pay] [decimal](18, 2) NULL,
	[realy_pay] [decimal](18, 2) NULL,
	[no_pay] [decimal](18, 2) NULL,
	[start_pay_time] [datetime] NULL,
	[by_id] [int] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_w_user_paymoney] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[w_admin] ADD  CONSTRAINT [DF_w_admin_power]  DEFAULT ((0)) FOR [power]
GO
ALTER TABLE [dbo].[w_announcement]  WITH CHECK ADD  CONSTRAINT [FK_w_announcement_w_admin] FOREIGN KEY([uid])
REFERENCES [dbo].[w_admin] ([id])
GO
ALTER TABLE [dbo].[w_announcement] CHECK CONSTRAINT [FK_w_announcement_w_admin]
GO
ALTER TABLE [dbo].[w_building]  WITH CHECK ADD  CONSTRAINT [FK_w_building_w_building] FOREIGN KEY([sp_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_building] CHECK CONSTRAINT [FK_w_building_w_building]
GO
ALTER TABLE [dbo].[w_complaint]  WITH CHECK ADD  CONSTRAINT [FK_w_complaint_w_house] FOREIGN KEY([house_id])
REFERENCES [dbo].[w_house] ([id])
GO
ALTER TABLE [dbo].[w_complaint] CHECK CONSTRAINT [FK_w_complaint_w_house]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_building] FOREIGN KEY([b_id])
REFERENCES [dbo].[w_building] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_building]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params] FOREIGN KEY([d_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params1] FOREIGN KEY([d_room])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params1]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params2] FOREIGN KEY([c_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params2]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params3] FOREIGN KEY([r_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params3]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params4] FOREIGN KEY([g_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params4]
GO
ALTER TABLE [dbo].[w_house]  WITH CHECK ADD  CONSTRAINT [FK_w_house_w_system_params5] FOREIGN KEY([bz_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_house] CHECK CONSTRAINT [FK_w_house_w_system_params5]
GO
ALTER TABLE [dbo].[w_installation]  WITH CHECK ADD  CONSTRAINT [FK_w_installation_w_installation] FOREIGN KEY([sp_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_installation] CHECK CONSTRAINT [FK_w_installation_w_installation]
GO
ALTER TABLE [dbo].[w_packing]  WITH CHECK ADD  CONSTRAINT [FK_w_packing_w_packing] FOREIGN KEY([packing_uid])
REFERENCES [dbo].[w_user] ([id])
GO
ALTER TABLE [dbo].[w_packing] CHECK CONSTRAINT [FK_w_packing_w_packing]
GO
ALTER TABLE [dbo].[w_repair]  WITH CHECK ADD  CONSTRAINT [FK_w_repair_w_building] FOREIGN KEY([louyu_id])
REFERENCES [dbo].[w_building] ([id])
GO
ALTER TABLE [dbo].[w_repair] CHECK CONSTRAINT [FK_w_repair_w_building]
GO
ALTER TABLE [dbo].[w_repair]  WITH CHECK ADD  CONSTRAINT [FK_w_repair_w_house] FOREIGN KEY([house_id])
REFERENCES [dbo].[w_house] ([id])
GO
ALTER TABLE [dbo].[w_repair] CHECK CONSTRAINT [FK_w_repair_w_house]
GO
ALTER TABLE [dbo].[w_repair]  WITH CHECK ADD  CONSTRAINT [FK_w_repair_w_system_params] FOREIGN KEY([danyuan_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_repair] CHECK CONSTRAINT [FK_w_repair_w_system_params]
GO
ALTER TABLE [dbo].[w_repair]  WITH CHECK ADD  CONSTRAINT [FK_w_repair_w_user] FOREIGN KEY([uid])
REFERENCES [dbo].[w_user] ([id])
GO
ALTER TABLE [dbo].[w_repair] CHECK CONSTRAINT [FK_w_repair_w_user]
GO
ALTER TABLE [dbo].[w_user]  WITH CHECK ADD  CONSTRAINT [FK_w_user_w_building] FOREIGN KEY([building_id])
REFERENCES [dbo].[w_building] ([id])
GO
ALTER TABLE [dbo].[w_user] CHECK CONSTRAINT [FK_w_user_w_building]
GO
ALTER TABLE [dbo].[w_user]  WITH CHECK ADD  CONSTRAINT [FK_w_user_w_house] FOREIGN KEY([house_id])
REFERENCES [dbo].[w_house] ([id])
GO
ALTER TABLE [dbo].[w_user] CHECK CONSTRAINT [FK_w_user_w_house]
GO
ALTER TABLE [dbo].[w_user]  WITH CHECK ADD  CONSTRAINT [FK_w_user_w_system_params] FOREIGN KEY([danyuan_id])
REFERENCES [dbo].[w_system_params] ([id])
GO
ALTER TABLE [dbo].[w_user] CHECK CONSTRAINT [FK_w_user_w_system_params]
GO
ALTER TABLE [dbo].[w_user_paymoney]  WITH CHECK ADD  CONSTRAINT [FK_w_user_paymoney_w_admin] FOREIGN KEY([by_id])
REFERENCES [dbo].[w_admin] ([id])
GO
ALTER TABLE [dbo].[w_user_paymoney] CHECK CONSTRAINT [FK_w_user_paymoney_w_admin]
GO
ALTER TABLE [dbo].[w_user_paymoney]  WITH CHECK ADD  CONSTRAINT [FK_w_user_paymoney_w_house] FOREIGN KEY([house_id])
REFERENCES [dbo].[w_house] ([id])
GO
ALTER TABLE [dbo].[w_user_paymoney] CHECK CONSTRAINT [FK_w_user_paymoney_w_house]
GO
USE [master]
GO
ALTER DATABASE [WuyeProject] SET  READ_WRITE 
GO
