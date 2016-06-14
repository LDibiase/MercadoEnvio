USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRolFuncionalidades]    Script Date: 13/06/2016 09:38:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRolFuncionalidades] 
	@IdRol int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT RF.[IdFuncionalidad]
	FROM [GD1C2016].[MASTERDBA].[Roles_Funcionalidades] RF
	WHERE RF.[IdRol] = @IdRol
	AND RF.[Activa] = 1
END

GO
