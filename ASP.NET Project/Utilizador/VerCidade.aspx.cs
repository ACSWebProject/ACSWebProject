using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;

public partial class VerCidade : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("Utilizador") == true)
            {
                if (!Page.IsPostBack)
                {
                    int idCidade = Convert.ToInt32(Session["IdCidade"]);
                    if (idCidade != 0)
                    {
                        fillData(getCidade(idCidade));
                    }
                    else
                    {
                        Response.Redirect("..\\Utilizador\\Default.aspx");
                    }
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

    private DataRow getCidade(int ID_Cidade)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetCity", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Cidade", ID_Cidade);
            Cmd.CommandType = CommandType.StoredProcedure;
            dAdapter.SelectCommand = Cmd;
            dAdapter.Fill(dTable);

            dAdapter.Dispose();
        }

        Cmd.Dispose();
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();

        return (DataRow)dTable.Rows[0];
    }

    private void fillData(DataRow Row)
    {
        LabelNomeCidade.Text = Row["Nome"].ToString();
        ImageCidade.ImageUrl = Row["Bandeira"].ToString();
        label_Moeda.Text = Row["NomeMoeda"].ToString();
        label_Lingua.Text = Row["NomeLingua"].ToString();
        label_Continente.Text = Row["NomeContinente"].ToString();
        label_Area.Text = Row["Area"].ToString();
        label_NumHabitantes.Text = Row["Num_Habitantes"].ToString();
        label_Pais.Text = Row["NomePais"].ToString();
        hyperLink_Wiki.NavigateUrl = "http://pt.wikipedia.org/wiki/" + Row["NomePais"].ToString();
        Descricao_Cidade.Text = Row["Descricao"].ToString();
        fillRating(Convert.ToInt32(Row["ID_Cidade"].ToString()));
        fillComentarios();
    }

    private void fillRating(int ID_Cidade)
    {
        double total = 0;
        DataTable dTable = getRatings(ID_Cidade);

        MembershipUser myObject = Membership.GetUser();
        string UserID = myObject.ProviderUserKey.ToString();

        bool findUser = false;
        foreach (DataRow dr in dTable.Rows)
        {
            total += Convert.ToDouble(dr["Classificacao"].ToString());
            if (dr["ID_Utilizador"].ToString() == UserID)
            {
                findUser = true;
            }
        }

        if (dTable.Rows.Count == 0)
        {
            total = 0;
        }
        else
        {
            total = total / dTable.Rows.Count;
        }

        LabelRating.Text = "   Média: " + total;
        Rating1.CurrentRating = Convert.ToInt32(total);

        if (findUser)
        {
            LabelRating.Text += " - Já votou esta cidade!";
            Rating1.ReadOnly = true;
        }

    }


    public DataTable getRatings(int ID_Cidade)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetAllRatingsByCidade", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Cidade", ID_Cidade);
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


    public bool UpdateRating(string userID, int ID_Cidade, double newRating)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("insertRating", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Utilizador", userID);
            Cmd.Parameters.AddWithValue("@ID_Cidade", ID_Cidade);
            Cmd.Parameters.AddWithValue("@Classificação", newRating);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.ExecuteNonQuery();
        }

        Cmd.Dispose();
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();

        return true;
    }

    protected void RatingExample_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        int idCidade = Convert.ToInt32(Session["IdCidade"]);
        double newRating = Convert.ToInt32(e.Value);

        MembershipUser myObject = Membership.GetUser();
        string UserID = myObject.ProviderUserKey.ToString();

        bool result = UpdateRating(UserID, idCidade, newRating);
        if (result)
            fillRating(idCidade);
    }

    private object GetComentarios(String idCidade)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetAllComentariosByCityID", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@idCidade", idCidade);
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

    private void fillComentarios()
    {
        GridViewComentarios.DataSource = GetComentarios(Session["IdCidade"].ToString());
        GridViewComentarios.DataBind();
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        insertComentario();
        fillComentarios();
        TextBoxComentario.Text = "";
    }

    private void insertComentario()
    {
        int idCidade = Convert.ToInt32(Session["IdCidade"]);

        MembershipUser myObject = Membership.GetUser();
        string UserID = myObject.ProviderUserKey.ToString();

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("insertComentario", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Utilizador", UserID);
            Cmd.Parameters.AddWithValue("@ID_Cidade", idCidade);
            Cmd.Parameters.AddWithValue("@Comentario", TextBoxComentario.Text);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.ExecuteNonQuery();
        }

        Cmd.Dispose();
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();
    }
}