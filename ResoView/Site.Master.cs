/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi ()
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.IO;
using System.Security.Claims;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using ResoView.Constants;

namespace ResoView
{
  public partial class SiteMaster : MasterPage
  {
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;
    protected static string FullName = "User";
    protected static bool ShowAdminPanel;

    protected void Page_Init(object sender, EventArgs e)
    {
      // The code below helps to protect against XSRF attacks
      var requestCookie = Request.Cookies[AntiXsrfTokenKey];
      if (requestCookie != null && Guid.TryParse(requestCookie.Value, out _))
      {
        // Use the Anti-XSRF token from the cookie
        _antiXsrfTokenValue = requestCookie.Value;
        Page.ViewStateUserKey = _antiXsrfTokenValue;
      }
      else
      {
        // Generate a new Anti-XSRF token and save to the cookie
        _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
        Page.ViewStateUserKey = _antiXsrfTokenValue;

        var responseCookie = new HttpCookie(AntiXsrfTokenKey)
        {
          HttpOnly = true,
          Value = _antiXsrfTokenValue
        };
        if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
        {
          responseCookie.Secure = true;
        }

        Response.Cookies.Set(responseCookie);
      }

      Page.PreLoad += Master_Page_PreLoad;
    }

    private void Master_Page_PreLoad(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        // Set Anti-XSRF token
        ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
        ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? string.Empty;
      }
      else
      {
        // Validate the Anti-XSRF token
        if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
            || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? string.Empty))
        {
          throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
        }
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        IsActivePage();
      }

      if (!Context.User.Identity.IsAuthenticated) return;
      var userIdentity = Context.User.Identity as ClaimsIdentity;
      FullName = userIdentity.FindFirstValue(CustomClaimConstant.FullName);
      LoginView.FindControl("AdminPanelLink").Visible = Context.User.IsInRole(AppRoleConstant.Admin);
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
      Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
    }

    private void IsActivePage()
    {
      SetActiveClass(HomeLink, "Home");
      SetActiveClass(ProductsLink, "Products");
      SetActiveClass(CartLink, "Cart");

      var registerLink = (HyperLink)LoginView.FindControl("RegisterLink");
      var loginLink = (HyperLink)LoginView.FindControl("LoginLink");
      var manageAccountLink = (HyperLink)LoginView.FindControl("ManageAccountLink");
      var adminPanelLink = (HyperLink)LoginView.FindControl("AdminPanelLink");
      if (registerLink != null)
      {
        SetActiveClass(registerLink, "Register");
      }

      if (loginLink != null)
      {
        SetActiveClass(loginLink, "Login");
      }

      if (manageAccountLink != null)
      {
        SetActiveClass(manageAccountLink, "Manage");
      }

      if (adminPanelLink != null)
      {
        SetActiveClass(adminPanelLink, "AdminPanel");
      }
    }

    private void SetActiveClass(WebControl link, string pageName)
    {
      var currentPage = Path.GetFileName(Request.Url.AbsolutePath);
      link.CssClass = currentPage.Equals(pageName, StringComparison.OrdinalIgnoreCase) ? "nav-link active" : "nav-link";
    }
  }
}