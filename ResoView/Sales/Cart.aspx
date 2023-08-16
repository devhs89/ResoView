<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Sales/Cart.aspx.cs" Inherits="ResoView.Cart" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main aria-labelledby="title" class="container mt-custom">
    <div class="row">
      <div class="col-12 mb-3">
        <h1 class="display-6" id="cartTitle">Shopping Cart</h1>
      </div>
    </div>
    <div class="row">
      <div class="col mb-3">
        <asp:BulletedList class="border border-danger cartErrorMessages d-grid gap-2 mb-0 text-bg-danger" ID="cartErrorsBulletedList" runat="server"></asp:BulletedList>
      </div>
    </div>
    <div class="row">
      <div class="col-12 col-lg-8 col-md-9 mb-3">
        <div class="d-grid gap-2" id="cartItems" runat="server">
          <asp:ListBox CssClass="form-select" ID="multiSelectListBox" Rows="5" runat="server" SelectionMode="Multiple" />
        </div>
      </div>
      <div class="col-12 col-lg-4 col-md-3 mb-3">
        <div class="row">
          <div class="col-auto col-md-12 mb-md-2">
            <asp:Button CssClass="btn btn-sm btn-outline-primary" OnClick="btnRemoveMyItem_Click" runat="server" Text="Remove my Item" />
          </div>
          <div class="col-auto col-md-12">
            <asp:Button CssClass="btn btn-sm btn-outline-danger" OnClick="btn_EmptyMyCart_Click" runat="server" Text="Empty my Cart" />
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-auto mb-3">
        <asp:HyperLink CssClass="btn btn-outline-dark" ID="continueShopping" NavigateUrl="Products.aspx" runat="server" Text="Continue Shopping"></asp:HyperLink>
      </div>
      <div class="col-auto mb-3">
        <asp:HyperLink CssClass="btn btn-primary" ID="checkOut" NavigateUrl="Checkout.aspx" runat="server" Text="Checkout" />
      </div>
    </div>
  </main>
</asp:Content>