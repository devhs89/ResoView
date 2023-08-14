using System;
using System.Security.Claims;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
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
      if (!Context.User.Identity.IsAuthenticated) return;
      var userIdentity = Context.User.Identity as ClaimsIdentity;
      FullName = userIdentity.FindFirstValue(CustomClaimConstant.FullName);
      LoginView.FindControl("AdminPanelLink").Visible = Context.User.IsInRole(AppRoleConstant.Admin);
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
      Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
    }
  }
}