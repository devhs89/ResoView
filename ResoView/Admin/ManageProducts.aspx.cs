/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

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
      // If the page is loaded for the first time, bind the grid view
      if (IsPostBack) return;
      BindGridView();
    }

    private void BindGridView()
    {
      List<Product> productsList;
      // Get products from the database and bind them to the grid view
      // Using statement to ensure resources are disposed after use
      using (var dbContext = new ResoViewDbContext())
      {
        productsList = dbContext.Products.ToList();
      }

      GridViewProducts.DataSource = productsList;
      GridViewProducts.DataBind();
    }

    // On edit button click, set the edit index of the grid view to the row index, and bind the grid view again
    protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
    {
      GridViewProducts.EditIndex = e.NewEditIndex;
      BindGridView();
    }

    // On edit cancel button click, set the edit index of the grid view to -1, and bind the grid view again
    protected void GridViewProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      GridViewProducts.EditIndex = -1;
      BindGridView();
    }

    // On update button click, get the updated values from the grid view row, and update the product in the database
    protected void GridViewProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      // Ensure form controls are valid
      Page.Validate("EditUpdateValidationGroup");
      if (!Page.IsValid) return;

      // Find controls in the grid view row by their id
      var row = GridViewProducts.Rows[e.RowIndex];
      var id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex]?.Values?["Id"]);
      var updatedProductName = (row.FindControl("EditProductName") as TextBox)?.Text;
      var updatedPrice = Convert.ToDecimal((row.FindControl("EditProductPrice") as TextBox)?.Text);
      var updatedImageUrl = (row.FindControl("EditProductImageUrl") as TextBox)?.Text;
      var updatedDescription = (row.FindControl("EditProductDescription") as TextBox)?.Text;

      // Update product in the database, set the edit index of the grid view to -1, and bind the grid view again
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

    // On delete button click, get the id of the product to delete, and delete the product from the database
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

    // On add product button click, validate the page controls, and add the product to the database
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

    // Clear the new product form controls
    private void ClearNewProductForm()
    {
      NewProductName.Text = string.Empty;
      NewPrice.Text = string.Empty;
      NewImageUrl.Text = string.Empty;
      NewDescription.Text = string.Empty;
    }
  }
}