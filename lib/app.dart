import 'package:flutter/material.dart';
import 'package:plants_shop/controller/cart_controller.dart';
import 'package:plants_shop/pages/started_page.dart';
import 'package:plants_shop/provider/provider_inherit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      controller: CartController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const StartedPage(),
      ),
    );
  }
}
