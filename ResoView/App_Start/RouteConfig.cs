/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace ResoView
{
  public static class RouteConfig
  {
    // Register routes for the application
    public static void RegisterRoutes(RouteCollection routes)
    {
      // Instantiate friendly URL Settings
      var settings = new FriendlyUrlSettings();
      // Redirect to permanent URL
      settings.AutoRedirectMode = RedirectMode.Permanent;
      // Register routes with friendly URLs
      routes.EnableFriendlyUrls(settings);
    }
  }
}