USE [GD1C2016]
GO
/****** Object:  View [MASTERDBA].[VW_Compras]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE VIEW [MASTERDBA].[VW_Compras] 
AS
SELECT
	C.[IdCompra],
	C.[IdPublicacion],
	P.[Descripcion],
	P.[IdRubro],
	R.[DescripcionLarga] AS RubroDescripcion,
	C.[Fecha],
	C.[Cantidad],
	C.[Envio],
	C.[IdUsuario],
	COALESCE(U.[Nombre] + ' ' + U.[Apellido], U.[RazonSocial]) AS NombreUsuario
FROM
	[GD1C2016].[MASTERDBA].[Compras] C,
	[GD1C2016].[MASTERDBA].[Publicaciones] P,
	[GD1C2016].[MASTERDBA].[VW_Usuarios] U,
	[GD1C2016].[MASTERDBA].[Rubros] R
WHERE C.[IdPublicacion] = P.[IdPublicacion]
AND C.[IdUsuario] = U.[IdUsuario]
AND P.[IdRubro] = R.[IdRubro]
GO
