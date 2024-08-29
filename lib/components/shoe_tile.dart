import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoeTile extends StatelessWidget {
  ShoeTile({super.key, required this.shoe});
  final Shoe shoe;

  // Funktion, um zu prüfen, ob der Schuh im Cart ist
  bool isInCart(Cart cart) {
    return cart.userCart.any((shoeInCart) => shoeInCart.name == shoe.name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(shoe.imagePath),
            ),
          ),
          Text(
            shoe.description,
            style: TextStyle(color: Colors.grey[700]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${shoe.price}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      bool inCart = isInCart(cart);
                      return IconButton(
                        onPressed: () {
                          // Direkte Manipulation des Cart-Zustands
                          if (inCart) {
                            cart.removeItemFromCart(shoe: shoe);
                          } else {
                            cart.addItemToCart(shoe: shoe);
                          }
                        },
                        icon: Icon(
                          inCart ? Icons.remove : Icons.add,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
