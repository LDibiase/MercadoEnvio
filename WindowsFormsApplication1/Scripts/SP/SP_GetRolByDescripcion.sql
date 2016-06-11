USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRolByDescripcion]    Script Date: 11/06/2016 05:38:33 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRolByDescripcion] 
	@Descripcion nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT R.[IdRol], R.[Descripcion], R.[Activo]
	FROM [GD1C2016].[MASTERDBA].[Roles] R
	WHERE UPPER(R.[Descripcion]) = UPPER(@Descripcion)
END

GO
