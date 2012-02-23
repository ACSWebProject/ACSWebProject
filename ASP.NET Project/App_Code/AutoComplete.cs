using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AutoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class AutoComplete : System.Web.Services.WebService
{

    public AutoComplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string[] GetCitiesList(string prefixText)
    {
        DataSet dtst = new DataSet();
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr_LookACity"].ToString());
        string strSql = "SELECT Nome FROM [dbo].[Cidade] WHERE Nome LIKE '%" + prefixText + "%' ";
        SqlCommand sqlComd = new SqlCommand(strSql, sqlCon);
        sqlCon.Open();
        SqlDataAdapter sqlAdpt = new SqlDataAdapter();
        sqlAdpt.SelectCommand = sqlComd;
        sqlAdpt.Fill(dtst);
        string[] countryName = new string[dtst.Tables[0].Rows.Count];
        int i = 0;
        try
        {
            foreach (DataRow rdr in dtst.Tables[0].Rows)
            {
                countryName.SetValue(rdr["Nome"].ToString(), i);
                i++;
            }
        }
        catch { }
        finally
        {
            sqlCon.Close();
        }
        return countryName;
    }
}
