
/****** Object:  Table [dbo].[Categories] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Categories(

[liSiteId] [int] NOT NULL ,
[liCategoryId] [int] NULL,
[sCategoryName] [nvarchar](255)  NULL,
[bIsSingleSelect] [bit]  NULL,
[bIsMandatory] [bit]  NULL,
[bIsHierarchical] [bit]  NULL

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Terms] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Terms(


[liTermId] [int] NOT NULL,
[sTerm] [nvarchar](255)  NULL,
[liParentTermId] [int] NULL,
[liMinValue] [int] NULL,
[liMaxValue] [int] NULL,
[liSiteId] [int] NOT NULL 

)
GO

GO

/****** Object:  Table [dbo].[CategoryTerms] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].CategoryTerms(

[liSiteId] [int],
[liCategoryId] [int] NULL,
[liTermId] [int] NULL,
[bIsTopLevel] [bit],
[SortOrder] [int],
[liOrderOnPage] [int]

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Resources] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Resources(

[liId] [int]  IDENTITY(1,1) PRIMARY KEY,
[sName][varchar](255),
[liType][int],
[liControlId][int],
[sControlName][varchar](255),
[bNumbersOnly] [bit],
[sPlaceHolder][ntext],
[sHelpText][ntext]


) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[ResourceType] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ResourceType(

[liResourceId] [int] NOT NULL PRIMARY KEY,
[sName][varchar](255)

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[ControlType] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ControlType(

[liControlId] [int] NOT NULL PRIMARY KEY,
[sName][varchar](255)

) ON [PRIMARY]
GO

GO


/****** Object:  Table [dbo].[SystemConfig] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].SystemConfig(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[ContactInfo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ContactInfo(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[DataCleaning] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].DataCleaning(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[RateCards] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].RateCards(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Sitecontent] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Sitecontent(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO



/****** Object:  Table [dbo].[ThirdParties] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ThirdParties(

[liResourceId] [int],
[liSiteId][int],
[sValue][ntext],
[sNote][ntext],
[sQuestion][nText]

) ON [PRIMARY]
GO

GO



-- ADMIN TABLES



/****** Object:  Table [dbo].[MadgexAnalytics] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].MadgexAnalytics(

[liSiteId] [int],
[sJSCode] [nvarchar](255) NULL,
[sRSCode] [nvarchar](255) NULL,
[sCMSCode] [nvarchar](255) NULL,
[sValidationCode] [nvarchar](255) NULL


) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Users] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Users(

[liUserId] [int] IDENTITY(1,1) PRIMARY KEY,
[liSiteId] [int] NOT NULL,
[sName] [nvarchar](255) NULL,
[sPhoneNumber] [nvarchar](255) NULL,
[sUserName] [nvarchar](255) NULL,
[sPassword] [nvarchar](255) NULL,
[liAuthLevel] [int] NULL
) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[AuthLevelValues] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].AuthLevelValues(

[liAuthLevel] [int],
[sAuthName] [varchar](255)

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Sites] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Sites(

[liSiteId] [int] IDENTITY(1,1) PRIMARY KEY,
[sSiteName] [nvarchar](255) NULL,
[dtDueDate] [datetime],
[bJobBoard] [bit] NULL,
[bCustomHomePage] [bit] NULL,
[bAffilliate] [bit] NULL,
[bCVSM] [bit] NULL,
[bSubmitted][bit],
[sClient][varchar](255)

) ON [PRIMARY]
GO

GO



/****** Object:  Table [dbo].[ManagerSites] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ManagerSites(

[liSiteId] [int] NOT NULL PRIMARY KEY,
[liManagerID] [int] NOT NULL,
[liAlive] int

) ON [PRIMARY]
GO

GO


/****** Object:  Table [dbo].[DevSites] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].DevSites(

[liSiteId] [int] NOT NULL PRIMARY KEY,
[liDevId] [int] NOT NULL,
[liAlive] int

) ON [PRIMARY]
GO

GO


/****** Object:  Table [dbo].[PMChecklist] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].PMChecklist(

[liSiteId] [int] NOT NULL,
[CheckName][varchar](255),
[Value][bit]


) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[Plugins] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].Plugins(

[liPluginId] [int] NOT NULL,
[Name][varchar](255)


) ON [PRIMARY]
GO

GO


/****** Object:  Table [dbo].[PluginValues] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].PluginValues(

[liPluginId] [int] NOT NULL,
[Name][varchar](255),
[sValue][varchar](255),


) ON [PRIMARY]
GO

GO


/****** Object:  Table [dbo].[ProfileQuestions] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ProfileQuestions(

[liQuestionId] [int] NOT NULL,
[liSiteId][int],
[liOrderInForm][int],
[sText][varchar](255),
[bIsMandatory][bit],
[liControlType][int],
[Section] [int],
[liCatId] [int]


) ON [PRIMARY]
GO







-- Profile Questions categories

/****** Object:  Table [dbo].[ProfileCategories] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ProfileCategories(

[liSiteId] [int] NOT NULL ,
[liCategoryId] [int] NULL,
[sCategoryName] [nvarchar](255)  NULL,
[bIsSingleSelect] [bit]  NULL,
[bIsMandatory] [bit]  NULL,
[bIsHierarchical] [bit]  NULL

) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[ProfileTerms] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ProfileTerms(


[liTermId] [int] NOT NULL,
[sTerm] [nvarchar](255)  NULL,
[liParentTermId] [int] NULL,
[liMinValue] [int] NULL,
[liMaxValue] [int] NULL,
[liSiteId] [int] NOT NULL 

)
GO

GO

/****** Object:  Table [dbo].[ProfileCategoryTerms] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].ProfileCategoryTerms(

[liSiteId] [int],
[liCategoryId] [int] NULL,
[liTermId] [int] NULL,
[bIsTopLevel] [bit],
[SortOrder] [int],
[liOrderOnPage] [int]

) ON [PRIMARY]
GO

GO