USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_InsertRol]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_InsertRol] 
	@Descripcion nvarchar(100), 
	@Activo bit
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [GD1C2016].[MASTERDBA].[Roles]
	VALUES (@Descripcion, @Activo)

	SELECT R.[IdRol], R.[Descripcion], R.[Activo]
	FROM [GD1C2016].[MASTERDBA].[Roles] R
	WHERE R.[IdRol] = @@IDENTITY
END

GO
