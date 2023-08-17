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
    public static void RegisterRoutes(RouteCollection routes)
    {
      var settings = new FriendlyUrlSettings();
      settings.AutoRedirectMode = RedirectMode.Permanent;
      routes.EnableFriendlyUrls(settings);
    }
  }
}