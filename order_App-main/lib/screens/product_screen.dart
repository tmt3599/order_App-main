// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

// import 'package:flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/module/counter/counter_bloc.dart';
import 'package:order_app/module/favorite/favorite_bloc.dart';
import 'package:order_app/pages/product/cart.dart';
import 'package:order_app/pages/product/product_detail.dart';
import 'package:order_app/pages/product/product_header.dart';
import 'package:order_app/services/product_service.dart';
import 'package:order_app/widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 late CounterBloc counterBloc;
  bool _isLoading = false;
  final productService = ProductService();
  List<Product> products = [];
  List<Product> cart = [];
  int sum = 0;
  String query = '';
  @override
  void initState() {
    _getProducts();
    super.initState();
  }

  void _getProducts() async {
    setState(() => _isLoading = true);
    products = await productService.getProduct();
    setState(() => _isLoading = false);
  }

  void addCart(selectedProduct) {
    setState(() {
      cart.add(selectedProduct);
      sum = 0;
      cart.forEach((item) {
        sum = sum + item.price!.toInt();
      });
    });
  }

  void clearAll() {
    setState(() {
      cart.clear();
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final FavoriteBloc favoriteBloc = context.read<FavoriteBloc>();

    return BlocBuilder<FavoriteBloc, bool>(builder: (context, isLike) {
      print('..................$cart');
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, boxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      
                      elevation: 0.2,
                      backgroundColor: Colors.white,
                      forceElevated: boxIsScrolled,
                      floating: true,
                      pinned: true,
                      flexibleSpace: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Palette.primaryColor.withOpacity(0.3),
                                child: Image(
                                  image: AssetImage('images/icon_shipper.png'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Text(''),
                                      ),
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        this.setState(() {
                                          isLike;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'Giao đến',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          Icon(
                                            isLike
                                                ? Icons
                                                    .keyboard_arrow_down_rounded
                                                : Icons.keyboard_arrow_up,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Đường 17, phường 5, Thành phố Cà Mau',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(_width, _height * 0.07),
                        child: ProductHeader(),
                      ),
                    ),
                  ];
                },
                body: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 7.5),
                          child: GestureDetector(
                            onTap: () => {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) =>
                                    ProductDetail(
                                  product: products[index],
                                  valueSetter: (Product value) =>
                                      addCart(products[index]),
                                ),
                              ),
                            },
                            child: SlidableWidget(
                              child: ProductContainer(product: products[index]),
                              onTap: () => {
                                favoriteBloc.add(Favorite()),
                              },
                              onDismissed: (action) =>
                                  dismissSlidableItem(context, isLike),
                            ),
                          ),
                        ),
                      ),
              ),
              cart.isEmpty
                  ? SizedBox.shrink()
                  : Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
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
                            builder: (BuildContext context) => CartWidget(
                              cart: cart,
                              sum: sum,
                              cleanAll: clearAll,
                            ),
                          ),
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: _width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Palette.orage50.withOpacity(1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.primaryColor.withOpacity(0.5),
                                ),
                                child: Icon(
                                  CupertinoIcons.bag,
                                  size: 23,
                                  color: Palette.white,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Xem chi tiết',
                                        style: TextStyle(
                                          color: Palette.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        CupertinoIcons.arrow_right,
                                        size: 16,
                                        color: Palette.textColor,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${NumberFormat.currency(locale: 'vi', symbol: 'đ').format(sum)} • ',
                                        style: TextStyle(
                                          color: Palette.textColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'thông tin sản phẩm tại đây',
                                        style: TextStyle(
                                          color: Palette.textColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}

class Utils {
  static void showSnackBar(BuildContext context, bool check) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            // margin: EdgeInsets.all(5),
            content: Row(
              children: [
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 22,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  !check
                      ? 'Đã xóa khỏi danh sách yêu thích'
                      : 'Đã thêm vào danh sách yêu thích',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
}

void dismissSlidableItem(BuildContext context, bool check) {
  Utils.showSnackBar(context, check);
}
