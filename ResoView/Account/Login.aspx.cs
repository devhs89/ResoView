using System;
using System.Data.Entity;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;

namespace ResoView.Account
{
  public partial class Login : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      RegisterHyperLink.NavigateUrl = "Register";
      var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
      if (!string.IsNullOrEmpty(returnUrl))
      {
        RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
      }
    }

    protected async void LogIn(object sender, EventArgs e)
    {
      if (!IsValid) return;

      var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
      var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

      var appUser = await userManager.Users.SingleOrDefaultAsync(user => user.Email == Email.Text);
      if (appUser == null)
      {
        ShowLoginError(@"User does not exists", 403);
        return;
      }

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
          break;
        default:
          ShowLoginError(@"Invalid login attempt", 403);
          break;
      }
    }

    private void ShowLoginError(string errText = @"Internal server error", int respCode = 500)
    {
      Response.StatusCode = respCode;
      FailureText.Text = errText;
      ErrorMessage.Visible = true;
    }
  }
}