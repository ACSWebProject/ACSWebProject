<%@ Page Title="" Language="C#" MasterPageFile="~/Utilizador/MasterPageUtilizador.master"
    AutoEventWireup="true" CodeFile="VerCidade.aspx.cs" Inherits="VerCidade" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="width25 floatLeft leftColumn">
        <div align="left">
            <h1>
                <asp:Label ID="LabelNomeCidade" runat="server" Text=""></asp:Label></h1>
            <ul class="sideMenu">
                <li class="here">
                    <ul>
                        <li><a href="#comentarios" title="Saltar para a secção">Ver Comentários</a></li>
                        <li><a href="#addcomentario" title="Saltar para a secção">Adicionar Comentário</a></li>
                </li>
                <li><a href="GaleriaFotos.aspx" title="Ver Galeria Fotos">Fotos</a></li>
            </ul>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <a name="addrating"></a>
                    <div>
                        <asp:Rating ID="Rating1" runat="server" MaxRating="5" StarCssClass="ratingStar" WaitingStarCssClass="savedRatingStar"
                            FilledStarCssClass="filledRatingStar" EmptyStarCssClass="emptyRatingStar" OnChanged="RatingExample_Changed"
                            AutoPostBack="true">
                        </asp:Rating>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="LabelRating" runat="server" Text=""></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- 75 percent width column, aligned to the right -->
    <div class="width75 floatRight">
        <div align="left">
            <!-- Gives the gradient block -->
            <div class="gradient">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="rowodd" style="white-space: nowrap;" valign="bottom">
                            <div style="padding-left: 20px;">
                                <asp:Image Height="235" Width="314" ID="ImageCidade" runat="server" ImageUrl="" />
                            </div>
                        </td>
                        <td class="rowodd" style="width: 100%; padding-left: 30px; padding-top: 30px;" valign="top">
                            <asp:Label ID="label1" runat="server" Text="Pais: " Font-Size="Large" Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_Pais" runat="server" Font-Size="Medium" Text=""></asp:Label>
                            (<asp:HyperLink ID="hyperLink_Wiki" runat="server">Wikipédia</asp:HyperLink>)
                            <br />
                            <asp:Label ID="label2" runat="server" Text="Continente: " Font-Size="Large" Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_Continente" runat="server" Text="" Font-Size="Medium"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="label3" runat="server" Text="Moeda: " Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_Moeda" runat="server" Text=""></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="label4" runat="server" Text="Lingua: " Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_Lingua" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="label5" runat="server" Text="Nº Habitantes: " Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_NumHabitantes" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="label6" runat="server" Text="Área Geografica: " Font-Size="Medium"
                                Font-Bold="true"></asp:Label>
                            <asp:Label ID="label_Area" runat="server" Text=""></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
                <div>
                    <p style="text-align: justify">
                        <!-- se for uma label vai dar problemas quando tiver mais que uma linha de texto-->
                        <asp:Label ID="Descricao_Cidade" runat="server" Text=""></asp:Label>
                    </p>
                </div>
            </div>
            <div class="gradient">
                <a name="comentarios"></a>
                <h2>
                    Comentários</h2>
                <div>
                    <asp:GridView runat="server" Width="100%" GridLines="None" ID="GridViewComentarios"
                        DataKeyNames="ID_Comentario" AutoGenerateColumns="False" CssClass="rowodd" EnableModelValidation="True"
                        ShowHeader="False">
                        <AlternatingRowStyle CssClass="roweven" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <blockquote>
                                        <p>
                                            <%# DataBinder.Eval(Container.DataItem, "Comentario")%></p>
                                        <span class="block small grey">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="Contact snop"><%# DataBinder.Eval(Container.DataItem, "UserName")%></a>&nbsp;&nbsp;
                                            on
                                            <%# DataBinder.Eval(Container.DataItem, "Data")%></span>
                                    </blockquote>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="gradient">
                <a name="addcomentario"></a>
                <h2>
                    Adicionar Comentário</h2>
                <div>
                    <form id="dummy" action="" method="post">
                    <p>
                        <asp:TextBox ID="TextBoxComentario" runat="server" TextMode="MultiLine" Rows="5"
                            CssClass="width75"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="button" OnClick="ButtonSubmit_Click" />
                        <input type="reset" value="Reset" class="button" />
                    </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
