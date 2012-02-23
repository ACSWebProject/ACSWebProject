<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Fotos.aspx.cs" Inherits="Fotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
 figure { 
          display: block; 
          position: relative; 
          float: left; 
          overflow: hidden; 
          margin: 0px 20px 20px 0;
          
        }
        figcaption { 
          position: absolute; 
          background: black;
          background: rgba(0,0,0,0.75); 
          color: white; 
          padding: 10px 20px; 
          opacity: 0;
          -webkit-transition: all 0.6s ease;
          -moz-transition:    all 0.6s ease;
          -o-transition:      all 0.6s ease;
        }
        figure:hover figcaption {
          opacity: 1;
        }
        figure:before { 
          content: "?"; 
          position: absolute; 
          font-weight: 800; 
          background: black;
          background: rgba(255,255,255,0.75); 
          text-shadow: 0 0 5px white;
          color: black;
          width: 24px;
          height: 24px;
          -webkit-border-radius: 12px;
          -moz-border-radius:    12px;
          border-radius:         12px;
          text-align: center;
          font-size: 14px;
          line-height: 24px;
          -moz-transition: all 0.6s ease;
          opacity: 0.75;	
        }
               
        figure:hover:before {
          opacity: 0;
        }

        .cap-left:before {  bottom: 60px; left: 10px; }
        .cap-left figcaption { bottom: 53px; left: -30%; }
        .cap-left:hover figcaption { left: 0; }

        .cap-right:before { bottom: 10px; right: 10px; }
        .cap-right figcaption { bottom: 0; right: -30%; }
        .cap-right:hover figcaption { right: 0; }

        .cap-top:before { top: 10px; left: 10px; }
        .cap-top figcaption { left: 0; top: -30%; }
        .cap-top:hover figcaption { top: 0; }

        .cap-bot:before { bottom: 10px; left: 10px; }
        .cap-bot figcaption { left: 0; bottom: -30%;}
        .cap-bot:hover figcaption { bottom: 0; }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <asp:SqlDataSource ID="allFotos" runat="server" 
           ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
    </asp:SqlDataSource>
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
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
  
</asp:Content>

