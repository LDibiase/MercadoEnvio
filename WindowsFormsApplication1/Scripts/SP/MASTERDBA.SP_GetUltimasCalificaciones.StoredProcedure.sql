USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_GetUltimasCalificaciones]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_GetUltimasCalificaciones] 
	@IdUsuario int, 
	@Cantidad int = 5
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP (@Cantidad) CA.[IdCalificacion], CA.[IdCompra], CA.[CantEstrellas], CA.[Descripcion], P.[Descripcion] AS DescripcionPublicacion
	FROM [GD1C2016].[MASTERDBA].[Calificaciones] CA, [GD1C2016].[MASTERDBA].[Compras] CO, [GD1C2016].[MASTERDBA].[Publicaciones] P
	WHERE CA.[IdCompra] = CO.[IdCompra]
	AND CO.[IdPublicacion] = P.[IdPublicacion]
	AND CO.IdUsuario = @IdUsuario
	ORDER BY CA.IdCalificacion DESC
END

GO
