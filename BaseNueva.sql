USE [SISTEMA]
GO
/****** Object:  Table [dbo].[CANTON]    Script Date: 13-Sep-19 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CANTON](
	[IdCanton] smallint IDENTITY (1,1),
	[CodCanton] [smallint] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[IdProvincia] [smallint] NOT NULL,
 CONSTRAINT [PK_CANTON] PRIMARY KEY CLUSTERED 
(
	[IdCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 13-Sep-19 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[IdDistrito] smallint IDENTITY (1,1) ,
	[CodDistrito] [smallint] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[IdCanton] [smallint] NOT NULL,
 CONSTRAINT [PK_DISTRITO] PRIMARY KEY CLUSTERED 
(
	[IdDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JUNTA]    Script Date: 13-Sep-19 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JUNTA](
	[CodigoJunta] [int] NOT NULL,
 CONSTRAINT [PK_JUNTA] PRIMARY KEY CLUSTERED 
(
	[CodigoJunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 13-Sep-19 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[Cedula] [bigint] NOT NULL,
	[IdProvincia] [smallint] NOT NULL,
	[IdCanton] [smallint] NOT NULL,
	[IdDistrito] [smallint] NOT NULL,
	[Sexo] [bit] NOT NULL,
	[FechaCaducidad] [date] NOT NULL,
	[CodigoJunta] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido1] [varchar](20) NOT NULL,
	[Apellido2] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PERSONA] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 13-Sep-19 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] smallint IDENTITY (1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CANTON]  WITH CHECK ADD  CONSTRAINT [FK_CANTON_PROVINCIA] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[PROVINCIA] ([IdProvincia])
GO
ALTER TABLE [dbo].[CANTON] CHECK CONSTRAINT [FK_CANTON_PROVINCIA]
GO
ALTER TABLE [dbo].[DISTRITO]  WITH CHECK ADD  CONSTRAINT [FK_DISTRITO_CANTON] FOREIGN KEY([IdCanton])
REFERENCES [dbo].[CANTON] ([IdCanton])
GO
ALTER TABLE [dbo].[DISTRITO] CHECK CONSTRAINT [FK_DISTRITO_CANTON]
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_PERSONA_CANTON] FOREIGN KEY([IdCanton])
REFERENCES [dbo].[CANTON] ([IdCanton])
GO
ALTER TABLE [dbo].[PERSONA] CHECK CONSTRAINT [FK_PERSONA_CANTON]
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_PERSONA_DISTRITO] FOREIGN KEY([IdDistrito])
REFERENCES [dbo].[DISTRITO] ([IdDistrito])
GO
ALTER TABLE [dbo].[PERSONA] CHECK CONSTRAINT [FK_PERSONA_DISTRITO]
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_PERSONA_JUNTA] FOREIGN KEY([CodigoJunta])
REFERENCES [dbo].[JUNTA] ([CodigoJunta])
GO
ALTER TABLE [dbo].[PERSONA] CHECK CONSTRAINT [FK_PERSONA_JUNTA]
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD  CONSTRAINT [FK_PERSONA_PROVINCIA] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[PROVINCIA] ([IdProvincia])
GO
ALTER TABLE [dbo].[PERSONA] CHECK CONSTRAINT [FK_PERSONA_PROVINCIA]
GO
