/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using System.ComponentModel.DataAnnotations;

namespace ResoView.Models
{
  public class Product
  {
    [Key] public int Id { get; set; }
    [Required] public string Name { get; set; }
    [Required] public decimal Price { get; set; }
    [Required] public string Description { get; set; }
    [Required] public string ImageUrl { get; set; }
  }
}