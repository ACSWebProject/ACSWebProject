using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("Administrador") == true)
            {
                Response.Redirect("Administrador\\Cidades.aspx");
            }
            else if (User.IsInRole("Utilizador") == true)
            {
                Response.Redirect("Utilizador\\Default.aspx");
            }
            else
            {
                MembershipUser member = Membership.GetUser();
                if (member != null)
                {
                    string userName = member.UserName;
                    Roles.AddUserToRole(userName, "Utilizador");
                    Response.Redirect("Utilizador\\Default.aspx");
                }
            }
        }

        fillGridViewTop();
    }

    private void fillGridViewTop()
    {

        DataTable dTable = (DataTable)getRatings();

        GridViewTop.DataSource = dTable;
        GridViewTop.DataBind();
        int cont = 0;
        foreach( DataRow r in dTable.Rows)
        {
            int ID_Cidade = Convert.ToInt32(r["ID_Cidade"].ToString());
            double media = Convert.ToDouble(r["Classificacao"].ToString());

            AjaxControlToolkit.Rating rating = (AjaxControlToolkit.Rating) GridViewTop.Rows[cont].FindControl("Rating1");
            rating.ReadOnly = true;
            rating.CurrentRating = (int)Math.Round(media, MidpointRounding.AwayFromZero);
            cont++;
        }
    }

    public DataTable getRatings()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetTopRatings", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.CommandType = CommandType.StoredProcedure;
            dAdapter.SelectCommand = Cmd;
            dAdapter.Fill(dTable);

            dAdapter.Dispose();
        }

        Cmd.Dispose();
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();

        return dTable;
    }

    protected void GridViewTop_SelectedIndexChanged(object sender, EventArgs e)
    {
        int row2 = GridViewTop.SelectedRow.RowIndex;
        Session["IdCidade"] = GridViewTop.DataKeys[row2].Value;
        Response.Redirect("Utilizador/VerCidade.aspx");
    }

    protected void GridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            Label aux = (Label)GridViewTop.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("LabelId");
            int idCidade = Convert.ToInt32(aux.Text);
            Session["IdCidade"] = idCidade;

            Response.Redirect("Utilizador/VerCidade.aspx");
        }
    }

    protected override void Render(System.Web.UI.HtmlTextWriter writer)
    {
        foreach (GridViewRow row in GridViewTop.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                row.Attributes.Add("onmouseover", "this.style.cursor='hand'; this.style.backgroundColor='orange';");
                row.Attributes.Add("onmouseout", "this.style.backgroundColor='';");
                //Add onclick attribute to select row.
                //e.Row.Attributes.Add("onclick", String.Format("javascript:__doPostBack('GridView1','Select${0}')", e.Row.RowIndex));
                row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(GridViewTop, "Select$" + row.DataItemIndex, true);
                //e.Row.Attributes.Add("onclick", "location='VerCidade.aspx?id=" + e.Row.Cells[0].Text + "'");
            }
        }
        base.Render(writer);
    }
}
