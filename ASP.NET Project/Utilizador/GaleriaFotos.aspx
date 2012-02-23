<%@ Page Title="" Language="C#" MasterPageFile="~/Utilizador/MasterPageUtilizador.master"
    AutoEventWireup="true" CodeFile="GaleriaFotos.aspx.cs" Inherits="GaleriaFotos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .textEntry
        {
        }
        
        figure
        {
            display: block;
            position: relative;
            float: left;
            overflow: hidden;
            margin: 0 20px 20px 0;
        }
        figcaption
        {
            position: absolute;
            background: black;
            background: rgba(0,0,0,0.75);
            color: white;
            padding: 10px 20px;
            opacity: 0;
            -webkit-transition: all 0.6s ease;
            -moz-transition: all 0.6s ease;
            -o-transition: all 0.6s ease;
        }
        figure:hover figcaption
        {
            opacity: 1;
        }
        figure:before
        {
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
            -moz-border-radius: 12px;
            border-radius: 12px;
            text-align: center;
            font-size: 14px;
            line-height: 24px;
            -moz-transition: all 0.6s ease;
            opacity: 0.75;
        }
        figure:hover:before
        {
            opacity: 0;
        }
        
        .cap-left:before
        {
            bottom: 10px;
            left: 10px;
        }
        .cap-left figcaption
        {
            bottom: 0;
            left: -30%;
        }
        .cap-left:hover figcaption
        {
            left: 0;
        }
        
        .cap-right:before
        {
            bottom: 10px;
            right: 10px;
        }
        .cap-right figcaption
        {
            bottom: 0;
            right: -30%;
        }
        .cap-right:hover figcaption
        {
            right: 0;
        }
        
        .cap-top:before
        {
            top: 10px;
            left: 10px;
        }
        .cap-top figcaption
        {
            left: 0;
            top: -30%;
        }
        .cap-top:hover figcaption
        {
            top: 0;
        }
        
        .cap-bot:before
        {
            bottom: 10px;
            left: 10px;
        }
        .cap-bot figcaption
        {
            left: 0;
            bottom: -30%;
        }
        .cap-bot:hover figcaption
        {
            bottom: 0;
        }
        .style1
        {
            width: 100%;
            float: left;
        }
    </style>
    <link href="../Styles/colorbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.colorbox-min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("a[rel='images']").colorbox({ transition: "fade" });
        });

        function pageLoad(sender, args) {
            if (args.get_isPartialLoad()) {
                $("a[rel='images']").colorbox({ transition: "fade" });
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="width25 floatLeft leftColumn" style="background-color: #444; border-color: White;
        border-style: groove; padding-left: 5px;">
        <h1 id="NomeCidade" runat="server">
        </h1>
        <p align="justify" id="DescricaoCidade" runat="server">
        </p>
    </div>
    <!-- 75 percent width column, aligned to the right -->
    <div class="width75 floatRight">
        <%--        <h5>
            <a href="AdicionarFoto.aspx" title="Adicionar Fotografia">Adicionar Fotografia</a>
        </h5>--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
            <asp:Accordion ID="Accordion1" runat="server" RequireOpenedPane="false" SelectedIndex="-1">
                <Panes>
                    <asp:AccordionPane runat="server">
                        <Header>
                            <div align="left" style="padding-left:30px;">
                            <h4><img src="../images/Pictures-Canon-icon.png" />Adicionar Fotografia
                            </h4>
                            </div>
                        </Header>
                        <Content>
                            <div style="padding-left:60px;">
                            <asp:Label ID="FileUploadLabel" runat="server" Text="Escolha um ficheiro: "></asp:Label>
                            &nbsp;
                            <asp:FileUpload ID="FileUpload" runat="server" />
                            &nbsp; &nbsp;
                            <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Insira uma descrição: "></asp:Label>
                            <asp:TextBox ID="TextBoxDescricao" runat="server">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDescricao"
                                ErrorMessage="Tem que inserir uma descrição">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
                            &nbsp;
                            <asp:Label runat="server" ID="StatusLabel" Visible="false" Text="Estado do Upload: " />
                            <br /><br />
                            </div>
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <div align="right" id="divimages" runat="server" style="center;">
                            </div>
                        </td>
                    </tr>
                </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
