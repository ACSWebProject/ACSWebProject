<%@ Page Title="Gestão de Cidades" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Cidades.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .textEntry
        {}
        
        figure { 
          display: block; 
          position: relative; 
          float: left; 
          overflow: hidden; 
          margin: 0 20px 20px 0;
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

        .cap-left:before {  bottom: 10px; left: 10px; }
        .cap-left figcaption { bottom: 0; left: -30%; }
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
        
    
        <asp:Panel ID="Panel1" runat="server" >
        <asp:LinkButton ID="btnCriarCidade" runat="server" onclick="btnCriarCidade_Click">Criar Cidade</asp:LinkButton>
            <br />
            <br />
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
            <asp:ListView ID="ListView1" runat="server" DataSourceID="allCidades">
                <AlternatingItemTemplate>
                 <ul style="background-color: #FFF8DC;">
                <table><tr><td > 
                        <asp:Image ID="Image3" ImageUrl='<%# Eval("Bandeira") %>' Height="180px" Width="210px" runat="server" />
                        <%--<asp:Label ID="BandeiraLabel" runat="server" Text='<%# Eval("Bandeira") %>' />--%></td><td></td><td><b>Nome:</b>
                        <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                        <br /><br />
                        <b>Descricao:</b>
                        <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                        <br /><br />
                        
                        <b>Continente:</b>
                        <asp:Label ID="ContinenteLabel" runat="server" 
                            Text='<%# Eval("Continente") %>' />
                        &nbsp;&nbsp;
                        <b>Pais:</b>
                        <asp:Label ID="PaisLabel" runat="server" Text='<%# Eval("Pais") %>' />
                        &nbsp;&nbsp;
                        <b>Moeda:</b>
                        <asp:Label ID="MoedaLabel" runat="server" Text='<%# Eval("Moeda") %>' />
                        &nbsp;&nbsp;
                        <b>Lingua:</b>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Lingua") %>' />
                        <br />
                        <b>Area:</b>
                        <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                        &nbsp;&nbsp;
                        <b>Habitantes:</b>
                        <asp:Label ID="HabitantesLabel" runat="server" 
                            Text='<%# Eval("Habitantes") %>' />
                        <br />
                        <b>Latitude:</b>
                        <asp:Label ID="LatitudeLabel" runat="server" Text='<%# Eval("Latitude") %>' />
                        &nbsp;&nbsp;
                        <b>Longitude:</b>
                        <asp:Label ID="LongitudeLabel" runat="server" Text='<%# Eval("Longitude") %>' />
                        &nbsp;&nbsp;
                        <b>Altitude:</b>
                        <asp:Label ID="AltitudeLabel" runat="server" Text='<%# Eval("Altitude") %>' />
                        <br />
                        <b>Estado:</b>
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                        <br />
                        <asp:Button ID="btnFotos" runat="server" Text="Galeria de Fotos" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnFotos_Click" />
                        <asp:Button ID="btnComentarios" runat="server" Text="Lista de Comentários" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnComentarios_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Editar Cidade" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnEditar_Click" />
                        <asp:Button ID="btnRemover" runat="server" Text="Remover Cidade" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnRemover_Click" />
                        <asp:ConfirmButtonExtender ID="remover_ConfirmButtonExtender" runat="server" ConfirmText="Ao remover a cidade, serão removidas todas as suas fotos e comentários! Deseja Continuar?" Enabled="True" TargetControlID="btnRemover"></asp:ConfirmButtonExtender>
                        </td></tr></table>
                        
                   
                    </ul>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                <center>
                <br />
                    Não existem cidades corresponde à sua procura.
                </center>
                </EmptyDataTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                <ul style="background-color: #DCDCDC">
                                  <table><tr style="background-color: #DCDCDC"><td> 
                        <asp:Image ID="Image3" ImageUrl='<%# Eval("Bandeira") %>' Height="180px" Width="210px" runat="server" />
                        <%--<asp:Label ID="BandeiraLabel" runat="server" Text='<%# Eval("Bandeira") %>' />--%></td><td></td><td><b>Nome:</b>
                        <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                        <br /><br />
                        <b>Descricao:</b>
                        <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                        <br /><br />
                        
                        <b>Continente:</b>
                        <asp:Label ID="ContinenteLabel" runat="server" 
                            Text='<%# Eval("Continente") %>' />
                        &nbsp;&nbsp;
                        <b>Pais:</b>
                        <asp:Label ID="PaisLabel" runat="server" Text='<%# Eval("Pais") %>' />
                        &nbsp;&nbsp;
                        <b>Moeda:</b>
                        <asp:Label ID="MoedaLabel" runat="server" Text='<%# Eval("Moeda") %>' />
                        &nbsp;&nbsp;
                        <b>Lingua:</b>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Lingua") %>' />
                        <br />
                        <b>Area:</b>
                        <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                        &nbsp;&nbsp;
                        <b>Habitantes:</b>
                        <asp:Label ID="HabitantesLabel" runat="server" 
                            Text='<%# Eval("Habitantes") %>' />
                        <br />
                        <b>Latitude:</b>
                        <asp:Label ID="LatitudeLabel" runat="server" Text='<%# Eval("Latitude") %>' />
                        &nbsp;&nbsp;
                        <b>Longitude:</b>
                        <asp:Label ID="LongitudeLabel" runat="server" Text='<%# Eval("Longitude") %>' />
                        &nbsp;&nbsp;
                        <b>Altitude:</b>
                        <asp:Label ID="AltitudeLabel" runat="server" Text='<%# Eval("Altitude") %>' />
                        <br />
                        <b>Estado:</b>
                        <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                        <br />
                        <asp:Button ID="btnFotos" runat="server" Text="Galeria de Fotos" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnFotos_Click" />
                        <asp:Button ID="btnComentarios" runat="server" Text="Lista de Comentários" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnComentarios_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Editar Cidade" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnEditar_Click" />
                        <asp:Button ID="btnRemover" runat="server" Text="Remover Cidade" CommandArgument='<%# Eval("Id_Cidade") %>' OnClick="btnRemover_Click" />
                        <asp:ConfirmButtonExtender ID="remover_ConfirmButtonExtender" runat="server" ConfirmText="Ao remover a cidade, serão removidas todas as suas fotos e comentários! Deseja Continuar?" Enabled="True" TargetControlID="btnRemover"></asp:ConfirmButtonExtender>
                        </td></tr></table>
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
            <asp:SqlDataSource ID="allCidades" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                SelectCommand="SELECT c.id_cidade Id_Cidade, c.nome Nome, c.descricao Descricao, c.area Area, c.num_habitantes Habitantes, p.nome Pais, coord.latitude Latitude, coord.longitude Longitude, coord.altitude Altitude, m.nome Moeda, cont.descricao Continente, l.nome Lingua ,c.bandeira Bandeira, e.descricao Estado  FROM Cidade c, Estado e, Pais p, Coordenadas coord, Moeda m, Continente cont, Lingua l WHERE c.id_pais = p.id_pais and c.id_moeda = m.id_moeda and c.id_continente = cont.id_continente and coord.id_coordenadas = c.id_coordenadas and c.id_estado = e.id_estado and l.id_lingua = c.id_lingua ORDER BY c.nome ASC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dadosCidade" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
            </asp:SqlDataSource>     
        </asp:Panel>
        
         <asp:Panel ID="Panel2" visible="false" runat="server">
         
        <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="failureNotification" />

        <div class="rightCol"><br /><br /><br /><asp:Image ID="Image1" 
                ImageUrl="http://ieiffeltower.com/wp-content/uploads/2011/09/eiffel_tower_cartoons.jpg" 
                runat="server" Height="595px" Width="410px" /></div>
             

        <div class="leftCol"><div class="accountInfo">
                 <fieldset class="login">
                    <legend>Criar Cidade</legend>
                    <p>
                        <asp:Label ID="lblNomeCidade" runat="server" AssociatedControlID="nomeCidade">Nome da Cidade:</asp:Label>
                        <asp:TextBox ID="nomeCidade" runat="server" CssClass="textEntry" Width="318px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nomeCidadeRequired" runat="server" ControlToValidate="nomeCidade" 
                             CssClass="failureNotification" ErrorMessage="Nome da Cidade é obrigatório." ToolTip="Nome da Cidade é obrigatório." >*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblDescCidade" runat="server" AssociatedControlID="descCidade">Descrição da Cidade:</asp:Label>
                        <asp:TextBox ID="descCidade" runat="server" CssClass="textEntry" 
                            TextMode="MultiLine" Height="70px" Width="318px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="descCidadeRequired" runat="server" ControlToValidate="descCidade" 
                             CssClass="failureNotification" ErrorMessage="Descrição da Cidade é obrigatória." ToolTip="Descrição da Cidade é obrigatória." >*</asp:RequiredFieldValidator>
                    </p>
                     <p>
                        <asp:Label ID="lblArea" runat="server" AssociatedControlID="areaCidade">Área da Cidade:</asp:Label>
                        <asp:TextBox ID="areaCidade" runat="server" CssClass="textEntry" Width="318px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredAreaCidade" runat="server" ControlToValidate="areaCidade" 
                             CssClass="failureNotification" ErrorMessage="Área da Cidade é obrigatória." ToolTip="Área da Cidade é obrigatória." >*</asp:RequiredFieldValidator>
                    </p>

                    <p>
                        <asp:Label ID="lblHab" runat="server" AssociatedControlID="habCidade">Nº de Habitantes da Cidade:</asp:Label>
                        <asp:TextBox ID="habCidade" runat="server" CssClass="textEntry" Width="318px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="habCidade" 
                             CssClass="failureNotification" ErrorMessage="Nº de Habitantes da Cidade é obrigatória." ToolTip="Nº de Habitantes da Cidade é obrigatória." >*</asp:RequiredFieldValidator>
                    </p>
                     <p>
                         <asp:Label ID="lblLatitude" runat="server" AssociatedControlID="latitude" 
                             Height="19px" Width="100px">Latitude:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Longitude:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Altitude:</asp:Label>    
                        <asp:TextBox ID="latitude" runat="server" CssClass="textEntry" Height="17px" 
                             Width="100px"></asp:TextBox>&nbsp;
                         <td><asp:TextBox ID="longitude" runat="server" CssClass="textEntry" Height="17px" 
                             Width="100px"></asp:TextBox>&nbsp;
                         <td><asp:TextBox ID="altitude" runat="server" CssClass="textEntry" Height="17px" 
                             Width="100px"></asp:TextBox>

                    </p>
                    <p>
                        <asp:Label ID="lblBandeira" runat="server" AssociatedControlID="bandeira">Bandeira:</asp:Label>
                        <asp:FileUpload ID="bandeira" runat="server" CssClass="textEntry"/>
                    </p>
                    <p>
                        <asp:Label ID="lblPais" runat="server" AssociatedControlID="pais">Pais:</asp:Label>
                        <asp:DropDownList ID="pais" CssClass="textEntry" runat="server" 
                            DataSourceID="Paises" DataTextField="Nome" DataValueField="ID_Pais">
                        </asp:DropDownList>                   
                        <asp:SqlDataSource ID="Paises" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                            SelectCommand="SELECT [Nome], [ID_Pais] FROM [Pais] ORDER BY [Nome]">
                        </asp:SqlDataSource>
                    </p>
                    <p>
                        <asp:Label ID="lblContinente" runat="server" AssociatedControlID="continente">Continente:</asp:Label>
                        <asp:DropDownList ID="continente" CssClass="textEntry" runat="server" 
                            DataSourceID="Continete" DataTextField="Descricao" 
                            DataValueField="ID_Continente">
                        </asp:DropDownList>
                                           
                        <asp:SqlDataSource ID="Continete" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                            
                            SelectCommand="SELECT [Descricao], [ID_Continente] FROM [Continente] ORDER BY [Descricao]">
                        </asp:SqlDataSource>
                                           
                    </p>

                    <p>
                        <asp:Label ID="lblLingua" runat="server" AssociatedControlID="lingua">Lingua:</asp:Label>
                        <asp:DropDownList ID="lingua" CssClass="textEntry" runat="server" 
                            DataSourceID="linguaCidade" DataTextField="Nome" 
                            DataValueField="ID_Lingua">
                        </asp:DropDownList> 
                                          
                        <asp:SqlDataSource ID="linguaCidade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                            SelectCommand="SELECT [Nome], [ID_Lingua] FROM [Lingua] ORDER BY [Nome]">
                        </asp:SqlDataSource>
                                          
                    </p>

                    <p>
                        <asp:Label ID="lblMoeda" runat="server" AssociatedControlID="moeda">Moeda:</asp:Label>
                        <asp:DropDownList ID="moeda" CssClass="textEntry" runat="server" 
                            DataSourceID="moedaCidade" DataTextField="Nome" DataValueField="ID_Moeda">
                        </asp:DropDownList>                   
                        <asp:SqlDataSource ID="moedaCidade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                            SelectCommand="SELECT [Nome],[ID_Moeda] FROM [Moeda] ORDER BY [Nome]">
                        </asp:SqlDataSource>
                    </p>

                    <p>
                        <asp:Label ID="lblEstado" runat="server" AssociatedControlID="estado">Estado:</asp:Label>
                        <asp:DropDownList ID="estado" CssClass="textEntry" runat="server" 
                            DataSourceID="estadoCidade" DataTextField="Descricao" 
                            DataValueField="ID_Estado">
                        </asp:DropDownList>                   
                        <asp:SqlDataSource ID="estadoCidade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" 
                            SelectCommand="SELECT * FROM [Estado] ORDER BY [Descricao]">
                        </asp:SqlDataSource>
                   </p>
                   
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="cancelar" runat="server" Text="Cancelar" CausesValidation="false"
                        onclick="cancelar_Click"/> 
                       
                         <asp:ConfirmButtonExtender ID="cancelar_ConfirmButtonExtender" 
                        runat="server" ConfirmText="Ao cancelar todos os dados introduzidos irão ser eliminados! Deseja cancelar?" Enabled="True" TargetControlID="cancelar">
                    </asp:ConfirmButtonExtender>
                       
                         <asp:Button ID="criarCidade" runat="server" Text="Criar Cidade" 
                        onclick="criarCidade_Click"/>

                        <asp:SqlDataSource ID="inserirCoord" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
                        </asp:SqlDataSource>
                           
                        <asp:SqlDataSource ID="inserirCidade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
                        </asp:SqlDataSource>
                </p>
            </div>
            </div>
       
        
        </asp:Panel>
        <asp:Panel ID="Panel3" Visible="false" runat="server">
        <table width="100%"><tr><td align="center"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td></tr>
        <tr><td><asp:LinkButton ID="btnFotosVoltar" runat="server" onclick="btnFotosVoltar_Click"><< Voltar</asp:LinkButton></td></tr>
        </table>
       
        <asp:SqlDataSource ID="allFotosCidade" runat="server" 
           ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
         </asp:SqlDataSource>
        </asp:Panel>


        <asp:Panel ID="Panel4" Visible="false" runat="server">
            <table width="100%">
            <tr><td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td><asp:LinkButton ID="btnComentVoltar" runat="server" 
                onclick="btnComentVoltar_Click"><< Voltar</asp:LinkButton></td></tr>
            </table>

          <asp:SqlDataSource ID="allComentCidade" runat="server" 
           ConnectionString="<%$ ConnectionStrings:Look!ACityConnectionString %>" >
         </asp:SqlDataSource>
        </asp:Panel>

     </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="criarCidade" />
    </Triggers>
    </asp:UpdatePanel>  
</asp:Content>


