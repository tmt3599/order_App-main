// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/config/palette.dart';
import 'package:intl/intl.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/module/counter/counter_bloc.dart';

class ProductDetail extends StatelessWidget {
  final ValueSetter<Product> valueSetter;
  final Product product;
  const ProductDetail(
      {Key? key, required this.product, required this.valueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    final CounterBloc counterBloc = context.read<CounterBloc>();

    return BlocBuilder<CounterBloc, int>(
      builder: (context, counter) {
        return Container(
          width: _width,
          height: _height - 50,
          decoration: BoxDecoration(
            color: Palette.scaffold,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: _width,
                      height: _height * 2 / 5,
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: product.imageUrl == null
                            ? Image(
                                image: AssetImage('images/image-none.png'),
                                width: _width,
                                height: _height * 2 / 5,
                              )
                            : Image.network(
                                '${product.imageUrl}',
                                width: _width,
                                height: _height * 2 / 5,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${product.name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 12.0,
                                  ),
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              NumberFormat.currency(locale: 'vi', symbol: 'đ')
                                  .format(product.price),
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '${product.derc}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    product.size == null
                        ? const SizedBox.shrink()
                        : Container(
                            width: _width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Size',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Chọn 1 loại size',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // ListView.builder(
                                //     itemCount: 1,
                                //     itemBuilder: (context, index) {
                                //       return Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Text(
                                //             'Nho',
                                //             style: TextStyle(
                                //               color: Colors.black87,
                                //               fontSize: 14,
                                //               fontWeight: FontWeight.w600,
                                //             ),
                                //           ),
                                //           Text(
                                //             '+ 0 d',
                                //             style: TextStyle(
                                //               color: Colors.black87,
                                //               fontSize: 14,
                                //               fontWeight: FontWeight.w600,
                                //             ),
                                //           ),
                                //         ],
                                //       );
                                //     })
                              ],
                            ),
                          ),
                    Container(
                      width: _width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yêu cầu khác',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Những tùy chọn khác',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => print('cmt'),
                            child: Container(
                              width: _width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black38,
                                ),
                              ),
                              child: Text(
                                'Thêm ghi chú',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height / 5),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  width: _width,
                  height: _height / 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.lerp(a, b, t)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              counterBloc.add(DecrementEvent());
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Center(
                                child: Text(
                                  '–',
                                  style: TextStyle(
                                    color: counter == 0
                                        ? Colors.grey.shade400
                                        : Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              counterBloc.add(IncrementEvent());
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              valueSetter(product);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: _width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Chọn sản phẩm - ${NumberFormat.currency(locale: 'vi', symbol: 'đ').format(product.price! * counter)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: InkWell(
                    child: Icon(
                      CupertinoIcons.clear_circled_solid,
                      size: 35,
                      color: Colors.grey.shade700,
                    ),
                    onTap: () => {
                          Navigator.pop(context),
                          counterBloc.add(ResertEvent()),
                        }),
              ),
            ],
          ),
        );
      },
    );
  }
}
