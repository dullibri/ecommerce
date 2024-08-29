import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
