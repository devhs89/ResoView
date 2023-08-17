<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResoView.Account.Register" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <h4>Create a new account</h4>
    <hr />
    <p class="text-danger">
      <asp:Literal ID="ErrorMessage" runat="server" />
    </p>
    <div class="row">
      <div class="col-md-6 mb-3">
        <div class="form-floating">
          <asp:TextBox CssClass="form-control" ID="FirstName" placeholder="First Name" runat="server" />
          <asp:Label AssociatedControlId="FirstName" runat="server">First Name</asp:Label>
          <asp:RequiredFieldValidator ControlToValidate="FirstName" CssClass="text-danger" Display="Dynamic" ErrorMessage="The first name field is required." runat="server" />
        </div>
      </div>
      <div class="col-md-6 mb-3">
        <div class="form-floating">
          <asp:TextBox CssClass="form-control" ID="LastName" placeholder="Last Name" runat="server" />
          <asp:Label AssociatedControlId="LastName" runat="server">Last Name</asp:Label>
          <asp:RequiredFieldValidator ControlToValidate="LastName" CssClass="text-danger" Display="Dynamic" ErrorMessage="The last name field is required." runat="server" />
        </div>
      </div>
      <div class="col-12 col-xl-4 mb-3">
        <div class="form-floating">
          <asp:TextBox CssClass="form-control" ID="Email" placeholder="Email" runat="server" TextMode="Email" />
          <asp:Label AssociatedControlId="Email" runat="server">Email</asp:Label>
          <asp:RequiredFieldValidator ControlToValidate="Email" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." runat="server" />
        </div>
      </div>
      <div class="col-md-6 col-xl-4 mb-3">
        <div class="form-floating">
          <asp:TextBox CssClass="form-control" ID="Password" placeholder="Password" runat="server" TextMode="Password" />
          <asp:Label AssociatedControlId="Password" runat="server">Password</asp:Label>
          <asp:RequiredFieldValidator ControlToValidate="Password" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." runat="server" />
        </div>
      </div>
      <div class="col-md-6 col-xl-4">
        <div class="form-floating">
          <asp:TextBox CssClass="form-control" ID="ConfirmPassword" placeholder="Confirm Password" runat="server" TextMode="Password" />
          <asp:Label AssociatedControlId="ConfirmPassword" runat="server">Confirm Password</asp:Label>
          <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." runat="server" />
          <asp:CompareValidator ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." runat="server" />
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12 mb-5 mt-3">
        <asp:Button CssClass="btn btn-primary" OnClick="CreateUser_Click" runat="server" Text="Register" />
      </div>
    </div>
  </main>
</asp:Content>