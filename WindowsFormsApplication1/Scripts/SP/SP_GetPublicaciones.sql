USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[GetPublicaciones]    Script Date: 13/06/2016 08:10:36 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetPublicaciones] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT P.[IdPublicacion], P.[Descripcion], P.[Stock], P.[FechaInicio], P.[FechaVencimiento], P.[Precio], P.[PrecioReserva], P.[IdRubro], P.[IdUsuario], P.[IdEstado], P.[IdTipo], P.[Envio], V.[IdVisibilidad], V.[Descripcion], V.[Precio], V.[Porcentaje], V.[EnvioPorcentaje]
	FROM [GD1C2016].[MASTERDBA].[Publicaciones] P, [GD1C2016].[MASTERDBA].[Publicaciones_Visibilidad] PV, [GD1C2016].[MASTERDBA].[Visibilidad_Publicacion] V
	WHERE P.[IdPublicacion] = PV.[IdPublicacion]
	AND PV.[IdVisibilidad] = V.[IdVisibilidad]
	AND PV.[Activa] = 1
END

GO
