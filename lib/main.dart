import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context)
      //         .copyWith(textScaler: TextScaler.linear(1.0)),
      //     child: child!,
      //   );
      // },
    );
  }
}
