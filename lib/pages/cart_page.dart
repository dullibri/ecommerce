import 'package:ecommerce/components/drawer_hp.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Center(
        child: cart.userCart.isEmpty
            ? Center(
                child: Text('Cart ist empty'),
              )
            : ListView.builder(
                itemCount: cart.userCart.length,
                itemBuilder: (BuildContext context, int index) {
                  Shoe shoe = cart.userCart[index];
                  return Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(shoe.imagePath),
                        ),
                        tileColor: Colors.white,
                        title: Text(
                          cart.userCart[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(cart.userCart[index].description),
                        trailing: IconButton(
                            onPressed: () {
                              cart.removeItemFromCart(shoe: shoe);
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
