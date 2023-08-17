<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi ()
--%>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ResoView._Default" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">

  <main class="text-center w-100">
    <div class="container jumbotron mt-custom">
      <h1>Welcome to ResoView!</h1>
      <p>Explore our collection of high-resolution monitors and projectors.</p>
      <p>
        <a class="btn btn-lg btn-primary" href="Products.aspx" role="button">View Products</a>
      </p>
    </div>
  </main>

</asp:Content>