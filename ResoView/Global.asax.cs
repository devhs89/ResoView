using System;
using System.Data.Entity;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using ResoView.Models;

namespace ResoView
{
  public class Global : HttpApplication
  {
    void Application_Start(object sender, EventArgs e)
    {
      // Seed Data
      Database.SetInitializer(new DropCreateDatabaseIfModelChanges<ResoViewDbContext>());

      // Code that runs on application startup
      RouteConfig.RegisterRoutes(RouteTable.Routes);
      BundleConfig.RegisterBundles(BundleTable.Bundles);
    }
  }
}