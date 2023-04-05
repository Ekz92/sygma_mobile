import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sygma_mobile/repositories/cart_repository.dart';

import 'models/cart.model.dart';
import 'providers/cart_provider.dart';
import 'routes.dart';
import 'screens/home/home_screen.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => CartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Initailise cart list
    Future.delayed(Duration.zero, () async {
      List<Cart> carts = await CartRepository.list();
      setCarts(carts);
    });
  }

  void setCarts(List<Cart> carts) {
    Provider.of<CartProvider>(context, listen: false).setCarts(carts);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sygma Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
