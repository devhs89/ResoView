using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResoView.Models;

namespace ResoView
{
  public partial class Products : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (IsPostBack) return;
      var products = GetProducts();
      GridViewProducts.DataSource = products;
      GridViewProducts.DataBind();
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
      var btnAddToCart = (Button)sender;
      var row = (GridViewRow)btnAddToCart.NamingContainer;
      var rowIndex = row.RowIndex;

      var txtQuantity = (TextBox)row.FindControl("txtQuantity");
      var quantity = Convert.ToInt32(txtQuantity.Text);

      var products = GetProducts();
      var selectedProduct = products[rowIndex];
      // TODO: Cart logic here
    }

    private static List<ProductModel> GetProducts()
    {
      using (var dbContext = new ResoViewDbContext())
      {
        return dbContext.Products.ToList();
      }
    }
  }
}