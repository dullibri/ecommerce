import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:flutter/material.dart';

class DrawerHP extends StatelessWidget {
  const DrawerHP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/black_nike.png',
              ),
            ),
            Divider(
              thickness: 25,
              color: Colors.black,
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ShopPage())),
              textColor: Colors.white,
              title: Text('Shop Page'),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
              textColor: Colors.white,
              title: Text('Cart Page'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
          ],
        ),
        ListTile(
          textColor: Colors.white,
          title: Text('Logging out'),
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
