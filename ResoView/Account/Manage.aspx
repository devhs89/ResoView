<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ResoView.Account.Manage" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <h2 id="title"><%: Title %></h2>
    <div>
      <asp:PlaceHolder ID="successMessage" runat="server" ViewStateMode="Disabled" Visible="false">
        <p class="text-success"><%: SuccessMessage %></p>
      </asp:PlaceHolder>
    </div>
    <div class="col-md-12">
      <div class="row">
        <h4>Change your account settings</h4>
        <hr />
        <dl class="dl-horizontal">
          <dt>Password:</dt>
          <dd>
            <asp:HyperLink ID="ChangePassword" NavigateUrl="/Account/ManagePassword" runat="server" Text="[Change]" Visible="false" />
          </dd>
        </dl>
      </div>
    </div>
  </main>
</asp:Content>