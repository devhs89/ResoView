﻿<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi ()
--%>

<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="AdminPanel.aspx.cs" Inherits="ResoView.Admin.AdminPanel" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="AdminPanel" runat="server">
  <main class="container mt-custom">
    <h2>Welcome to the Admin Dashboard</h2>
    <p>Here, you can manage various aspects of the website.</p>
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Manage Users</h5>
            <p class="card-text">View and manage user accounts.</p>
            <a class="btn btn-primary" href="ManageUsers.aspx">Go to Users</a>
          </div>
        </div>
      </div>
      <div class="col mb-3">
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
  </main>
</asp:Content>