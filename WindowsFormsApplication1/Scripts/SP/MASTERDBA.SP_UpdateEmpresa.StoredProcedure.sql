USE [GD1C2016]
GO
/****** Object:  StoredProcedure [MASTERDBA].[SP_UpdateEmpresa]    Script Date: 27/06/2016 09:25:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [MASTERDBA].[SP_UpdateEmpresa] 
	@IdUsuario int,
	@RazonSocial nvarchar(255), 
	@Mail nvarchar(255), 
	@Telefono nvarchar(50), 
	@Calle nvarchar(255), 
    @Nro numeric(18,0), 
	@Piso numeric(18,0), 
	@Departamento nvarchar(50), 
	@Localidad nvarchar(100), 
	@CodigoPostal nvarchar(50), 
	@Ciudad nvarchar(100), 
	@CUIT nvarchar(50), 
	@Contacto nvarchar(255), 
	@Rubro nvarchar(255), 
	@PassEncr nvarchar(255), 
	@Activo bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [GD1C2016].[MASTERDBA].[Empresas]
	SET
	[RazonSocial] = @RazonSocial,
	[Mail] = @Mail,
	[Telefono] = @Telefono,
	[Calle] = @Calle,
	[Nro] = @Nro,
	[Piso] = @Piso,
	[Departamento] = @Departamento,
	[Localidad] = @Localidad,
	[CP] = @CodigoPostal,
	[Ciudad] = @Ciudad,
	[CUIT] = @CUIT,
	[Contacto] = @Contacto,
	[Rubro] = @Rubro
	WHERE [IdUsuario] = @IdUsuario

	UPDATE [GD1C2016].[MASTERDBA].[Usuarios]
	SET
	[PassEncr] = @PassEncr,
	[Activo] = @Activo
	WHERE [IdUsuario] = @IdUsuario
END

GO
