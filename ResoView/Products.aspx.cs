﻿/*
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
using ResoView.Dtos;
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

    // Add to cart button click event handler
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
      var btnAddToCart = (Button)sender;
      var row = (GridViewRow)btnAddToCart.NamingContainer;
      var rowIndex = row.RowIndex;

      var txtQuantity = (TextBox)row.FindControl("txtQuantity");
      var quantity = Convert.ToInt32(txtQuantity.Text);

      var products = GetProducts();
      var selectedProduct = products[rowIndex];

      if (Session["Cart"] == null)
      {
        var cart = new List<CartItem>();
        Session["Cart"] = cart;
      }

      var cartItems = (List<CartItem>)Session["Cart"];
      cartItems.Add(new CartItem
      {
        Product = selectedProduct,
        ProductQuantity = quantity
      });
      UpdateCartItemsCountLabel();
    }

    // Get products from database
    private static List<Product> GetProducts()
    {
      using (var dbContext = new ResoViewDbContext())
      {
        return dbContext.Products.ToList();
      }
    }

    // Update cart items count label
    private void UpdateCartItemsCountLabel()
    {
      var cartItemsCount = GetCartItemsCount();
      if (cartItemsCount <= 0) return;
      var plural = cartItemsCount > 1 ? "products" : "product";
      LabelCartItemsCount.Text = $@"{cartItemsCount} {plural} added to cart";
      LabelCartItemsCount.Visible = true;
    }

    // Get cart items count from session
    private int GetCartItemsCount()
    {
      var cartItems = (List<CartItem>)Session["Cart"];
      return cartItems.Count;
    }
  }
}