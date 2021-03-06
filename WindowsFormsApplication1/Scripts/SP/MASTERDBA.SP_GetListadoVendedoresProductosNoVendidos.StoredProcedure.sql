USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetListadoVendedoresProductosNoVendidos]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetListadoVendedoresProductosNoVendidos] 
	@NroTrimestre int, 
	@Año int, 
	@IdVisibilidad int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP(5) V.[IdUsuario], V.[NombreUsuario], SUM(V.[CantProductosNoVendidos]) AS CantProductosNoVendidos, V.[VisibilidadDescripcion]
	FROM
	(
	SELECT F.[IdUsuario], F.[NombreUsuario], SUM(P.[Stock]) - SUM(I.[Cantidad]) AS CantProductosNoVendidos, P.[IdVisibilidad], P.[VisibilidadDescripcion]
	FROM [GD1C2016].[MASTERDBA].[VW_Facturas] F, [GD1C2016].[MASTERDBA].[Facturas_Items] I, [GD1C2016].[MASTERDBA].[VW_Publicaciones] P
	WHERE F.[IdFactura] = I.[IdFactura]
	AND F.[IdPublicacion] = P.[IdPublicacion]
	AND I.[Concepto] = 'Comisión por Venta'
	AND P.[VisibilidadActual] = 1
	--WHERE MONTH(F.[Fecha]) BETWEEN
	--	(CASE @NroTrimestre WHEN 1 THEN 1 WHEN 2 THEN 4 WHEN 3 THEN 7 WHEN 4 THEN 10 END) AND
	--	(CASE @NroTrimestre WHEN 1 THEN 3 WHEN 2 THEN 6 WHEN 3 THEN 9 WHEN 4 THEN 12 END)
	--AND YEAR(F.[Fecha]) = @Año
	--AND (@IdVisibilidad = 0 OR P.[IdVisibilidad] = @IdVisibilidad)
	GROUP BY F.[IdUsuario], F.[NombreUsuario], P.[IdVisibilidad], P.[VisibilidadDescripcion]
	) V
	GROUP BY V.[IdUsuario], V.[NombreUsuario], V.[IdVisibilidad], V.[VisibilidadDescripcion]
	ORDER BY SUM(V.[CantProductosNoVendidos]) DESC
END

GO
