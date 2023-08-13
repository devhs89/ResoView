using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using ResoView.Constants;
using ResoView.Models;

namespace ResoView.Migrations
{
  public class ResoViewDbInitializer : DbMigrationsConfiguration<ResoViewDbContext>
  {
    public ResoViewDbInitializer()
    {
      AutomaticMigrationsEnabled = false;
    }

    protected override void Seed(ResoViewDbContext context)
    {
      var adminUser = new AppUser()
      {
        FirstName = "Harpreet",
        LastName = "Singh",
        UserName = "harpreetsingh0943",
        Email = "harpreetsingh0943@conestogac.on.ca",
        PasswordHash = new PasswordHasher().HashPassword("Xyz12345$"),
        SecurityStamp = new Guid().ToString(),
        EmailConfirmed = true
      };

      context.Users.Add(adminUser);

      var userRoles = new List<AppRole>
      {
        new AppRole
        {
          Name = AppRoleConstant.Admin
        },
        new AppRole
        {
          Name = AppRoleConstant.Member
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