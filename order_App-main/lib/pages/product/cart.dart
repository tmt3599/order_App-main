import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/widgets/widgets.dart';

class CartWidget extends StatefulWidget {
  final List<Product> cart;
  final Function cleanAll;
  final sum;
  const CartWidget(
      {Key? key, required this.cart, required this.sum, required this.cleanAll})
      : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  bool _isShown = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height - 50,
      decoration: const BoxDecoration(
        color: Palette.scaffold,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                'Xác nhận đơn hàng',
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Container(
              color: Palette.scaffold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Palette.white,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Các sản phẩm đã chọn',
                              style: TextStyle(
                                color: Palette.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Palette.primaryColor.withAlpha(50),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  '+ Thêm sản phẩm',
                                  style: TextStyle(
                                    color: Palette.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
                          child: SizedBox(
                            height: widget.cart.length >= 4
                                ? 230
                                : 60 * (widget.cart.length + 0),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          '${widget.cart[index].imageUrl}',
                                          width: 45,
                                          height: 45,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Text(
                                          '${widget.cart[index].name}',
                                          style: const TextStyle(
                                              color: Palette.textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                locale: 'vi', symbol: 'đ')
                                            .format(widget.cart[index].price),
                                        style: const TextStyle(
                                            color: Palette.textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: widget.cart.length),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    color: Palette.white,
                    width: _width,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tổng cộng',
                          style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Thành tiền',
                              style: TextStyle(
                                color: Palette.textColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(locale: 'vi', symbol: 'đ')
                                  .format(widget.sum),
                              style: const TextStyle(
                                color: Palette.textColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 30,
                          thickness: 0.6,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Chọn khuyến mãi',
                                style: TextStyle(
                                  color: Palette.blue,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 30,
                          thickness: 0.6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Số tiền thanh toán',
                              style: TextStyle(
                                color: Palette.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(locale: 'vi', symbol: 'đ')
                                  .format(widget.sum),
                              style: const TextStyle(
                                color: Palette.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => showCupertinoDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return CupertinoAlertDialog(
                          title: const Text('Xác nhận'),
                          content: const Text(
                              'Bạn chắc chắn muốn xóa đơn hàng này không'),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Hủy bỏ'),
                              isDefaultAction: false,
                              isDestructiveAction: false,
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                setState(
                                  () {
                                    _isShown = false;
                                    widget.cleanAll();
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                              child: const Text('Xác nhận'),
                              isDefaultAction: true,
                              isDestructiveAction: true,
                            ),
                          ],
                        );
                      },
                    ),
                    child: Container(
                      color: Palette.white,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                CupertinoIcons.delete,
                                color: Palette.red,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Xóa đơn hàng',
                                style: TextStyle(
                                  color: Palette.red,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
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
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                CupertinoIcons.clear,
                size: 20,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Palette.themeColor,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Giao hàng	• ${widget.cart.length} sản phẩm',
                        style: const TextStyle(
                          color: Palette.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        NumberFormat.currency(locale: 'vi', symbol: 'đ')
                            .format(widget.sum),
                        style: const TextStyle(
                          color: Palette.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => showCupertinoDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return CupertinoAlertDialog(
                          title: const Text('Thông báo'),
                          content: Column(
                            children: [
                              const Text('Đặt hàng thành công'),
                              Text(
                                  '${NumberFormat.currency(locale: 'vi', symbol: 'đ').format(widget.sum)}	• ${widget.cart.length} sản phẩm'),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                setState(
                                  () {
                                    _isShown = false;
                                    // widget.cleanAll();
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                              child: const Text('OK'),
                              isDefaultAction: true,
                              isDestructiveAction: false,
                            ),
                          ],
                        );
                      },
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: const Text(
                        'Đặt hàng',
                        style: TextStyle(
                          color: Palette.themeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
