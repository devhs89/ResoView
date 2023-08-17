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
      if (IsPostBack) return;
      BindGridView();
    }

    private void BindGridView()
    {
      List<Product> productsList;
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
      Page.Validate("EditUpdateValidationGroup");
      if (!Page.IsValid) return;

      var row = GridViewProducts.Rows[e.RowIndex];
      var id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex]?.Values?["Id"]);
      var updatedProductName = (row.FindControl("EditProductName") as TextBox)?.Text;
      var updatedPrice = Convert.ToDecimal((row.FindControl("EditProductPrice") as TextBox)?.Text);
      var updatedImageUrl = (row.FindControl("EditProductImageUrl") as TextBox)?.Text;
      var updatedDescription = (row.FindControl("EditProductDescription") as TextBox)?.Text;

      using (var dbContext = new ResoViewDbContext())
      {
        var productToUpdate = dbContext.Products.Find(id);
        if (productToUpdate == null) return;
        productToUpdate.Name = updatedProductName;
        productToUpdate.Price = updatedPrice;
        productToUpdate.Description = updatedDescription;
        productToUpdate.ImageUrl = updatedImageUrl;
        dbContext.SaveChanges();
        GridViewProducts.EditIndex = -1;
        BindGridView();
      }
    }


    protected void GridViewProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      var id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex]?.Values?["Id"]);
      using (var dbContext = new ResoViewDbContext())
      {
        var productToDelete = dbContext.Products.SingleOrDefault(p => p.Id == id);
        if (productToDelete == null) return;
        dbContext.Products.Remove(productToDelete);
        dbContext.SaveChanges();
        GridViewProducts.EditIndex = -1;
        BindGridView();
      }
    }


    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
      // Validate the page controls
      Page.Validate("AddProductGroup");
      if (!Page.IsValid) return;

      var newProductName = NewProductName.Text;
      var newPrice = Convert.ToDecimal(NewPrice.Text);
      var newImageUrl = NewImageUrl.Text;
      var newDescription = NewDescription.Text;

      using (var dbContext = new ResoViewDbContext())
      {
        var newProduct = new Product
        {
          Name = newProductName,
          Price = newPrice,
          ImageUrl = newImageUrl,
          Description = newDescription
        };

        dbContext.Products.Add(newProduct);
        dbContext.SaveChanges();
        ClearNewProductForm();
        BindGridView();
      }
    }

    private void ClearNewProductForm()
    {
      NewProductName.Text = string.Empty;
      NewPrice.Text = string.Empty;
      NewImageUrl.Text = string.Empty;
      NewDescription.Text = string.Empty;
    }
  }
}