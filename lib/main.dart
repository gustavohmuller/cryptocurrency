import 'package:cryptocurrency/screens/market_screen.dart';
import 'package:cryptocurrency/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/market",
      routes: {
        "/market": (context) => const MarketScreen(),
        "/search": (context) => const SearchScreen(),

        // SPLASH SCREEN: https://www.figma.com/file/kVS1HwSyK9RRAO7d1w8Gf6/BlackGold-Crypto--Currency--Free-3D-icons-(Community)?node-id=2%3A85
      },
    );
  }
}
