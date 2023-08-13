using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using ResoView.Models;

namespace ResoView
{
  public partial class Startup
  {
    public void ConfigureAuth(IAppBuilder app)
    {
      // Configure the db context, user manager and signin manager to use a single instance per request
      app.CreatePerOwinContext(ResoViewDbContext.Create);
      app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
      app.CreatePerOwinContext<ApplicationSignInManager>(ApplicationSignInManager.Create);

      // Enable the application to use a cookie to store information for the signed in user
      // Configure the sign in cookie
      app.UseCookieAuthentication(new CookieAuthenticationOptions
      {
        AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
        LoginPath = new PathString("/Account/Login"),
        Provider = new CookieAuthenticationProvider
        {
          OnValidateIdentity = SecurityStampValidator.OnValidateIdentity<ApplicationUserManager, AppUser>(
            validateInterval: TimeSpan.FromMinutes(30),
            regenerateIdentity: (manager, user) => user.GenerateUserIdentityAsync(manager))
        }
      });
    }
  }
}