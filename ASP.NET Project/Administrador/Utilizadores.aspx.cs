using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Collections;

public partial class About : System.Web.UI.Page
{
    private static string utilizador = "";

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            if (Session["PainelAct2"] != null)
            {
                int painel = Int32.Parse(Session["PainelAct2"].ToString());
                mostrarPainel(painel);
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PainelAct"] = 1;

        if (User.Identity.IsAuthenticated && User.IsInRole("Administrador"))
        {
   
            string url = Request.Url.AbsoluteUri;
            if (url.Contains("remCom="))
            {
                string[] idCom = url.Split('=');

                if (Int32.Parse(idCom[1]) != -1)
                {
                    comentariosUtilizador.DeleteCommand = "DELETE FROM comentario WHERE id_comentario=" + idCom[1];
                    comentariosUtilizador.Delete();
                }
                //preencherComentarios(id_cidade.ToString());
                mostrarPainel(2);
            }

        }
        else
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Account/Login.aspx");
           
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //Panel1.Visible = false;
        //Panel2.Visible = true;

        Button bt = (Button)sender;
        string user = bt.CommandArgument.ToString();

        //Remover Comentarios, Fotos, Rating

        utilizadores.DeleteCommand = "DELETE FROM rating where id_utilizador='" + user +"'";
        utilizadores.Delete();

        utilizadores.DeleteCommand = "DELETE FROM comentario where id_utilizador='" + user + "'";
        utilizadores.Delete();

        utilizadores.DeleteCommand = "DELETE FROM foto where id_utilizador='" + user + "'";
        utilizadores.Delete();
         
        utilizadores.DeleteCommand = "DELETE FROM aspnet_Membership WHERE UserId='" + user + "'";
        utilizadores.Delete();

        utilizadores.DeleteCommand = "DELETE FROM aspnet_UsersInRoles where UserId='" + user + "'";
        utilizadores.Delete();

        utilizadores.DeleteCommand = "DELETE FROM aspnet_Users WHERE UserId='" + user + "'";
        utilizadores.Delete();

        ListView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        utilizador = bt.CommandArgument.ToString();

        mostrarPainel(2);
    } 

    private void preencherComentarios(string user)
    {
        comentariosUtilizador.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_utilizador ='" + user + "' and co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY co.data DESC";
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable c = comentariosUtilizador.Select(arg);
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
                          "<span>" + data.ToShortDateString() + " - " + row.Row[4].ToString() + "</span></a>  </li></ul></div></td><td width=\"20%\"><a href=\"Utilizadores.aspx?remCom=" + row.Row[0].ToString() + "\"><img height=\"20px\" width=\"20px\" src=\"Icons/remCom.png\" onClick=\"if(confirm('Deseja eliminar o comentário seleccionado?')); else return false;\" title=\"Remover Comentário\"/></a></td></tr></table>";


        }

        if (numComentarios == 0)
        {
            Label1.Text = "<center>Não existem comentários do utilizador seleccionado</center>";
        }
        else
        {
            Label1.Text = comentarios + "<br/>";
        }
    }
    

    protected void Link_Click(object sender, EventArgs e)
    {
        mostrarPainel(1);
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        string pressedButton = b.ID;

        if (pressedButton == "Todos")
        {
            utilizadores.SelectCommand = "SELECT UserId, UserName, Email, CreateDate, LastLoginDate, LastActivityDate FROM vw_aspnet_MembershipUsers WHERE (UserName != 'Admin')";
            ListView1.DataBind();
        }
        else
        {
            utilizadores.SelectCommand = "SELECT UserId, UserName, Email, CreateDate, LastLoginDate, LastActivityDate FROM vw_aspnet_MembershipUsers WHERE (UserName != 'Admin') AND UserName LIKE '["+pressedButton+"]%'";
            ListView1.DataBind();
        }

    }

    protected void mostrarPainel(int painel)
    {
        Session["PainelAct2"] = painel;
        if (painel == 1)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        else
        {
            if (painel == 2)
            {
                preencherComentarios(utilizador);
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }
    }
}
