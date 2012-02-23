using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Utilizador_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("Utilizador") == true)
            {
                if (!Page.IsPostBack)
                {
                    GridView1.DataSource = GetNewCities();
                    GridView1.DataBind();
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

    private object GetNewCities()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetAllNewCities", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            //Cmd.Parameters.AddWithValue("@Family", "");
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

    protected void GridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int rowNumber = int.Parse(e.CommandArgument.ToString());
            if (rowNumber >= 5)
            {
                rowNumber = rowNumber - 5;
            }
            Label aux = (Label)GridView1.Rows[rowNumber].FindControl("LabelId");
            int idCidade = Convert.ToInt32(aux.Text);
            Session["IdCidade"] = idCidade;

            Response.Redirect("VerCidade.aspx");
        }
    }

    protected override void Render(System.Web.UI.HtmlTextWriter writer)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                row.Attributes.Add("onmouseover", "this.style.cursor='hand'; this.style.backgroundColor='orange';");
                row.Attributes.Add("onmouseout", "this.style.backgroundColor='';");
                //Add onclick attribute to select row.
                //e.Row.Attributes.Add("onclick", String.Format("javascript:__doPostBack('GridView1','Select${0}')", e.Row.RowIndex));
                row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + row.DataItemIndex, true);
                //e.Row.Attributes.Add("onclick", "location='VerCidade.aspx?id=" + e.Row.Cells[0].Text + "'");
            }
        }
        base.Render(writer);
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = GetNewCities();
        GridView1.DataBind();
    }
}