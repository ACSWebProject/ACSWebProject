using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;
using System.Data;

public partial class Fotos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated && User.IsInRole("Administrador"))
        {

        }
        else
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Account/Login.aspx");

        }

        string url = Request.Url.AbsoluteUri;
        if (url.Contains("remFoto="))
        {
            string[] idFoto = url.Split('=');

            if (Int32.Parse(idFoto[1]) != -1)
            {
                allFotos.DeleteCommand = "DELETE FROM foto WHERE id_foto=" + idFoto[1];
                allFotos.Delete();
            }
            select();
            preencherGaleria();
        }


        if (!Page.IsPostBack)
        {
            Label1.Visible = false;
            select();
            preencherGaleria();
        }
    }

    protected void preencherGaleria()
    {
        
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable ft = allFotos.Select(arg);
        IEnumerator ft2 = ft.GetEnumerator();

        string fotos = "";
        int numFotos = 0;
        while (ft2.MoveNext())
        {
            numFotos++;
            DataRowView row = (DataRowView)ft2.Current;
            string legenda = row.Row[4].ToString() + " na cidade de(o) " + row.Row[3].ToString() + " (" + Convert.ToDateTime(row.Row[5].ToString()).ToShortDateString() + ")";
            fotos = fotos + "<figure  class=\"cap-left\">" +
                   "<a href=\"" + row.Row[2].ToString() + "\" class=\"top_up\" toptions=\"group = imagens\"><p style=\"float: left; width: 200px; font-size: 9pt; margin-right: 5px; padding-bottom: 0px;\"><img width=\"200px\" height=\"200px\" src=\"" + row.Row[2].ToString() + "\" alt=\"\"></a>"+legenda+"</p><br/>" +
                   "<figcaption>" + row.Row[1].ToString() + "&nbsp;&nbsp;<a href=\"Fotos.aspx?remFoto=" + row.Row[0].ToString() + "\" onClick=\"if(confirm('Deseja eliminar a foto seleccionada?')); else return false;\"><img src=\"Icons/remFoto.png\" heigth=\"20px\" width=\"20px\" title=\"Remover Foto\"/></a></figcaption>" +
                   "</figure>";
        }

        Label1.Visible = true;
        if (numFotos == 0)
        {
            Label1.Text = "<center>Não existem fotos da cidade seleccionada</center>";
        }
        else
        {
            Label1.Text = fotos + "<br/>";
        }
    }

    protected void select()
    {
        allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid ORDER BY f.data DESC";
    }

    protected void Ordenar_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "Data")
        {
            allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid ORDER BY f.data DESC";
            Avan.Visible = false;
            Avan.Checked = false;
            TextBox1.Visible = false;
            preencherGaleria();
        }
        else
        {
            if (DropDownList1.SelectedValue == "Cidade")
            {
                if (!Avan.Checked || TextBox1.Text == "")
                {
                    allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid ORDER BY c.nome ASC";

                }
                else
                {
                    allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid and c.nome LIKE '%" + TextBox1.Text + "%'";
                }
                Avan.Visible = true;
                preencherGaleria();
            }
            else
            {
                if (!Avan.Checked || TextBox1.Text == "")
                {
                    allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid ORDER BY u.username ASC";
                }
                else
                {
                    allFotos.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome, u.username, f.data FROM Foto f, Cidade c, aspnet_Users u WHERE f.id_cidade = c.id_cidade and f.id_utilizador = u.userid and u.username LIKE '%" + TextBox1.Text + "%'";
                }
                Avan.Visible = true;
                preencherGaleria();
            }

        }
    }

    protected void Avan_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox1.Visible)
        {
            TextBox1.Text = "";
            TextBox1.Visible = false;
        }
        else
        {
            TextBox1.Visible = true;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox1.Visible = false;
        Avan.Visible = false;
        Avan.Checked = false;
    }
}