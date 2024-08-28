import 'package:ecommerce/models/shoe.dart';

class Cart {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'shoe1',
        imagePath: 'lib/images/shoe1.jpg',
        description: 'description1',
        price: '1'),
    Shoe(
        name: 'shoe2',
        imagePath: 'lib/images/shoe2.jpg',
        description: 'description2',
        price: '2'),
    Shoe(
        name: 'shoe3',
        imagePath: 'lib/images/shoe3.jpg',
        description: 'description3',
        price: '3'),
    Shoe(
        name: 'shoe4',
        imagePath: 'lib/images/shoe4.jpg',
        description: 'description4',
        price: '4'),
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
  }

  void removeItemFromCart({required Shoe shoe}) {
    userCart.remove(shoe);
  }
}
