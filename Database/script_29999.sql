USE [happy_programming_system]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/17/2024 4:13:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[fullname] [nvarchar](max) NULL,
	[phonenumber] [nvarchar](max) NULL,
	[dob] [date] NULL,
	[sex] [bit] NULL,
	[address] [nvarchar](max) NULL,
	[avatar] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[roleID] [int] NULL,
	[balance] [decimal](18, 0) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__Account__3213E83F585EAB99] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account Course]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account Course](
	[id] [int] NOT NULL,
	[course_id] [int] NULL,
	[mentor_id] [int] NULL,
 CONSTRAINT [PK_Account Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](max) NULL,
	[course_description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[avatar] [nvarchar](max) NULL,
	[job] [nvarchar](max) NULL,
	[introduction] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[achievements] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_Skill]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_Skill](
	[cv_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[rating_star] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC,
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Following]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Following](
	[mentee_id] [int] NOT NULL,
	[mentor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mentee_id] ASC,
	[mentor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateComment]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mentorID] [int] NULL,
	[content] [nvarchar](max) NULL,
	[ratingstar] [real] NULL,
	[createdBy] [int] NULL,
	[createdDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[deadline] [datetime] NULL,
	[content] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[createdBy] [int] NULL,
	[createdDate] [datetime] NULL,
	[PricePerHour] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Account]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestID] [int] NULL,
	[accountID] [int] NULL,
	[status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_skill]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestID] [int] NULL,
	[skillID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_Note]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Note](
	[schedule_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[sessionId] [nvarchar](max) NOT NULL,
	[note] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day_of_week] [int] NOT NULL,
	[mentor_id] [int] NOT NULL,
	[status] [nvarchar](max) NULL,
	[create_time] [datetime] NULL,
	[slot] [nvarchar](max) NULL,
	[teach_date] [date] NULL,
	[sessionId] [varchar](255) NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 6/17/2024 4:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (40, N'namlh123', N'namlh123@gmail.com', N'Nam123', N'Lê Xuân Nam', N'0912873410', CAST(N'2004-05-22' AS Date), 1, N'Phu Tho', NULL, NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (41, N'khanhnguyen', N'khanh245@gmail.com', N'Khanh245', N'Nguyễn Văn Khánh', N'924781275', CAST(N'2002-07-23' AS Date), 0, N'Khanh Hoa', NULL, NULL, CAST(N'2024-05-30T00:12:09.670' AS DateTime), 2, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (42, N'khanhnguyenvan', N'khanh_nguyen@gmail.com', N'Khanh123456', N'Nguyen Khanh', N'0923123456', CAST(N'2001-02-16' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (43, N'longchhe153', N'long123@gmail.com', N'Chulong123', N'chulong', N'0585703546', CAST(N'2024-04-16' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (44, N'longchu', N'long345@gmail.com', N'Long5678', N'chu hong long', N'0781298122', CAST(N'2000-12-05' AS Date), 1, N'Phu Tho', NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (50, N'khanhhuyen', N'huyen345@gmail.com', N'Huyen5678', N'chu hong huyen', N'0721298122', CAST(N'2000-12-16' AS Date), 1, N'Hue', NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (52, N'vannam', N'namvan123@gmail.com', N'Van123456', N'nguyen khanh van', N'0923451236', CAST(N'2000-12-20' AS Date), 1, N'Hue', NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (60, N'hung2561', N'hung234@gmail.com', N'Long123456', N'Chu Hoàng Khánh', N'0585703546', CAST(N'2001-06-29' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (2068, N'chulong2001', N'huynqhe180309@fpt.edu.vn', N'123456', N'Chu Hong Long', N'0585703546', CAST(N'2001-06-20' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (2073, N'longchhe1530933', N'longchhe2612@fpt.edu.vn', N'Long2612', N'Chu Hoàng Khánh', N'0585703546', CAST(N'2024-06-11' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (2076, N'thangnt245', N'thangnt245@gmail.com', N'Thang2612', N'Nguyễn Cao Thắng', N'0978123456', CAST(N'2002-07-21' AS Date), 1, N'Hue', NULL, NULL, NULL, 4, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (2078, N'cuongng789', N'cuongng789@gmail.com', N'Cuong789', N'Nguyễn Huy Cường', N'0914256735', CAST(N'2005-08-20' AS Date), 1, N'Khanh Hoa', NULL, NULL, NULL, 2, NULL, 1)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status]) VALUES (2079, N'vuongng1234', N'vuongng567@gmail.com', N'Vuong987', N'Nguyễn Văn Vương', N'0927468126', CAST(N'2005-09-21' AS Date), 1, N'Phu Thinh', NULL, NULL, NULL, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status]) VALUES (2002, 41, NULL, N'asdas', N'dasdds', CAST(N'2024-05-30T00:11:49.807' AS DateTime), CAST(N'2024-05-30T00:12:09.660' AS DateTime), N'asdasdasd', NULL)
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (3, N'H?c Java', CAST(N'2024-05-29T15:45:00.000' AS DateTime), N'ABCCCCCC', N'1', 50, CAST(N'2024-05-29T15:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (4, N'ABCCC', CAST(N'2001-05-24T20:58:00.000' AS DateTime), N'ABCDD', N'1', 50, CAST(N'2024-05-28T21:00:57.337' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (5, N'ABCCC', CAST(N'2024-05-03T21:58:00.000' AS DateTime), N'MNNNN', N'1', 50, CAST(N'2024-05-28T21:59:03.877' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (6, N'ABCCC', CAST(N'2024-05-03T21:58:00.000' AS DateTime), N'MNNNN', N'1', 50, CAST(N'2024-05-28T22:05:18.603' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1002, N'', CAST(N'2024-06-14T11:17:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:14:40.500' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1003, N'', CAST(N'2024-06-14T11:17:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:16:21.913' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1004, N'', CAST(N'2024-06-14T11:17:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:16:38.287' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1005, N'', CAST(N'2024-06-14T11:17:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:32:25.427' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1006, N'', CAST(N'2024-06-14T11:17:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:32:29.287' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1007, N'', CAST(N'2024-06-07T11:59:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T11:59:31.697' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1008, N'', CAST(N'2024-05-29T12:02:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:02:21.807' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1009, N'', CAST(N'2024-05-30T12:10:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:10:19.097' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1010, N'', CAST(N'2024-05-30T12:10:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:11:13.497' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1011, N'', CAST(N'2024-06-06T12:12:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:12:08.410' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1012, N'', CAST(N'2024-06-07T12:15:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:15:58.897' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1013, N'', CAST(N'2024-05-29T12:22:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:22:58.150' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1014, N'', CAST(N'2024-05-31T12:23:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T12:23:23.583' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1015, N'', CAST(N'2024-06-01T15:39:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:41:09.467' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1016, N'', CAST(N'2024-06-05T15:41:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:42:16.337' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1017, N'', CAST(N'2024-06-05T15:41:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:42:19.183' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1018, N'', CAST(N'2024-05-31T15:44:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:44:53.763' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1019, N'', CAST(N'2024-05-15T15:45:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:45:49.823' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1020, N'', CAST(N'2024-06-12T15:46:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:47:02.000' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1021, N'', CAST(N'2024-06-12T15:46:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:47:52.170' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1022, N'', CAST(N'2024-05-29T15:47:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:48:38.427' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1023, N'', CAST(N'2024-06-06T15:56:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:56:47.423' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1024, N'', CAST(N'2024-06-06T15:56:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:57:12.543' AS DateTime), NULL)
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate], [PricePerHour]) VALUES (1025, N'', CAST(N'2024-06-06T15:58:00.000' AS DateTime), N'', N'1', 2068, CAST(N'2024-06-03T15:59:31.887' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Request_skill] ON 

INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (2, 3, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (3, 4, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1005, 1003, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1006, 1004, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1007, 1004, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1008, 1005, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1009, 1005, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1010, 1006, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1011, 1006, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1012, 1007, 24)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1013, 1008, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1014, 1008, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1015, 1009, 24)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1016, 1009, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1017, 1010, 24)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1018, 1010, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1019, 1011, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1020, 1011, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1021, 1012, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1022, 1012, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1023, 1013, 24)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1024, 1013, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1025, 1014, 24)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1026, 1014, 25)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1027, 1014, 26)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1028, 1015, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1029, 1015, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1030, 1015, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1031, 1016, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1032, 1016, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1033, 1016, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1034, 1017, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1035, 1017, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1036, 1017, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1037, 1018, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1038, 1018, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1039, 1018, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1040, 1019, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1041, 1019, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1042, 1019, 8)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1043, 1020, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1044, 1020, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1045, 1020, 8)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1046, 1021, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1047, 1021, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1048, 1021, 8)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1049, 1022, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1050, 1022, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1051, 1022, 8)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1052, 1023, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1053, 1023, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1054, 1023, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1055, 1024, 21)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1056, 1024, 22)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1057, 1024, 23)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1058, 1025, 5)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1059, 1025, 6)
INSERT [dbo].[Request_skill] ([id], [requestID], [skillID]) VALUES (1060, 1025, 8)
SET IDENTITY_INSERT [dbo].[Request_skill] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Mentee')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Mentor')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (4, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Schedule_Note] ([schedule_id], [account_id], [sessionId], [note]) VALUES (832, 41, N'11698148-30e7-4806-b370-c111b8986bc2', N'OK')
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (832, 6, 41, N'2', CAST(N'2024-06-15T01:42:47.000' AS DateTime), N'5', CAST(N'2024-06-15' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (833, 1, 41, N'2', CAST(N'2024-06-15T01:42:47.037' AS DateTime), N'3', CAST(N'2024-06-17' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (834, 2, 41, N'2', CAST(N'2024-06-15T01:42:47.040' AS DateTime), N'1', CAST(N'2024-06-18' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (835, 3, 41, N'2', CAST(N'2024-06-15T01:42:47.040' AS DateTime), N'2', CAST(N'2024-06-19' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (836, 3, 41, N'2', CAST(N'2024-06-15T01:42:47.043' AS DateTime), N'4', CAST(N'2024-06-19' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (837, 4, 41, N'2', CAST(N'2024-06-15T01:42:47.043' AS DateTime), N'1', CAST(N'2024-06-20' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (838, 4, 41, N'2', CAST(N'2024-06-15T01:42:47.043' AS DateTime), N'3', CAST(N'2024-06-20' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (839, 5, 41, N'2', CAST(N'2024-06-15T01:42:47.047' AS DateTime), N'5', CAST(N'2024-06-21' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (840, 6, 41, N'2', CAST(N'2024-06-15T01:42:47.047' AS DateTime), N'5', CAST(N'2024-06-22' AS Date), N'11698148-30e7-4806-b370-c111b8986bc2')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (841, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.073' AS DateTime), N'2', CAST(N'2024-06-15' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (842, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.100' AS DateTime), N'4', CAST(N'2024-06-15' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (843, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.103' AS DateTime), N'1', CAST(N'2024-06-16' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (844, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.103' AS DateTime), N'3', CAST(N'2024-06-16' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (845, 1, 2079, N'1', CAST(N'2024-06-15T06:32:25.103' AS DateTime), N'3', CAST(N'2024-06-17' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (846, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'1', CAST(N'2024-06-18' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (847, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'5', CAST(N'2024-06-18' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (848, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'1', CAST(N'2024-06-19' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (849, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'2', CAST(N'2024-06-19' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (850, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'3', CAST(N'2024-06-19' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (851, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.107' AS DateTime), N'4', CAST(N'2024-06-19' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (852, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.110' AS DateTime), N'2', CAST(N'2024-06-20' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (853, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.110' AS DateTime), N'4', CAST(N'2024-06-20' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (854, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.110' AS DateTime), N'5', CAST(N'2024-06-20' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (855, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.110' AS DateTime), N'1', CAST(N'2024-06-21' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (856, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.113' AS DateTime), N'3', CAST(N'2024-06-21' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (857, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.113' AS DateTime), N'2', CAST(N'2024-06-22' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (858, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.113' AS DateTime), N'4', CAST(N'2024-06-22' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (859, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.113' AS DateTime), N'1', CAST(N'2024-06-23' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (860, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.113' AS DateTime), N'3', CAST(N'2024-06-23' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (861, 1, 2079, N'1', CAST(N'2024-06-15T06:32:25.117' AS DateTime), N'3', CAST(N'2024-06-24' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (862, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.127' AS DateTime), N'1', CAST(N'2024-06-25' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (863, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.127' AS DateTime), N'5', CAST(N'2024-06-25' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (864, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.127' AS DateTime), N'1', CAST(N'2024-06-26' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (865, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.127' AS DateTime), N'2', CAST(N'2024-06-26' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (866, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.130' AS DateTime), N'3', CAST(N'2024-06-26' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (867, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.130' AS DateTime), N'4', CAST(N'2024-06-26' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (868, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.130' AS DateTime), N'2', CAST(N'2024-06-27' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (869, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.130' AS DateTime), N'4', CAST(N'2024-06-27' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (870, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.133' AS DateTime), N'5', CAST(N'2024-06-27' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (871, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.133' AS DateTime), N'1', CAST(N'2024-06-28' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (872, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.137' AS DateTime), N'3', CAST(N'2024-06-28' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (873, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.137' AS DateTime), N'2', CAST(N'2024-06-29' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (874, 6, 2079, N'1', CAST(N'2024-06-15T06:32:25.137' AS DateTime), N'4', CAST(N'2024-06-29' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (875, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.137' AS DateTime), N'1', CAST(N'2024-06-30' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (876, 7, 2079, N'1', CAST(N'2024-06-15T06:32:25.137' AS DateTime), N'3', CAST(N'2024-06-30' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (877, 1, 2079, N'1', CAST(N'2024-06-15T06:32:25.140' AS DateTime), N'3', CAST(N'2024-07-01' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (878, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.140' AS DateTime), N'1', CAST(N'2024-07-02' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (879, 2, 2079, N'1', CAST(N'2024-06-15T06:32:25.140' AS DateTime), N'5', CAST(N'2024-07-02' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (880, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'1', CAST(N'2024-07-03' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (881, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'2', CAST(N'2024-07-03' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (882, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'3', CAST(N'2024-07-03' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (883, 3, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'4', CAST(N'2024-07-03' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (884, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'2', CAST(N'2024-07-04' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (885, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.143' AS DateTime), N'4', CAST(N'2024-07-04' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (886, 4, 2079, N'1', CAST(N'2024-06-15T06:32:25.147' AS DateTime), N'5', CAST(N'2024-07-04' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (887, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.147' AS DateTime), N'1', CAST(N'2024-07-05' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (888, 5, 2079, N'1', CAST(N'2024-06-15T06:32:25.147' AS DateTime), N'3', CAST(N'2024-07-05' AS Date), N'89117a16-4d9c-46b8-b515-6922bf80c397')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (889, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.023' AS DateTime), N'1', CAST(N'2024-07-05' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (890, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.027' AS DateTime), N'3', CAST(N'2024-07-05' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (891, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.030' AS DateTime), N'5', CAST(N'2024-07-05' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (892, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.030' AS DateTime), N'1', CAST(N'2024-07-06' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (893, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.030' AS DateTime), N'2', CAST(N'2024-07-06' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (894, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.030' AS DateTime), N'4', CAST(N'2024-07-06' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (895, 7, 2079, N'1', CAST(N'2024-06-15T06:37:27.030' AS DateTime), N'1', CAST(N'2024-07-07' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (896, 7, 2079, N'1', CAST(N'2024-06-15T06:37:27.033' AS DateTime), N'3', CAST(N'2024-07-07' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (897, 1, 2079, N'1', CAST(N'2024-06-15T06:37:27.037' AS DateTime), N'2', CAST(N'2024-07-08' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (898, 1, 2079, N'1', CAST(N'2024-06-15T06:37:27.037' AS DateTime), N'4', CAST(N'2024-07-08' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (899, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.037' AS DateTime), N'1', CAST(N'2024-07-09' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (900, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.037' AS DateTime), N'2', CAST(N'2024-07-09' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (901, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.037' AS DateTime), N'3', CAST(N'2024-07-09' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (902, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'4', CAST(N'2024-07-09' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (903, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'5', CAST(N'2024-07-09' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (904, 3, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'1', CAST(N'2024-07-10' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (905, 3, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'5', CAST(N'2024-07-10' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (906, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'2', CAST(N'2024-07-11' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (907, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.040' AS DateTime), N'3', CAST(N'2024-07-11' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (908, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'4', CAST(N'2024-07-11' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (909, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'5', CAST(N'2024-07-11' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (910, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'1', CAST(N'2024-07-12' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (911, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'3', CAST(N'2024-07-12' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (912, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'5', CAST(N'2024-07-12' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (913, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.043' AS DateTime), N'1', CAST(N'2024-07-13' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (914, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.047' AS DateTime), N'2', CAST(N'2024-07-13' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (915, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.047' AS DateTime), N'4', CAST(N'2024-07-13' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (916, 7, 2079, N'1', CAST(N'2024-06-15T06:37:27.047' AS DateTime), N'1', CAST(N'2024-07-14' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (917, 7, 2079, N'1', CAST(N'2024-06-15T06:37:27.050' AS DateTime), N'3', CAST(N'2024-07-14' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (918, 1, 2079, N'1', CAST(N'2024-06-15T06:37:27.050' AS DateTime), N'2', CAST(N'2024-07-15' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (919, 1, 2079, N'1', CAST(N'2024-06-15T06:37:27.053' AS DateTime), N'4', CAST(N'2024-07-15' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (920, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.053' AS DateTime), N'1', CAST(N'2024-07-16' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (921, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.053' AS DateTime), N'2', CAST(N'2024-07-16' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (922, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.053' AS DateTime), N'3', CAST(N'2024-07-16' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (923, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.057' AS DateTime), N'4', CAST(N'2024-07-16' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (924, 2, 2079, N'1', CAST(N'2024-06-15T06:37:27.057' AS DateTime), N'5', CAST(N'2024-07-16' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (925, 3, 2079, N'1', CAST(N'2024-06-15T06:37:27.057' AS DateTime), N'1', CAST(N'2024-07-17' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (926, 3, 2079, N'1', CAST(N'2024-06-15T06:37:27.057' AS DateTime), N'5', CAST(N'2024-07-17' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (927, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'2', CAST(N'2024-07-18' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (928, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'3', CAST(N'2024-07-18' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (929, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'4', CAST(N'2024-07-18' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (930, 4, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'5', CAST(N'2024-07-18' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
GO
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (931, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'1', CAST(N'2024-07-19' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (932, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'3', CAST(N'2024-07-19' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (933, 5, 2079, N'1', CAST(N'2024-06-15T06:37:27.060' AS DateTime), N'5', CAST(N'2024-07-19' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (934, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.070' AS DateTime), N'1', CAST(N'2024-07-20' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (935, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.070' AS DateTime), N'2', CAST(N'2024-07-20' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (936, 6, 2079, N'1', CAST(N'2024-06-15T06:37:27.070' AS DateTime), N'4', CAST(N'2024-07-20' AS Date), N'17d36a90-2ef5-4739-ab2a-25d4463e0b85')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (937, 3, 2078, N'1', CAST(N'2024-06-15T06:39:10.813' AS DateTime), N'2', CAST(N'2024-07-03' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (938, 3, 2078, N'1', CAST(N'2024-06-15T06:39:10.833' AS DateTime), N'4', CAST(N'2024-07-03' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (939, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.833' AS DateTime), N'1', CAST(N'2024-07-04' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (940, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.833' AS DateTime), N'3', CAST(N'2024-07-04' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (941, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.837' AS DateTime), N'5', CAST(N'2024-07-04' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (942, 5, 2078, N'1', CAST(N'2024-06-15T06:39:10.837' AS DateTime), N'2', CAST(N'2024-07-05' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (943, 5, 2078, N'1', CAST(N'2024-06-15T06:39:10.837' AS DateTime), N'4', CAST(N'2024-07-05' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (944, 6, 2078, N'1', CAST(N'2024-06-15T06:39:10.837' AS DateTime), N'1', CAST(N'2024-07-06' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (945, 6, 2078, N'1', CAST(N'2024-06-15T06:39:10.840' AS DateTime), N'3', CAST(N'2024-07-06' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (946, 7, 2078, N'1', CAST(N'2024-06-15T06:39:10.840' AS DateTime), N'3', CAST(N'2024-07-07' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (947, 1, 2078, N'1', CAST(N'2024-06-15T06:39:10.840' AS DateTime), N'1', CAST(N'2024-07-08' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (948, 2, 2078, N'1', CAST(N'2024-06-15T06:39:10.840' AS DateTime), N'1', CAST(N'2024-07-09' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (949, 2, 2078, N'1', CAST(N'2024-06-15T06:39:10.843' AS DateTime), N'4', CAST(N'2024-07-09' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (950, 3, 2078, N'1', CAST(N'2024-06-15T06:39:10.843' AS DateTime), N'2', CAST(N'2024-07-10' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (951, 3, 2078, N'1', CAST(N'2024-06-15T06:39:10.843' AS DateTime), N'4', CAST(N'2024-07-10' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (952, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.843' AS DateTime), N'1', CAST(N'2024-07-11' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (953, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'3', CAST(N'2024-07-11' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (954, 4, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'5', CAST(N'2024-07-11' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (955, 5, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'2', CAST(N'2024-07-12' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (956, 5, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'4', CAST(N'2024-07-12' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (957, 6, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'1', CAST(N'2024-07-13' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (958, 6, 2078, N'1', CAST(N'2024-06-15T06:39:10.847' AS DateTime), N'3', CAST(N'2024-07-13' AS Date), N'ea26daba-f6ac-4dc9-811a-c8e17fc0c9ca')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1832, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.440' AS DateTime), N'2', CAST(N'2024-06-27' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1833, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.473' AS DateTime), N'4', CAST(N'2024-06-27' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1834, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.473' AS DateTime), N'1', CAST(N'2024-06-28' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1835, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.477' AS DateTime), N'3', CAST(N'2024-06-28' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1836, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.477' AS DateTime), N'5', CAST(N'2024-06-28' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1837, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.477' AS DateTime), N'1', CAST(N'2024-06-29' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1838, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.480' AS DateTime), N'2', CAST(N'2024-06-29' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1839, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.480' AS DateTime), N'4', CAST(N'2024-06-29' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1840, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.480' AS DateTime), N'1', CAST(N'2024-06-30' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1841, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.480' AS DateTime), N'2', CAST(N'2024-06-30' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1842, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.483' AS DateTime), N'3', CAST(N'2024-06-30' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1843, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.483' AS DateTime), N'5', CAST(N'2024-06-30' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1844, 1, 41, N'3', CAST(N'2024-06-16T00:10:36.483' AS DateTime), N'2', CAST(N'2024-07-01' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1845, 1, 41, N'3', CAST(N'2024-06-16T00:10:36.483' AS DateTime), N'4', CAST(N'2024-07-01' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1846, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.483' AS DateTime), N'1', CAST(N'2024-07-02' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1847, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.487' AS DateTime), N'3', CAST(N'2024-07-02' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1848, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.487' AS DateTime), N'5', CAST(N'2024-07-02' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1849, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'1', CAST(N'2024-07-03' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1850, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'3', CAST(N'2024-07-03' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1851, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'5', CAST(N'2024-07-03' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1852, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'2', CAST(N'2024-07-04' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1853, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'4', CAST(N'2024-07-04' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1854, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.490' AS DateTime), N'1', CAST(N'2024-07-05' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1855, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.493' AS DateTime), N'3', CAST(N'2024-07-05' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1856, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.493' AS DateTime), N'5', CAST(N'2024-07-05' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1857, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.493' AS DateTime), N'1', CAST(N'2024-07-06' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1858, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.493' AS DateTime), N'2', CAST(N'2024-07-06' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1859, 6, 41, N'3', CAST(N'2024-06-16T00:10:36.497' AS DateTime), N'4', CAST(N'2024-07-06' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1860, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.497' AS DateTime), N'1', CAST(N'2024-07-07' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1861, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.497' AS DateTime), N'2', CAST(N'2024-07-07' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1862, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.497' AS DateTime), N'3', CAST(N'2024-07-07' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1863, 7, 41, N'3', CAST(N'2024-06-16T00:10:36.497' AS DateTime), N'5', CAST(N'2024-07-07' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1864, 1, 41, N'3', CAST(N'2024-06-16T00:10:36.500' AS DateTime), N'2', CAST(N'2024-07-08' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1865, 1, 41, N'3', CAST(N'2024-06-16T00:10:36.500' AS DateTime), N'4', CAST(N'2024-07-08' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1866, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.500' AS DateTime), N'1', CAST(N'2024-07-09' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1867, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.503' AS DateTime), N'3', CAST(N'2024-07-09' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1868, 2, 41, N'3', CAST(N'2024-06-16T00:10:36.503' AS DateTime), N'5', CAST(N'2024-07-09' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1869, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.503' AS DateTime), N'1', CAST(N'2024-07-10' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1870, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.507' AS DateTime), N'3', CAST(N'2024-07-10' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1871, 3, 41, N'3', CAST(N'2024-06-16T00:10:36.507' AS DateTime), N'5', CAST(N'2024-07-10' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1872, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.507' AS DateTime), N'2', CAST(N'2024-07-11' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1873, 4, 41, N'3', CAST(N'2024-06-16T00:10:36.507' AS DateTime), N'4', CAST(N'2024-07-11' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1874, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.510' AS DateTime), N'1', CAST(N'2024-07-12' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1875, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.510' AS DateTime), N'3', CAST(N'2024-07-12' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1876, 5, 41, N'3', CAST(N'2024-06-16T00:10:36.510' AS DateTime), N'5', CAST(N'2024-07-12' AS Date), N'd4694d36-6a72-4105-9e93-1b1558d3db29')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1877, 3, 41, N'2', CAST(N'2024-06-16T08:44:01.797' AS DateTime), N'1', CAST(N'2024-07-10' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1878, 3, 41, N'2', CAST(N'2024-06-16T08:44:01.840' AS DateTime), N'5', CAST(N'2024-07-10' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1879, 4, 41, N'2', CAST(N'2024-06-16T08:44:01.840' AS DateTime), N'2', CAST(N'2024-07-11' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1880, 4, 41, N'2', CAST(N'2024-06-16T08:44:01.843' AS DateTime), N'3', CAST(N'2024-07-11' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1881, 5, 41, N'2', CAST(N'2024-06-16T08:44:01.843' AS DateTime), N'1', CAST(N'2024-07-12' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1882, 5, 41, N'2', CAST(N'2024-06-16T08:44:01.843' AS DateTime), N'4', CAST(N'2024-07-12' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1883, 6, 41, N'2', CAST(N'2024-06-16T08:44:01.843' AS DateTime), N'1', CAST(N'2024-07-13' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1884, 6, 41, N'2', CAST(N'2024-06-16T08:44:01.847' AS DateTime), N'4', CAST(N'2024-07-13' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1885, 7, 41, N'2', CAST(N'2024-06-16T08:44:01.847' AS DateTime), N'1', CAST(N'2024-07-14' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1886, 7, 41, N'2', CAST(N'2024-06-16T08:44:01.847' AS DateTime), N'5', CAST(N'2024-07-14' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1887, 1, 41, N'2', CAST(N'2024-06-16T08:44:01.847' AS DateTime), N'2', CAST(N'2024-07-15' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1888, 1, 41, N'2', CAST(N'2024-06-16T08:44:01.850' AS DateTime), N'4', CAST(N'2024-07-15' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1889, 2, 41, N'2', CAST(N'2024-06-16T08:44:01.850' AS DateTime), N'1', CAST(N'2024-07-16' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1890, 2, 41, N'2', CAST(N'2024-06-16T08:44:01.850' AS DateTime), N'3', CAST(N'2024-07-16' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1891, 3, 41, N'2', CAST(N'2024-06-16T08:44:01.853' AS DateTime), N'1', CAST(N'2024-07-17' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1892, 3, 41, N'2', CAST(N'2024-06-16T08:44:01.853' AS DateTime), N'5', CAST(N'2024-07-17' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1893, 4, 41, N'2', CAST(N'2024-06-16T08:44:01.853' AS DateTime), N'2', CAST(N'2024-07-18' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1894, 4, 41, N'2', CAST(N'2024-06-16T08:44:01.857' AS DateTime), N'3', CAST(N'2024-07-18' AS Date), N'462e2b92-f5c5-4fbd-8d5d-0639f166f89d')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1895, 6, 41, N'1', CAST(N'2024-06-17T01:28:08.783' AS DateTime), N'5', CAST(N'2024-06-15' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1896, 1, 41, N'1', CAST(N'2024-06-17T01:28:08.820' AS DateTime), N'3', CAST(N'2024-06-17' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1897, 2, 41, N'1', CAST(N'2024-06-17T01:28:08.820' AS DateTime), N'1', CAST(N'2024-06-18' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1898, 3, 41, N'1', CAST(N'2024-06-17T01:28:08.823' AS DateTime), N'2', CAST(N'2024-06-19' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1899, 3, 41, N'1', CAST(N'2024-06-17T01:28:08.823' AS DateTime), N'4', CAST(N'2024-06-19' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1900, 4, 41, N'1', CAST(N'2024-06-17T01:28:08.823' AS DateTime), N'1', CAST(N'2024-06-20' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1901, 4, 41, N'1', CAST(N'2024-06-17T01:28:08.827' AS DateTime), N'3', CAST(N'2024-06-20' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1902, 5, 41, N'1', CAST(N'2024-06-17T01:28:08.827' AS DateTime), N'5', CAST(N'2024-06-21' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
INSERT [dbo].[Schedules] ([id], [day_of_week], [mentor_id], [status], [create_time], [slot], [teach_date], [sessionId]) VALUES (1903, 6, 41, N'1', CAST(N'2024-06-17T01:28:08.827' AS DateTime), N'5', CAST(N'2024-06-22' AS Date), N'1752089b-e3f8-4e8e-9cf4-30e11d17cd07')
GO
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (5, N'Java_9', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (6, N'C#', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (8, N'.NET', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (21, N'Angular', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (22, N'HTML-CSS', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (23, N'ReactJS', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (24, N'ReactJS', NULL, 0)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (25, N'Python', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (26, N'AVCCCC', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (27, N'tgrrff', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (28, N'ABCCC', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1005, N'Skill 12', NULL, 0)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1006, N'ABCCCMNNN', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1007, N'AVCCCCCCCC', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1008, N'Java_8888', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1009, N'KÍNNSNUS', NULL, 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1010, N'ueuduuanuaa', NULL, 1)
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Account Course]  WITH CHECK ADD  CONSTRAINT [FK_Account Course_Account] FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account Course] CHECK CONSTRAINT [FK_Account Course_Account]
GO
ALTER TABLE [dbo].[Account Course]  WITH CHECK ADD  CONSTRAINT [FK_Account Course_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Account Course] CHECK CONSTRAINT [FK_Account Course_Course]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_Account]
GO
ALTER TABLE [dbo].[CV_Skill]  WITH CHECK ADD  CONSTRAINT [FK_CV_Skill_CV] FOREIGN KEY([cv_id])
REFERENCES [dbo].[CV] ([id])
GO
ALTER TABLE [dbo].[CV_Skill] CHECK CONSTRAINT [FK_CV_Skill_CV]
GO
ALTER TABLE [dbo].[CV_Skill]  WITH CHECK ADD  CONSTRAINT [FK_CV_Skill_Skill] FOREIGN KEY([skill_id])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[CV_Skill] CHECK CONSTRAINT [FK_CV_Skill_Skill]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Mentee] FOREIGN KEY([mentee_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Mentee]
GO
ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Mentor] FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Mentor]
GO
ALTER TABLE [dbo].[RateComment]  WITH CHECK ADD  CONSTRAINT [FK_RateComment_CreatedBy] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[RateComment] CHECK CONSTRAINT [FK_RateComment_CreatedBy]
GO
ALTER TABLE [dbo].[RateComment]  WITH CHECK ADD  CONSTRAINT [FK_RateComment_MentorID] FOREIGN KEY([mentorID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[RateComment] CHECK CONSTRAINT [FK_RateComment_MentorID]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Account]
GO
ALTER TABLE [dbo].[Request_Account]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request_Account] CHECK CONSTRAINT [FK_Request_Account_Account]
GO
ALTER TABLE [dbo].[Request_Account]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account_Request] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Request_Account] CHECK CONSTRAINT [FK_Request_Account_Request]
GO
ALTER TABLE [dbo].[Request_skill]  WITH CHECK ADD  CONSTRAINT [FK_Request_skill_Request] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Request_skill] CHECK CONSTRAINT [FK_Request_skill_Request]
GO
ALTER TABLE [dbo].[Request_skill]  WITH CHECK ADD  CONSTRAINT [FK_Request_skill_Skill] FOREIGN KEY([skillID])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Request_skill] CHECK CONSTRAINT [FK_Request_skill_Skill]
GO
ALTER TABLE [dbo].[Schedule_Note]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Note_Schedules] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedules] ([id])
GO
ALTER TABLE [dbo].[Schedule_Note] CHECK CONSTRAINT [FK_Schedule_Note_Schedules]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Account] FOREIGN KEY([mentor_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Account]
GO
