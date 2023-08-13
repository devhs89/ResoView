<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResoView.Account.Login" Async="true" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title">
    <h2 id="title"><%: Title %>.</h2>
    <div class="row">
      <section class="col-md-8" id="loginForm">
        <div class="row">
          <h4>Use a local account to log in.</h4>
          <hr />
          <asp:PlaceHolder ID="ErrorMessage" runat="server" Visible="false">
            <p class="text-danger">
              <asp:Literal ID="FailureText" runat="server" />
            </p>
          </asp:PlaceHolder>
          <div class="row">
            <asp:Label AssociatedControlID="Email" CssClass="col-md-2 col-form-label" runat="server">Email</asp:Label>
            <div class="col-md-10">
              <asp:TextBox CssClass="form-control" ID="Email" runat="server" TextMode="Email" />
              <asp:RequiredFieldValidator ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." runat="server" />
            </div>
          </div>
          <div class="row">
            <asp:Label AssociatedControlID="Password" CssClass="col-md-2 col-form-label" runat="server">Password</asp:Label>
            <div class="col-md-10">
              <asp:TextBox CssClass="form-control" ID="Password" runat="server" TextMode="Password" />
              <asp:RequiredFieldValidator ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." runat="server" />
            </div>
          </div>
          <div class="row">
            <div class="col-md-10 offset-md-2">
              <div class="checkbox">
                <asp:CheckBox ID="RememberMe" runat="server" />
                <asp:Label AssociatedControlID="RememberMe" runat="server">Remember me?</asp:Label>
              </div>
            </div>
          </div>
          <div class="mt-3 row">
            <div class="col-md-10 col-offset-md-2">
              <asp:Button CssClass="btn btn-outline-dark" OnClick="LogIn" runat="server" Text="Log in" />
            </div>
          </div>
        </div>
        <p class="mt-2">
          <asp:HyperLink CssClass="page-link" ID="RegisterHyperLink" runat="server" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
        </p>
      </section>
    </div>
  </main>
</asp:Content>