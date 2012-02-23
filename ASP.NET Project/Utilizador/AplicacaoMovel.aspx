<%@ Page Title="" Language="C#" MasterPageFile="~/Utilizador/MasterPageUtilizador.master" AutoEventWireup="true" CodeFile="AplicacaoMovel.aspx.cs" Inherits="Utilizador_AplicacaoMovel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="gradient">
        <h2>Aplicação Android</h2>

        <table>
            <tr>
                <td><img src="../images/android.png" style="height: 147px; width: 163px" /></td>
                <td>Para dar a possibilidade ao utilizador de consultar cidades da Europa quando desejar, é disponibilizada
        uma aplicação android com uma descrição breve das cidades.
                    <br />
                    Esta aplicação possibilita também visualizar as cidades no google maps
                    <br />
                    Faça download <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://market.android.com/?hl=en">aqui</asp:HyperLink>
                    </td>
            </tr>
        </table>

        <h3>Screenshots da aplicação:</h3>
        &nbsp;<img src="../images/20120222112144.png" style="height: 362px; width: 240px" />
        &nbsp;<img src="../images/20120222112226.png" style="height: 362px; width: 240px" />
        &nbsp;<img src="../images/20120222112247.png" style="height: 362px; width: 240px" />
        &nbsp;<img src="../images/screenshot-1329914874198.png" style="height: 362px; width: 240px" />
        </div>
</asp:Content>

