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

    protected void ChangePassword_Click(object sender, EventArgs e)
    {
      if (!IsValid) return;
      var manager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var signInManager = Context.GetOwinContext().Get<ResoViewSignInManager>();
      var result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
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