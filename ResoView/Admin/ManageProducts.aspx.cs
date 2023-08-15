using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResoView.Models;

namespace ResoView.Admin
{
  public partial class ManageProducts : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        BindGridView();
      }
    }

    private void BindGridView()
    {
      List<ProductModel> productsList;
      using (var dbContext = new ResoViewDbContext())
      {
        productsList = dbContext.Products.ToList();
      }

      GridViewProducts.DataSource = productsList;
      GridViewProducts.DataBind();
    }

    protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
    {
      GridViewProducts.EditIndex = e.NewEditIndex;
      BindGridView();
    }

    protected void GridViewProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      GridViewProducts.EditIndex = -1;
      BindGridView();
    }

    protected void GridViewProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      var row = GridViewProducts.Rows[e.RowIndex];
      var id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex]?.Values?["Id"]);
      var updatedProductName = (row.Cells[1].Controls[0] as TextBox)?.Text;
      var updatedPrice = Convert.ToDecimal((row.Cells[2].Controls[0] as TextBox)?.Text);
      var updatedDescription = (row.Cells[3].Controls[0] as TextBox)?.Text;

      using (var dbContext = new ResoViewDbContext())
      {
        var productToUpdate = dbContext.Products.Find(id);
        if (productToUpdate != null)
        {
          productToUpdate.Name = updatedProductName;
          productToUpdate.Price = updatedPrice;
          productToUpdate.Description = updatedDescription;
          dbContext.SaveChanges();
        }
      }

      GridViewProducts.EditIndex = -1;
      BindGridView();
    }


    protected void GridViewProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      BindGridView();
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
      var newProductName = NewProductName.Text;
      var newPrice = Convert.ToDecimal(NewPrice.Text);
      var newDescription = NewDescription.Text;

      using (var dbContext = new ResoViewDbContext())
      {
        var newProduct = new ProductModel
        {
          Name = newProductName,
          Price = newPrice,
          Description = newDescription
        };

        dbContext.Products.Add(newProduct);
        dbContext.SaveChanges();
      }

      BindGridView();
      ClearNewProductForm();
    }

    private void ClearNewProductForm()
    {
      NewProductName.Text = string.Empty;
      NewPrice.Text = string.Empty;
      NewDescription.Text = string.Empty;
    }
  }
}