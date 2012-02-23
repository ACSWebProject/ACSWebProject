<%@ Page Title="" Language="C#" MasterPageFile="~/Utilizador/MasterPageUtilizador.master"
    AutoEventWireup="true" CodeFile="Procurar.aspx.cs" Inherits="Utilizador_Procurar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" tagprefix="asp"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 64px;
            height: 64px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/AutoComplete.asmx" />
        </Services>
    </asp:ScriptManager>
    <div class="gradient">
        <div align="center">
            <img src="../images/Tela.png" /></div>
        <br />
        <center>
            <h2 style="font-size: 40px;">Procurar Cidade</h2>
            <asp:TextBox ID="TextBox1" runat="server" Width="500"></asp:TextBox>
            <asp:AutoCompleteExtender runat="server" ID="autoComplete1" TargetControlID="TextBox1" ServicePath="~/AutoComplete.asmx" ServiceMethod="GetCitiesList" MinimumPrefixLength="1" EnableCaching="true"
             CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" />                                                                                                     
            <asp:Button ID="Button2" runat="server" Text="Procura" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:GridView runat="server" GridLines="None" ID="GridViewCidades" DataKeyNames="Id_Cidade"
            AutoGenerateColumns="False" ShowHeader="False" AllowPaging="True" PageSize="5"
            OnRowCommand="GridView_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging">
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
        </center>
    </div>
</asp:Content>
