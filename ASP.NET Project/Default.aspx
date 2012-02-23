<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/LookACity.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<%@ Register Src="~/AjaxControlToolkit/Facebook.ascx" TagName="Facebook" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <div id="fb-root">
    </div>
    <script>        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=153909814681753";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="width25 floatLeft leftColumn">
        <div align="left">
            <div class="gradient">
                <h2 style="font:700 2.5em trebuchet ms, serif;">
                    Top 5 Cidades</h2>
                <asp:GridView ID="GridViewTop" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Cidade"
                    OnSelectedIndexChanged="GridViewTop_SelectedIndexChanged" CssClass="rowodd" GridLines="None"
                    ShowHeader="False" OnRowCommand="GridView_RowCommand">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                &nbsp;&nbsp;<asp:Label runat="server" ID="LabelId" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "Id_Cidade")%>'
                                    Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Nome" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "Nome")%>'></asp:Label>,
                                <asp:Label runat="server" ID="NomePais" Text='<%# DataBinder.Eval(Container.DataItem, "NomePais")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <Columns>
                        <asp:TemplateField HeaderText="Rating">
                            <ItemTemplate>
                                <asp:Rating ID="Rating1" runat="server" MaxRating="5" StarCssClass="ratingStarHome"
                                    WaitingStarCssClass="savedRatingStarHome" FilledStarCssClass="filledRatingStarHome"
                                    EmptyStarCssClass="emptyRatingStarHome" AutoPostBack="true">
                                </asp:Rating>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <%-- <ul class="sideMenu">
                <li class="here">Menu
                    <ul>
                        <li><a href="#Intro" title="Jump to section">Intro</a></li>
                        <li><a href="#Top" title="Jump to section">Top Cidades</a></li>
                    </ul>
                </li>
            </ul>--%>
            <div style="background-color: #444;">
                <div class="fb-like-box" data-href="http://www.facebook.com/pages/LookACity/295379457140971"
                    data-width="248" data-colorscheme="dark" data-show-faces="true" data-border-color="white"
                    data-stream="false" data-header="true">
                </div>
            </div>
        </div>
    </div>
    <!-- 75 percent width column, aligned to the right -->
    <div class="width75 floatRight">
        <div align="left">
            <!-- Gives the gradient block -->
            <div class="gradient">
                <a name="Intro"></a>
                <h1>
                    Experimente o Look!ACity</h1>
                <h2>
                    Venha conhecer novas cidades através deste WebSite. <a href="Account/Register.aspx">
                        Registe-se</a> e viaje entre as mais bonitas cidades da Europa!
                </h2>
                <p>
                    Este website permite-lhe conhecer novas cidades da europa e deixar uma opinião ou
                    uma avaliação sobre as própias!</p>
            </div>
            <div align="center">
                <img alt="" src="images/polaroids_aldeias.png" />
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
            </asp:ScriptManager>
        </div>
    </div>
</asp:Content>
