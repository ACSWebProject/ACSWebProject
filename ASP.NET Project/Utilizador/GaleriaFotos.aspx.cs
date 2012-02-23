using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.IO;

public partial class GaleriaFotos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("Utilizador") == true)
            {
                string idCidade = Session["IdCidade"].ToString();
                if (!Page.IsPostBack)
                {
                    preencherGaleria(idCidade);
                    preencherDescricao(idCidade);
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

    protected void preencherGaleria(string cidade)
    {
        DataTable dTable = (DataTable)GetFotos(cidade);

        string fotos = "";
        int numFotos = 0;
        foreach (DataRow row in dTable.Rows)
        {
            numFotos++;

            fotos = fotos + "<figure  class=\"cap-left\">" +
                   "<a href=\"" + row["URL"].ToString() + "\"  title=\"" + row["Descricao"].ToString() + "\" rel=\"images\" ><img width=\"200px\" height=\"200px\" src=\"" + row["URL"].ToString() + "\" alt=\"\"></a><br/>" +
                   "<figcaption>" + row["Descricao"].ToString() + "&nbsp;&nbsp;</figcaption> </figure>";

        }

        if (numFotos == 0)
        {
            divimages.InnerHtml = "<center>Não existem fotos da cidade seleccionada</center>";
        }
        else
        {
            divimages.InnerHtml = fotos + "<br/>";
        }
    }

    protected void preencherDescricao(string cidade)
    {
        DataTable dTable = (DataTable)GetDescricao(cidade);

        foreach (DataRow row in dTable.Rows)
        {
            NomeCidade.InnerHtml = row["Nome"].ToString();
            DescricaoCidade.InnerHtml = row["Descricao"].ToString();
        }
    }

    private object GetDescricao(String idCidade)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetDescrByCityID", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Cidade", idCidade);
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


    private object GetFotos(String idCidade)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("GetAllFotosByCityID", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();
        DataTable dTable = new DataTable();

        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@ID_Cidade", idCidade);
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

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUpload.HasFile)
        {
            try
            {
                if (FileUpload.PostedFile.ContentType == "image/jpeg")
                {
                    if (FileUpload.PostedFile.ContentLength < 102400000)
                    {
                        MembershipUser myObject = Membership.GetUser();
                        string UserID = myObject.ProviderUserKey.ToString();

                        string filename = Session["IdCidade"].ToString() + "-" + DateTime.Now.ToString("yyyyMMddHHmmss") + "." + Path.GetExtension(FileUpload.FileName).Substring(1); //Path.GetFileName(FileUpload.FileName).get;

                        FileUpload.SaveAs(Server.MapPath("~/images/Cidades/") + filename);
                        insertFoto(filename);
                        StatusLabel.Text = "Estado do Upload: Ficheiro enviado!";
                        StatusLabel.Visible = true;
                    }
                    else
                        StatusLabel.Text = "Estado do Upload: The file has to be less than 100 Mb!";
                }
                else
                    StatusLabel.Text = "Estado do Upload: Apenas são aceites ficheiros JPEG!";
            }
            catch (Exception ex)
            {
                //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
        else
        {
            Label2.Text = "Tem que escolher um ficheiro!";
            Label2.Visible = true;
        }

        preencherGaleria(Session["IdCidade"].ToString());
        Accordion1.SelectedIndex = -1;
        TextBoxDescricao.Text = "";
    }

    public bool insertFoto(string filename)
    {
        int idCidade = Convert.ToInt32(Session["IdCidade"]);
        MembershipUser myObject = Membership.GetUser();
        string UserID = myObject.ProviderUserKey.ToString();
        DateTime date = DateTime.Now;
        string descricao = TextBoxDescricao.Text;
        string url = "../images/Cidades/" + filename;

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        System.Data.SqlClient.SqlCommand Cmd = new System.Data.SqlClient.SqlCommand("insertFoto", Conn);
        System.Data.SqlClient.SqlDataAdapter dAdapter = new System.Data.SqlClient.SqlDataAdapter();


        using (Conn)
        {
            Conn.Open();
            Cmd.Parameters.AddWithValue("@URL", url);
            Cmd.Parameters.AddWithValue("@Descricao", descricao);
            Cmd.Parameters.AddWithValue("@Data", date);
            Cmd.Parameters.AddWithValue("@ID_Utilizador", UserID);
            Cmd.Parameters.AddWithValue("@ID_Cidadde", idCidade);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.ExecuteNonQuery();
        }

        Cmd.Dispose();
        if (Conn.State == ConnectionState.Open)
            Conn.Close();
        Conn.Dispose();

        return true;
    }
}