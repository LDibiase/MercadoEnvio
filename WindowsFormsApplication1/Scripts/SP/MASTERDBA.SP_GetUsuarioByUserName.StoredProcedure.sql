USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetUsuarioByUserName]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetUsuarioByUserName] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT U.[IdUsuario], U.[UserName], U.[PassEncr], U.[CantIntFallidos], U.[Activo]
	FROM [GD1C2016].[MASTERDBA].[Usuarios] U
	WHERE UPPER(U.[UserName]) = UPPER(@UserName)
END

GO
