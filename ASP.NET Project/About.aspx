<%@ Page Title="About Us" Language="C#" MasterPageFile="~/LookACity.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 417px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="width25 floatLeft leftColumn">
        <div align="left">
            <div class="gradient">
                <br />
                <div align="center"><img src="images/escola_eng.png" /></div>
                <br />
                <p align="justify">
                    Universidade do Minho está actualmente entre as mais prestigiadas instituições de
                    ensino superior do país, tendo também vindo a afirmar-se progressivamente no panorama
                    internacional.
                    </p>
                    <p align="justify">
                        Fundada em 1973, conta com dois grandes pólos. O campus de Gualtar, em Braga, e
                        o campus de Azurém, em Guimarães.
                    </p>
            </div>
        </div>
    </div>
    <div class="width75 floatRight">
        <div align="left">
            <div class="gradient">
                <h1>
                    Sobre Nós</h1>
                <p align="justify">
                    Este projeto foi desenvolvido no âmbito do módulo de Engenharia Web da UCE de Análise e Conceção de Software. O projeto surge de uma ideia elaborada pelos elementos do grupo (principalmente elaborada pelo Fábio Silva) com o intuito de desenvolver algo inovador que mais tarde tivesse viabilidade e capacidade para entrar no mundo Online.</p>
                    <p align="justify"> A equipa de desenvolvimento do website é constituida por 3 elementos, todos eles
                    são recém-licenciados em engenharia informática e residem na zona norte do país.
                    Neste momento, os elementos encontram-se a tirar o Mestrado em Engenharia Informatica
                    na Universidade do Minho.</p>
                <ul>
                    <li><b>Bruno Santos</b> - PG19838 </li>
                    <li><b>Fábio Silva</b> - PG19834</li>
                    <li><b>Samuel Rodrigues</b> - PG20200</li>
                </ul>
                <p>
                    Estamos abertos a sugestões, caso tenha alguma contacte-nos por <a href="mailto:pg19834@alunos.uminho.pt" title="Get in touch">mail</a>.</p>
            </div>
        </div>
    </div>
</asp:Content>
