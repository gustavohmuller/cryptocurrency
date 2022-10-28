import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:cryptocurrency/screens/market_screen.dart';
import 'package:cryptocurrency/screens/search_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final tabs = [const MarketScreen(), const SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0XFF2E3440),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/market_icon.svg",
              color: const Color(0XFFE6E6E6),
            ),
            label: "Market",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/search_icon.svg",
              color: const Color(0XFFE6E6E6),
            ),
            label: "Search",
          ),
        ],
        selectedItemColor: const Color(0XFFE6E6E6),
        unselectedItemColor: const Color(0XFFE6E6E6),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
