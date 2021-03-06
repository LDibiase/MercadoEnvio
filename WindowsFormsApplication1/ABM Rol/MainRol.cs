﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Windows.Forms;
using MercadoEnvio.Entidades;
using MercadoEnvio.Servicios;
using MercadoEnvio.Properties;

namespace MercadoEnvio.ABM_Rol
{
    public partial class MainRol : Form
    {
        public Usuario Usuario { get; set; }

        public MainRol()
        {
            InitializeComponent();
        }

        private void MainRol_Load(object sender, EventArgs e)
        {
            #region armadoDeGrillaRol
            BindingList<Rol> dataSource = new BindingList<Rol>(RolesServices.GetAllData());
            BindingSource bs = new BindingSource {DataSource = dataSource};

            DgRoles.AutoGenerateColumns = false;
            DgRoles.ColumnCount = 2;

            DgRoles.Columns[0].HeaderText = Resources.Rol;
            DgRoles.Columns[0].Name = "Descripcion";
            DgRoles.Columns[0].DataPropertyName = "Descripcion";

            DgRoles.Columns[1].HeaderText = Resources.Estado;
            DgRoles.Columns[1].Name = "Estado";
            DgRoles.Columns[1].DataPropertyName = "Estado";

            DgRoles.DataSource = bs;
            #endregion

            #region armadoComboEstado
            Estado estadoTodos = new Estado { Descripcion = "--Todos--" };
            Estado estadoHabilitado = new Estado { Valor = true };
            Estado estadoDeshabilitado = new Estado { Valor = false };
            List<Estado> estados = new List<Estado> {estadoTodos, estadoHabilitado, estadoDeshabilitado};

            ComboEstado.DataSource = estados;
            ComboEstado.DisplayMember = "Descripcion";
            ComboEstado.DropDownStyle = ComboBoxStyle.DropDownList;
            #endregion

            #region armadoComboFuncionalidad
            Funcionalidad funcionalidadTodas = new Funcionalidad { IdFuncionalidad = 0, Descripcion = "--Todas--" };
            List<Funcionalidad> funcionalidades = new List<Funcionalidad>(RolesServices.GetAllFuncionalidades())
            {
                funcionalidadTodas
            };
            funcionalidades.RemoveAll(x => x.Descripcion.Equals(Resources.LoginSeguridad, StringComparison.CurrentCultureIgnoreCase));
            funcionalidades = funcionalidades.OrderBy(x => x.IdFuncionalidad).ToList();

            ComboFuncionalidad.DataSource = funcionalidades;
            ComboFuncionalidad.DisplayMember = "Descripcion";
            ComboFuncionalidad.DropDownStyle = ComboBoxStyle.DropDownList;
            #endregion
        }

        private void BtnBorrar_Click(object sender, EventArgs e)
        {
            Rol rolSeleccionado = new Rol();

            if (DgRoles.SelectedRows.Count > 0)
            {
                BindingSource bs = DgRoles.DataSource as BindingSource;
                if (bs != null)
                    rolSeleccionado = (Rol)bs.List[bs.Position];
            }

            if (rolSeleccionado.Activo)
            {
                string message = RolesServices.DeleteRol(rolSeleccionado);

                if (string.IsNullOrEmpty(message))
                {
                    BindingList<Rol> dataSource = new BindingList<Rol>(RolesServices.FindRoles(string.Empty, 0, string.Empty));
                    BindingSource bs = new BindingSource {DataSource = dataSource};

                    DgRoles.DataSource = bs;

                    MessageBox.Show(Resources.RolBorrado, Resources.MercadoEnvio, MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                    MessageBox.Show(message, Resources.ErrorBorrado, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
                MessageBox.Show(Resources.ErrorRolBorrado3, Resources.ErrorBorrado, MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void BtnBuscar_Click(object sender, EventArgs e)
        {
            string filtroNombre = TxtFiltroNombre.Text;
            int filtroFuncionalidad = ((Funcionalidad)ComboFuncionalidad.SelectedItem).IdFuncionalidad;
            string filtroEstado = ((Estado)ComboEstado.SelectedItem).Descripcion;

            BindingList<Rol> dataSource = new BindingList<Rol>(RolesServices.FindRoles(filtroNombre, filtroFuncionalidad, filtroEstado));
            BindingSource bs = new BindingSource {DataSource = dataSource};

            DgRoles.DataSource = bs;
        }

        private void BtnLimpiar_Click(object sender, EventArgs e)
        {
            BindingList<Rol> dataSource = new BindingList<Rol>();
            BindingSource bs = new BindingSource {DataSource = dataSource};

            DgRoles.DataSource = bs;
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            Rol rolSeleccionado = new Rol();

            if (DgRoles.SelectedRows.Count > 0)
            {
                BindingSource bs = DgRoles.DataSource as BindingSource;
                if (bs != null)
                    rolSeleccionado = (Rol)bs.List[bs.Position];
            }

            var altaRol = new AltaRol();
            altaRol.Text = Resources.EdicionRol;
            altaRol.Rol = rolSeleccionado;

            var result = altaRol.ShowDialog();

            if (result.Equals(DialogResult.OK))
            {
                BindingList<Rol> dataSource = new BindingList<Rol>(RolesServices.GetAllData());
                BindingSource bs = new BindingSource {DataSource = dataSource};

                DgRoles.DataSource = bs;
            }
        }

        private void BtnAgregar_Click(object sender, EventArgs e)
        {
            var altaRol = new AltaRol();
            altaRol.Rol = Usuario.RolActivo != null ? Usuario.RolActivo : new Rol();
            var result = altaRol.ShowDialog();

            if (result.Equals(DialogResult.OK))
            {
                BindingList<Rol> dataSource = new BindingList<Rol>(RolesServices.GetAllData());
                BindingSource bs = new BindingSource {DataSource = dataSource};

                DgRoles.DataSource = bs;
            }
        }
    }
}
