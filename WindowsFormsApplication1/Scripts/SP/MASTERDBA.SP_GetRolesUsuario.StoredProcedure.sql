USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetRolesUsuario]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetRolesUsuario] 
	@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT UR.[IdRol]
	FROM [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR
	WHERE UR.[IdUsuario] = @IdUsuario
	AND UR.[Activa] = 1
END

GO
