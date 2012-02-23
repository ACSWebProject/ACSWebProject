<%@ Page Title="" Language="C#" MasterPageFile="~/LookACity.master" AutoEventWireup="true" CodeFile="PaginaErro.aspx.cs" Inherits="PaginaErro" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1 class="style6">
        <asp:Label ID="LabelPaginaErro" runat="server" 
            meta:resourcekey="LabelPaginaErroResource1" 
            style="font-family: 'Comic Sans MS'; font-weight: 700" Text="Página de Erro"></asp:Label>
    </h1>
<p>
    <asp:Label ID="LabelErro" runat="server" 
        style="font-family: 'Comic Sans MS'; font-weight: 700;" 
        meta:resourcekey="LabelErroResource1" Visible="False">Erro inesperado.</asp:Label>
    <asp:Label ID="LabelErroPermissoes" runat="server" 
        style="font-family: 'Comic Sans MS'; font-weight: 700;" 
        meta:resourcekey="LabelErroPermissoesResource1" Visible="False">Está a tentar a aceder a uma página que não tem permissões para tal.</asp:Label>
    <asp:Label ID="LabelErroPaginaNExiste" runat="server" 
        style="font-family: 'Comic Sans MS'; font-weight: 700;" 
        meta:resourcekey="LabelErroPaginaNExisteResource1" Visible="False">Está a tentar a aceder a uma página que não existe.</asp:Label>
</p>
</asp:Content>

