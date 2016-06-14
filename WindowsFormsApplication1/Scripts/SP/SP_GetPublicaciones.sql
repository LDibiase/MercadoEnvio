USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPublicaciones]    Script Date: 13/06/2016 09:38:44 p.m. ******/
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

	SELECT P.[IdPublicacion], P.[Descripcion], P.[Stock], P.[FechaInicio], P.[FechaVencimiento], P.[Precio], P.[PrecioReserva], P.[IdRubro], P.[IdUsuario], P.[IdEstado], P.[Envio]
	FROM [GD1C2016].[MASTERDBA].[Publicaciones] P, [GD1C2016].[MASTERDBA].[Estado_Publicacion] E
	WHERE P.[IdEstado] = E.[IdEstado]
	AND E.[Descripcion] = 'Activa' -- Comentar para pruebas ya que todas las publicaciones migradas están finalizadas
END


GO
