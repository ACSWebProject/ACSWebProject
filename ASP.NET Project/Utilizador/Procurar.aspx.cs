using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Utilizador_Procurar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("Utilizador") == true)
            {
                if (!Page.IsPostBack)
                {
                  
                }
            }
            else
            {
                Response.Redirect("..\\error.aspx?code=403");
            }
        }
        else
        {
            Response.Redirect("..\\Account\\Login.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
    {
        int idCidade = Convert.ToInt32(e.CommandArgument);
        Session["IdCidade"] = idCidade;

        Response.Redirect("VerCidade.aspx");
    }

    private object findCities(string palavraChave)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("FindCities", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@KeyWord",palavraChave);
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

    protected void Button2_Click(object sender, EventArgs e)
    {
        String palavraChave = TextBox1.Text;

        GridViewCidades.DataSource = findCities(palavraChave);
        GridViewCidades.DataBind();
    }

    protected void GridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int rowNumber = int.Parse(e.CommandArgument.ToString());
            if (rowNumber >= 5)
            {
                rowNumber = rowNumber - 5;
            }
            Label aux = (Label)GridViewCidades.Rows[rowNumber].FindControl("LabelId");
            int idCidade = Convert.ToInt32(aux.Text);
            Session["IdCidade"] = idCidade;

            Response.Redirect("VerCidade.aspx");
        }
    }

    protected override void Render(System.Web.UI.HtmlTextWriter writer)
    {
        foreach (GridViewRow row in GridViewCidades.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                row.Attributes.Add("onmouseover", "this.style.cursor='hand'; this.style.backgroundColor='orange';");
                row.Attributes.Add("onmouseout", "this.style.backgroundColor='';");
                //Add onclick attribute to select row.
                //e.Row.Attributes.Add("onclick", String.Format("javascript:__doPostBack('GridView1','Select${0}')", e.Row.RowIndex));
                row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(GridViewCidades, "Select$" + row.DataItemIndex, true);
                //e.Row.Attributes.Add("onclick", "location='VerCidade.aspx?id=" + e.Row.Cells[0].Text + "'");
            }
        }
        base.Render(writer);
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCidades.PageIndex = e.NewPageIndex;
        String palavraChave = TextBox1.Text;

        GridViewCidades.DataSource = findCities(palavraChave);
        GridViewCidades.DataBind();
    }
}