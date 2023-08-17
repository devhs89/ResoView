<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi ()
--%>

<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="ResoView.Account.ManagePassword" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <div class="justify-content-center row">
      <section class="col-md-7 col-xl-6" id="passwordForm">
        <div>
          <h4>Change Password Form</h4>
          <hr />
          <asp:ValidationSummary CssClass="text-danger" runat="server" ShowModelStateErrors="true" />
          <div class="row">
            <asp:Label AssociatedControlID="CurrentPassword" CssClass="col-lg-4 col-form-label" ID="CurrentPasswordLabel" runat="server">Current password</asp:Label>
            <div class="col-lg-8">
              <asp:TextBox CssClass="form-control" ID="CurrentPassword" runat="server" TextMode="Password" />
              <asp:RequiredFieldValidator ControlToValidate="CurrentPassword" CssClass="text-danger" ErrorMessage="The current password field is required." runat="server" ValidationGroup="ChangePassword" />
            </div>
          </div>
          <div class="row">
            <asp:Label AssociatedControlID="NewPassword" CssClass="col-lg-4 col-form-label" ID="NewPasswordLabel" runat="server">New password</asp:Label>
            <div class="col-lg-8">
              <asp:TextBox CssClass="form-control" ID="NewPassword" runat="server" TextMode="Password" />
              <asp:RequiredFieldValidator ControlToValidate="NewPassword" CssClass="text-danger" ErrorMessage="The new password is required." runat="server" ValidationGroup="ChangePassword" />
            </div>
          </div>
          <div class="row">
            <asp:Label AssociatedControlID="ConfirmNewPassword" CssClass="col-lg-4 col-form-label" ID="ConfirmNewPasswordLabel" runat="server">Confirm new password</asp:Label>
            <div class="col-lg-8">
              <asp:TextBox CssClass="form-control" ID="ConfirmNewPassword" runat="server" TextMode="Password" />
              <asp:RequiredFieldValidator ControlToValidate="ConfirmNewPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required." runat="server" ValidationGroup="ChangePassword" />
              <asp:CompareValidator ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." runat="server" ValidationGroup="ChangePassword" />
            </div>
          </div>
          <div class="row">
            <div class="col-lg-8 mt-3 offset-lg-4">
              <asp:Button CssClass="btn btn-outline-dark" OnClick="ChangePassword_Click" runat="server" Text="Change Password" ValidationGroup="ChangePassword" />
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>
</asp:Content>