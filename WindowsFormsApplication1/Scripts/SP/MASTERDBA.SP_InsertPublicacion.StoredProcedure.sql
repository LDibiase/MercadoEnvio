USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_InsertPublicacion]    Script Date: 03/07/2016 06:40:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_InsertPublicacion] 
	@Descripcion nvarchar(255), 
	@Stock numeric(18,0), 
	@FechaInicio datetime, 
	@FechaVencimiento datetime, 
	@Precio numeric(18,2), 
	@PrecioReserva numeric(18,2), 
	@IdRubro int, 
	@IdUsuario int, 
	@IdEstado int, 
	@IdTipo int, 
	@Envio bit, 
	@IdVisibilidad numeric(18,0), 
	@FechaActual datetime
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @IdPublicacion numeric(18,0),
			@Total numeric(18,2),
			@IdFactura numeric(18,0)

	SELECT @IdPublicacion = MAX(P.[IdPublicacion]) + 1 FROM [GD1C2016].[MASTERDBA].[Publicaciones] P

	INSERT INTO [GD1C2016].[MASTERDBA].[Publicaciones]
	VALUES (@IdPublicacion,	@Descripcion, @Stock, @FechaInicio,	@FechaVencimiento, @Precio, @PrecioReserva, @IdRubro, @IdUsuario, @IdEstado, @IdTipo, @Envio)

	EXEC [GD1C2016].[MASTERDBA].[SP_InsertPublicacionVisibilidad] @IdPublicacion, @IdVisibilidad

	IF (SELECT E.[Descripcion] FROM [GD1C2016].[MASTERDBA].[Estado_Publicacion] E WHERE E.[IdEstado] = @IdEstado) = 'Activa'
	BEGIN
		SELECT @Total = V.[Precio] FROM [GD1C2016].[MASTERDBA].[Visibilidad_Publicacion] V WHERE V.[IdVisibilidad] = @IdVisibilidad

		EXEC @IdFactura = [GD1C2016].[MASTERDBA].[SP_InsertFactura] @IdPublicacion, @FechaActual, @Total
		EXEC [GD1C2016].[MASTERDBA].[SP_InsertFacturaItem] @IdFactura, 'Comisión por Publicación', @Total, 1
	END

	SELECT P.[IdPublicacion] FROM [GD1C2016].[MASTERDBA].[Publicaciones] P WHERE P.[IdPublicacion] = @IdPublicacion
END

GO
