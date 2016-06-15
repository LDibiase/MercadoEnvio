USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetFuncionalidades]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetFuncionalidades] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT F.[IdFuncionalidad], F.[Descripcion]
	FROM [GD1C2016].[MASTERDBA].[Funcionalidades] F
END

GO
