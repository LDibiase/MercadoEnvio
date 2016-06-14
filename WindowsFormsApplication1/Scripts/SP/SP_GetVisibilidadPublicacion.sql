USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVisibilidadPublicacion]    Script Date: 13/06/2016 09:38:44 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetVisibilidadPublicacion] 
	@IdPublicacion int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT V.[IdVisibilidad], V.[Descripcion], V.[Precio], V.[Porcentaje], V.[EnvioPorcentaje]
	FROM [GD1C2016].[MASTERDBA].[Publicaciones_Visibilidad] PV, [GD1C2016].[MASTERDBA].[Visibilidad_Publicacion] V
	WHERE PV.[IdVisibilidad] = V.[IdVisibilidad]
	AND PV.[Activa] = 1
	AND PV.[IdPublicacion] = @IdPublicacion
END


GO
