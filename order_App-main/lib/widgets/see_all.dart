// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/widgets/widgets.dart';

class SeeAll extends StatelessWidget {
  final String title;
  // final Function onPressed;
  final bool isDisible;
  const SeeAll(
      {Key? key,
      required this.title,
      // required this.onPressed,
      this.isDisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text(
                        'Phiếu ưu đãi của bạn',
                        style: TextStyle(
                          color: Palette.white,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Palette.primaryColor,
                      centerTitle: true,
                      elevation: 0.6,
                    ),
                    body: ListView.builder(
                      itemCount: vouchers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: VoucherListContainer(voucher: vouchers[index]),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: isDisible
                    ? Palette.grey90
                    : Palette.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Xem tất cả',
                style: TextStyle(
                  color: isDisible ? Palette.grey46 : Palette.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
