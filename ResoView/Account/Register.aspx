<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResoView.Account.Register" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title">
    <h2 id="title"><%: Title %>.</h2>
    <h4>Create a new account</h4>
    <hr />
    <asp:ValidationSummary CssClass="text-danger" runat="server" />
    <div class="row">
      <asp:Label AssociatedControlID="FirstName" CssClass="col-md-2 col-form-label" runat="server">Firstname</asp:Label>
      <div class="col-md-10">
        <asp:TextBox CssClass="form-control" ID="FirstName" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="FirstName" CssClass="text-danger" ErrorMessage="The first name field is required." runat="server" />
      </div>
    </div>
    <div class="row">
      <asp:Label AssociatedControlID="LastName" CssClass="col-md-2 col-form-label" runat="server">Lastname</asp:Label>
      <div class="col-md-10">
        <asp:TextBox CssClass="form-control" ID="LastName" runat="server" />
        <asp:RequiredFieldValidator ControlToValidate="LastName" CssClass="text-danger" ErrorMessage="The last name field is required." runat="server" />
      </div>
    </div>
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
      <asp:Label AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label" runat="server">Confirm password</asp:Label>
      <div class="col-md-10">
        <asp:TextBox CssClass="form-control" ID="ConfirmPassword" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." runat="server" />
        <asp:CompareValidator ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." runat="server" />
      </div>
    </div>
    <div class="mt-3 row">
      <div class="col-md-10 offset-md-2">
        <asp:Button CssClass="btn btn-outline-dark" OnClick="CreateUser_Click" runat="server" Text="Register" />
      </div>
    </div>
  </main>
</asp:Content>