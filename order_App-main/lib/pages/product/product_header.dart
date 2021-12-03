// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/pages/product/category.dart';
import 'package:order_app/widgets/search_widget.dart';

class ProductHeader extends StatelessWidget {
  // final String id;
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return
        // PreferredSize(
        //   preferredSize: Size(_width, _height * 0.07),
        //   child:
        Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      height: _height * 0.07,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => {
                showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) => CategoryModal()),
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // width: _height * 0.07,
                height: _height * 0.07,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thực đơn',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22,
                      color: Colors.grey.shade600,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchWidget()),
            ),
            child: Container(
              width: _height * 0.07,
              height: _height * 0.07,
              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                CupertinoIcons.search,
                size: 20,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: _height * 0.07,
            height: _height * 0.07,
            decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              CupertinoIcons.heart,
              size: 20,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
