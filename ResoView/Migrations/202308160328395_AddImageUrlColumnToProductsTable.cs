/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

namespace ResoView.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddImageUrlColumnToProductsTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ProductModels", "ImageUrl", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.ProductModels", "ImageUrl");
        }
    }
}
