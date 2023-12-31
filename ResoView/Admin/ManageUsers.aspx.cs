﻿/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace ResoView.Admin
{
  public partial class ManageUsers : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (IsPostBack) return;
      BindUsersGridView();
    }

    // Bind users to grid view method
    private void BindUsersGridView()
    {
      // Get role manager and user manager from Owin context
      var roleManager = Context.GetOwinContext().GetUserManager<ResoViewRoleManager>();
      var userManager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var memberRoleId = roleManager.Roles.SingleOrDefault(r => r.Name == "member")?.Id;
      if (memberRoleId == null) return;
      var members = userManager.Users.Where(u => u.Roles.Any(r => r.RoleId == memberRoleId)).ToList();
      GridViewUsers.DataSource = members;
      GridViewUsers.DataBind();
    }

    // Handle row canceling edit event
    protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      GridViewUsers.EditIndex = -1;
      BindUsersGridView();
    }

    // Handle row deleting event
    protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      var id = GridViewUsers.DataKeys[e.RowIndex]?.Values?["Id"].ToString();
      var userManager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var user = userManager.FindById(id);
      if (user == null) return;
      userManager.Delete(user);
      GridViewUsers.EditIndex = -1;
      BindUsersGridView();
    }

    // Handle row editing event
    protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
    {
      GridViewUsers.EditIndex = e.NewEditIndex;
      BindUsersGridView();
    }

    // Handle row updating event
    protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      if (!Page.IsValid) return;

      var row = GridViewUsers.Rows[e.RowIndex];
      var id = Convert.ToString(GridViewUsers.DataKeys[e.RowIndex]?.Values?["Id"]);
      var updatedFirstName = (row.FindControl("EditFirstName") as TextBox)?.Text;
      var updatedLastName = (row.FindControl("EditLastName") as TextBox)?.Text;
      var updatedEmail = (row.FindControl("EditEmail") as TextBox)?.Text;

      var userManager = Context.GetOwinContext().GetUserManager<ResoViewUserManager>();
      var user = userManager.FindById(id);

      if (user == null) return;
      user.FirstName = updatedFirstName;
      user.LastName = updatedLastName;
      user.Email = updatedEmail;
      user.UserName = updatedEmail;
      var result = userManager.Update(user);

      if (!result.Succeeded) return;
      GridViewUsers.EditIndex = -1;
      BindUsersGridView();
    }
  }
}