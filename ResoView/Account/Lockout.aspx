<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lockout.aspx.cs" Inherits="ResoView.Account.Lockout" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <%-- Page to display when a user is locked out --%>
  <main class="container mt-custom">
    <hgroup>
      <h1>Locked out.</h1>
      <h2 class="text-danger">This account has been locked out, please try again later.</h2>
    </hgroup>
  </main>
</asp:Content>