<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ResoView.Account.Manage" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <div>
      <%-- Show success messages here --%>
      <asp:PlaceHolder ID="successMessage" runat="server" ViewStateMode="Disabled" Visible="false">
        <p class="text-success"><%: SuccessMessage %></p>
      </asp:PlaceHolder>
    </div>
    <div class="justify-content-center row">
      <div class="col-md-6">
        <h4>Change your account settings</h4>
        <hr />
        <div class="row">
          <div class="col">
            <%-- Change password link --%>
            <asp:Label AssociatedControlID="ChangePassword" CssClass="me-3" runat="server" Text="Password:"></asp:Label>
            <asp:HyperLink CssClass="text-decoration-none" ID="ChangePassword" NavigateUrl="/Account/ManagePassword.aspx" runat="server" Text="Change" />
          </div>
        </div>
      </div>
    </div>
  </main>
</asp:Content>