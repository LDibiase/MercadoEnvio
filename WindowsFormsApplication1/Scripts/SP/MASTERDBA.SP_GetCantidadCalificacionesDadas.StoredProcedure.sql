USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetCantidadCalificacionesDadas]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetCantidadCalificacionesDadas] 
	@CantEstrellas int, 
	@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(C.[IdCalificacion])
	FROM [GD1C2016].[MASTERDBA].[VW_Calificaciones] C
	WHERE C.[IdUsuario] = @IdUsuario
	AND C.[CantEstrellas] = @CantEstrellas
END

GO
