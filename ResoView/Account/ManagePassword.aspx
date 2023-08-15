<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="ResoView.Account.ManagePassword" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <div class="row">
      <section id="passwordForm">
        <asp:PlaceHolder ID="setPassword" runat="server" Visible="false">
          <p>
            You do not have a local password for this site. Add a local
            password so you can log in without an external login.
          </p>
          <div>
            <h4>Set Password Form</h4>
            <asp:ValidationSummary CssClass="text-danger" runat="server" ShowModelStateErrors="true" />
            <hr />
            <div class="row">
              <asp:Label AssociatedControlID="password" CssClass="col-md-2 col-form-label" runat="server">Password</asp:Label>
              <div class="col-md-10">
                <asp:TextBox CssClass="form-control" ID="password" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="password" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." runat="server" ValidationGroup="SetPassword" />
                <asp:ModelErrorMessage AssociatedControlID="password" CssClass="text-danger" ModelStateKey="NewPassword" runat="server" SetFocusOnError="true" />
              </div>
            </div>

            <div class="row">
              <asp:Label AssociatedControlID="confirmPassword" CssClass="col-md-2 col-form-label" runat="server">Confirm password</asp:Label>
              <div class="col-md-10">
                <asp:TextBox CssClass="form-control" ID="confirmPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="confirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." runat="server" ValidationGroup="SetPassword" />
                <asp:CompareValidator ControlToCompare="Password" ControlToValidate="confirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." runat="server" ValidationGroup="SetPassword" />

              </div>
            </div>
            <div class="row">
              <div class="col-md-10 offset-md-2">
                <asp:Button CssClass="btn btn-outline-dark" OnClick="SetPassword_Click" runat="server" Text="Set Password" ValidationGroup="SetPassword" />
              </div>
            </div>
          </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="changePasswordHolder" runat="server" Visible="false">
          <div>
            <h4>Change Password Form</h4>
            <hr />
            <asp:ValidationSummary CssClass="text-danger" runat="server" ShowModelStateErrors="true" />
            <div class="row">
              <asp:Label AssociatedControlID="CurrentPassword" CssClass="col-md-2 col-form-label" ID="CurrentPasswordLabel" runat="server">Current password</asp:Label>
              <div class="col-md-10">
                <asp:TextBox CssClass="form-control" ID="CurrentPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="CurrentPassword" CssClass="text-danger" ErrorMessage="The current password field is required." runat="server" ValidationGroup="ChangePassword" />
              </div>
            </div>
            <div class="row">
              <asp:Label AssociatedControlID="NewPassword" CssClass="col-md-2 col-form-label" ID="NewPasswordLabel" runat="server">New password</asp:Label>
              <div class="col-md-10">
                <asp:TextBox CssClass="form-control" ID="NewPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="NewPassword" CssClass="text-danger" ErrorMessage="The new password is required." runat="server" ValidationGroup="ChangePassword" />
              </div>
            </div>
            <div class="row">
              <asp:Label AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 col-form-label" ID="ConfirmNewPasswordLabel" runat="server">Confirm new password</asp:Label>
              <div class="col-md-10">
                <asp:TextBox CssClass="form-control" ID="ConfirmNewPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="ConfirmNewPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required." runat="server" ValidationGroup="ChangePassword" />
                <asp:CompareValidator ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." runat="server" ValidationGroup="ChangePassword" />
              </div>
            </div>
            <div class="row">
              <div class="col-md-10 offset-md-2">
                <asp:Button CssClass="btn btn-outline-dark" OnClick="ChangePassword_Click" runat="server" Text="Change Password" ValidationGroup="ChangePassword" />
              </div>
            </div>
          </div>
        </asp:PlaceHolder>
      </section>
    </div>
  </main>
</asp:Content>