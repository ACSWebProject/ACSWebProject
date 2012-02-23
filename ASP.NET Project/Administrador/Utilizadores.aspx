<%@ Page Title="Gestão de Utilizadores" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Utilizadores.aspx.cs" Inherits="About" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
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
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="Panel1" runat="server" Visible="true">
    <center>
    <asp:Table ID="Filtro" runat="server">
    <asp:TableRow>
    <asp:TableCell><asp:Button ID="Todos" runat="server" Text="Todos" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="A" runat="server" Text="A" onclick="Button_Click" /></asp:TableCell>
    <asp:TableCell><asp:Button ID="B" runat="server" Text="B" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="C" runat="server" Text="C" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="D" runat="server" Text="D" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="E" runat="server" Text="E" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="F" runat="server" Text="F" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="G" runat="server" Text="G" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="H" runat="server" Text="H" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="I" runat="server" Text="I" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="J" runat="server" Text="J" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="K" runat="server" Text="K" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="L" runat="server" Text="L" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="M" runat="server" Text="M" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="N" runat="server" Text="N" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="O" runat="server" Text="O" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="P" runat="server" Text="P" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="Q" runat="server" Text="Q" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="R" runat="server" Text="R" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="S" runat="server" Text="S" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="T" runat="server" Text="T" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="U" runat="server" Text="U" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="V" runat="server" Text="V" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="W" runat="server" Text="W" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="X" runat="server" Text="X" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="Y" runat="server" Text="Y" onclick="Button_Click"/></asp:TableCell>
    <asp:TableCell><asp:Button ID="Z" runat="server" Text="Z" onclick="Button_Click"/></asp:TableCell>
    </asp:TableRow>
    </asp:Table>
        </center>
    <br />
    
    <asp:ListView ID="ListView1" runat="server" DataSourceID="utilizadores" 
                    DataKeyNames="UserId">
        <AlternatingItemTemplate>
     
            <ul style="background-color: #FFF8DC;" >
            <b>Username:</b>
                <asp:Label ID="UserNameLabel"  runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                <b>Email:</b>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                <b>Data de Criação:</b>
                <asp:Label ID="CreateDateLabel" runat="server" 
                    Text='<%# Eval("CreateDate") %>' />
                <br />
                <b>Data de Último Login:</b>
                <asp:Label ID="LastLoginDateLabel" runat="server" 
                    Text='<%# Eval("LastLoginDate") %>' />
                <br />
                <b>Data da Última Actividade:</b>
                <asp:Label ID="LastActivityDateLabel" runat="server" 
                    Text='<%# Eval("LastActivityDate") %>' />
                <br />
                 <asp:Button ID="btnComentariosUtilizador" runat="server" Text="Lista de Comentários" CommandArgument='<%# Eval("UserId") %>' onclick="Button2_Click" /> 
                 <asp:Button ID="btnRemoverUtilizador" runat="server" Text="Remover Utilizador" CommandArgument='<%# Eval("UserId") %>' onclick="Button3_Click" />
              <asp:ConfirmButtonExtender ID="remover_UtilizadorExtender" runat="server" ConfirmText="Deseja revomer o utilizador?" Enabled="True" TargetControlID="btnRemoverUtilizador"></asp:ConfirmButtonExtender>
                   
            </ul>
        </AlternatingItemTemplate>
        <EmptyDataTemplate >
        <center>
        <br />
            Não existem utilizadores correspondetes à sua procura
        </center>
        </EmptyDataTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
      
    <ItemTemplate>
        <ul style="background-color: #DCDCDC;color: #000000;">
            <font color="gray"><b>Username:</b></font>
            <asp:Label ID="UserNameLabel" ForeColor="GrayText" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            <font color="gray"><b>Email:</b></font>
            <asp:Label ID="EmailLabel" ForeColor="GrayText" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            <font color="gray"><b>Data de Criação:</b></font>
            <asp:Label ID="CreateDateLabel" ForeColor="GrayText" runat="server" 
                Text='<%# Eval("CreateDate") %>' />
            <br />
            <font color="gray"><b>Data do Último Login:</b></font>
            <asp:Label ID="LastLoginDateLabel" ForeColor="GrayText" runat="server" 
                Text='<%# Eval("LastLoginDate") %>' />
            <br />
            <font color="gray"><b>Data da Última Actividade:</b></font>
            <asp:Label ID="LastActivityDateLabel" ForeColor="GrayText" runat="server" 
                Text='<%# Eval("LastActivityDate") %>' />
            <br />
            <asp:Button ID="btnComentariosUtilizador" runat="server" Text="Lista de Comentários" CommandArgument='<%# Eval("UserId") %>' onclick="Button2_Click" />         
             <asp:Button ID="btnRemoverUtilizador" runat="server" Text="Remover Utilizador" CommandArgument='<%# Eval("UserId") %>' onclick="Button3_Click" />
              <asp:ConfirmButtonExtender ID="remover_UtilizadorExtender" runat="server" ConfirmText="Deseja revomer o utilizador?" Enabled="True" TargetControlID="btnRemoverUtilizador"></asp:ConfirmButtonExtender>
            
        </ul>
    </ItemTemplate>
    <LayoutTemplate>      
        <ul ID="itemPlaceholderContainer" runat="server" 
            style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
        </div>
    </LayoutTemplate>
    </asp:ListView>

    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <asp:Label ID="Label1" runat="server" Text="Label23"></asp:Label><br />
        <asp:LinkButton ID="Link" runat="server" onclick="Link_Click"><< Voltar</asp:LinkButton>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="utilizadores" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>"        
        SelectCommand="SELECT UserId, UserName, Email, CreateDate, LastLoginDate, LastActivityDate FROM vw_aspnet_MembershipUsers WHERE (UserName != 'Admin')">
</asp:SqlDataSource>

    <asp:SqlDataSource ID="comentariosUtilizador" runat="server" ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>"></asp:SqlDataSource>
</asp:Content>
