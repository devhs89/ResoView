/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi (8876529)
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

using ResoView.Models;

namespace ResoView.Dtos
{
  public class CartItem
  {
    public Product Product { get; set; }
    public int ProductQuantity { get; set; }
  }
}