USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_InsertOferta]    Script Date: 03/07/2016 11:11:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_InsertOferta] 
	@IdPublicacion numeric(18,0), 
	@Fecha datetime, 
	@Monto numeric(18,2), 
	@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [GD1C2016].[MASTERDBA].[Ofertas]
	VALUES (@IdPublicacion, @Fecha, @Monto, 0, @IdUsuario, NULL)

	SELECT O.[IdOferta] FROM [GD1C2016].[MASTERDBA].[Ofertas] O	WHERE O.[IdPublicacion] = @IdPublicacion AND O.[Fecha] = @Fecha AND O.[Monto] = @Monto AND O.[IdUsuario] = @IdUsuario
END

GO
