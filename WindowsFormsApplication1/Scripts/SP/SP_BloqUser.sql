USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_BloqUser]    Script Date: 22/5/2016 7:28:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BloqUser] 
	-- Add the parameters for the stored procedure here
	@Usuario nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [GD1C2016].[MASTERDBA].[Usuarios]
	SET
	Estado = 'B'
END

