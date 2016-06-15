USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRolesUsuario]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRolesUsuario] 
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
