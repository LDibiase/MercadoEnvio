USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_DeleteUsuariosRol]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_DeleteUsuariosRol] 
	@IdRol int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS	(
				SELECT 1 FROM [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR1, [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR2
				WHERE UR1.[IdRol] = @IdRol AND UR1.[Activa] = 1 AND UR2.[IdUsuario] = UR1.[IdUsuario] AND UR2.[Activa] = 1
				GROUP BY UR2.[IdUsuario] HAVING COUNT(UR2.[IdRol]) = 1
				)
	BEGIN
		SELECT
			UR2.[IdUsuario],
			(SELECT U.[UserName] FROM [GD1C2016].[MASTERDBA].[Usuarios] U WHERE U.[IdUsuario] = UR2.[IdUsuario]) UserName
		FROM [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR1, [GD1C2016].[MASTERDBA].[Usuarios_Roles] UR2
		WHERE UR1.[IdRol] = @IdRol
		AND UR1.[Activa] = 1
		AND UR2.[IdUsuario] = UR1.[IdUsuario]
		AND UR2.[Activa] = 1
		GROUP BY UR2.[IdUsuario]
		HAVING COUNT(UR2.[IdRol]) = 1
	END
	ELSE
	BEGIN
		UPDATE [GD1C2016].[MASTERDBA].[Usuarios_Roles]
		SET	[Activa] = 0
		WHERE [IdRol] = @IdRol
	END
END

GO
