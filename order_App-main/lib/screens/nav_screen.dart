//ignore_for_file: prefer_const_constructors, unused_field, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/screens/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  get initialValue => null;

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 10);
  static List<Widget> _screens = [
    HomeScreen(),
    ProductScreen(),
    StoreScreen(),
    VoucherScreen(),
    OtherScreen(),
  ];
  Future showStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  @override
  void initState() {
    // var count = widget.initialValue.length; // Initial value
    showStatusBar();
    super.initState();
  }
  void _onItemTapped(int index) {
    this.setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedIndex);
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: optionStyle,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            // icon: svgIcon('images/home.svg'),
            title: Text(
              'Trang chủ',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            title: Text(
              'Đặt hàng',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location),
            title: Text(
              'Cửa hàng',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket),
            title: Text(
              'Ưu đãi',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bars),
            title: Text(
              'Khác',
              style: optionStyle,
            ),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.primaryColor,
      ),
    );
  }
}

Widget svgIcon(iconName) {
  return SvgPicture.asset(iconName,
      color: Colors.red, semanticsLabel: 'A red up arrow');
}
