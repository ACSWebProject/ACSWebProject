using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private static int id_cidade = -1;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            this.Page.Form.Enctype = "multipart/form-data";

            if (Session["PainelAct"] != null)
            {
                int painel = Int32.Parse(Session["PainelAct"].ToString());
                mostrarPainel(painel);
            }
        }
        else
        {
            mostrarPainel(1);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PainelAct2"] = 1;
        if (User.Identity.IsAuthenticated && User.IsInRole("Administrador"))
        {
                string url = Request.Url.AbsoluteUri;
                if (url.Contains("remFoto="))
                {
                    string [] idFoto = url.Split('=');

                    if (Int32.Parse(idFoto[1]) != -1)
                    {
                        allFotosCidade.DeleteCommand = "DELETE FROM foto WHERE id_foto=" + idFoto[1];
                        allFotosCidade.Delete();
                    }
                    //preencherGaleria(id_cidade.ToString());
                    mostrarPainel(3);                
                }
                else
                {
                    if (url.Contains("remCom="))
                    {
                        string[] idCom = url.Split('=');

                        if (Int32.Parse(idCom[1]) != -1)
                        {
                            allComentCidade.DeleteCommand = "DELETE FROM comentario WHERE id_comentario=" + idCom[1];
                            allComentCidade.Delete();
                        }
                        //preencherComentarios(id_cidade.ToString());
                        mostrarPainel(4);
                    }
                }
        }
        else
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Account/Login.aspx");   
        }    
    }
    protected void btnCriarCidade_Click(object sender, EventArgs e)
    {
        Session["Actualizar"] = false;
        mostrarPainel(2);

        criarCidade.Text = "Criar Cidade";

        //Fazer reset aos campos do formulário
        nomeCidade.Text = "";
        descCidade.Text = "";
        areaCidade.Text = "";
        habCidade.Text = "";
        latitude.Text = "";
        longitude.Text = "";
        altitude.Text = "";
        pais.SelectedIndex = -1;
        lingua.SelectedIndex = -1;
        continente.SelectedIndex = -1;
        moeda.SelectedIndex = -1;
        estado.SelectedIndex = -1;
        bandeira.Dispose();
    }

    protected void cancelar_Click(object sender, EventArgs e)
    {
        mostrarPainel(1);
    }
    protected void criarCidade_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        if (bt.Text == "Criar Cidade")
        {
            //Criar o novo conjunto de coordenadas
            inserirCoord.InsertCommand = "INSERT INTO Coordenadas (Latitude,Longitude,Altitude) VALUES ('" + latitude.Text + "','" + longitude.Text + "','" + altitude.Text + "')";
            inserirCoord.Insert();

            //Seleccionar o ID das coordenadas inseridas
            inserirCoord.SelectCommand = "SELECT ID_Coordenadas FROM Coordenadas WHERE Latitude='" + latitude.Text + "' and Longitude='" + longitude.Text + "' and Altitude='" + altitude.Text + "'";
            DataSourceSelectArguments arg = new DataSourceSelectArguments();
            IEnumerable num = inserirCoord.Select(arg);
            IEnumerator num2 = num.GetEnumerator();
            num2.MoveNext();
            DataRowView row = (DataRowView)num2.Current;

            //Criar a imagem no servidor
            string path = "Cidades/unkown.jpg";
            if (bandeira.HasFile)
                path = SaveFile(bandeira.PostedFile);

            //Inserir a nova cidade
            inserirCidade.InsertCommand = "INSERT INTO Cidade (Nome,Descricao, Area, Num_Habitantes, Bandeira, ID_Pais, ID_Moeda, ID_Lingua, ID_Continente, ID_Coordenadas, ID_Estado)" +
                                        "VALUES        ('" + nomeCidade.Text + "','" + descCidade.Text + "','" + areaCidade.Text + "','" + habCidade.Text + "','" + path + "'," + pais.SelectedValue + "," + moeda.SelectedValue + "," + lingua.SelectedValue + "," + continente.SelectedValue + "," + row.Row[0].ToString() + "," + estado.SelectedValue + ")";
            inserirCidade.Insert();
            ListView1.DataBind();
        }
        else
        {
            if (bt.Text == "Actualizar Cidade")
            {
                inserirCoord.SelectCommand = "SELECT Id_coordenadas FROM Coordenadas WHERE Latitude='" + latitude.Text + "' and Longitude='" + longitude.Text + "' and Altitude='" + altitude.Text + "'";
                DataSourceSelectArguments arg = new DataSourceSelectArguments();
                IEnumerable num = inserirCoord.Select(arg);
                IEnumerator num2 = num.GetEnumerator();
                DataRowView row;
                if(num2.MoveNext())
                    row = (DataRowView)num2.Current;
                else
                {
                    inserirCoord.InsertCommand = "INSERT INTO Coordenadas (Latitude,Longitude,Altitude) VALUES ('" + latitude.Text + "','" + longitude.Text + "','" + altitude.Text + "')";
                    inserirCoord.Insert();

                    inserirCoord.SelectCommand = "SELECT ID_Coordenadas FROM Coordenadas WHERE Latitude='" + latitude.Text + "' and Longitude='" + longitude.Text + "' and Altitude='" + altitude.Text + "'";
                    arg = new DataSourceSelectArguments();
                    num = inserirCoord.Select(arg);
                    num2 = num.GetEnumerator();
                    num2.MoveNext();
                    row = (DataRowView)num2.Current;
                }


                string path = "";
                if (bandeira.HasFile)
                {    
                    path = SaveFile(bandeira.PostedFile);
                    inserirCidade.UpdateCommand = "UPDATE cidade SET nome='"+nomeCidade.Text+"', descricao = '"+descCidade.Text+"', area = '"+areaCidade.Text+"', num_habitantes = '"+habCidade.Text+"', bandeira='"+path+"', id_pais="+pais.SelectedValue+", id_moeda = "+moeda.SelectedValue+", id_lingua = "+lingua.SelectedValue+", id_continente = "+continente.SelectedValue + ", id_estado ="+estado.SelectedValue +", id_coordenadas="+row.Row[0].ToString()+"WHERE id_cidade="+id_cidade;
                }else{
                    inserirCidade.UpdateCommand = "UPDATE cidade SET nome='" + nomeCidade.Text + "', descricao = '" + descCidade.Text + "', area = '" + areaCidade.Text + "', num_habitantes = '" + habCidade.Text + "', id_pais=" + pais.SelectedValue + ", id_moeda = " + moeda.SelectedValue + ", id_lingua = " + lingua.SelectedValue + ", id_continente = " + continente.SelectedValue + ", id_estado =" + estado.SelectedValue + ", id_coordenadas=" + row.Row[0].ToString() + " WHERE id_cidade=" + id_cidade;
                }
                
                inserirCidade.Update();

                ListView1.DataBind();
            }
        }

        mostrarPainel(1);
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        string pressedButton = b.ID;

        //Apresentar a lista de acordo com a letra seleccionada
        if (pressedButton == "Todos")
        {
            allCidades.SelectCommand = "SELECT c.id_cidade Id_cidade , c.nome Nome, c.descricao Descricao, c.area Area, c.num_habitantes Habitantes, p.nome Pais, coord.latitude Latitude, coord.longitude Longitude, coord.altitude Altitude, m.nome Moeda, cont.descricao Continente, l.nome Lingua ,c.bandeira Bandeira, e.descricao Estado  FROM Cidade c, Estado e, Pais p, Coordenadas coord, Moeda m, Continente cont, Lingua l WHERE c.id_pais = p.id_pais and c.id_moeda = m.id_moeda and c.id_continente = cont.id_continente and coord.id_coordenadas = c.id_coordenadas and c.id_estado = e.id_estado and l.id_lingua = c.id_lingua ORDER BY c.nome ASC";
            ListView1.DataBind();  
        }
        else 
        {
            allCidades.SelectCommand = "SELECT c.id_cidade Id_cidade, c.nome Nome, c.descricao Descricao, c.area Area, c.num_habitantes Habitantes, p.nome Pais, coord.latitude Latitude, coord.longitude Longitude, coord.altitude Altitude, m.nome Moeda, cont.descricao Continente, l.nome Lingua ,c.bandeira Bandeira, e.descricao Estado  FROM Cidade c, Estado e, Pais p, Coordenadas coord, Moeda m, Continente cont, Lingua l WHERE c.id_pais = p.id_pais and c.id_moeda = m.id_moeda and c.id_continente = cont.id_continente and coord.id_coordenadas = c.id_coordenadas and c.id_estado = e.id_estado and l.id_lingua = c.id_lingua and c.Nome LIKE '[" + pressedButton + "]%' ORDER BY c.nome ASC";
            ListView1.DataBind();
        }
        
    }

    string SaveFile(HttpPostedFile file)
    {
        string savePath = "~/images/Cidades/";

        //Definir o nome e o directório destino do ficheiro
        string fileName = bandeira.FileName;
        string pathToCheck = savePath + fileName;

        //Verificar se o ficheiro existe
        string tempfileName = ""; 
        if (System.IO.File.Exists(pathToCheck))
        {
            int counter = 2;
            while (System.IO.File.Exists(pathToCheck))
            {
                tempfileName = counter.ToString() + fileName;
                pathToCheck = savePath + tempfileName;
                counter++;
            }

            fileName = tempfileName;
        }
       
        //Gravar o ficheiro no directório do servidor
        savePath += fileName;
        bandeira.SaveAs(Server.MapPath(savePath));

        return savePath;
    }

    protected void btnFotos_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        string cidade = bt.CommandArgument.ToString();

        mostrarPainel(3);

        id_cidade = Int32.Parse(cidade);
        preencherGaleria(cidade);
        
    }
    protected void btnFotosVoltar_Click(object sender, EventArgs e)
    {
        mostrarPainel(1);
    }

    protected void btnComentarios_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        string cidade = bt.CommandArgument.ToString();

        mostrarPainel(4);

        id_cidade = Int32.Parse(cidade);
        preencherComentarios(cidade);
    }

    protected void btnComentVoltar_Click(object sender, EventArgs e)
    {
        mostrarPainel(1);
    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        string cidade = bt.CommandArgument.ToString();

        criarCidade.Text = "Actualizar Cidade";
        Session["Actualizar"] = true;

        obterDadosCidade(cidade);
        
        mostrarPainel(2);
    }

    protected void obterDadosCidade(string cidade)
    {
        dadosCidade.SelectCommand = "SELECT c.nome, c.descricao, c.area, c.num_habitantes, c.id_pais, c.id_moeda, c.id_lingua, c.id_continente, c.id_estado, co.latitude, co.longitude, co.altitude  FROM Coordenadas co , Cidade c WHERE c.id_coordenadas = co.id_coordenadas and c.id_cidade=" + cidade;
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable c = dadosCidade.Select(arg);
        IEnumerator c2 = c.GetEnumerator();
        c2.MoveNext();

        DataRowView row = (DataRowView)c2.Current;

        nomeCidade.Text = row.Row[0].ToString();
        descCidade.Text = row.Row[1].ToString();
        areaCidade.Text = row.Row[2].ToString();
        habCidade.Text = row.Row[3].ToString();
        latitude.Text = row.Row[9].ToString();
        longitude.Text = row.Row[10].ToString();
        altitude.Text = row.Row[11].ToString();
        pais.SelectedValue = row.Row[4].ToString();
        lingua.SelectedValue = row.Row[6].ToString();
        continente.SelectedValue = row.Row[7].ToString();
        moeda.SelectedValue = row.Row[5].ToString();
        estado.SelectedValue = row.Row[8].ToString();

        id_cidade = Int32.Parse(cidade);
    }

    protected void btnRemover_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        string cidade = bt.CommandArgument.ToString();

        allCidades.DeleteCommand = "DELETE FROM rating where Id_Cidade="+cidade;
        allCidades.Delete();

        allCidades.DeleteCommand = "DELETE FROM foto where Id_Cidade="+cidade;
        allCidades.Delete();

        allCidades.DeleteCommand = "DELETE FROM comentario where Id_Cidade="+cidade;
        allCidades.Delete();

        allCidades.DeleteCommand = "DELETE FROM cidade where Id_Cidade="+cidade;
        allCidades.Delete();

        ListView1.DataBind();
    }

    protected void preencherComentarios(string cidade)
    {
        allComentCidade.SelectCommand = "SELECT co.id_comentario Id_Comentario, co.comentario Comentario, c.Nome, co.Data, u.username FROM Comentario co, Cidade c, aspnet_Users u WHERE co.id_cidade =" + cidade + "and co.id_cidade = c.id_cidade and co.id_utilizador=u.userid ORDER BY co.data DESC";
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable c = allComentCidade.Select(arg);
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
                          "<span>" + data.ToShortDateString() + " - " + row.Row[4].ToString() + "</span></a>  </li></ul></div></td><td width=\"20%\"><a href=\"Cidades.aspx?remCom=" + row.Row[0].ToString() + "\"><img height=\"20px\" width=\"20px\" src=\"Icons/remCom.png\" onClick=\"if(confirm('Deseja eliminar o comentário seleccionado?')); else return false;\" title=\"Remover Comentário\"/></a></td></tr></table>";

            
        }

        if (numComentarios == 0)
        {
            Label3.Text = "<center>Não existem comentários da cidade seleccionada</center>";
        }
        else
        {
            Label3.Text = comentarios + "<br/>";
        }
    }

    protected void preencherGaleria(string cidade)
    {
        allFotosCidade.SelectCommand = "SELECT f.id_foto, f.descricao, f.URL, c.Nome FROM Foto f, Cidade c WHERE f.id_cidade = c.id_cidade and f.id_cidade = " + cidade + " ORDER BY f.data DESC";
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        IEnumerable ft = allFotosCidade.Select(arg);
        IEnumerator ft2 = ft.GetEnumerator();

        string fotos = "";
        int numFotos = 0;
        while (ft2.MoveNext())
        {
            numFotos++;
            DataRowView row = (DataRowView)ft2.Current;

            fotos = fotos + "<figure  class=\"cap-left\">" +
                   "<a href=\"" + row.Row[2].ToString() + "\" class=\"top_up\" toptions=\"group = imagens\"><img width=\"200px\" height=\"200px\" src=\"" + row.Row[2].ToString() + "\" alt=\"\"></a><br/>" +
                   "<figcaption>" + row.Row[1].ToString() + "&nbsp;&nbsp;<a href=\"Cidades.aspx?remFoto=" + row.Row[0].ToString() + "\" onClick=\"if(confirm('Deseja eliminar a foto seleccionada?')); else return false;\"><img src=\"Icons/remFoto.png\" heigth=\"20px\" width=\"20px\" title=\"Remover Foto\"/></a></figcaption> </figure>";

        }

        if (numFotos == 0)
        {
            Label2.Text = "<center>Não existem fotos da cidade seleccionada</center>";
        }
        else
        {
            Label2.Text = fotos + "<br/>";
        }
    }

    protected void mostrarPainel(int painel)
    {
        Session["PainelAct"] = painel;
        if (painel == 1)
        {          
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
        }
        else
        {
            if (painel == 2)
            {
                bool act = Boolean.Parse(Session["Actualizar"].ToString());
                if (act)
                {
                    criarCidade.Text = "Actualizar Cidade";
                    obterDadosCidade(id_cidade.ToString());
                }
                Panel1.Visible = false;
                Panel2.Visible = true;
                Panel3.Visible = false;
                Panel4.Visible = false;
            }
            else 
            {
                if (painel == 3)
                {
                    preencherGaleria(id_cidade.ToString());
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = true;
                    Panel4.Visible = false;
                }
                else
                {
                    if (painel == 4)
                    {
                        preencherComentarios(id_cidade.ToString());
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = true;
                    }
                }
            }
        }
    }
}



