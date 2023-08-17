<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResoView.Account.Login" Async="true" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <h4>Use a local account to log in.</h4>
    <hr />
    <div class="justify-content-center row">
      <section class="col-lg-7 col-md-8 col-xl-6" id="loginForm">
        <div class="row">
          <asp:PlaceHolder ID="ErrorMessage" runat="server" Visible="false">
            <p class="text-danger">
              <asp:Literal ID="FailureText" runat="server" />
            </p>
          </asp:PlaceHolder>
          <div class="row">
            <div class="col-12">
              <div class="form-floating">
                <asp:TextBox CssClass="form-control" ID="Email" placeholder="Email" runat="server" TextMode="Email" />
                <asp:Label AssociatedControlID="Email" runat="server">Email</asp:Label>
                <asp:RequiredFieldValidator ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." runat="server" />
              </div>
            </div>
            <div class="col-12">
              <div class="form-floating">
                <asp:TextBox CssClass="form-control" ID="Password" placeholder="Password" runat="server" TextMode="Password" />
                <asp:Label AssociatedControlID="Password" runat="server">Password</asp:Label>
                <asp:RequiredFieldValidator ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." runat="server" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 mb-3 mt-1">
              <div class="checkbox">
                <asp:CheckBox ID="RememberMe" runat="server" />
                <asp:Label AssociatedControlID="RememberMe" runat="server">Remember me?</asp:Label>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 mb-3">
              <asp:Button CssClass="btn btn-primary" OnClick="LogIn" runat="server" Text="Log in" />
            </div>
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-12 text-center">
            <asp:HyperLink CssClass="page-link text-primary" ID="RegisterHyperLink" runat="server" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
          </div>
        </div>
      </section>
    </div>
  </main>
</asp:Content>