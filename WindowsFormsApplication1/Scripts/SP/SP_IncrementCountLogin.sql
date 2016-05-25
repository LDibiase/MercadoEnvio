USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_IncrementCountLogin]    Script Date: 22/5/2016 9:51:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_IncrementCountLogin] 
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
	CantIntentos = CantIntentos + 1
	WHERE 
	[UserName] = @Usuario

	SELECT CantIntentos FROM [GD1C2016].[MASTERDBA].[Usuarios]
	WHERE [UserName] = @Usuario
END

