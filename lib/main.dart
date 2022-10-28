import 'package:flutter/material.dart';

import 'package:cryptocurrency/components/bottom_bar.dart';
import 'package:cryptocurrency/screens/market_screen.dart';
import 'package:cryptocurrency/screens/search_screen.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0XFF2E3440),
          titleTextStyle: TextStyle(
            color: Color(0XFFE6E6E6),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          actionsIconTheme: IconThemeData(color: Color(0XFFE6E6E6)),
          iconTheme: IconThemeData(color: Color(0XFFE6E6E6)),
        ),
        //textTheme: GoogleFonts.bitternuTextTheme(),
      ),
      initialRoute: "/bottom_bar",
      routes: {
        "/bottom_bar": (context) => const BottomBar(),
        "/market": (context) => const MarketScreen(),
        "/search": (context) => const SearchScreen(),
      },
    );
  }
}
