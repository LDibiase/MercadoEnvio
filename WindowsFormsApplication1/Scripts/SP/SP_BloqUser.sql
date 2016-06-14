USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_BloqUser]    Script Date: 13/06/2016 09:38:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BloqUser] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [GD1C2016].[MASTERDBA].[Usuarios]
	SET	[Activo] = 0
	WHERE UPPER([UserName]) = UPPER(@UserName)
END

GO
