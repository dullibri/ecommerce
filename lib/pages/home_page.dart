import 'package:ecommerce/components/bottom_nav_bar.dart';
import 'package:ecommerce/components/drawer_hp.dart';
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
        ));
  }
}
