﻿<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="ManageProducts.aspx.cs" Inherits="ResoView.Admin.ManageProducts" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="ManageProducts" runat="server">
  <main class="container mt-custom">
    <div class="manage-products-wrapper">
      <h2>Manage Products</h2>
      <div class="table-responsive">
        <%-- Grid View of Products --%>
        <asp:GridView AutoGenerateColumns="False" CssClass="table table-bordered table-striped" DataKeyNames="Id" ID="GridViewProducts" OnRowCancelingEdit="GridViewProducts_RowCancelingEdit" OnRowDeleting="GridViewProducts_RowDeleting" OnRowEditing="GridViewProducts_RowEditing" OnRowUpdating="GridViewProducts_RowUpdating" runat="server" ValidationGroup="EditUpdateValidationGroup">
          <Columns>
            <asp:BoundField ControlStyle-CssClass="form-control" DataField="Id" HeaderText="Product ID" ReadOnly="True" />
            <asp:TemplateField HeaderText="Product Name">
              <ItemTemplate>
                <asp:Label ID="ProductName" runat="server" Text='<%# Eval("Name") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditProductName" runat="server" Text='<%# Bind("Name") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditProductName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditProductName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
              <ItemTemplate>
                <asp:Label ID="ProductPrice" runat="server" Text='<%# Eval("Price") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditProductPrice" runat="server" Text='<%# Bind("Price") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditProductPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product price field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditProductPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product price must be a decimal value" runat="server" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image Url">
              <ItemTemplate>
                <asp:Label ID="ProductImageUrl" runat="server" Text='<%# Eval("ImageUrl") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditProductImageUrl" runat="server" Text='<%# Bind("ImageUrl") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditProductImageUrl" CssClass="text-danger" Display="Dynamic" ErrorMessage="Image url field is required." runat="server" />
              </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
              <ItemTemplate>
                <asp:Label ID="ProductDescription" runat="server" Text='<%# Eval("Description") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditProductDescription" runat="server" Text='<%# Bind("Description") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditProductDescription" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product description field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditProductDescription" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
            </asp:TemplateField>
            <%-- Action Buttons for each row of products --%>
            <asp:TemplateField HeaderText="Actions">
              <ItemTemplate>
                <asp:LinkButton CommandName="Edit" CssClass="btn btn-sm btn-primary" ID="btnEdit" runat="server" Text="Edit" ValidationGroup="EditUpdateValidationGroup" />
                <asp:LinkButton CommandName="Delete" CssClass="btn btn-sm btn-danger" ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delete this product?');" runat="server" Text="Delete" ValidationGroup="EditUpdateValidationGroup" />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:LinkButton CommandName="Update" CssClass="btn btn-sm btn-success" ID="btnUpdate" runat="server" Text="Update" ValidationGroup="EditUpdateValidationGroup" />
                <asp:LinkButton CommandName="Cancel" CssClass="btn btn-sm btn-secondary" ID="btnCancel" runat="server" Text="Cancel" ValidationGroup="EditUpdateValidationGroup" />
              </EditItemTemplate>
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </div>
    </div>
    <div class="add-new-product-wrapper">
      <%-- Add new product form controls --%>
      <h2 class="mt-3">Add New Product</h2>
      <div class="row">
        <div class="col-md-6 mb-3">
          <asp:TextBox CssClass="form-control" ID="NewProductName" placeholder="Product Name" runat="server" ValidationGroup="AddProductGroup" />
          <asp:RequiredFieldValidator ControlToValidate="NewProductName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name field is required." runat="server" />
          <asp:RegularExpressionValidator ControlToValidate="NewProductName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-6 mb-3">
          <asp:TextBox CssClass="form-control" ID="NewPrice" placeholder="Product Price" runat="server" ValidationGroup="AddProductGroup" />
          <asp:RequiredFieldValidator ControlToValidate="NewPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product price field is required." runat="server" />
          <asp:RegularExpressionValidator ControlToValidate="NewPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product price must be a decimal value" runat="server" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
        </div>
        <div class="col-12 mb-3">
          <asp:TextBox CssClass="form-control" ID="NewImageUrl" placeholder="Image URL" runat="server" ValidationGroup="AddProductGroup" />
          <asp:RequiredFieldValidator ControlToValidate="NewImageUrl" CssClass="text-danger" Display="Dynamic" ErrorMessage="Image URL field is required." runat="server" />
        </div>
        <div class="col-12 mb-3">
          <asp:TextBox CssClass="form-control" ID="NewDescription" placeholder="Product Description" runat="server" TextMode="Multiline" ValidationGroup="AddProductGroup" />
          <asp:RequiredFieldValidator ControlToValidate="NewDescription" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product description field is required." runat="server" />
          <asp:RegularExpressionValidator ControlToValidate="NewDescription" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
        </div>
        <div class="col-12 mb-5">
          <%-- Add product button --%>
          <asp:Button CssClass="btn btn-primary" ID="AddProduct" OnClick="btnAddProduct_Click" runat="server" Text="Add Product" ValidationGroup="AddProductGroup" />
        </div>
      </div>
    </div>
  </main>
</asp:Content>