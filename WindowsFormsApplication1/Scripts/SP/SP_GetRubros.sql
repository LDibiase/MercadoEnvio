USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRubros]    Script Date: 14/06/2016 10:41:32 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRubros] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT R.[IdRubro] as IdRubro, R.[DescripcionCorta] as DescripcionCorta, R.[DescripcionLarga] as DescripcionLarga
	FROM [GD1C2016].[MASTERDBA].[Rubros] R
END


GO
