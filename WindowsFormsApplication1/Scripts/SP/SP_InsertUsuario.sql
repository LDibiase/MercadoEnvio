USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUsuario]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUsuario] 
	@UserName nvarchar(50), 
	@PassEncr nvarchar(255), 
	@CantIntFallidos int, 
	@Activo bit
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [GD1C2016].[MASTERDBA].[Usuarios]
	VALUES (@UserName, @PassEncr, @CantIntFallidos, @Activo)

	SELECT U.[IdUsuario], U.[UserName], U.[PassEncr], U.[CantIntFallidos], U.[Activo]
	FROM [GD1C2016].[MASTERDBA].[Usuarios] U
	WHERE U.[IdUsuario] = @@IDENTITY
END

GO
