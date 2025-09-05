<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XML_Rakendus._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1>XML katsetamine: Elizoveta II sugupuu ülesanne</h1>
        <div>
            <asp:Xml runat="server"
                DocumentSource="~/Elizoveta2Sugupuu.xml"
                TransformSource="~/Elizaveta2paring.xslt">
            </asp:Xml>
        </div>
    </main>

</asp:Content>
