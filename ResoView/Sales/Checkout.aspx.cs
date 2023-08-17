/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi ()
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using ResoView.Dtos;

namespace ResoView
{
  public partial class Checkout : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (IsPostBack) return;
      BindCheckoutGridView();
      CalculateTotal();
    }

    private void BindCheckoutGridView()
    {
      if (Session["Cart"] == null) return;
      var cartItems = (List<CartItem>)Session["Cart"];
      GridViewCheckout.DataSource = cartItems;
      GridViewCheckout.DataBind();
    }

    private void CalculateTotal()
    {
      if (Session["Cart"] == null) return;
      var cartItems = (List<CartItem>)Session["Cart"];
      var total = cartItems.Sum(item => item.Product.Price * item.ProductQuantity);
      LabelTotal.Text = total.ToString("C");
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
      SuccessMessage = "Order placed successfully!";
      SuccessMessagePlaceHolder.Visible = true;
      Session.Remove("Cart");
      GridViewCheckout.DataSource = new List<CartItem>();
      GridViewCheckout.DataBind();
    }

    protected string SuccessMessage { get; private set; }
  }
}