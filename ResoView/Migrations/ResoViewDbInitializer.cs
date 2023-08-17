/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi ()
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
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
      var alreadySeeded = context.Users.Any();
      if (alreadySeeded) return;

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
        context.Roles.Add(userRole);
      }

      var adminUser = new AppUser()
      {
        FirstName = "Harpreet",
        LastName = "Singh",
        UserName = "harpreetsingh0943@conestogac.on.ca",
        Email = "harpreetsingh0943@conestogac.on.ca",
        PasswordHash = new PasswordHasher().HashPassword("Xyz12345$"),
        SecurityStamp = new Random().Next(50_000, 100_000).ToString(),
        EmailConfirmed = true,
        LockoutEnabled = true
      };

      adminUser.Roles.Add(new IdentityUserRole
      {
        RoleId = userRoles.Find(r => r.Name == AppRoleConstant.Admin).Id,
        UserId = adminUser.Id
      });

      context.Users.Add(adminUser);
      context.SaveChanges();
    }
  }
}