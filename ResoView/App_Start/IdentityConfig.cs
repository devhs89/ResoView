﻿/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using ResoView.Models;

namespace ResoView
{
  // Configure the application user manager that inherits from UserManager defined in ASP.NET Identity
  public class ResoViewUserManager : UserManager<AppUser>
  {
    // Pass the user store to the base class
    public ResoViewUserManager(IUserStore<AppUser> store)
      : base(store)
    {
    }

    // Create user manager with the specified options
    public static ResoViewUserManager Create(IdentityFactoryOptions<ResoViewUserManager> options,
      IOwinContext context)
    {
      var manager = new ResoViewUserManager(new UserStore<AppUser>(context.Get<ResoViewDbContext>()));
      // Configure validation logic for usernames
      manager.UserValidator = new UserValidator<AppUser>(manager)
      {
        AllowOnlyAlphanumericUserNames = false,
        RequireUniqueEmail = true
      };

      // Configure validation logic for passwords
      manager.PasswordValidator = new PasswordValidator
      {
        RequiredLength = 6,
        RequireNonLetterOrDigit = true,
        RequireDigit = true,
        RequireLowercase = true,
        RequireUppercase = true,
      };

      // Configure user lockout defaults
      manager.UserLockoutEnabledByDefault = true;
      manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(1);
      manager.MaxFailedAccessAttemptsBeforeLockout = 3;

      // Configure token provider if data protection provider is set
      var dataProtectionProvider = options.DataProtectionProvider;
      if (dataProtectionProvider != null)
      {
        manager.UserTokenProvider =
          new DataProtectorTokenProvider<AppUser>(dataProtectionProvider.Create("ASP.NET Identity"));
      }

      return manager;
    }
  }

  // Configure the application sign-in manager that inherits from SignInManager defined in ASP.NET Identity
  public class ResoViewSignInManager : SignInManager<AppUser, string>
  {
    // Pass the user manager and authentication manager to the base class
    public ResoViewSignInManager(ResoViewUserManager userManager, IAuthenticationManager authenticationManager) :
      base(userManager, authenticationManager)
    {
    }

    public override Task<ClaimsIdentity> CreateUserIdentityAsync(AppUser user)
    {
      return user.GenerateUserIdentityAsync((ResoViewUserManager)UserManager);
    }

    // Create sign-in manager with the specified options
    public static ResoViewSignInManager Create(IdentityFactoryOptions<ResoViewSignInManager> options,
      IOwinContext context)
    {
      return new ResoViewSignInManager(context.GetUserManager<ResoViewUserManager>(), context.Authentication);
    }
  }

  // Configure the application role manager that inherits from RoleManager defined in ASP.NET Identity
  public class ResoViewRoleManager : RoleManager<AppRole>
  {
    // Pass the role store to the base class
    public ResoViewRoleManager(IRoleStore<AppRole, string> roleStore) : base(roleStore)
    {
    }

    // Create role manager with the specified options
    public static ResoViewRoleManager Create(IdentityFactoryOptions<ResoViewRoleManager> options,
      IOwinContext context)
    {
      var roleStore = new RoleStore<AppRole>(context.Get<ResoViewDbContext>());
      return new ResoViewRoleManager(roleStore);
    }
  }
}