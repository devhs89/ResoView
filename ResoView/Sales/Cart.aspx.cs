/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResoView.Dtos;

namespace ResoView
{
  public partial class Cart : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (IsPostBack) return;
      // Populate the cart items from session on page load
      try
      {
        var selectedCartItemsFromSession = GetSelectedCartItemsFromSession();
        PopulateCartItems(selectedCartItemsFromSession);
      }
      catch (Exception exception)
      {
        ShowPageErrors(exception.Message);
      }
    }

    // Populate the cart items method
    private void PopulateCartItems(List<CartItem> selectedProducts)
    {
      // If no products are found in cart, show a message
      if (selectedProducts == null || selectedProducts.Count < 1)
      {
        multiSelectListBox.Items.Clear();
        multiSelectListBox.Items.Add(new ListItem("No products found in cart", ""));
        return;
      }

      // If products are found in cart, populate the list box
      var listItems = new List<ListItem>();
      foreach (var cartItem in selectedProducts)
      {
        var id = cartItem.Product.Id.ToString();
        var title = cartItem.Product.Name;
        var price = cartItem.Product.Price;
        var qty = cartItem.ProductQuantity;
        var productDetails = new StringBuilder();
        productDetails.Append($"{title} ({qty} at {price:c2})");
        listItems.Add(new ListItem(productDetails.ToString(), id));
      }

      multiSelectListBox.Items.Clear();
      multiSelectListBox.Items.AddRange(listItems.ToArray());
    }

    // Remove my item button click event
    protected void btnRemoveMyItem_Click(object sender, EventArgs e)
    {
      for (var i = 0; i < multiSelectListBox.Items.Count; i++)
      {
        if (!multiSelectListBox.Items[i].Selected || string.IsNullOrEmpty(multiSelectListBox.Items[i].Value)) continue;
        var selectedItems = GetSelectedCartItemsFromSession();
        var itemDex = selectedItems.FindIndex(p => p.Product.Id.ToString() == multiSelectListBox.Items[i].Value);
        selectedItems.RemoveAt(itemDex);
        Session["Cart"] = selectedItems;
        PopulateCartItems(selectedItems);
      }
    }

    // Get selected cart items from session
    private List<CartItem> GetSelectedCartItemsFromSession()
    {
      var selectedItems = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
      return selectedItems;
    }

    // Empty my cart button click event
    protected void btn_EmptyMyCart_Click(object sender, EventArgs e)
    {
      // Clear the session and list box
      Session["Cart"] = null;
      multiSelectListBox.Items.Clear();
      PopulateCartItems(null);
    }

    // Show page errors method
    private void ShowPageErrors(string errorMsg)
    {
      cartErrorsBulletedList.Items.Add(new ListItem(errorMsg));
    }
  }
}