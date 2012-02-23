using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;
using System.Data;

public partial class Comentarios : System.Web.UI.Page
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
        if (url.Contains("remCom="))
        {
            string[] idCom = url.Split('=');

            if (Int32.Parse(idCom[1]) != -1)
            {
                allComent.DeleteCommand = "DELETE FROM comentario WHERE id_comentario=" + idCom[1];
                allComent.Delete();
            }
            select();
            preencherComentarios();
        }


        if (!Page.IsPostBack)
        {
            Label1.Visible = false;
            select();
            preencherComentarios();
        }
    }

    protected void preencherComentarios()
    {   
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable c = allComent.Select(arg);
        IEnumerator c2 = c.GetEnumerator();

        string comentarios = "";
        int numComentarios = 0;
        while (c2.MoveNext())
        {
            numComentarios++;
            DataRowView row = (DataRowView)c2.Current;

            DateTime data = DateTime.Parse(row.Row[3].ToString());
            comentarios = comentarios + "<table width=\"100%\"><tr><td width=\"80%\"><div id=\"links\"><ul>" +
                          "<li><a href=\"#\"> " +
                          "<em>" + row.Row[1].ToString() + "</em>  " +
                          "<span>" + data.ToShortDateString() + " - " + row.Row[4].ToString() + " na cidade de(o) "+row.Row[2].ToString()+"</span></a>  </li></ul></div></td><td width=\"20%\"><a href=\"Comentarios.aspx?remCom=" + row.Row[0].ToString() + "\"><img height=\"20px\" width=\"20px\" src=\"Icons/remCom.png\" onClick=\"if(confirm('Deseja eliminar o comentário seleccionado?')); else return false;\" title=\"Remover Comentário\"/></a></td></tr></table>";


        }

        Label1.Visible = true;
        if (numComentarios == 0)
        {
            Label1.Text = "<center>Não existem comentários da cidade seleccionada</center>";
        }
        else
        {
            Label1.Text = comentarios + "<br/>";
        }
    }

    protected void select()
    {
        allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY co.data DESC";
    }

    protected void Ordenar_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "Data")
        {
            allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY co.data DESC";
            Avan.Visible = false;
            Avan.Checked = false;
            TextBox1.Visible = false;
            preencherComentarios();
        }
        else
        {
                if (DropDownList1.SelectedValue == "Cidade")
                {
                    if (!Avan.Checked || TextBox1.Text == "")
                    {
                        allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY c.nome ASC";

                    }
                    else
                    {                                         
                        allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid and c.nome LIKE '%"+TextBox1.Text+"%'";
                    }                   
                    Avan.Visible = true;                   
                    preencherComentarios();
                }
                else
                {
                    if (!Avan.Checked || TextBox1.Text == "")
                    {
                        allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY u.username ASC";
                    }
                    else
                    {
                        allComent.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade = c.id_cidade and co.id_utilizador=u.userid and u.username LIKE '%" + TextBox1.Text + "%'";
                    } 
                    Avan.Visible = true;
                    preencherComentarios();
                }
            
        }
    }
    protected void Avan_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox1.Visible)
        {
            TextBox1.Text = "";
            TextBox1.Visible = false;
        }else{
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