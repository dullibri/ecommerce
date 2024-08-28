import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
                Text(
                  "Search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.search)
              ],
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(
          "everyone flies ...some fly longer than others",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(18.0),
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
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = Shoe(
                    name: "Cool Shoe",
                    imagePath: 'lib/images/shoe1.jpg',
                    description: 'coolest shoe in the world',
                    price: '100 Dollar');
                return ShoeTile(
                  shoe: shoe,
                );
              }))
    ]);
  }
}
