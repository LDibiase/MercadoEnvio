USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_InsertUsuarioRol]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_InsertUsuarioRol] 
	@IdUsuario int, 
	@IdRol int, 
	@Activa bit
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS	(
				SELECT 1 FROM [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR
				WHERE UR.[IdUsuario] = @IdUsuario AND UR.[IdRol] = @IdRol
				)
	BEGIN
		UPDATE [GD1C2016].[MASTERDBA].[Usuarios_Roles]
		SET	[Activa] = 1
		WHERE [IdUsuario] = @IdUsuario
		AND [IdRol] = @IdRol
	END
	ELSE
	BEGIN
		INSERT INTO [GD1C2016].[MASTERDBA].[Usuarios_Roles]
		VALUES (@IdUsuario, @IdRol, @Activa)
	END
END

GO
