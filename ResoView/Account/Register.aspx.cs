﻿using System;
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
    protected void CreateUser_Click(object sender, EventArgs e)
    {
      var manager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var signInManager = Context.GetOwinContext().Get<ResoViewSignInManager>();
      var user = new AppUser
        { FirstName = FirstName.Text, LastName = LastName.Text, UserName = Email.Text, Email = Email.Text };
      var result = manager.Create(user, Password.Text);
      if (!result.Succeeded)
      {
        ErrorMessage.Text = result.Errors.FirstOrDefault();
        return;
      }

      manager.AddToRole(user.Id, AppRoleConstant.Member);
      signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
      IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
    }
  }
}