<%@ Page Title="" Language="C#" MasterPageFile="~/Utilizador/MasterPageUtilizador.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Utilizador_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 250px;
            height: 444px;
        }
    </style>
    <style type="text/css">
        .style2
        {
            width: 64px;
            height: 64px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="width25 floatLeft leftColumn">
        <img alt="" class="style1" src="../images/big-ben-picture-8.jpg" /></div>
    <!-- 75 percent width column, aligned to the right -->
    <div class="width75 floatRight">
        <h1>
            Novas Cidades Disponiveis
        </h1>
        <div style="padding-left: 80px;">
            <table>
                <tr>
                    <td style="width: 80%;">
                        <asp:GridView runat="server" GridLines="None" ID="GridView1" DataKeyNames="Id_Cidade"
                            AutoGenerateColumns="False" ShowHeader="False" AllowPaging="True" PageSize="5"
                            OnRowCommand="GridView_RowCommand" Width="90%" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                                        <asp:Image ID="Image1" runat="server" class="style2" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Bandeira")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="Nome" Font-Bold="true" Font-Size="Medium" Text='<%# DataBinder.Eval(Container.DataItem, "Nome")%>'></asp:Label>,
                                        <asp:Label runat="server" ID="NomePais" Font-Bold="true" Font-Size="Medium" Text='<%# DataBinder.Eval(Container.DataItem, "NomePais")%>'></asp:Label><br />
                                        <asp:Label runat="server" ID="Label4" Font-Size="Small" Text="Lingua: "></asp:Label><asp:Label
                                            runat="server" ID="Label2" Font-Size="Small" Text='<%# DataBinder.Eval(Container.DataItem, "Lingua")%>'></asp:Label><br />
                                        <asp:Label runat="server" ID="Label1" Font-Size="Small" Text='<%# DataBinder.Eval(Container.DataItem, "Num_Habitantes")%>'></asp:Label><asp:Label
                                            runat="server" ID="Label3" Font-Size="Small" Text=" habitantes"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td align="left" valign="top" style="width: 20%;">
                        <img src="../images/12284211311154772712sheikh_tuhin_Label_Icon.svg.med.png" style="height: 211px;
                            width: 209px" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
