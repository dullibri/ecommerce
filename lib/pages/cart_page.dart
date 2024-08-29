import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<Cart>();
    int itemCount = cart.userCart.length;
    return Center(
      child: Consumer<Cart>(
          builder: (context, cart, child) => ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Text(cart.userCart[index].name);
              })),
    );
  }
}
