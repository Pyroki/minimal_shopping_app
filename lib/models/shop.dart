import 'package:flutter/material.dart';
import 'package:minimal_shoppingapp/models/product.dart';

class shop extends ChangeNotifier {
  //add product shop list

  final List<Product> _Shop = [
    Product(
        name: 'Hoodie',
        price: 49.99,
        description:
            'A comfortable and stylish hoodie, perfect for casual wear.',
        imagepath: 'assets/pro1.jpeg'),
    Product(
        name: 'Sunglasses',
        price: 29.99,
        description: 'Fashionable sunglasses with UV protection.',
        imagepath: 'assets/pro2.jpeg'),
    Product(
        name: 'Nike Shoes',
        price: 79.99,
        description:
            'High-quality Nike running shoes for sports and daily wear.',
        imagepath: 'assets/pro3.jpeg'),
    Product(
        name: 'Watch',
        price: 199.99,
        description: 'A sleek and elegant watch to complement any outfit.',
        imagepath: 'assets/pro4.jpeg'),
  ];

  //user cart

  List<Product> _cart = [];

  //get product list
  List<Product> get Shop => _Shop;

  //get cart list
  List<Product> get Cart => _cart;

  //add to cart
  void addtocart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove from cart
  void removefromcart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
