USE [happy_programming_system]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/5/2024 9:32:49 PM ******/
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
	[hold] [int] NULL,
 CONSTRAINT [PK__Account__3213E83F585EAB99] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Balance_Change]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance_Change](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[change_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Balance_Change] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 8/5/2024 9:32:49 PM ******/
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
	[note] [nvarchar](max) NULL,
	[rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_Skill]    Script Date: 8/5/2024 9:32:49 PM ******/
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
/****** Object:  Table [dbo].[Notification_Schedule]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mentor_id] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[created_at] [date] NOT NULL,
	[schedule_id] [int] NOT NULL,
 CONSTRAINT [PK_Notification_Schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[menteeId] [int] NOT NULL,
	[mentorId] [int] NOT NULL,
	[total] [int] NOT NULL,
	[createDate] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateComment]    Script Date: 8/5/2024 9:32:49 PM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 8/5/2024 9:32:49 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Course]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Course](
	[reqc_id] [int] IDENTITY(1,1) NOT NULL,
	[req_id] [int] NOT NULL,
	[toUser_id] [int] NOT NULL,
	[skill_id] [int] NULL,
	[numOfSlot] [int] NULL,
	[schedule_id] [int] NULL,
	[status] [nvarchar](max) NULL,
	[mentee_id] [int] NULL,
	[note_reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_Request_Course] PRIMARY KEY CLUSTERED 
(
	[reqc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/5/2024 9:32:49 PM ******/
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
/****** Object:  Table [dbo].[Schedule_Note]    Script Date: 8/5/2024 9:32:49 PM ******/
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
/****** Object:  Table [dbo].[Schedules]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mentor_id] [int] NOT NULL,
	[status] [nvarchar](max) NULL,
	[create_time] [datetime] NULL,
	[month] [int] NULL,
	[sessionId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 8/5/2024 9:32:49 PM ******/
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
/****** Object:  Table [dbo].[Slot]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slot] [int] NOT NULL,
	[dayOfWeek] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[teach_date] [date] NOT NULL,
	[isBooking] [bit] NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot_Mentee]    Script Date: 8/5/2024 9:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot_Mentee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slot] [int] NOT NULL,
	[dayOfWeek] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[learning_date] [date] NOT NULL,
	[skillId] [int] NOT NULL,
	[isAttend] [bit] NOT NULL,
 CONSTRAINT [PK_Slot_Mentee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (40, N'namlh123', N'namlh123@gmail.com', N'Nam123', N'Lê Xuân Nam', N'0912873410', CAST(N'2004-05-22' AS Date), 1, N'Phu Tho', NULL, NULL, NULL, 3, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (41, N'khanhnguyen', N'khanh245@gmail.com', N'Khanh245', N'Nguyễn Văn Khánh', N'924781275', CAST(N'2002-07-23' AS Date), 0, N'Khanh Hoa', N'https://cafebiz.cafebizcdn.vn/162123310254002176/2023/10/13/anh-bao-chi-2-11095058-1697189360905-16971893610092135965518.jpg', NULL, CAST(N'2024-06-24T05:31:38.560' AS DateTime), 2, CAST(2010000 AS Decimal(18, 0)), 1, 60000)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (42, N'khanhnguyenvan', N'khanh_nguyen@gmail.com', N'Khanh123456', N'Nguyen Khanh', N'0923123456', CAST(N'2001-02-16' AS Date), 1, N'Ha Noi', N'uploads/42.png', NULL, NULL, 1, CAST(3470000 AS Decimal(18, 0)), 1, 3400000)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (43, N'longchhe153', N'long123@gmail.com', N'Chulong123', N'chulong', N'0585703546', CAST(N'2024-04-16' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 1, CAST(600000 AS Decimal(18, 0)), 1, 80000)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (44, N'longchu', N'long345@gmail.com', N'Long5678', N'chu hong long', N'0781298122', CAST(N'2000-12-05' AS Date), 1, N'Phu Tho', N'uploads/44.png', NULL, NULL, 1, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (50, N'khanhhuyen', N'huyen345@gmail.com', N'Huyen5678', N'chu hong huyen', N'0721298122', CAST(N'2000-12-16' AS Date), 1, N'Hue', NULL, NULL, NULL, 1, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (52, N'vannam', N'namvan123@gmail.com', N'Van123456', N'nguyen khanh van', N'0923451236', CAST(N'2000-12-20' AS Date), 1, N'Hue', NULL, NULL, NULL, 1, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (60, N'hung2561', N'hung234@gmail.com', N'Long123456', N'Chu Hoàng Khánh', N'0585703546', CAST(N'2001-06-29' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 0, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2068, N'chulong2001', N'huynqhe180309@fpt.edu.vn', N'123456', N'Chu Hong Long', N'0585703546', CAST(N'2001-06-20' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2073, N'longchhe1530933', N'longchhe2612@fpt.edu.vn', N'Long2612', N'Chu Hoàng Khánh', N'0585703546', CAST(N'2024-06-11' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 0, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2076, N'thangnt245', N'thangnt245@gmail.com', N'Thang2612', N'Nguyễn Cao Thắng', N'0978123456', CAST(N'2002-07-21' AS Date), 1, N'Hue', NULL, NULL, NULL, 4, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2078, N'cuongng789', N'cuongng789@gmail.com', N'Cuong789', N'Nguyễn Huy Cường', N'0914256735', CAST(N'2005-08-20' AS Date), 1, N'Khanh Hoa', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2079, N'vuongng1234', N'vuongng567@gmail.com', N'Vuong987', N'Nguyễn Văn Vương', N'0927468126', CAST(N'2005-09-21' AS Date), 1, N'Phu Thinh', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2081, N'minh243', N'catminh2k1@gmail.com', N'Minh1234', N'Pham Cat Minh', N'826518299', CAST(N'2008-01-17' AS Date), 1, N'Quang Ninh', N'uploads/2081.png', NULL, CAST(N'2024-06-25T21:26:07.840' AS DateTime), 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2085, N'minh2468', N'minhpche153232@fpt.edu.vn', N'Minh1234', N'Pham Minh', N'826518299', CAST(N'2024-06-20' AS Date), 1, N'Quang Ninh', N'uploads/2085.png', NULL, CAST(N'2024-06-25T22:54:41.910' AS DateTime), 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2086, N'minh123', N'minhsteam2k1@gmail.com', N'Minh1234', N'Pham Minh', N'826518299', CAST(N'2001-06-13' AS Date), 1, N'Quang Ninh', N'uploads/2086.png', NULL, CAST(N'2024-06-26T15:00:36.030' AS DateTime), 2, CAST(7820000 AS Decimal(18, 0)), 1, 60000)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2087, N'mentor1', N'tranhunganhC@gmail.com', N'123ABCabc', N'Tran Hung Anh', N'0965626513', CAST(N'2003-12-12' AS Date), 1, N'Ha Noi', NULL, NULL, CAST(N'2024-07-17T13:28:29.067' AS DateTime), 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2088, N'chulong', N'long019@fpt.edu.vn', N'Chulong123', N'Chu Hoàng Long', N'0585703546', CAST(N'2024-07-25' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2089, N'hunglong', N'long78999@fpt.edu.vn', N'Chulong123', N'Chu Hùng Long', N'0585703546', CAST(N'2003-06-26' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 0, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2090, N'longcao', N'caohung@fpt.edu.vn', N'Chulong123', N'Cao Hùng Long', N'0585703546', CAST(N'2002-06-21' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 0, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2091, N'caolong123', N'longchhe153093999@fpt.edu.vn', N'Chulong2612', N'Cao Phương Long', N'0585703546', CAST(N'2024-07-25' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2092, N'duonglong', N'longchhe1530936777@fpt.edu.vn', N'Chulong2612', N'Chu Dương Long', N'0585703546', CAST(N'2024-07-25' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2093, N'HungCao', N'longchhe153093988@fpt.edu.vn', N'Hung123456', N'Cao Hùng ', N'0585703546', CAST(N'2024-07-16' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2101, N'phuongMinh', N'longchhe15309398811@fpt.edu.vn', N'Minh123456', N'Chu Phương Minh', N'0585703546', CAST(N'2024-07-17' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 0, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2102, N'minh_578', N'longchhe15309312121@fpt.edu.vn', N'Minh123456', N'nguyễn minh', N'0585703512', CAST(N'2024-07-23' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2103, N'Hieu261200', N'longchhe15309334566@fpt.edu.vn', N'Hieu26122000', N'Cao Hiếu', N'0585703567', CAST(N'2024-07-25' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2104, N'khanhlong', N'longchhe15309345699@fpt.edu.vn', N'Long9876', N'Cao Khánh Long', N'0585703534', CAST(N'2024-07-25' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2105, N'Chulien', N'longchhe1530936754444@fpt.edu.vn', N'Lien123456', N'Chu Phương Liên', N'0585703556', CAST(N'2024-07-26' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2106, N'nam_khanh', N'longchhe8888888@fpt.edu.vn', N'Long123456', N'Nguyễn Huy Khánh', N'0585704567', CAST(N'2005-06-27' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2107, N'huyen_nguyen', N'longchhe1530933456666@fpt.edu.vn', N'Huyen123456', N'Huyền Nguyễn', N'0975979857', CAST(N'2003-07-25' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2108, N'cuongnguyen', N'longchhe15309345211111@fpt.edu.vn', N'Chulong123', N'Cường Nguyễn', N'0978123456', CAST(N'2024-07-25' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 1, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2109, N'hunganh_123', N'tranhunganhB45677@gmail.com', N'Hunganh123', N'Trần Hùng Nam', N'0978123456', CAST(N'2024-07-17' AS Date), 0, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
INSERT [dbo].[Account] ([id], [name], [email], [password], [fullname], [phonenumber], [dob], [sex], [address], [avatar], [created_at], [modified_at], [roleID], [balance], [status], [hold]) VALUES (2110, N'honglong', N'longchhe153093@fpt.edu.vn', N'Chulong2612', N'Chu Hồng Long', N'0923123456', CAST(N'2001-06-28' AS Date), 1, N'Ha Noi', NULL, NULL, NULL, 2, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2002, 41, NULL, N'Teacher', N'Hello! I''m a dedicated teacher with a profound passion for teaching and knowledge dissemination. With experience in various fields, I strive to create a positive learning environment and foster comprehensive development among my students. My mission is to inspire and uncover the potential of each individual through education.', CAST(N'2024-05-30T00:11:49.807' AS DateTime), CAST(N'2024-06-24T05:31:38.553' AS DateTime), N'tudent Achievement: Consistently guiding students to excel academically, with many achieving top scores in national examinations.

Curriculum Development: Spearheading the development of innovative curriculum materials that cater to diverse learning styles and needs.

Professional Development: Actively participating in workshops and conferences to stay updated with the latest educational trends and methodologies.', N'Approve', N'Good cv', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2003, 2081, N'uploads/2081.png', N'Teacher', N'- Từng học ở Đại Học FPT
- Hiện đang làm việc tại FPT Software
- Hiện đang là hội viên của Hội Chữ Thập Đỏ', CAST(N'2024-06-25T21:13:31.050' AS DateTime), CAST(N'2024-06-25T21:26:07.837' AS DateTime), N'- Giải nhất thi chạy marathon JCup
- Giải ba kì thi toán quốc gia
- Giải nhì cuộc thi chạy tự thiện', N'Approve', N'Good cv', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2004, 2085, N'uploads/2085.png', N'Teacher', N'I am designed to assist with a wide range of tasks and provide information on numerous topics. Based on the GPT-4 architecture, I can understand and generate human-like text, enabling me to engage in conversations, answer questions, provide explanations, and even help with creative writing.', CAST(N'2024-06-25T22:42:41.317' AS DateTime), CAST(N'2024-06-25T22:54:41.907' AS DateTime), N'I am designed to assist with a wide range of tasks and provide information on numerous topics. Based on the GPT-4 architecture, I can understand and generate human-like text, enabling me to engage in conversations, answer questions, provide explanations, and even help with creative writing.', N'Approve', N'Good cv', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2005, 2086, N'uploads/2086.png', N'Teacher', N'abc', CAST(N'2024-06-26T14:56:57.740' AS DateTime), CAST(N'2024-06-26T15:00:36.027' AS DateTime), N'abc', N'Approve', N'abc', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2006, 2078, N'uploads/0.png', N'asdasd', N'asdasd', CAST(N'2024-07-17T13:09:48.097' AS DateTime), CAST(N'2024-07-17T13:13:00.987' AS DateTime), N'asdasd', N'Approve', N'ok', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2007, 2079, NULL, NULL, NULL, CAST(N'2024-07-17T13:20:26.130' AS DateTime), CAST(N'2024-07-17T13:20:26.130' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2008, 2087, N'uploads/0.png', N'Mentor', N'abcd', CAST(N'2024-07-17T13:24:24.673' AS DateTime), CAST(N'2024-07-17T13:27:31.017' AS DateTime), N'abcd', N'Approve', N'ok', 10000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2009, 2088, N'uploads/0.png', N'ABCCC', N'ABCCCC', CAST(N'2024-07-21T21:09:41.373' AS DateTime), CAST(N'2024-07-21T21:11:04.173' AS DateTime), N'ABCCC', N'Approve', N'Okkke', 20000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2010, 2091, N'uploads/0.png', N'ABCCC', N'ABCCC123', CAST(N'2024-07-21T22:05:37.320' AS DateTime), CAST(N'2024-07-21T22:06:55.353' AS DateTime), N'ABCCC123', N'Approve', N'OK', 20000)
INSERT [dbo].[CV] ([id], [accountID], [avatar], [job], [introduction], [created_at], [modified_at], [achievements], [status], [note], [rate]) VALUES (2011, 2109, N'uploads/0.png', N'Teacher', N'ABCBCCCCCCCCCCCC', CAST(N'2024-07-28T09:00:58.277' AS DateTime), CAST(N'2024-07-28T09:01:28.757' AS DateTime), N'ABCCCC', N'Pending', NULL, 10000)
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2002, 6, 5)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2002, 8, 5)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2002, 21, 5)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2003, 6, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2003, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2003, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2004, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2004, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2005, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2005, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2006, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2006, 1011, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2008, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2008, 25, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2009, 6, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2009, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2009, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2010, 8, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2010, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2011, 21, 0)
INSERT [dbo].[CV_Skill] ([cv_id], [skill_id], [rating_star]) VALUES (2011, 25, 0)
GO
SET IDENTITY_INSERT [dbo].[Notification_Schedule] ON 

INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (1, 41, N'Not Good', CAST(N'2024-07-27' AS Date), 12)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (2, 2087, N'OK', CAST(N'2024-07-17' AS Date), 50)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (3, 2088, N'OK', CAST(N'2024-07-21' AS Date), 95)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (4, 2091, N'Oke', CAST(N'2024-07-21' AS Date), 98)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (5, 2078, N'Not Good', CAST(N'2024-07-27' AS Date), 6)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (6, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 132)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (7, 2078, N'not Good', CAST(N'2024-07-27' AS Date), 7)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (8, 2079, N'Not Good', CAST(N'2024-07-27' AS Date), 8)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (9, 2079, N'Not Good', CAST(N'2024-07-27' AS Date), 9)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (10, 2078, N'Not Good', CAST(N'2024-07-27' AS Date), 10)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (11, 41, N'Not Good', CAST(N'2024-07-27' AS Date), 15)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (12, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 85)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (13, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 86)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (14, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 87)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (15, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 88)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (16, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 89)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (17, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 90)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (18, 43, N'Not Good', CAST(N'2024-07-27' AS Date), 91)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (19, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 92)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (20, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 93)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (21, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 97)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (22, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 100)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (23, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 101)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (24, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 102)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (25, 41, N'Not Good', CAST(N'2024-07-27' AS Date), 103)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (26, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 107)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (27, 41, N'Not Good', CAST(N'2024-07-27' AS Date), 108)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (28, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 109)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (29, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 110)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (30, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 111)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (31, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 112)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (32, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 113)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (33, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 114)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (34, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 115)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (35, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 116)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (36, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 117)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (37, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 118)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (38, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 119)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (39, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 120)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (40, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 121)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (41, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 122)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (42, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 123)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (43, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 124)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (44, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 125)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (45, 42, N'Not Good', CAST(N'2024-07-27' AS Date), 126)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (46, 2085, N'QUÍNNNS', CAST(N'2024-07-28' AS Date), 153)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (47, 2107, N'Not Goood', CAST(N'2024-07-28' AS Date), 161)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (48, 41, N'Very Goooooood', CAST(N'2024-07-28' AS Date), 165)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (49, 2109, N'Not Good', CAST(N'2024-07-28' AS Date), 169)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (50, 2110, N'Ok', CAST(N'2024-07-28' AS Date), 179)
INSERT [dbo].[Notification_Schedule] ([id], [mentor_id], [message], [created_at], [schedule_id]) VALUES (1005, 41, N'Good', CAST(N'2024-08-05' AS Date), 2135)
SET IDENTITY_INSERT [dbo].[Notification_Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (1, 42, 41, 10000, CAST(N'2024-07-01' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (2, 42, 42, 10000, CAST(N'2024-07-01' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (4, 2086, 41, 1000000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (5, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (6, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (8, 2086, 2081, 2081, CAST(N'2081-01-01' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (9, 2086, 2081, 2081, CAST(N'2081-01-01' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (10, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (11, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (12, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (13, 2086, 41, 10000, CAST(N'2024-07-03' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (16, 2086, 2081, 80000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (17, 2086, 2081, 60000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (18, 2086, 2081, 60000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (19, 2086, 2081, 60000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (20, 2086, 2081, 60000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (21, 2086, 2081, 80000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (22, 2086, 2081, 60000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (23, 2086, 2081, 140000, CAST(N'2024-07-08' AS Date), 1)
INSERT [dbo].[Order] ([orderId], [menteeId], [mentorId], [total], [createDate], [status]) VALUES (24, 42, 41, 60000, CAST(N'2024-07-09' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1073, N'abc', CAST(N'2024-07-06T15:18:01.273' AS DateTime), N'abc', N'1', 2086, CAST(N'2024-07-06T15:18:01.273' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1074, N'abc', CAST(N'2024-07-06T15:20:07.023' AS DateTime), N'abc', N'1', 2086, CAST(N'2024-07-06T15:20:07.023' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1075, N'ttt', CAST(N'2024-07-18T10:05:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T10:06:17.517' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1076, N'ttt', CAST(N'2024-07-19T10:13:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T10:10:20.860' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1077, N'ttt', CAST(N'2024-07-05T22:14:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T10:13:03.500' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1078, N'Test', CAST(N'2024-07-27T10:48:00.000' AS DateTime), N'test', N'2', 2086, CAST(N'2024-07-08T10:48:32.893' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1079, N'Test', CAST(N'2024-07-25T01:56:00.000' AS DateTime), N'tet', N'2', 2086, CAST(N'2024-07-08T10:57:01.047' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1080, N'Test', CAST(N'2024-07-27T10:57:00.000' AS DateTime), N'test', N'2', 2086, CAST(N'2024-07-08T10:57:57.737' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1081, N'Test', CAST(N'2024-07-12T12:21:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T12:21:51.643' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1082, N'Test', CAST(N'2024-07-24T12:26:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T12:23:32.860' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1083, N'Test', CAST(N'2024-07-13T14:24:00.000' AS DateTime), N'tttt', N'2', 2086, CAST(N'2024-07-08T12:24:28.293' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1084, N'Test', CAST(N'2024-07-18T13:33:00.000' AS DateTime), N'ttt', N'2', 2086, CAST(N'2024-07-08T13:33:27.753' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1085, N'Test', CAST(N'2024-07-17T13:37:00.000' AS DateTime), N'tttt', N'2', 2086, CAST(N'2024-07-08T13:37:59.487' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1086, N'Test', CAST(N'2024-07-26T13:39:00.000' AS DateTime), N'tttt', N'2', 2086, CAST(N'2024-07-08T13:39:40.637' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1087, N'Test', CAST(N'2024-08-03T13:45:00.000' AS DateTime), N'rttt', N'2', 2086, CAST(N'2024-07-08T13:45:45.793' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1088, N'Test', CAST(N'2024-07-24T13:50:00.000' AS DateTime), N'tttt', N'2', 2086, CAST(N'2024-07-08T13:50:35.943' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1089, N'Test', CAST(N'2024-07-18T13:56:00.000' AS DateTime), N'1234', N'2', 2086, CAST(N'2024-07-08T13:56:22.793' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1090, N'Test', CAST(N'2024-07-18T14:02:00.000' AS DateTime), N'ertt', N'2', 2086, CAST(N'2024-07-08T14:03:00.857' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1091, N'Test', CAST(N'2024-08-13T10:34:00.000' AS DateTime), N'1234', N'2', 42, CAST(N'2024-07-09T10:35:20.060' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1092, N'Test', CAST(N'2024-07-20T10:36:00.000' AS DateTime), N'ttt', N'1', 42, CAST(N'2024-07-09T10:36:40.040' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1108, N'abc', CAST(N'2024-07-18T15:40:17.390' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T15:40:17.390' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1109, N'abc', CAST(N'2024-07-18T15:40:45.277' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T15:40:45.277' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1110, N'abc', CAST(N'2024-07-18T15:40:59.303' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T15:40:59.303' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1111, N'abc345', CAST(N'2024-07-18T15:42:37.837' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T15:42:37.837' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1112, N'abc345899', CAST(N'2024-07-18T15:46:34.920' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T15:46:34.920' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1113, N'abc345899', CAST(N'2024-07-18T16:12:12.323' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T16:12:12.323' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1114, N'abc345899', CAST(N'2024-07-18T16:13:46.747' AS DateTime), N'abc', N'3', 2086, CAST(N'2024-07-18T16:13:46.747' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1115, N'Chu Long', CAST(N'2024-07-20T16:42:00.000' AS DateTime), N'Tôi Là Chu Long', N'1', 42, CAST(N'2024-07-18T16:43:11.510' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1116, N'Chu Hồng Long', CAST(N'2024-07-27T16:45:00.000' AS DateTime), N'Tôi là Chu Long', N'1', 42, CAST(N'2024-07-18T16:46:50.240' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1117, N'Chu Long', CAST(N'2024-07-20T21:02:00.000' AS DateTime), N'Tôi Là Chu Long', N'1', 42, CAST(N'2024-07-19T21:15:48.697' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1118, N'Khanh Pham', CAST(N'2024-07-20T22:29:00.000' AS DateTime), N'Tôi là Khánh Phạm', N'1', 42, CAST(N'2024-07-19T22:30:16.297' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1119, N'Nguyen Huy', CAST(N'2024-07-20T22:31:00.000' AS DateTime), N'Tôi là Nguyen Huy', N'1', 42, CAST(N'2024-07-19T22:31:26.520' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1120, N'Nguyen Huy', CAST(N'2024-07-20T22:35:00.000' AS DateTime), N'Tôi là Nguyen Huy', N'1', 42, CAST(N'2024-07-19T22:35:53.020' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1121, N'Cao Khanh', CAST(N'2024-07-20T22:41:00.000' AS DateTime), N'Tôi là cao khánh', N'1', 42, CAST(N'2024-07-19T22:46:26.410' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1122, N'Khánh Huy', CAST(N'2024-07-20T22:53:00.000' AS DateTime), N'Tôi Là Khánh Huy', N'1', 42, CAST(N'2024-07-19T22:54:27.037' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1123, N'Long', CAST(N'2024-07-20T22:54:00.000' AS DateTime), N'Long Hong', N'1', 42, CAST(N'2024-07-19T22:56:03.150' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1124, N'Long Chu 123', CAST(N'2024-07-20T22:56:00.000' AS DateTime), N'Long Chu', N'1', 42, CAST(N'2024-07-20T00:00:46.497' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1125, N'Khanh Nguyen', CAST(N'2024-07-21T09:18:00.000' AS DateTime), N'Tooi la Khanh Nguyen', N'1', 42, CAST(N'2024-07-20T09:18:53.097' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1126, N'Khanh Huy', CAST(N'2024-07-21T09:19:00.000' AS DateTime), N'Toi La Khanh Huy', N'1', 42, CAST(N'2024-07-20T09:25:19.653' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1127, N'Huyen Nguyen 234', CAST(N'2024-07-21T10:23:00.000' AS DateTime), N'Tôi là Khanh Nguyen 345', N'1', 42, CAST(N'2024-07-20T10:24:42.280' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1128, N'Minh Pham 123', CAST(N'2024-07-23T10:27:00.000' AS DateTime), N'Minh Pham 123', N'1', 42, CAST(N'2024-07-20T10:28:29.947' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1129, N'Pham Khanh', CAST(N'2024-07-21T10:38:00.000' AS DateTime), N'Tôi là Khánh Phạm', N'1', 42, CAST(N'2024-07-20T10:39:18.567' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1130, N'Khanh Nguyen Van', CAST(N'2024-07-24T10:48:00.000' AS DateTime), N'Tôi là Khanh Nguyen', N'1', 42, CAST(N'2024-07-20T10:49:04.647' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1131, N'Chu Long 345', CAST(N'2024-07-23T15:11:00.000' AS DateTime), N'Tôi Là Chu Long', N'1', 42, CAST(N'2024-07-20T15:12:22.470' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1132, N'Cao Nguyen', CAST(N'2024-07-25T15:14:00.000' AS DateTime), N'Tôi là cao nguyen', N'1', 42, CAST(N'2024-07-20T15:15:30.333' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1133, N'Bình Minh', CAST(N'2024-07-24T18:01:00.000' AS DateTime), N'Tôi là Bình Minh', N'1', 43, CAST(N'2024-07-20T18:07:09.757' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1134, N'Khanh Nguyen', CAST(N'2024-07-25T23:12:00.000' AS DateTime), N'Tôi 123', N'1', 42, CAST(N'2024-07-20T23:12:43.950' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1135, N'Hùng Nguyễn', CAST(N'2024-07-26T23:58:00.000' AS DateTime), N'Tôi Là Hùng Nguyễn', N'1', 42, CAST(N'2024-07-20T23:59:00.487' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1136, N'Khanh Huy', CAST(N'2024-07-25T21:21:00.000' AS DateTime), N'Tôi là Khánh Huy', N'1', 42, CAST(N'2024-07-21T21:22:43.450' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1137, N'Phương Long', CAST(N'2024-07-26T22:12:00.000' AS DateTime), N'Tôi Là Phương Long', N'1', 42, CAST(N'2024-07-21T22:15:42.693' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1138, N'Minh Pham', CAST(N'2024-07-24T22:19:00.000' AS DateTime), N'Tôi Là Minh Pham', N'1', 42, CAST(N'2024-07-21T22:20:06.743' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1139, N'Cao Trung Nam', CAST(N'2024-07-26T16:01:00.000' AS DateTime), N'Tôi là trung Nam', N'1', 42, CAST(N'2024-07-22T16:02:20.573' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1140, N'7737733', CAST(N'2024-07-26T16:19:00.000' AS DateTime), N'tôi là 7771222', N'1', 41, CAST(N'2024-07-22T16:19:25.467' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1141, N'Khanh', CAST(N'2024-07-26T15:24:00.000' AS DateTime), N'Toi la Khánh Huy', N'1', 42, CAST(N'2024-07-24T15:24:48.967' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1142, N'Huy Nguyễn', CAST(N'2024-07-26T15:20:00.000' AS DateTime), N'Tôi là Huy Nguyễn', N'1', 42, CAST(N'2024-07-25T15:21:02.620' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1143, N'Cường Phạm 234', CAST(N'2024-07-26T22:33:00.000' AS DateTime), N'Tôi là Cường Phạm 456', N'1', 42, CAST(N'2024-07-25T22:37:27.513' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1144, N'Long Phạm', CAST(N'2024-07-26T23:25:00.000' AS DateTime), N'Tôi Là Long Phạm', N'1', 42, CAST(N'2024-07-25T23:26:15.707' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1145, N'Huy Phạm', CAST(N'2024-07-24T23:44:00.000' AS DateTime), N'Tôi Là Huy Phạm', N'1', 42, CAST(N'2024-07-25T23:46:10.473' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1146, N'Cường Phạm', CAST(N'2024-07-28T00:29:00.000' AS DateTime), N'Tôi Là Cường Phạm', N'1', 42, CAST(N'2024-07-26T00:29:48.133' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1147, N'Vinh Phạm', CAST(N'2024-07-25T00:51:00.000' AS DateTime), N'Tôi Là Vinh Phạm', N'1', 42, CAST(N'2024-07-26T00:52:08.033' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1148, N'Bình Nam', CAST(N'2024-07-25T20:29:00.000' AS DateTime), N'Tôi là Bình Nam', N'1', 42, CAST(N'2024-07-26T20:30:09.557' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1149, N'ABCCC345', CAST(N'2024-07-30T20:51:00.000' AS DateTime), N'Tôi là ABCCC', N'1', 42, CAST(N'2024-07-26T20:52:13.027' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1150, N'Quốc Cường', CAST(N'2024-07-27T20:58:00.000' AS DateTime), N'Tôi là Quốc Cường', N'1', 42, CAST(N'2024-07-26T21:01:49.380' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1151, N'Hoàng Anh', CAST(N'2024-07-27T21:19:00.000' AS DateTime), N'Tôi Là Hoàng Anh', N'1', 42, CAST(N'2024-07-26T21:21:12.083' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1152, N'Cao Văn', CAST(N'2024-07-27T21:25:00.000' AS DateTime), N'Tôi Là Cao Văn 23456', N'1', 42, CAST(N'2024-07-26T21:31:35.077' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1153, N'Chu Long 234', CAST(N'2024-07-27T06:24:00.000' AS DateTime), N'Tôi Là Chu Long', N'1', 42, CAST(N'2024-07-28T06:29:57.157' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1154, N'Quốc Nam', CAST(N'2024-07-29T06:35:00.000' AS DateTime), N'Tôi Là Quốc Nam', N'1', 42, CAST(N'2024-07-28T06:35:49.503' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1155, N'Hoàng Nam', CAST(N'2024-07-27T06:40:00.000' AS DateTime), N'Tôi Là Hoàng Nam', N'1', 42, CAST(N'2024-07-28T06:43:40.250' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1156, N'Hoàng Cườngd', CAST(N'2024-07-27T10:13:00.000' AS DateTime), N'Tôi là Hoàng Cường', N'1', 42, CAST(N'2024-07-28T10:14:52.607' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (1157, N'Tôi muốn đăng ký học C', CAST(N'2024-07-27T11:23:00.000' AS DateTime), N'Tôi muốn đăng ký học C', N'1', 42, CAST(N'2024-07-28T11:26:25.750' AS DateTime))
INSERT [dbo].[Request] ([id], [title], [deadline], [content], [status], [createdBy], [createdDate]) VALUES (2153, N'Tôi Là Huy Cường', CAST(N'2024-07-30T15:47:00.000' AS DateTime), N'Tôi Là Huy Cường', N'1', 42, CAST(N'2024-07-31T15:49:57.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Request_Course] ON 

INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (46, 1073, 41, 6, 4, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (47, 1074, 2078, 6, 4, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (48, 1075, 2081, 6, 3, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (49, 1076, 2081, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (50, 1077, 2081, 6, 4, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (51, 1078, 2081, 8, 3, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (52, 1079, 2081, 6, 3, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (53, 1080, 2081, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (54, 1081, 2081, 6, 3, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (55, 1082, 2081, 6, 3, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (56, 1083, 2081, 6, 4, NULL, NULL, 52, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (57, 1084, 2081, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (58, 1085, 2081, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (59, 1086, 2081, 8, 3, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (60, 1087, 2081, 6, 3, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (61, 1088, 2081, 6, 4, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (62, 1089, 2081, 6, 4, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (63, 1090, 2081, 6, 7, NULL, NULL, 50, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (64, 1091, 41, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (65, 1092, 41, 6, 3, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (68, 1111, 2078, 6, 4, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (69, 1112, 2078, 6, 4, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (70, 1113, 2078, 6, 4, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (71, 1114, 2078, 6, 4, NULL, NULL, 44, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (84, 1127, 41, 21, 4, 85, N'3', 42, N'Notrgg')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (85, 1128, 2081, 21, 3, 86, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (86, 1129, 2081, 21, 2, 87, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (87, 1130, 2081, 21, 3, 88, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (88, 1132, 41, 8, 3, 90, N'2', 42, N'Ok')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (89, 1133, 41, 21, 4, 91, N'2', 43, N'ggg')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (90, 1134, 41, 21, 5, 92, N'2', 42, N'OK')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (91, 1135, 41, 21, 20, 93, N'2', 42, N'Okkk')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (92, 1136, 41, 8, 16, 97, N'2', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (93, 1137, 41, 8, 16, 100, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (94, 1138, 2081, 8, 3, 101, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (95, 1139, 41, 8, 3, 102, N'2', 42, N'dddddddddd')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (96, 1140, 41, 8, 3, 103, N'2', 41, N'ddddddddddd')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (97, 1141, 41, 6, 3, 107, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (98, 1142, 41, 8, 4, 109, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (99, 1143, 2081, 8, 9, 111, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (100, 1144, 2081, 8, 4, 112, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (101, 1145, 2091, 21, 17, 114, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (102, 1146, 41, 8, 4, 116, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (103, 1147, 2081, 21, 3, 118, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (104, 1148, 2081, 6, 3, 120, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (105, 1149, 41, 8, 3, 123, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (106, 1150, 2091, 21, 2, 125, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (107, 1151, 2091, 21, 3, 127, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (108, 1152, 2088, 21, 9, 129, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (109, 1153, 41, 21, 4, 166, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (110, 1154, 41, 8, 3, 167, N'1', 42, NULL)
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (111, 1155, 41, 8, 6, 168, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (112, 1156, 41, 8, 14, 175, N'2', 42, N'Goood')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (113, 1157, 41, 6, 3, 181, N'3', 42, N'Not Good')
INSERT [dbo].[Request_Course] ([reqc_id], [req_id], [toUser_id], [skill_id], [numOfSlot], [schedule_id], [status], [mentee_id], [note_reason]) VALUES (1109, 2153, 2081, 21, 13, 1132, N'1', 42, NULL)
SET IDENTITY_INSERT [dbo].[Request_Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Mentee')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Mentor')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (4, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2, 41, N'2', CAST(N'2024-06-19T16:29:56.277' AS DateTime), 5, N'3d786fce-41f3-4992-875e-082d463f9334')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (3, 41, N'2', CAST(N'2024-06-19T16:37:14.260' AS DateTime), 5, N'2d7f8b07-8f22-4f11-8f67-228a8aea8ce3')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (4, 41, N'2', CAST(N'2024-06-19T16:38:44.453' AS DateTime), 9, N'4678ee26-ee16-49e0-9ab4-23fe9a049b65')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (5, 41, N'3', CAST(N'2024-06-19T16:44:52.257' AS DateTime), 5, N'0cbccdc2-cd46-4b9b-ad48-1ecaa262ef63')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (6, 2078, N'3', CAST(N'2024-06-19T16:51:37.397' AS DateTime), 9, N'a32c3d17-83c6-480d-ad6c-feedb9576055')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (7, 2078, N'3', CAST(N'2024-06-19T16:52:04.420' AS DateTime), 12, N'31a39737-1bb4-489d-837c-b70da3903860')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (8, 2079, N'3', CAST(N'2024-06-19T16:53:17.140' AS DateTime), 4, N'd0b1f963-eee4-4ada-881c-61170932d7f5')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (9, 2079, N'3', CAST(N'2024-06-19T16:53:28.837' AS DateTime), 3, N'3bb6dc42-d6fc-4bfd-9287-783f08718bce')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (10, 2078, N'3', CAST(N'2024-06-19T17:45:59.320' AS DateTime), 9, N'35330407-1ffa-4c69-8fe6-578490cfd769')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (11, 41, N'4', CAST(N'2024-06-26T00:00:00.000' AS DateTime), 7, N'abc123')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (12, 41, N'3', CAST(N'2024-06-21T00:00:00.000' AS DateTime), 7, N'nbv457')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (13, 41, N'4', CAST(N'2024-06-26T13:58:39.567' AS DateTime), 5, N'276c402f-3a09-4ecf-83aa-ddfa914ae919')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (14, 41, N'4', CAST(N'2024-06-26T14:00:28.920' AS DateTime), 5, N'd6cffc53-ef9b-4733-81d7-69a45b5306cd')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (15, 41, N'3', CAST(N'2024-06-26T14:06:22.693' AS DateTime), 6, N'04a87974-9e58-4d25-a4b7-4a37444f1450')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (16, 2086, N'3', CAST(N'2024-06-26T15:01:54.657' AS DateTime), 8, N'a2c0b7b1-f4aa-498e-9757-c5c59c3e434d')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (17, 2086, N'2', CAST(N'2024-06-26T15:02:56.053' AS DateTime), 8, N'5ca9ef78-2eab-4554-b8b1-0182a1e7f422')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (18, 2086, N'4', CAST(N'2024-06-26T15:03:18.917' AS DateTime), 8, N'9a8bc6d1-43af-4ddf-8702-fc037780e596')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (19, 2086, N'4', CAST(N'2024-07-02T05:11:30.560' AS DateTime), 8, N'309d2fcf-a573-43ca-a87f-df3174ec8d6a')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (20, 2081, N'2', CAST(N'2024-07-11T18:02:57.610' AS DateTime), 8, N'6628ae39-c60e-4329-af49-7eb59ce2e5cf')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (21, 2081, N'4', CAST(N'2024-07-11T18:03:16.827' AS DateTime), 8, N'd8ff276c-eb5f-40f8-a8c4-d44e120b53f5')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (23, 41, N'4', CAST(N'2024-07-12T10:55:13.917' AS DateTime), 7, N'db3510f3-cc91-41ce-9981-68bf3d3145a4')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (50, 2087, N'2', CAST(N'2024-07-17T13:29:42.210' AS DateTime), 8, N'358f12f7-123e-4a1e-af2d-356104abc98e')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (85, 42, N'3', CAST(N'2024-07-20T10:24:02.160' AS DateTime), 9, N'e3182671-0321-43bb-afef-322af2911eec')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (86, 42, N'3', CAST(N'2024-07-20T10:27:18.793' AS DateTime), 8, N'93b2bbc8-09d8-4eab-890e-75d436403195')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (87, 42, N'3', CAST(N'2024-07-20T10:39:08.447' AS DateTime), 8, N'626ea5d4-1852-4ac6-bc0c-c5e6b0599272')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (88, 42, N'3', CAST(N'2024-07-20T10:48:57.493' AS DateTime), 8, N'0c0c1f72-4ef4-4dc9-994f-90d64903d697')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (89, 42, N'3', CAST(N'2024-07-20T15:12:10.630' AS DateTime), 9, N'a63b13b1-d600-46cb-91bf-391665e25fbc')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (90, 42, N'3', CAST(N'2024-07-20T15:15:16.377' AS DateTime), 9, N'f4617bee-722c-4746-b783-781db19b7f19')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (91, 43, N'3', CAST(N'2024-07-20T18:06:58.283' AS DateTime), 9, N'd687f7df-760c-432f-88e5-0bf643e91e98')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (92, 42, N'3', CAST(N'2024-07-20T23:12:36.193' AS DateTime), 9, N'1acf8d09-4efd-47e9-b481-0b31f08e9cc4')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (93, 42, N'3', CAST(N'2024-07-20T23:58:38.653' AS DateTime), 9, N'cb830418-ae0e-463b-9a2e-8e4fbf7c5176')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (95, 2088, N'2', CAST(N'2024-07-21T21:16:32.243' AS DateTime), 8, N'57bfb4aa-46bd-4262-b026-1f0787624a7f')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (96, 2088, N'4', CAST(N'2024-07-21T21:16:45.380' AS DateTime), 8, N'ad92af72-2eca-478b-b0f7-756f45766170')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (97, 42, N'3', CAST(N'2024-07-21T21:21:17.983' AS DateTime), 9, N'6bc44957-9104-4d1f-8727-c0e3c2c90433')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (98, 2091, N'2', CAST(N'2024-07-21T22:07:36.410' AS DateTime), 8, N'9fd48600-ce01-43a5-b6a0-1e5b81bf10e5')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (100, 42, N'3', CAST(N'2024-07-21T22:13:07.930' AS DateTime), 9, N'0582a7e9-cfa1-40d1-9b34-1a766dafcea5')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (101, 42, N'3', CAST(N'2024-07-21T22:19:51.757' AS DateTime), 8, N'14aa7f09-f250-4803-b422-3dac850dc9b2')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (102, 42, N'3', CAST(N'2024-07-22T16:02:10.203' AS DateTime), 9, N'910ddfca-edd0-479a-9c19-095c3ad07067')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (103, 41, N'3', CAST(N'2024-07-22T16:19:19.980' AS DateTime), 9, N'155d308d-ab4f-46a6-b66c-f291dabbed6d')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (104, 41, N'4', CAST(N'2024-07-23T16:45:14.320' AS DateTime), 5, N'a0374d6e-9224-4a36-87fa-fb1be10c4476')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (105, 41, N'4', CAST(N'2024-07-23T22:24:05.283' AS DateTime), 5, N'8ef0ba7b-929d-4c10-82c0-96a2a163a571')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (106, 41, N'4', CAST(N'2024-07-23T22:25:54.203' AS DateTime), 5, N'9ea57a27-b26e-426c-88bf-68fcef73aa41')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (107, 42, N'3', CAST(N'2024-07-24T15:24:36.330' AS DateTime), 9, N'6081f418-ebd0-455a-860e-bcfc1be2d199')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (108, 41, N'3', CAST(N'2024-07-24T15:54:10.727' AS DateTime), 9, N'3a71ad24-7515-4ceb-b815-5bb4ef029f02')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (109, 42, N'3', CAST(N'2024-07-25T15:20:50.037' AS DateTime), 9, N'5363adf6-8cc4-4438-b1ee-7381127205eb')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (110, 42, N'3', CAST(N'2024-07-25T21:53:31.393' AS DateTime), 8, N'a19be39a-c01f-4ed5-a712-58d0a74d75aa')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (111, 42, N'3', CAST(N'2024-07-25T22:33:55.587' AS DateTime), 8, N'4272a0cc-4978-45db-b145-457b5de6e0d6')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (112, 42, N'3', CAST(N'2024-07-25T23:25:52.590' AS DateTime), 8, N'0ee0b3b0-021c-4a6e-a5b2-7b9423f666c5')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (113, 42, N'3', CAST(N'2024-07-25T23:26:20.850' AS DateTime), 8, N'2a7afba2-a70d-4c2c-8b19-5a3b6e1ca1fb')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (114, 42, N'3', CAST(N'2024-07-25T23:45:08.703' AS DateTime), 8, N'ca2504ab-dea7-41d2-9725-6de51d30ad64')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (115, 42, N'3', CAST(N'2024-07-25T23:46:17.817' AS DateTime), 8, N'f422f55b-515e-4e54-a111-e0b081162cc8')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (116, 42, N'3', CAST(N'2024-07-26T00:29:36.827' AS DateTime), 9, N'1c35280e-9fda-434c-9f91-f3fe0e0c4342')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (117, 42, N'3', CAST(N'2024-07-26T00:29:52.967' AS DateTime), 9, N'422f1a0f-14f5-4a91-99ed-d6a4476f5329')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (118, 42, N'3', CAST(N'2024-07-26T00:52:01.697' AS DateTime), 8, N'317b7841-2943-4cea-afdb-cc0bb3cf3241')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (119, 42, N'3', CAST(N'2024-07-26T00:52:16.077' AS DateTime), 8, N'd45c2807-8cc6-4ed3-9d25-68c8f1e10953')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (120, 42, N'3', CAST(N'2024-07-26T20:30:01.427' AS DateTime), 8, N'92b2d983-b76b-427f-a83b-aeaf4bb24559')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (121, 42, N'3', CAST(N'2024-07-26T20:30:14.747' AS DateTime), 8, N'ab5002b1-5fc3-4c35-8d10-6ea69adf86f1')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (122, 42, N'3', CAST(N'2024-07-26T20:39:39.107' AS DateTime), 8, N'10ea481a-9967-4de3-a39c-142e12c2d6d8')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (123, 42, N'3', CAST(N'2024-07-26T20:52:01.577' AS DateTime), 9, N'fb1c66e4-8917-41ea-8022-da4c70b4bb34')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (124, 42, N'3', CAST(N'2024-07-26T20:52:15.787' AS DateTime), 9, N'1057635a-726a-4116-ac14-c70413d3c706')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (125, 42, N'3', CAST(N'2024-07-26T20:58:25.683' AS DateTime), 8, N'2de7ca70-64af-43ef-bad6-a7e322f729d3')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (126, 42, N'3', CAST(N'2024-07-26T21:01:52.543' AS DateTime), 8, N'7dbcf780-681a-4f99-b403-e6ca4e630d6a')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (127, 42, N'1', CAST(N'2024-07-26T21:20:39.990' AS DateTime), 8, N'93e6690f-d08d-45b2-a0a4-6af261d7d097')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (128, 42, N'1', CAST(N'2024-07-26T21:21:18.380' AS DateTime), 8, N'e3368239-721e-4d07-9510-b937605ccab2')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (129, 42, N'1', CAST(N'2024-07-26T21:30:07.697' AS DateTime), 8, N'3ffb8b4e-1481-4566-8b77-47c44c2d7ed8')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (130, 42, N'1', CAST(N'2024-07-26T21:31:40.600' AS DateTime), 8, N'14931076-81ca-4fd3-b2c8-7dc01baa92c2')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (131, 42, N'1', CAST(N'2024-07-27T11:36:24.733' AS DateTime), 9, N'87f3175b-58d2-45c9-9167-997182bfa51c')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (132, 42, N'3', CAST(N'2024-07-27T11:43:52.003' AS DateTime), 8, N'30f13a5a-ce51-4e7a-bda9-d873021e755b')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (141, 41, N'4', CAST(N'2024-07-27T14:16:27.560' AS DateTime), 7, N'ba2cfa39-06c1-439a-aca9-c285924b6213')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (142, 41, N'4', CAST(N'2024-07-27T14:23:12.053' AS DateTime), 7, N'd23c003a-7782-4cdb-8937-129766802680')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (143, 41, N'4', CAST(N'2024-07-27T14:37:42.347' AS DateTime), 7, N'9aa6af54-83c2-4987-8377-81c063119332')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (147, 41, N'4', CAST(N'2024-07-27T15:44:46.293' AS DateTime), 6, N'ccf8df1b-5b3e-4bd4-ac28-ad2b39aeca01')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (148, 41, N'4', CAST(N'2024-07-27T16:02:28.183' AS DateTime), 5, N'6217c4c6-a0de-42d8-95d1-3fc3fdb840eb')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (151, 2078, N'4', CAST(N'2024-07-27T16:32:28.723' AS DateTime), 9, N'09bcbd50-3cc1-4670-81a8-24534f897758')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (152, 2078, N'4', CAST(N'2024-07-27T19:48:05.030' AS DateTime), 9, N'40bcef79-0af6-4605-a4ab-f62153442e3e')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (153, 2085, N'3', CAST(N'2024-07-27T23:36:50.903' AS DateTime), 8, N'd43dd592-5bf3-47fb-8de3-955bed736b2c')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (160, 2085, N'4', CAST(N'2024-07-28T00:33:10.853' AS DateTime), 8, N'acb2f4a3-c01d-423a-b4df-bc3a14dcc65a')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (161, 2107, N'3', CAST(N'2024-07-28T06:08:45.447' AS DateTime), 9, N'0a471621-487c-46e5-bd90-905dadecbab0')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (165, 41, N'2', CAST(N'2024-07-28T06:21:02.933' AS DateTime), 10, N'b28bf105-2fc8-4ab4-ab34-86f2cdc59c72')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (166, 42, N'1', CAST(N'2024-07-28T06:25:34.293' AS DateTime), 10, N'b339313d-6b89-4cdc-a389-217e5599a177')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (167, 42, N'1', CAST(N'2024-07-28T06:35:27.523' AS DateTime), 10, N'c6cdf903-1863-4eac-9fe4-23b07ea4ccc3')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (168, 42, N'1', CAST(N'2024-07-28T06:40:40.143' AS DateTime), 10, N'32b9296e-02c7-414b-b3bb-02a60759edbd')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (169, 2109, N'1', CAST(N'2024-07-28T09:58:46.173' AS DateTime), 9, N'8338be95-38ea-45eb-8509-cdcb5ed03897')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (174, 2109, N'4', CAST(N'2024-07-28T10:10:34.770' AS DateTime), 9, N'8295cbbc-8469-4303-b473-7a9440e1a7e7')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (175, 42, N'1', CAST(N'2024-07-28T10:13:22.253' AS DateTime), 10, N'9139795a-2603-4079-a0f4-d51d46199ae2')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (176, 42, N'1', CAST(N'2024-07-28T10:15:03.583' AS DateTime), 10, N'e734a7a1-507f-430b-a76a-c7914a149b29')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (178, 2109, N'4', CAST(N'2024-07-28T10:29:30.407' AS DateTime), 9, N'e6ac1133-091f-4418-b379-231e01f4bcf7')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (179, 2110, N'2', CAST(N'2024-07-28T11:17:18.393' AS DateTime), 9, N'8c84d85b-56a1-4e87-9413-d01881c6d5b3')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (181, 42, N'1', CAST(N'2024-07-28T11:23:26.857' AS DateTime), 10, N'a87d8d2b-cf2c-4703-9a41-47823dbc6d9f')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (1132, 41, N'1', CAST(N'2024-07-31T15:46:51.873' AS DateTime), 8, N'4d27d2c3-4eb2-47de-8ae5-83c9d53b6517')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2132, 41, N'4', CAST(N'2024-08-05T20:45:39.430' AS DateTime), 8, N'297b5543-c5b9-490d-a345-bf32316a56bf')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2133, 41, N'4', CAST(N'2024-08-05T20:46:20.950' AS DateTime), 8, N'8f893e06-7b0d-4f47-be08-239c2bc96ad2')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2134, 41, N'4', CAST(N'2024-08-05T20:46:31.253' AS DateTime), 10, N'04a1f3ff-1310-4d32-b9d3-d65436304b9c')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2135, 41, N'3', CAST(N'2024-08-05T20:47:04.567' AS DateTime), 8, N'40e1e45e-1b1b-4a2a-ae0e-267df09b5ce1')
INSERT [dbo].[Schedules] ([id], [mentor_id], [status], [create_time], [month], [sessionId]) VALUES (2136, 41, N'4', CAST(N'2024-08-05T20:47:11.833' AS DateTime), 8, N'7d4815f8-6655-4da1-aaec-b842b2695e93')
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (6, N'C#', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPvJBvVedFjpONzC1ZOR-YSWauBp9ZKK6ydA&s', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (8, N'.NET', N'https://i.ytimg.com/vi/AhAxLiGC7Pc/maxresdefault.jpg', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (21, N'Angular', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwUm_-KXte5eYQ7O-SMzVZBUk6NvOtcco8dA&s', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (22, N'HTML-CSS', N'https://ultimatecourses.com/assets/share/courses/html-css-367da365548eefccdac7403c6031670a76274d60b76a934b35bb0979548f1581.png', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (23, N'ReactJS', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQlsGXyQnrK4krmkfXwm1NhbvAQRAvQDW-dw&s', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (25, N'Python', N'https://www.cdmi.in/courses@2x/python-training-institute.webp', 1)
INSERT [dbo].[Skill] ([id], [name], [image], [status]) VALUES (1011, N'Java', N'https://www.tekksolglobal.com/wp-content/uploads/2024/05/Core-Java-Pro.jpg', 1)
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1419, 4, 3, 3, CAST(N'2024-05-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1423, 3, 6, 3, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1424, 3, 7, 3, CAST(N'2024-05-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1425, 2, 1, 3, CAST(N'2024-05-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1426, 1, 2, 3, CAST(N'2024-05-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1427, 3, 2, 3, CAST(N'2024-05-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1428, 4, 3, 3, CAST(N'2024-05-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1429, 1, 4, 3, CAST(N'2024-05-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1430, 5, 4, 3, CAST(N'2024-05-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1431, 3, 5, 3, CAST(N'2024-05-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1432, 3, 6, 3, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1433, 3, 7, 3, CAST(N'2024-05-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1434, 2, 1, 3, CAST(N'2024-05-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1435, 1, 2, 3, CAST(N'2024-05-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1436, 3, 2, 3, CAST(N'2024-05-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1437, 4, 3, 3, CAST(N'2024-05-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1438, 1, 4, 3, CAST(N'2024-05-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1439, 5, 4, 3, CAST(N'2024-05-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1440, 3, 5, 3, CAST(N'2024-05-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1441, 3, 6, 3, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1442, 3, 7, 3, CAST(N'2024-05-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1443, 2, 1, 3, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1444, 1, 2, 3, CAST(N'2024-05-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1445, 3, 2, 3, CAST(N'2024-05-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1446, 4, 3, 3, CAST(N'2024-05-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1447, 1, 4, 3, CAST(N'2024-05-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1448, 5, 4, 3, CAST(N'2024-05-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1449, 3, 5, 3, CAST(N'2024-05-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1450, 3, 6, 3, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1451, 3, 7, 3, CAST(N'2024-05-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1452, 2, 1, 3, CAST(N'2024-05-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1453, 1, 2, 3, CAST(N'2024-05-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1454, 3, 2, 3, CAST(N'2024-05-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1455, 4, 3, 3, CAST(N'2024-05-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1456, 1, 4, 3, CAST(N'2024-05-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1457, 5, 4, 3, CAST(N'2024-05-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1458, 3, 5, 3, CAST(N'2024-05-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1459, 2, 7, 4, CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1460, 3, 7, 4, CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1461, 1, 1, 4, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1462, 3, 1, 4, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1463, 2, 2, 4, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1464, 5, 2, 4, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1465, 1, 3, 4, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1466, 3, 3, 4, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1467, 5, 3, 4, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1468, 1, 4, 4, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1469, 3, 4, 4, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1470, 5, 4, 4, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1471, 1, 5, 4, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1472, 3, 5, 4, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1473, 5, 5, 4, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1474, 3, 6, 4, CAST(N'2024-09-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1475, 5, 6, 4, CAST(N'2024-09-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1476, 2, 7, 4, CAST(N'2024-09-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1477, 3, 7, 4, CAST(N'2024-09-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1478, 1, 1, 4, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1479, 3, 1, 4, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1480, 2, 2, 4, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1481, 5, 2, 4, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1482, 1, 3, 4, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1483, 3, 3, 4, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1484, 5, 3, 4, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1485, 1, 4, 4, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1486, 3, 4, 4, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1487, 5, 4, 4, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1488, 1, 5, 4, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1489, 3, 5, 4, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1490, 5, 5, 4, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1491, 3, 6, 4, CAST(N'2024-09-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1492, 5, 6, 4, CAST(N'2024-09-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1493, 2, 7, 4, CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1494, 3, 7, 4, CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1495, 1, 1, 4, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1496, 3, 1, 4, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1497, 2, 2, 4, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1498, 5, 2, 4, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1499, 1, 3, 4, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1500, 3, 3, 4, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1501, 5, 3, 4, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1502, 1, 4, 4, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1503, 3, 4, 4, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1504, 5, 4, 4, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1505, 1, 5, 4, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1506, 3, 5, 4, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1507, 5, 5, 4, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1508, 3, 6, 4, CAST(N'2024-09-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1509, 5, 6, 4, CAST(N'2024-09-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1510, 2, 7, 4, CAST(N'2024-09-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1511, 3, 7, 4, CAST(N'2024-09-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1512, 1, 1, 4, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1513, 3, 1, 4, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1514, 2, 2, 4, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1515, 5, 2, 4, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1516, 1, 3, 4, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1517, 3, 3, 4, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1518, 5, 3, 4, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1519, 1, 4, 4, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1520, 3, 4, 4, CAST(N'2024-09-26' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1521, 5, 4, 4, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1522, 1, 5, 4, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1523, 3, 5, 4, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1524, 5, 5, 4, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1525, 3, 6, 4, CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1526, 5, 6, 4, CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1527, 2, 7, 4, CAST(N'2024-09-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1528, 3, 7, 4, CAST(N'2024-09-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1529, 1, 1, 4, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1530, 3, 1, 4, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1531, 3, 6, 5, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1532, 4, 6, 5, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1533, 5, 6, 5, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1534, 1, 1, 5, CAST(N'2024-05-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1535, 3, 1, 5, CAST(N'2024-05-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1536, 3, 6, 5, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1537, 4, 6, 5, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1538, 5, 6, 5, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1539, 1, 1, 5, CAST(N'2024-05-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1540, 3, 1, 5, CAST(N'2024-05-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1541, 3, 6, 5, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1542, 4, 6, 5, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1543, 5, 6, 5, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1544, 1, 1, 5, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1545, 3, 1, 5, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1546, 3, 6, 5, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1547, 4, 6, 5, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1548, 5, 6, 5, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1549, 1, 1, 5, CAST(N'2024-05-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1550, 3, 1, 5, CAST(N'2024-05-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1551, 4, 7, 6, CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1552, 1, 1, 6, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1553, 3, 1, 6, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1554, 2, 2, 6, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1555, 5, 2, 6, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1556, 2, 3, 6, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1557, 4, 3, 6, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1558, 5, 4, 6, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1559, 1, 5, 6, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1560, 4, 6, 6, CAST(N'2024-09-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1561, 4, 7, 6, CAST(N'2024-09-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1562, 1, 1, 6, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1563, 3, 1, 6, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1564, 2, 2, 6, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1565, 5, 2, 6, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1566, 2, 3, 6, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1567, 4, 3, 6, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1568, 5, 4, 6, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1569, 1, 5, 6, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1570, 4, 6, 6, CAST(N'2024-09-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1571, 4, 7, 6, CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1572, 1, 1, 6, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1573, 3, 1, 6, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1574, 2, 2, 6, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1575, 5, 2, 6, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1576, 2, 3, 6, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1577, 4, 3, 6, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1578, 5, 4, 6, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1579, 1, 5, 6, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1580, 4, 6, 6, CAST(N'2024-09-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1581, 4, 7, 6, CAST(N'2024-09-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1582, 1, 1, 6, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1583, 3, 1, 6, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1584, 2, 2, 6, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1585, 5, 2, 6, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1586, 2, 3, 6, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1587, 4, 3, 6, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1588, 5, 4, 6, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1589, 1, 5, 6, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1590, 4, 6, 6, CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1591, 4, 7, 6, CAST(N'2024-09-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1592, 1, 1, 6, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1593, 3, 1, 6, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1594, 2, 7, 7, CAST(N'2024-12-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1595, 1, 1, 7, CAST(N'2024-12-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1596, 3, 1, 7, CAST(N'2024-12-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1597, 5, 1, 7, CAST(N'2024-12-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1598, 2, 2, 7, CAST(N'2024-12-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1599, 4, 2, 7, CAST(N'2024-12-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1600, 1, 3, 7, CAST(N'2024-12-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1601, 5, 3, 7, CAST(N'2024-12-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1602, 2, 4, 7, CAST(N'2024-12-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1603, 2, 5, 7, CAST(N'2024-12-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1604, 2, 6, 7, CAST(N'2024-12-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1605, 2, 7, 7, CAST(N'2024-12-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1606, 1, 1, 7, CAST(N'2024-12-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1607, 3, 1, 7, CAST(N'2024-12-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1608, 5, 1, 7, CAST(N'2024-12-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1609, 2, 2, 7, CAST(N'2024-12-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1610, 4, 2, 7, CAST(N'2024-12-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1611, 1, 3, 7, CAST(N'2024-12-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1612, 5, 3, 7, CAST(N'2024-12-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1613, 2, 4, 7, CAST(N'2024-12-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1614, 2, 5, 7, CAST(N'2024-12-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1615, 2, 6, 7, CAST(N'2024-12-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1616, 2, 7, 7, CAST(N'2024-12-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1617, 1, 1, 7, CAST(N'2024-12-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1618, 3, 1, 7, CAST(N'2024-12-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1619, 5, 1, 7, CAST(N'2024-12-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1620, 2, 2, 7, CAST(N'2024-12-17' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1621, 4, 2, 7, CAST(N'2024-12-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1622, 1, 3, 7, CAST(N'2024-12-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1623, 5, 3, 7, CAST(N'2024-12-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1624, 2, 4, 7, CAST(N'2024-12-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1625, 2, 5, 7, CAST(N'2024-12-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1626, 2, 6, 7, CAST(N'2024-12-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1627, 2, 7, 7, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1628, 1, 1, 7, CAST(N'2024-12-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1629, 3, 1, 7, CAST(N'2024-12-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1630, 5, 1, 7, CAST(N'2024-12-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1631, 2, 2, 7, CAST(N'2024-12-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1632, 4, 2, 7, CAST(N'2024-12-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1633, 1, 3, 7, CAST(N'2024-12-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1634, 5, 3, 7, CAST(N'2024-12-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1635, 2, 4, 7, CAST(N'2024-12-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1636, 2, 5, 7, CAST(N'2024-12-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1637, 2, 6, 7, CAST(N'2024-12-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1638, 2, 7, 7, CAST(N'2024-12-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1639, 1, 1, 7, CAST(N'2024-12-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1640, 3, 1, 7, CAST(N'2024-12-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1641, 5, 1, 7, CAST(N'2024-12-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1642, 2, 2, 7, CAST(N'2024-12-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1643, 4, 2, 7, CAST(N'2024-12-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1644, 1, 1, 8, CAST(N'2024-04-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1645, 3, 1, 8, CAST(N'2024-04-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1646, 2, 2, 8, CAST(N'2024-04-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1647, 5, 2, 8, CAST(N'2024-04-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1648, 4, 3, 8, CAST(N'2024-04-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1649, 4, 4, 8, CAST(N'2024-04-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1650, 3, 5, 8, CAST(N'2024-04-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1651, 1, 6, 8, CAST(N'2024-04-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1652, 4, 7, 8, CAST(N'2024-04-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1653, 1, 1, 8, CAST(N'2024-04-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1654, 3, 1, 8, CAST(N'2024-04-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1655, 2, 2, 8, CAST(N'2024-04-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1656, 5, 2, 8, CAST(N'2024-04-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1657, 4, 3, 8, CAST(N'2024-04-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1658, 4, 4, 8, CAST(N'2024-04-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1659, 3, 5, 8, CAST(N'2024-04-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1660, 1, 6, 8, CAST(N'2024-04-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1661, 4, 7, 8, CAST(N'2024-04-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1662, 1, 1, 8, CAST(N'2024-04-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1663, 3, 1, 8, CAST(N'2024-04-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1664, 2, 2, 8, CAST(N'2024-04-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1665, 5, 2, 8, CAST(N'2024-04-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1666, 4, 3, 8, CAST(N'2024-04-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1667, 4, 4, 8, CAST(N'2024-04-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1668, 3, 5, 8, CAST(N'2024-04-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1669, 1, 6, 8, CAST(N'2024-04-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1670, 4, 7, 8, CAST(N'2024-04-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1671, 1, 1, 8, CAST(N'2024-04-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1672, 3, 1, 8, CAST(N'2024-04-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1673, 2, 2, 8, CAST(N'2024-04-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1674, 5, 2, 8, CAST(N'2024-04-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1675, 4, 3, 8, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1676, 4, 4, 8, CAST(N'2024-04-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1677, 3, 5, 8, CAST(N'2024-04-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1678, 1, 6, 8, CAST(N'2024-04-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1679, 4, 7, 8, CAST(N'2024-04-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1680, 1, 1, 8, CAST(N'2024-04-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1681, 3, 1, 8, CAST(N'2024-04-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1682, 2, 2, 8, CAST(N'2024-04-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1683, 5, 2, 8, CAST(N'2024-04-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1684, 3, 5, 9, CAST(N'2024-03-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1685, 1, 6, 9, CAST(N'2024-03-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1686, 4, 7, 9, CAST(N'2024-03-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1687, 1, 1, 9, CAST(N'2024-03-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1688, 3, 1, 9, CAST(N'2024-03-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1689, 1, 2, 9, CAST(N'2024-03-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1690, 2, 2, 9, CAST(N'2024-03-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1691, 5, 2, 9, CAST(N'2024-03-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1692, 1, 3, 9, CAST(N'2024-03-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1693, 4, 3, 9, CAST(N'2024-03-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1694, 1, 4, 9, CAST(N'2024-03-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1695, 4, 4, 9, CAST(N'2024-03-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1696, 3, 5, 9, CAST(N'2024-03-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1697, 1, 6, 9, CAST(N'2024-03-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1698, 4, 7, 9, CAST(N'2024-03-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1699, 1, 1, 9, CAST(N'2024-03-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1700, 3, 1, 9, CAST(N'2024-03-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1701, 1, 2, 9, CAST(N'2024-03-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1702, 2, 2, 9, CAST(N'2024-03-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1703, 5, 2, 9, CAST(N'2024-03-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1704, 1, 3, 9, CAST(N'2024-03-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1705, 4, 3, 9, CAST(N'2024-03-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1706, 1, 4, 9, CAST(N'2024-03-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1707, 4, 4, 9, CAST(N'2024-03-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1708, 3, 5, 9, CAST(N'2024-03-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1709, 1, 6, 9, CAST(N'2024-03-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1710, 4, 7, 9, CAST(N'2024-03-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1711, 1, 1, 9, CAST(N'2024-03-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1712, 3, 1, 9, CAST(N'2024-03-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1713, 1, 2, 9, CAST(N'2024-03-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1714, 2, 2, 9, CAST(N'2024-03-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1715, 5, 2, 9, CAST(N'2024-03-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1716, 1, 3, 9, CAST(N'2024-03-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1717, 4, 3, 9, CAST(N'2024-03-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1718, 1, 4, 9, CAST(N'2024-03-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1719, 4, 4, 9, CAST(N'2024-03-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1720, 3, 5, 9, CAST(N'2024-03-22' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1721, 1, 6, 9, CAST(N'2024-03-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1722, 4, 7, 9, CAST(N'2024-03-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1723, 1, 1, 9, CAST(N'2024-03-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1724, 3, 1, 9, CAST(N'2024-03-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1725, 1, 2, 9, CAST(N'2024-03-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1726, 2, 2, 9, CAST(N'2024-03-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1727, 5, 2, 9, CAST(N'2024-03-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1728, 1, 3, 9, CAST(N'2024-03-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1729, 4, 3, 9, CAST(N'2024-03-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1730, 1, 4, 9, CAST(N'2024-03-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1731, 4, 4, 9, CAST(N'2024-03-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1732, 3, 5, 9, CAST(N'2024-03-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1733, 1, 6, 9, CAST(N'2024-03-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1734, 4, 7, 9, CAST(N'2024-03-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1735, 3, 7, 10, CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1736, 5, 7, 10, CAST(N'2024-09-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1737, 1, 1, 10, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1738, 3, 1, 10, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1739, 2, 2, 10, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1740, 5, 2, 10, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1741, 1, 3, 10, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1742, 4, 3, 10, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1743, 2, 4, 10, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1744, 4, 4, 10, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1745, 5, 4, 10, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1746, 1, 5, 10, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1747, 3, 5, 10, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1748, 5, 5, 10, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1749, 1, 6, 10, CAST(N'2024-09-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1750, 4, 6, 10, CAST(N'2024-09-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1751, 3, 7, 10, CAST(N'2024-09-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1752, 5, 7, 10, CAST(N'2024-09-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1753, 1, 1, 10, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1754, 3, 1, 10, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1755, 2, 2, 10, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1756, 5, 2, 10, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1757, 1, 3, 10, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1758, 4, 3, 10, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1759, 2, 4, 10, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1760, 4, 4, 10, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1761, 5, 4, 10, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1762, 1, 5, 10, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1763, 3, 5, 10, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1764, 5, 5, 10, CAST(N'2024-09-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1765, 1, 6, 10, CAST(N'2024-09-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1766, 4, 6, 10, CAST(N'2024-09-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1767, 3, 7, 10, CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1768, 5, 7, 10, CAST(N'2024-09-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1769, 1, 1, 10, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1770, 3, 1, 10, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1771, 2, 2, 10, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1772, 5, 2, 10, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1773, 1, 3, 10, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1774, 4, 3, 10, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1775, 2, 4, 10, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1776, 4, 4, 10, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1777, 5, 4, 10, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1778, 1, 5, 10, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1779, 3, 5, 10, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1780, 5, 5, 10, CAST(N'2024-09-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1781, 1, 6, 10, CAST(N'2024-09-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1782, 4, 6, 10, CAST(N'2024-09-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1783, 3, 7, 10, CAST(N'2024-09-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1784, 5, 7, 10, CAST(N'2024-09-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1785, 1, 1, 10, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1786, 3, 1, 10, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1787, 2, 2, 10, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1788, 5, 2, 10, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1789, 1, 3, 10, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1790, 4, 3, 10, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1791, 2, 4, 10, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1792, 4, 4, 10, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1793, 5, 4, 10, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1794, 1, 5, 10, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1795, 3, 5, 10, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1796, 5, 5, 10, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1797, 1, 6, 10, CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1798, 4, 6, 10, CAST(N'2024-09-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1799, 3, 7, 10, CAST(N'2024-09-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1800, 5, 7, 10, CAST(N'2024-09-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1801, 1, 1, 10, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (1802, 3, 1, 10, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2092, 4, 1, 11, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2093, 5, 1, 11, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2095, 1, 1, 11, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2096, 3, 1, 11, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2097, 5, 1, 11, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2098, 1, 3, 13, CAST(N'2024-05-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2099, 3, 4, 13, CAST(N'2024-05-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2100, 2, 6, 13, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2101, 2, 1, 13, CAST(N'2024-05-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2102, 3, 2, 13, CAST(N'2024-05-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2103, 2, 3, 13, CAST(N'2024-05-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2104, 5, 4, 13, CAST(N'2024-05-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2105, 3, 6, 13, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2106, 3, 7, 13, CAST(N'2024-05-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2107, 2, 1, 13, CAST(N'2024-05-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2108, 3, 2, 13, CAST(N'2024-05-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2109, 5, 4, 13, CAST(N'2024-05-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2110, 3, 5, 13, CAST(N'2024-05-17' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2111, 3, 6, 13, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2112, 3, 7, 13, CAST(N'2024-05-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2113, 2, 1, 13, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2114, 5, 2, 13, CAST(N'2024-05-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2115, 4, 3, 13, CAST(N'2024-05-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2116, 1, 4, 13, CAST(N'2024-05-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2117, 2, 6, 13, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2118, 1, 7, 13, CAST(N'2024-05-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2119, 2, 1, 13, CAST(N'2024-05-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2120, 3, 2, 13, CAST(N'2024-05-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2121, 4, 3, 13, CAST(N'2024-05-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2122, 3, 5, 13, CAST(N'2024-05-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2123, 1, 3, 2, CAST(N'2024-05-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2124, 3, 4, 2, CAST(N'2024-05-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2125, 2, 6, 2, CAST(N'2024-05-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2126, 2, 1, 2, CAST(N'2024-05-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2127, 3, 2, 2, CAST(N'2024-05-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2128, 2, 3, 2, CAST(N'2024-05-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2129, 5, 4, 2, CAST(N'2024-05-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2130, 3, 6, 2, CAST(N'2024-05-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2131, 3, 7, 2, CAST(N'2024-05-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2132, 2, 1, 2, CAST(N'2024-05-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2133, 3, 2, 2, CAST(N'2024-05-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2134, 5, 4, 2, CAST(N'2024-05-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2135, 3, 5, 2, CAST(N'2024-05-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2136, 3, 6, 2, CAST(N'2024-05-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2137, 3, 7, 2, CAST(N'2024-05-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2138, 2, 1, 2, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2139, 5, 2, 2, CAST(N'2024-05-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2140, 4, 3, 2, CAST(N'2024-05-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2141, 1, 4, 2, CAST(N'2024-05-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2142, 2, 6, 2, CAST(N'2024-05-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2143, 1, 7, 2, CAST(N'2024-05-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2144, 2, 1, 2, CAST(N'2024-05-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2145, 3, 2, 2, CAST(N'2024-05-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2146, 4, 3, 2, CAST(N'2024-05-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2147, 3, 5, 2, CAST(N'2024-05-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2148, 3, 6, 15, CAST(N'2024-06-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2149, 4, 7, 15, CAST(N'2024-06-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2150, 1, 1, 15, CAST(N'2024-06-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2151, 2, 2, 15, CAST(N'2024-06-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2152, 3, 3, 15, CAST(N'2024-06-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2153, 2, 4, 15, CAST(N'2024-06-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2154, 3, 6, 15, CAST(N'2024-06-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2155, 4, 7, 15, CAST(N'2024-06-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2156, 1, 1, 15, CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2157, 2, 2, 15, CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2158, 3, 3, 15, CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2159, 2, 4, 15, CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2160, 3, 6, 15, CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2161, 4, 7, 15, CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2162, 1, 1, 15, CAST(N'2024-06-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2163, 2, 2, 15, CAST(N'2024-06-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2164, 3, 3, 15, CAST(N'2024-06-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2165, 2, 4, 15, CAST(N'2024-06-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2166, 3, 6, 15, CAST(N'2024-06-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2167, 4, 7, 15, CAST(N'2024-06-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2168, 1, 1, 15, CAST(N'2024-06-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2169, 2, 2, 15, CAST(N'2024-06-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2170, 3, 3, 15, CAST(N'2024-06-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2171, 2, 4, 15, CAST(N'2024-06-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2172, 3, 6, 15, CAST(N'2024-06-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2173, 4, 7, 15, CAST(N'2024-06-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2174, 2, 4, 16, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2175, 1, 1, 16, CAST(N'2024-08-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2176, 2, 2, 16, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2177, 4, 3, 16, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2178, 2, 4, 16, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2179, 1, 1, 16, CAST(N'2024-08-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2180, 2, 2, 16, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2181, 4, 3, 16, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2182, 2, 4, 16, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2183, 1, 1, 16, CAST(N'2024-08-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2184, 2, 2, 16, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2185, 4, 3, 16, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2186, 2, 4, 16, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2187, 1, 1, 16, CAST(N'2024-08-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2188, 2, 2, 16, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2189, 4, 3, 16, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2190, 2, 4, 16, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2191, 2, 4, 17, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2192, 1, 1, 17, CAST(N'2024-08-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2193, 2, 2, 17, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2194, 4, 3, 17, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2195, 2, 4, 17, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2196, 1, 1, 17, CAST(N'2024-08-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2197, 2, 2, 17, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2198, 4, 3, 17, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2199, 2, 4, 17, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2200, 1, 1, 17, CAST(N'2024-08-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2201, 2, 2, 17, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2202, 4, 3, 17, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2203, 2, 4, 17, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2204, 1, 1, 17, CAST(N'2024-08-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2205, 2, 2, 17, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2206, 4, 3, 17, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2207, 2, 4, 17, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2208, 2, 4, 20, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2209, 3, 5, 20, CAST(N'2024-08-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2210, 2, 2, 20, CAST(N'2024-08-06' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2211, 3, 3, 20, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2212, 2, 4, 20, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2213, 3, 5, 20, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2214, 2, 2, 20, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2215, 3, 3, 20, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2216, 2, 4, 20, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2217, 3, 5, 20, CAST(N'2024-08-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2218, 2, 2, 20, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2219, 3, 3, 20, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2220, 2, 4, 20, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2221, 3, 5, 20, CAST(N'2024-08-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2222, 2, 2, 20, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2223, 3, 3, 20, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2224, 2, 4, 20, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2225, 3, 5, 20, CAST(N'2024-08-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2299, 3, 1, 50, CAST(N'2024-08-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2300, 1, 2, 50, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2301, 3, 3, 50, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2302, 1, 4, 50, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2303, 1, 5, 50, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2304, 2, 5, 50, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2305, 1, 4, 50, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2306, 2, 5, 50, CAST(N'2024-08-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2307, 3, 1, 50, CAST(N'2024-08-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2308, 1, 2, 50, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2309, 3, 3, 50, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2310, 1, 4, 50, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2311, 2, 5, 50, CAST(N'2024-08-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2312, 3, 1, 50, CAST(N'2024-08-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2313, 1, 2, 50, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2314, 3, 3, 50, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2315, 1, 4, 50, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2316, 2, 5, 50, CAST(N'2024-08-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2317, 3, 1, 50, CAST(N'2024-08-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2318, 1, 2, 50, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2319, 3, 3, 50, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2320, 1, 4, 50, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2321, 2, 5, 50, CAST(N'2024-08-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2345, 3, 4, 95, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2346, 2, 2, 95, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2347, 1, 3, 95, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2348, 3, 3, 95, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2349, 3, 4, 95, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2350, 2, 2, 95, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2351, 1, 3, 95, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2352, 3, 3, 95, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2353, 3, 4, 95, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2354, 2, 2, 95, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2355, 1, 3, 95, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2356, 3, 3, 95, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2357, 3, 4, 95, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2358, 2, 2, 95, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2359, 1, 3, 95, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2360, 3, 3, 95, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2361, 3, 4, 95, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2397, 2, 2, 98, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2398, 1, 3, 98, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2399, 3, 3, 98, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2400, 2, 4, 98, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2401, 2, 5, 98, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2402, 2, 4, 98, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2403, 2, 2, 98, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2404, 1, 3, 98, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2405, 3, 3, 98, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2406, 2, 4, 98, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2407, 2, 2, 98, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2408, 1, 3, 98, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2409, 3, 3, 98, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2410, 2, 4, 98, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2411, 2, 2, 98, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2412, 1, 3, 98, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2413, 3, 3, 98, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2414, 2, 4, 98, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2423, 1, 2, 141, CAST(N'2024-07-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2424, 3, 2, 141, CAST(N'2024-07-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2425, 2, 3, 141, CAST(N'2024-07-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2482, 2, 1, 141, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2483, 1, 2, 141, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2484, 3, 2, 141, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2485, 5, 2, 141, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2486, 2, 3, 141, CAST(N'2024-07-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2487, 2, 4, 141, CAST(N'2024-07-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2488, 2, 2, 141, CAST(N'2024-07-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2489, 1, 3, 141, CAST(N'2024-07-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2490, 3, 3, 141, CAST(N'2024-07-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2491, 2, 4, 141, CAST(N'2024-07-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2492, 2, 2, 141, CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2493, 1, 3, 141, CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2494, 3, 3, 141, CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2495, 2, 4, 141, CAST(N'2024-07-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2496, 2, 1, 142, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2497, 1, 2, 142, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2498, 3, 2, 142, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2499, 5, 2, 142, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2500, 2, 3, 142, CAST(N'2024-07-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2501, 2, 4, 142, CAST(N'2024-07-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2502, 2, 2, 142, CAST(N'2024-07-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2503, 1, 3, 142, CAST(N'2024-07-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2504, 3, 3, 142, CAST(N'2024-07-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2505, 2, 4, 142, CAST(N'2024-07-11' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2512, 2, 1, 143, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2513, 2, 1, 143, CAST(N'2024-07-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2514, 1, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2515, 1, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2516, 3, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2517, 5, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2518, 3, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2519, 5, 2, 143, CAST(N'2024-07-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2521, 2, 3, 143, CAST(N'2024-07-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2523, 2, 4, 143, CAST(N'2024-07-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2683, 1, 2, 12, CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2684, 3, 2, 12, CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2685, 2, 3, 12, CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2686, 1, 4, 12, CAST(N'2024-07-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2687, 2, 4, 12, CAST(N'2024-07-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2688, 2, 2, 12, CAST(N'2024-07-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2689, 1, 3, 12, CAST(N'2024-07-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2690, 3, 3, 12, CAST(N'2024-07-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2829, 2, 1, 153, CAST(N'2024-08-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2830, 1, 2, 153, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2831, 3, 2, 153, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2832, 1, 4, 153, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2833, 1, 1, 153, CAST(N'2024-08-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2834, 1, 2, 153, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2835, 1, 3, 153, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2836, 1, 4, 153, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2837, 1, 5, 153, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2838, 1, 1, 153, CAST(N'2024-08-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2839, 1, 2, 153, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2840, 1, 3, 153, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2841, 1, 4, 153, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2842, 1, 5, 153, CAST(N'2024-08-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2843, 1, 1, 153, CAST(N'2024-08-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2844, 1, 2, 153, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2845, 1, 3, 153, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2846, 1, 4, 153, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2922, 2, 2, 161, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2923, 1, 3, 161, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2924, 3, 3, 161, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2925, 1, 4, 161, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2926, 2, 4, 161, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2927, 2, 2, 161, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2928, 1, 3, 161, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2929, 3, 3, 161, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2930, 1, 4, 161, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2931, 2, 4, 161, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2932, 2, 2, 161, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2933, 1, 3, 161, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2934, 3, 3, 161, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2935, 1, 4, 161, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2936, 1, 5, 161, CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2937, 1, 2, 165, CAST(N'2024-10-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2938, 3, 2, 165, CAST(N'2024-10-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2939, 2, 3, 165, CAST(N'2024-10-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2940, 2, 4, 165, CAST(N'2024-10-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2941, 2, 1, 165, CAST(N'2024-10-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2942, 1, 2, 165, CAST(N'2024-10-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2943, 3, 2, 165, CAST(N'2024-10-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2944, 2, 3, 165, CAST(N'2024-10-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2945, 2, 4, 165, CAST(N'2024-10-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2946, 2, 1, 165, CAST(N'2024-10-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2947, 1, 2, 165, CAST(N'2024-10-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2948, 3, 2, 165, CAST(N'2024-10-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2949, 2, 3, 165, CAST(N'2024-10-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2950, 2, 4, 165, CAST(N'2024-10-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2951, 2, 1, 165, CAST(N'2024-10-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2952, 1, 2, 165, CAST(N'2024-10-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2953, 3, 2, 165, CAST(N'2024-10-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2954, 2, 3, 165, CAST(N'2024-10-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2955, 2, 4, 165, CAST(N'2024-10-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2956, 2, 1, 165, CAST(N'2024-10-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2957, 1, 2, 165, CAST(N'2024-10-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2958, 3, 2, 165, CAST(N'2024-10-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2959, 2, 3, 165, CAST(N'2024-10-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (2960, 2, 4, 165, CAST(N'2024-10-31' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3143, 1, 1, 169, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3144, 1, 2, 169, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3145, 1, 3, 169, CAST(N'2024-09-18' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3146, 1, 4, 169, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3147, 2, 1, 169, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3148, 1, 2, 169, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3149, 3, 2, 169, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3150, 3, 3, 169, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3151, 2, 4, 169, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3152, 2, 1, 169, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3196, 2, 1, 179, CAST(N'2024-09-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3197, 1, 2, 179, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3198, 3, 2, 179, CAST(N'2024-09-03' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3199, 3, 3, 179, CAST(N'2024-09-04' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3200, 2, 4, 179, CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3201, 1, 5, 179, CAST(N'2024-09-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3202, 2, 1, 179, CAST(N'2024-09-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3203, 1, 2, 179, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3204, 3, 2, 179, CAST(N'2024-09-10' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3205, 3, 3, 179, CAST(N'2024-09-11' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3206, 2, 4, 179, CAST(N'2024-09-12' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3207, 2, 1, 179, CAST(N'2024-09-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3208, 1, 2, 179, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3209, 3, 2, 179, CAST(N'2024-09-17' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3210, 3, 3, 179, CAST(N'2024-09-18' AS Date), NULL)
GO
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3211, 2, 4, 179, CAST(N'2024-09-19' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3212, 2, 1, 179, CAST(N'2024-09-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3213, 1, 2, 179, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3214, 3, 2, 179, CAST(N'2024-09-24' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3215, 3, 3, 179, CAST(N'2024-09-25' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3216, 2, 4, 179, CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3217, 2, 1, 179, CAST(N'2024-09-30' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3415, 2, 4, 2135, CAST(N'2024-08-01' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3416, 2, 5, 2135, CAST(N'2024-08-02' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3417, 2, 2, 2135, CAST(N'2024-08-06' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3418, 1, 3, 2135, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3419, 3, 3, 2135, CAST(N'2024-08-07' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3420, 2, 4, 2135, CAST(N'2024-08-08' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3421, 2, 5, 2135, CAST(N'2024-08-09' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3422, 2, 2, 2135, CAST(N'2024-08-13' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3423, 1, 3, 2135, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3424, 3, 3, 2135, CAST(N'2024-08-14' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3425, 2, 4, 2135, CAST(N'2024-08-15' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3426, 2, 5, 2135, CAST(N'2024-08-16' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3427, 2, 2, 2135, CAST(N'2024-08-20' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3428, 1, 3, 2135, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3429, 3, 3, 2135, CAST(N'2024-08-21' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3430, 2, 4, 2135, CAST(N'2024-08-22' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3431, 2, 5, 2135, CAST(N'2024-08-23' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3432, 2, 2, 2135, CAST(N'2024-08-27' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3433, 1, 3, 2135, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3434, 3, 3, 2135, CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3435, 2, 4, 2135, CAST(N'2024-08-29' AS Date), NULL)
INSERT [dbo].[Slot] ([id], [slot], [dayOfWeek], [schedule_id], [teach_date], [isBooking]) VALUES (3436, 2, 5, 2135, CAST(N'2024-08-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot_Mentee] ON 

INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (3, 1, 2, 23, CAST(N'2024-07-15' AS Date), 8, 1)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (4, 1, 3, 23, CAST(N'2024-07-15' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (5, 1, 3, 23, CAST(N'2024-07-15' AS Date), 21, 1)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (6, 1, 3, 23, CAST(N'2024-07-15' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (877, 2, 2, 85, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (878, 1, 3, 85, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (879, 3, 3, 85, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (880, 1, 4, 85, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (881, 2, 2, 86, CAST(N'2024-08-06' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (882, 3, 3, 86, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (883, 2, 4, 86, CAST(N'2024-08-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (884, 2, 2, 87, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (885, 3, 3, 87, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (886, 2, 2, 88, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (887, 3, 3, 88, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (888, 2, 4, 88, CAST(N'2024-08-08' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (889, 2, 2, 89, CAST(N'2024-09-03' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (890, 1, 3, 89, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (891, 2, 2, 90, CAST(N'2024-09-10' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (892, 1, 3, 90, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (893, 3, 3, 90, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (894, 2, 2, 91, CAST(N'2024-09-03' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (895, 1, 3, 91, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (896, 3, 3, 91, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (897, 1, 4, 91, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (898, 2, 2, 92, CAST(N'2024-09-03' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (899, 1, 3, 92, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (900, 3, 3, 92, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (901, 1, 4, 92, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (902, 3, 4, 92, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (903, 2, 2, 93, CAST(N'2024-09-03' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (904, 1, 3, 93, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (905, 3, 3, 93, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (906, 1, 4, 93, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (907, 3, 4, 93, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (908, 2, 2, 93, CAST(N'2024-09-10' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (909, 1, 3, 93, CAST(N'2024-09-11' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (910, 3, 3, 93, CAST(N'2024-09-11' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (911, 1, 4, 93, CAST(N'2024-09-12' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (912, 3, 4, 93, CAST(N'2024-09-12' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (913, 2, 2, 93, CAST(N'2024-09-17' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (914, 1, 3, 93, CAST(N'2024-09-18' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (915, 3, 3, 93, CAST(N'2024-09-18' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (916, 1, 4, 93, CAST(N'2024-09-19' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (917, 3, 4, 93, CAST(N'2024-09-19' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (918, 2, 2, 93, CAST(N'2024-09-24' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (919, 1, 3, 93, CAST(N'2024-09-25' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (920, 3, 3, 93, CAST(N'2024-09-25' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (921, 1, 4, 93, CAST(N'2024-09-26' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (922, 3, 4, 93, CAST(N'2024-09-26' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (923, 2, 2, 97, CAST(N'2024-09-17' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (924, 1, 3, 97, CAST(N'2024-09-18' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (925, 3, 3, 97, CAST(N'2024-09-18' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (926, 1, 4, 97, CAST(N'2024-09-19' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (927, 2, 2, 97, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (928, 1, 3, 97, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (929, 3, 3, 97, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (930, 1, 4, 97, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (931, 2, 2, 97, CAST(N'2024-09-10' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (932, 1, 3, 97, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (933, 3, 3, 97, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (934, 1, 4, 97, CAST(N'2024-09-12' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (935, 2, 2, 97, CAST(N'2024-09-24' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (936, 1, 3, 97, CAST(N'2024-09-25' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (937, 3, 3, 97, CAST(N'2024-09-25' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (938, 1, 4, 97, CAST(N'2024-09-26' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (939, 2, 2, 100, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (940, 1, 3, 100, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (941, 3, 3, 100, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (942, 1, 4, 100, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (943, 2, 2, 100, CAST(N'2024-09-10' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (944, 1, 3, 100, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (945, 3, 3, 100, CAST(N'2024-09-11' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (946, 1, 4, 100, CAST(N'2024-09-12' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (947, 2, 2, 100, CAST(N'2024-09-17' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (948, 1, 3, 100, CAST(N'2024-09-18' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (949, 3, 3, 100, CAST(N'2024-09-18' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (950, 1, 4, 100, CAST(N'2024-09-19' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (951, 2, 2, 100, CAST(N'2024-09-24' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (952, 1, 3, 100, CAST(N'2024-09-25' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (953, 3, 3, 100, CAST(N'2024-09-25' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (954, 1, 4, 100, CAST(N'2024-09-26' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (955, 2, 2, 101, CAST(N'2024-08-06' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (956, 3, 3, 101, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (957, 2, 4, 101, CAST(N'2024-08-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (958, 1, 3, 102, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (959, 3, 3, 102, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (960, 3, 4, 102, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (961, 2, 2, 103, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (962, 1, 3, 103, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (963, 3, 3, 103, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (964, 3, 4, 107, CAST(N'2024-09-05' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (965, 5, 4, 107, CAST(N'2024-09-05' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (966, 5, 5, 107, CAST(N'2024-09-06' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (967, 1, 4, 108, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (968, 3, 4, 108, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (969, 5, 4, 108, CAST(N'2024-09-05' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (970, 2, 2, 109, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (971, 1, 3, 109, CAST(N'2024-09-04' AS Date), 8, 0)
GO
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (972, 3, 3, 109, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (973, 1, 4, 109, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (974, 2, 2, 110, CAST(N'2024-08-06' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (975, 3, 3, 110, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (976, 2, 4, 110, CAST(N'2024-08-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (980, 3, 3, 111, CAST(N'2024-08-14' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (981, 2, 4, 111, CAST(N'2024-08-15' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (982, 2, 4, 111, CAST(N'2024-08-01' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (983, 3, 3, 111, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (984, 2, 4, 111, CAST(N'2024-08-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (985, 3, 3, 111, CAST(N'2024-08-21' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (986, 2, 4, 111, CAST(N'2024-08-22' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (987, 3, 3, 111, CAST(N'2024-08-28' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (988, 2, 4, 111, CAST(N'2024-08-29' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (989, 2, 2, 112, CAST(N'2024-08-06' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (990, 3, 3, 112, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (991, 2, 4, 112, CAST(N'2024-08-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (992, 3, 5, 112, CAST(N'2024-08-09' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (993, 2, 2, 114, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (994, 1, 3, 114, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (995, 3, 3, 114, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (996, 2, 4, 114, CAST(N'2024-08-08' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (997, 2, 4, 114, CAST(N'2024-08-01' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (998, 2, 2, 114, CAST(N'2024-08-13' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (999, 1, 3, 114, CAST(N'2024-08-14' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1000, 3, 3, 114, CAST(N'2024-08-14' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1001, 2, 4, 114, CAST(N'2024-08-15' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1002, 2, 2, 114, CAST(N'2024-08-20' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1003, 1, 3, 114, CAST(N'2024-08-21' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1004, 3, 3, 114, CAST(N'2024-08-21' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1005, 2, 4, 114, CAST(N'2024-08-22' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1006, 2, 2, 114, CAST(N'2024-08-27' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1007, 1, 3, 114, CAST(N'2024-08-28' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1008, 3, 3, 114, CAST(N'2024-08-28' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1009, 2, 4, 114, CAST(N'2024-08-29' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1010, 2, 2, 116, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1011, 1, 3, 116, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1012, 3, 3, 116, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1013, 1, 4, 116, CAST(N'2024-09-05' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1014, 3, 3, 118, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1015, 2, 4, 118, CAST(N'2024-08-08' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1016, 3, 5, 118, CAST(N'2024-08-09' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1017, 2, 2, 120, CAST(N'2024-08-06' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1018, 3, 3, 120, CAST(N'2024-08-07' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1019, 2, 4, 120, CAST(N'2024-08-08' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1020, 2, 2, 122, CAST(N'2024-08-06' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1021, 1, 3, 122, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1022, 3, 3, 122, CAST(N'2024-08-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1023, 2, 2, 123, CAST(N'2024-09-03' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1024, 1, 3, 123, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1025, 3, 3, 123, CAST(N'2024-09-04' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1026, 2, 2, 125, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1027, 1, 3, 125, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1028, 2, 2, 127, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1029, 1, 3, 127, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1030, 3, 3, 127, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1031, 2, 2, 129, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1032, 1, 3, 129, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1033, 3, 3, 129, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1052, 2, 2, 129, CAST(N'2024-08-13' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1053, 1, 3, 129, CAST(N'2024-08-14' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1054, 3, 3, 129, CAST(N'2024-08-14' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1055, 2, 2, 129, CAST(N'2024-08-20' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1056, 1, 3, 129, CAST(N'2024-08-21' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1057, 3, 3, 129, CAST(N'2024-08-21' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1089, 2, 2, 131, CAST(N'2024-09-17' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1090, 3, 3, 131, CAST(N'2024-09-18' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1091, 2, 2, 131, CAST(N'2024-09-03' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1092, 3, 3, 131, CAST(N'2024-09-04' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1093, 2, 2, 131, CAST(N'2024-09-10' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1094, 3, 3, 131, CAST(N'2024-09-11' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1095, 2, 2, 131, CAST(N'2024-09-24' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1096, 3, 3, 131, CAST(N'2024-09-25' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1097, 2, 2, 132, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1098, 1, 3, 132, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1099, 3, 3, 132, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1103, 2, 1, 166, CAST(N'2024-10-28' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1104, 1, 2, 166, CAST(N'2024-10-29' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1105, 3, 2, 166, CAST(N'2024-10-29' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1106, 2, 3, 166, CAST(N'2024-10-30' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1107, 2, 1, 167, CAST(N'2024-10-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1108, 1, 2, 167, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1109, 3, 2, 167, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1110, 1, 2, 168, CAST(N'2024-10-01' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1111, 3, 2, 168, CAST(N'2024-10-01' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1112, 2, 3, 168, CAST(N'2024-10-02' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1113, 1, 2, 168, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1114, 3, 2, 168, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1115, 2, 3, 168, CAST(N'2024-10-09' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1125, 2, 1, 175, CAST(N'2024-10-07' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1126, 1, 2, 175, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1127, 3, 2, 175, CAST(N'2024-10-08' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1128, 1, 2, 175, CAST(N'2024-10-01' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1129, 3, 2, 175, CAST(N'2024-10-01' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1130, 2, 1, 175, CAST(N'2024-10-14' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1131, 1, 2, 175, CAST(N'2024-10-15' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1132, 3, 2, 175, CAST(N'2024-10-15' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1133, 2, 1, 175, CAST(N'2024-10-21' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1134, 1, 2, 175, CAST(N'2024-10-22' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1135, 3, 2, 175, CAST(N'2024-10-22' AS Date), 8, 0)
GO
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1136, 2, 1, 175, CAST(N'2024-10-28' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1137, 1, 2, 175, CAST(N'2024-10-29' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1138, 3, 2, 175, CAST(N'2024-10-29' AS Date), 8, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1139, 2, 1, 181, CAST(N'2024-10-07' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1140, 1, 2, 181, CAST(N'2024-10-08' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (1141, 3, 2, 181, CAST(N'2024-10-08' AS Date), 6, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2082, 2, 2, 1132, CAST(N'2024-08-06' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2083, 3, 3, 1132, CAST(N'2024-08-07' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2084, 2, 4, 1132, CAST(N'2024-08-08' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2085, 2, 4, 1132, CAST(N'2024-08-01' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2086, 2, 2, 1132, CAST(N'2024-08-13' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2087, 3, 3, 1132, CAST(N'2024-08-14' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2088, 2, 4, 1132, CAST(N'2024-08-15' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2089, 2, 2, 1132, CAST(N'2024-08-20' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2090, 3, 3, 1132, CAST(N'2024-08-21' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2091, 2, 4, 1132, CAST(N'2024-08-22' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2092, 2, 2, 1132, CAST(N'2024-08-27' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2093, 3, 3, 1132, CAST(N'2024-08-28' AS Date), 21, 0)
INSERT [dbo].[Slot_Mentee] ([id], [slot], [dayOfWeek], [schedule_id], [learning_date], [skillId], [isAttend]) VALUES (2094, 2, 4, 1132, CAST(N'2024-08-29' AS Date), 21, 0)
SET IDENTITY_INSERT [dbo].[Slot_Mentee] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [df_hold]  DEFAULT ((0)) FOR [hold]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [df_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Balance_Change]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Change_Account] FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Balance_Change] CHECK CONSTRAINT [FK_Balance_Change_Account]
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([menteeId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account1] FOREIGN KEY([mentorId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account1]
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
ALTER TABLE [dbo].[Request_Course]  WITH CHECK ADD  CONSTRAINT [FK_Request_Course_Account] FOREIGN KEY([toUser_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request_Course] CHECK CONSTRAINT [FK_Request_Course_Account]
GO
ALTER TABLE [dbo].[Request_Course]  WITH CHECK ADD  CONSTRAINT [FK_Request_Course_Account1] FOREIGN KEY([mentee_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request_Course] CHECK CONSTRAINT [FK_Request_Course_Account1]
GO
ALTER TABLE [dbo].[Request_Course]  WITH CHECK ADD  CONSTRAINT [FK_Request_Course_Request] FOREIGN KEY([req_id])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Request_Course] CHECK CONSTRAINT [FK_Request_Course_Request]
GO
ALTER TABLE [dbo].[Request_Course]  WITH CHECK ADD  CONSTRAINT [FK_Request_Course_Schedules] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedules] ([id])
GO
ALTER TABLE [dbo].[Request_Course] CHECK CONSTRAINT [FK_Request_Course_Schedules]
GO
ALTER TABLE [dbo].[Request_Course]  WITH CHECK ADD  CONSTRAINT [FK_Request_Course_Skill] FOREIGN KEY([skill_id])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Request_Course] CHECK CONSTRAINT [FK_Request_Course_Skill]
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
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Schedules] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedules] ([id])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Schedules]
GO
ALTER TABLE [dbo].[Slot_Mentee]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Mentee_Schedules] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedules] ([id])
GO
ALTER TABLE [dbo].[Slot_Mentee] CHECK CONSTRAINT [FK_Slot_Mentee_Schedules]
GO
ALTER TABLE [dbo].[Slot_Mentee]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Mentee_Skill] FOREIGN KEY([skillId])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Slot_Mentee] CHECK CONSTRAINT [FK_Slot_Mentee_Skill]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD CHECK  (([status]<=(3) AND [status]>(0)))
GO
