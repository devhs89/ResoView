/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */


using System;
using System.Data.Entity;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;

namespace ResoView.Account
{
  // Login page code-behind class
  public partial class Login : Page
  {
    // On page load, setup the register link and redirect to the return url if it exists
    protected void Page_Load(object sender, EventArgs e)
    {
      RegisterHyperLink.NavigateUrl = "Register";
      var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
      if (!string.IsNullOrEmpty(returnUrl))
      {
        RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
      }
    }

    // On login button click, validate the user and redirect to the return url if it exists, or show appropriate error(s)
    protected async void LogIn(object sender, EventArgs e)
    {
      if (!IsValid) return;

      // Get user and sign in managers from HttpContext
      var userManager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var signinManager = Context.GetOwinContext().GetUserManager<ResoViewSignInManager>();

      // Find user by email
      var appUser = await userManager.Users.SingleOrDefaultAsync(user => user.Email == Email.Text);
      if (appUser == null)
      {
        ShowLoginError(@"User does not exists", 403);
        return;
      }

      // Try to sign in the user with the given password, count failed attempts
      var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, true);
      switch (result)
      {
        case SignInStatus.Success:
          IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
          break;
        case SignInStatus.LockedOut:
          Response.Redirect("/Account/Lockout");
          break;
        case SignInStatus.RequiresVerification:
          ShowLoginError();
          break;
        case SignInStatus.Failure:
        default:
          ShowLoginError(@"Invalid login attempt", 403);
          break;
      }
    }

    // Update the login error message and status code
    private void ShowLoginError(string errText = @"Internal server error", int respCode = 500)
    {
      Response.StatusCode = respCode;
      FailureText.Text = errText;
      ErrorMessage.Visible = true;
    }
  }
}