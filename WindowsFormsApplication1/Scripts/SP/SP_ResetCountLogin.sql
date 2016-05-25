USE [GD1C2016]
GO
/****** Object:  StoredProcedure [dbo].[SP_ResetCountLogin]    Script Date: 22/5/2016 9:51:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_ResetCountLogin] 
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
	CantIntentos = 0
	WHERE 
	[UserName] = @Usuario
END

