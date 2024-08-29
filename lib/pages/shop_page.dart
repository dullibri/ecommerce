import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Shoe> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchShoes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchShoes() {
    final cart = Provider.of<Cart>(context, listen: false);
    final query = _searchController.text.toLowerCase();
    _searchResults = cart.shoeShop.where((shoe) {
      return shoe.name.toLowerCase().contains(query) ||
          shoe.description.toLowerCase().contains(query);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Icon(Icons.search)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(
          "everyone flies ...some fly longer than others",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(14.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Hot Picks🔥",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "see all",
            style: TextStyle(color: Colors.blue),
          )
        ]),
      ),
      SizedBox(height: 20.0),
      Expanded(
        child: ListView.builder(
          itemCount: _searchResults.isEmpty ? 4 : _searchResults.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ShoeTile(
              shoe: _searchResults.isEmpty
                  ? Provider.of<Cart>(context, listen: false).shoeShop[index]
                  : _searchResults[index],
            );
          },
        ),
      )
    ]);
  }
}
