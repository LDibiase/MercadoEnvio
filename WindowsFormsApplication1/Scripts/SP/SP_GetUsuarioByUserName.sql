USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsuarioByUserName]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUsuarioByUserName] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT U.[IdUsuario], U.[UserName], U.[PassEncr], U.[CantIntFallidos], U.[Activo]
	FROM [GD1C2016].[MASTERDBA].[Usuarios] U
	WHERE UPPER(U.[UserName]) = UPPER(@UserName)
END

GO
