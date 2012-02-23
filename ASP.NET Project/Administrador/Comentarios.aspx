<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Comentarios.aspx.cs" Inherits="Comentarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
 #links ul {
                list-style-type: none;
                width: 93%;
                margin: -8px 0;
        } 

        #links li {
                border-bottom: 1px dotted #999;
                border-width: 1px 0;
                margin: 5px 0;
        }

        #links li a { 
                color: #990000;
                display: block;
                font: bold 120% Arial, Helvetica, sans-serif;
                padding:5px;
                text-decoration: none;
        }

         * html #links li a {  /* make hover effect work in IE */
	        width: 400px;
        }

        #links li a:hover {
                background: #ffffcc;
        }

        #links a em { 
                color: #333;
                display: block;
                font: normal 85% Verdana, Helvetica, sans-serif;
                line-height: 125%; 
        }

        #links a span {
                color: #125F15;
                font: normal 70% Verdana, Helvetica, sans-serif;
                line-height: 150%;
        }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:SqlDataSource ID="allComent" runat="server" 
           ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>"  >
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    Ordenar por: <asp:DropDownList ID="DropDownList1" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Selected="True">Data</asp:ListItem>
        <asp:ListItem>Cidade</asp:ListItem>
        <asp:ListItem>Utilizador</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TextBox1" Visible="false" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Ordenar" 
        onclick="Ordenar_Click" />
    <br />
    <asp:CheckBox ID="Avan" Text="Pesquisa Avançada" runat="server" 
        oncheckedchanged="Avan_CheckedChanged" Visible="false" AutoPostBack="true"/>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="true"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

