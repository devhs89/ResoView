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
using Microsoft.AspNet.Identity.EntityFramework;

namespace ResoView.Models
{
  // Application database context class that inherits from IdentityDbContext
  public class ResoViewDbContext : IdentityDbContext<AppUser>
  {
    // Constructor that calls the base class constructor with the "DefaultConnection" connection string
    public ResoViewDbContext()
      : base("DefaultConnection", throwIfV1Schema: false)
    {
    }

    // Products table property that represents the Products table in the database
    public DbSet<Product> Products { get; set; }

    public static ResoViewDbContext Create()
    {
      return new ResoViewDbContext();
    }
  }
}

#region Helpers

namespace ResoView
{
  public static class IdentityHelper
  {
    // Used for XSRF when linking external logins
    public const string XsrfKey = "XsrfId";

    public const string ProviderNameKey = "providerName";

    public static string GetProviderNameFromRequest(HttpRequest request)
    {
      return request.QueryString[ProviderNameKey];
    }

    public const string CodeKey = "code";

    public static string GetCodeFromRequest(HttpRequest request)
    {
      return request.QueryString[CodeKey];
    }

    public const string UserIdKey = "userId";

    public static string GetUserIdFromRequest(HttpRequest request)
    {
      return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
    }

    public static string GetResetPasswordRedirectUrl(string code, HttpRequest request)
    {
      var absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
      return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
    }

    public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
    {
      var absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" +
                        HttpUtility.UrlEncode(userId);
      return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
    }

    private static bool IsLocalUrl(string url)
    {
      return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) ||
                                            (url.Length > 1 && url[0] == '~' && url[1] == '/'));
    }

    public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
    {
      if (!string.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
      {
        response.Redirect(returnUrl);
      }
      else
      {
        response.Redirect("~/");
      }
    }
  }
}

#endregion