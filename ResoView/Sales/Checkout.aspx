<%--
  - Copyright 2023, Group 2
  - Bhavna, Bhavna (8864264)
  - Deepak, Mikkilneni Jeevarathnam (8850079)
  - Harpreet Singh (8870943)
  - Pratharan Sai Rupak Reddy, Gondi (8876529)
--%>

<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="~/Sales/Checkout.aspx.cs" Inherits="ResoView.Checkout" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">
  <main class="container mt-custom">
    <h2>Checkout</h2>
    <div>
      <asp:PlaceHolder ID="SuccessMessagePlaceHolder" runat="server" ViewStateMode="Disabled" Visible="false">
        <p class="text-success"><%: SuccessMessage %></p>
      </asp:PlaceHolder>
    </div>
    <%-- Check out GridView --%>
    <asp:GridView AutoGenerateColumns="False" CssClass="table table-bordered table-striped" ID="GridViewCheckout" runat="server">
      <Columns>
        <asp:BoundField DataField="Product.Name" HeaderText="Product" />
        <asp:BoundField DataField="Product.Price" DataFormatString="{0:C}" HeaderText="Price" />
        <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" />
      </Columns>
    </asp:GridView>
    <div class="mt-3">
      <h4>Total: <asp:Label CssClass="text-primary" ID="LabelTotal" runat="server" /></h4>
      <%-- Place order button --%>
      <asp:Button CssClass="btn btn-primary mt-3" ID="btnPlaceOrder" OnClick="btnPlaceOrder_Click" runat="server" Text="Place Order" />
    </div>
  </main>
</asp:Content>