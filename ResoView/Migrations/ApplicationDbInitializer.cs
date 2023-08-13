using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using ResoView.Models;

namespace ResoView.Migrations
{
  public class ApplicationDbInitializer : DbMigrationsConfiguration<ApplicationDbContext>
  {
    public ApplicationDbInitializer()
    {
      AutomaticMigrationsEnabled = false;
    }

    protected override void Seed(ApplicationDbContext context)
    {
      var adminUser = new ApplicationUser()
      {
        UserName = "harpreetsingh0943",
        Email = "harpreetsingh0943@conestogac.on.ca",
        PasswordHash = new PasswordHasher().HashPassword("Xyz12345$"),
        SecurityStamp = new Guid().ToString(),
        EmailConfirmed = true
      };

      context.Users.Add(adminUser);

      var userRoles = new List<ApplicationRole>()
      {
        new ApplicationRole()
        {
          Name = "admin"
        },
        new ApplicationRole()
        {
          Name = "member"
        }
      };
      foreach (var userRole in userRoles)
      {
        userRole.Users.Add(new IdentityUserRole()
        {
          RoleId = userRole.Id,
          UserId = adminUser.Id
        });
        context.Roles.Add(userRole);
      }

      context.SaveChanges();
    }
  }
}