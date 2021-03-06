USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetListadoVendedoresFacturas]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetListadoVendedoresFacturas] 
	@NroTrimestre int, 
	@Año int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP(5) F1.[IdUsuario], F1.[NombreUsuario], F1.[CantFacturas]
	FROM
	(
	SELECT F.[IdUsuario], F.[NombreUsuario], COUNT(F.[IdFactura]) AS CantFacturas
	FROM [GD1C2016].[MASTERDBA].[VW_Facturas] F
	WHERE MONTH(F.[Fecha]) BETWEEN
		(CASE @NroTrimestre WHEN 1 THEN 1 WHEN 2 THEN 4 WHEN 3 THEN 7 WHEN 4 THEN 10 END) AND
		(CASE @NroTrimestre WHEN 1 THEN 3 WHEN 2 THEN 6 WHEN 3 THEN 9 WHEN 4 THEN 12 END)
	AND YEAR(F.[Fecha]) = @Año
	GROUP BY F.[IdUsuario], F.[NombreUsuario]
	) F1
	ORDER BY F1.[CantFacturas] DESC
END

GO
