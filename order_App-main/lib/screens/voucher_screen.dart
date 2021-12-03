// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/pages/voucher/accumulate_points.dart';
import 'package:order_app/pages/voucher/redeem_offer.dart';
import 'package:order_app/widgets/widgets.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leadingWidth: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            titleSpacing: 15.0,
            title: Text(
              'Ưu đãi',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              // CircleButton(
              //   icon: CupertinoIcons.tickets,
              //   iconSize: 24.0,
              //   // color: Palette.themeColor,
              //   onPressed: () => print(''),
              // ),
              CircleButton(
                icon: CupertinoIcons.bell,
                iconSize: 24.0,
                // color: Colors.yellow.shade500,
                onPressed: () => print('Search'),
                isStickers: true,
              ),
              const SizedBox(width: 15),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Palette.primaryColor,
                  unselectedLabelColor: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 30.0,
                    indicatorColor: Colors.grey.shade100,
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    // indicatorRadius: 1,
                    // insets: EdgeInsets.all(1),
                    // padding: EdgeInsets.all(10),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Tích điểm',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Đổi ưu đãi',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AccumulatePoints(),
              RedeemOffer(),
            ],
          ),
        ),
      ),
    );
  }
}
