USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateVisibilidad]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateVisibilidad] 
	@Descripcion nvarchar(255), 
	@Activa bit,
	@Porcentaje numeric(18,2),
	@EnvioPorcentaje numeric(18,2),
	@Precio numeric(18,2),
	@IdVisibilidad int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [GD1C2016].[MASTERDBA].[Visibilidad_Publicacion]
	SET [Descripcion] = @Descripcion, Activa = @Activa, Porcentaje = @Porcentaje, EnvioPorcentaje = @EnvioPorcentaje, Precio = @Precio
	WHERE
	[IdVisibilidad] = @IdVisibilidad
END


GO
