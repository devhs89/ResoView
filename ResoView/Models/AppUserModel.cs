/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using ResoView.Constants;

namespace ResoView.Models
{
  // Class to represent the user of the application, that inherits from IdentityUser
  public class AppUser : IdentityUser
  {
    // Additional properties for the user
    public string FirstName { get; set; }
    public string LastName { get; set; }

    // Method to generate the user identity, that is used for authentication
    private ClaimsIdentity GenerateUserIdentity(ResoViewUserManager manager)
    {
      var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
      // Add fullname as a claim
      userIdentity.AddClaim(new Claim(CustomClaimConstant.FullName, $"{FirstName} {LastName}"));
      return userIdentity;
    }

    public Task<ClaimsIdentity> GenerateUserIdentityAsync(ResoViewUserManager manager)
    {
      return Task.FromResult(GenerateUserIdentity(manager));
    }
  }
}