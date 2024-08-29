import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'shoe1',
        imagePath: 'lib/images/shoe1.jpg',
        description: 'description1',
        price: '1',
        inCart: false),
    Shoe(
        name: 'shoe2',
        imagePath: 'lib/images/shoe2.jpg',
        description: 'description2',
        price: '2',
        inCart: false),
    Shoe(
        name: 'shoe3',
        imagePath: 'lib/images/shoe3.jpg',
        description: 'description3',
        price: '3',
        inCart: false),
    Shoe(
        name: 'shoe4',
        imagePath: 'lib/images/shoe4.jpg',
        description: 'description4',
        price: '4',
        inCart: false),
  ];
  List<Shoe> userCart = [];
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getCart() {
    return userCart;
  }

  void addItemToCart({required Shoe shoe}) {
    userCart.add(shoe);
    print("cart_model added $shoe");
    notifyListeners();
  }

  void removeItemFromCart({required Shoe shoe}) {
    userCart.remove(shoe);
    print("cart_model removed $shoe");
    notifyListeners();
  }
}
