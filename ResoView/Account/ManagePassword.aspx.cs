/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace ResoView.Account
{
  public partial class ManagePassword : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    // On change password button click, try changing the password
    protected void ChangePassword_Click(object sender, EventArgs e)
    {
      // If page is not valid, return
      if (!IsValid) return;
      // Get the current user's manager and sign in manager
      var manager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var signInManager = Context.GetOwinContext().Get<ResoViewSignInManager>();
      // Try changing the password
      var result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
      // If successful, sign in the user and redirect to the manage page, else add the errors to the page
      if (result.Succeeded)
      {
        var user = manager.FindById(User.Identity.GetUserId());
        signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
        Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
      }
      else
      {
        AddErrors(result);
      }
    }

    private void AddErrors(IdentityResult result)
    {
      foreach (var error in result.Errors)
      {
        ModelState.AddModelError("", error);
      }
    }
  }
}