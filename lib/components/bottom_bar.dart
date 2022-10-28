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
        backgroundColor: const Color(0XFF0075FF),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/market_icon.svg",
              color: Colors.white,
            ),
            label: "Market",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/search_icon.svg",
              color: Colors.white,
            ),
            label: "Search",
          ),
        ],
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
