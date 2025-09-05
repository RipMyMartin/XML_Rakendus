<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="XML_Rakendus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Martin sugupuu</h1>
        <div>
            <asp:Xml runat="server"
                DocumentSource="~/MartinSugupuu.xml"
                TransformSource="~/martinparing.xslt">
            </asp:Xml>
        </div>
    </main>
</asp:Content>
