<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="AdminPanel.aspx.cs" Inherits="ResoView.Admin.AdminPanel" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="AdminPanel" runat="server">
  <div class="container">
    <h2>Welcome to the Admin Dashboard</h2>
    <p>Here, you can manage various aspects of the website.</p>
    <div class="row">
      <div class="col-md-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Manage Users</h5>
            <p class="card-text">View and manage user accounts.</p>
            <a class="btn btn-primary" href="ManageUsers.aspx">Go to Users</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Manage Products</h5>
            <p class="card-text">Add, edit, and delete products.</p>
            <a class="btn btn-primary" href="ManageProducts.aspx">Go to Products</a>
          </div>
        </div>
      </div>
      <!-- Add more cards for other functionalities -->
    </div>
  </div>
</asp:Content>