<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="ManageUsers.aspx.cs" Inherits="ResoView.Admin.ManageUsers" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="ManageUsers" runat="server">
  <main class="container mt-custom">
    <div class="manage-users-wrapper">
      <h2>Manage Users</h2>
      <div class="table-responsive">
        <asp:GridView AutoGenerateColumns="False" CssClass="table table-bordered table-striped" DataKeyNames="Id" ID="GridViewUsers" OnRowCancelingEdit="GridViewUsers_RowCancelingEdit" OnRowDeleting="GridViewUsers_RowDeleting" OnRowEditing="GridViewUsers_RowEditing" OnRowUpdating="GridViewUsers_RowUpdating" runat="server">
          <Columns>
            <asp:TemplateField HeaderText="Firstname">
              <ItemTemplate>
                <asp:Label ID="Firstname" runat="server" Text='<%# Eval("FirstName") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditFirstName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Firstname field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditFirstName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Firstname can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lastname">
              <ItemTemplate>
                <asp:Label ID="Lastname" runat="server" Text='<%# Eval("LastName") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditLastName" runat="server" Text='<%# Bind("LastName") %>' />
                <asp:RequiredFieldValidator ControlToValidate="EditLastName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Lastname field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditLastName" CssClass="text-danger" Display="Dynamic" ErrorMessage="Lastname can consist of A-Z, a-z, 0-9 characters" runat="server" ValidationExpression="^[A-Za-z0-9\s]+$"></asp:RegularExpressionValidator>
              </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
              <ItemTemplate>
                <asp:Label ID="Email" runat="server" Text='<%# Eval("Email") %>' />
              </ItemTemplate>
              <EditItemTemplate>
                <asp:TextBox CssClass="form-control" ID="EditEmail" runat="server" Text='<%# Bind("Email") %>' TextMode="Email" />
                <asp:RequiredFieldValidator ControlToValidate="EditEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="Email field is required." runat="server" />
                <asp:RegularExpressionValidator ControlToValidate="EditEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a valid email address." runat="server" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" />
              </EditItemTemplate>
            </asp:TemplateField>
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
    </div>
  </main>
</asp:Content>