import 'package:ecommerce/components/bottom_nav_bar.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShopPage())),
                    textColor: Colors.white,
                    title: Text('Shop Page'),
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
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
      ),
    );
  }
}
