/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using ResoView.Constants;
using ResoView.Models;

namespace ResoView.Account
{
  public partial class Register : Page
  {
    // On register button click, try to create a new user
    protected void CreateUser_Click(object sender, EventArgs e)
    {
      // Get user manager and sign in manager
      var manager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var signInManager = Context.GetOwinContext().Get<ResoViewSignInManager>();
      // Instantiate new user with the form data
      var user = new AppUser
        { FirstName = FirstName.Text, LastName = LastName.Text, UserName = Email.Text, Email = Email.Text };
      // Try to create the user
      var result = manager.Create(user, Password.Text);
      // If the user was not created, display the error message
      if (!result.Succeeded)
      {
        ErrorMessage.Text = result.Errors.FirstOrDefault();
        return;
      }

      // Add user to the member role
      manager.AddToRole(user.Id, AppRoleConstant.Member);
      // Sign in the user and redirect to the home page or the return url
      signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
      IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
    }
  }
}