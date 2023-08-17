<%@ Page Title="Products" Language="C#" MasterPageFile="Site.Master" CodeBehind="Products.aspx.cs" Inherits="ResoView.Products" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="BodyContent" runat="server">

  <main class="container mt-custom">
    <div class="align-items-center row">
      <div class="col-md-6 mb-3">
        <asp:HyperLink CssClass="btn btn-primary" NavigateUrl="~/Sales/Cart.aspx" runat="server" Text="Go to Cart"></asp:HyperLink>
      </div>
      <div class="col-md-6 mb-3 text-md-end">
        <asp:Label CssClass="px-3 py-1 rounded text-md-end bg-success bg-opacity-25 text-success" ID="LabelCartItemsCount" runat="server" Visible="False"></asp:Label>
      </div>
    </div>
    <div class="table-responsive">
      <asp:GridView AutoGenerateColumns="False" CssClass="table table-bordered table-striped" ID="GridViewProducts" runat="server">
        <Columns>
          <asp:TemplateField HeaderText="Image" ItemStyle-Width="10%">
            <ItemTemplate>
              <asp:Image CssClass="img-thumbnail" Height="50" ID="imgProduct" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" Width="50" />
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="Name" HeaderText="Title" />
          <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="Price" />
          <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="10%">
            <ItemTemplate>
              <asp:TextBox CssClass="form-control" ID="txtQuantity" runat="server" Text="1" TextMode="Number"></asp:TextBox>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Add to Cart">
            <ItemTemplate>
              <asp:Button CommandArgument="<%# Container.DataItemIndex %>" CommandName="AddToCart" CssClass="btn btn-sm btn-outline-primary" ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="Add to Cart" />
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </div>
  </main>

</asp:Content>