<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="ManageProducts.aspx.cs" Inherits="ResoView.Admin.ManageProducts" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="ManageProducts" runat="server">
  <h2>Manage Products</h2>
  <div class="table-responsive">
    <asp:GridView AutoGenerateColumns="False" CssClass="table table-bordered table-striped" DataKeyNames="Id" ID="GridViewProducts" OnRowCancelingEdit="GridViewProducts_RowCancelingEdit" OnRowDeleting="GridViewProducts_RowDeleting" OnRowEditing="GridViewProducts_RowEditing" OnRowUpdating="GridViewProducts_RowUpdating" runat="server">
      <Columns>
        <asp:BoundField ControlStyle-CssClass="form-control" DataField="Id" HeaderText="Product ID" ReadOnly="True" />
        <asp:BoundField ControlStyle-CssClass="form-control" DataField="Name" HeaderText="Product Name" />
        <asp:BoundField ControlStyle-CssClass="form-control" DataField="Price" HeaderText="Price" />
        <asp:BoundField ControlStyle-CssClass="form-control" DataField="Description" HeaderText="Description" />
        <asp:TemplateField HeaderText="Actions">
          <ItemTemplate>
            <asp:LinkButton CommandName="Edit" CssClass="btn btn-sm btn-primary" ID="btnEdit" runat="server" Text="Edit" />
            <asp:LinkButton CommandName="Delete" CssClass="btn btn-sm btn-danger" ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delete this product?');" runat="server" Text="Delete" />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:LinkButton CommandName="Update" CssClass="btn btn-sm btn-success" ID="btnUpdate" runat="server" Text="Update" />
            <asp:LinkButton CommandName="Cancel" CssClass="btn btn-sm btn-secondary" ID="btnCancel" runat="server" Text="Cancel" />
          </EditItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
  </div>
  <h2 class="mt-3">Add New Product</h2>
  <div class="row">
    <div class="col-md-6 mb-3">
      <asp:TextBox CssClass="form-control" ID="NewProductName" placeholder="Product Name" runat="server" />
      <asp:RequiredFieldValidator ControlToValidate="NewProductName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product name field is required." runat="server" />
    </div>
    <div class="col-md-6 mb-3">
      <asp:TextBox CssClass="form-control" ID="NewPrice" placeholder="Product Price" runat="server" />
      <asp:RequiredFieldValidator ControlToValidate="NewPrice" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product price field is required." runat="server" />
    </div>
    <div class="col-12 mb-3">
      <asp:TextBox CssClass="form-control" ID="NewDescription" placeholder="Product Description" runat="server" TextMode="Multiline" />
      <asp:RequiredFieldValidator ControlToValidate="NewDescription" CssClass="text-danger" Display="Dynamic" ErrorMessage="Product description field is required." runat="server" />
    </div>
    <div class="col-12">
      <asp:Button CssClass="btn btn-primary" ID="AddProduct" OnClick="btnAddProduct_Click" runat="server" Text="Add Product" />
    </div>
  </div>
</asp:Content>