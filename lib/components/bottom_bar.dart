import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushReplacementNamed(context, '/market');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/search');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/market_icon.svg",
            color: Colors.black,
          ),
          label: "Market",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/search_icon.svg",
            color: Colors.black,
          ),
          label: "Search",
        ),
      ],
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
