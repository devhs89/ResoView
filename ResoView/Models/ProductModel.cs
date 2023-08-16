﻿using System.ComponentModel.DataAnnotations;

namespace ResoView.Models
{
  public class ProductModel
  {
    [Key] public int Id { get; set; }
    [Required] public string Name { get; set; }
    [Required] public decimal Price { get; set; }
    [Required] public string Description { get; set; }
    [Required] public string ImageUrl { get; set; }
  }
}