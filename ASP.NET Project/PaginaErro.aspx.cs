using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaginaErro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string code = Request.QueryString["code"];

        try
        {
            if (code.CompareTo("404") == 0)
            {
                LabelErroPaginaNExiste.Visible = true;
            }
            else
            {
                if (code.CompareTo("403") == 0)
                {
                    LabelErroPermissoes.Visible = true;
                }
                else
                {
                    LabelErro.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            LabelErro.Visible = true;
        }
    }
}