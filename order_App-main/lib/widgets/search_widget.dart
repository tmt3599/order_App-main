import 'dart:async';

import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/pages/product/product_detail.dart';
import 'package:order_app/services/product_service.dart';
import 'package:order_app/widgets/product_container.dart';
import 'package:order_app/widgets/search.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final productService = ProductService();
  List<Product> products = [];
  List<Product> data = [];
  String query = '';
  Timer? debouncer;
  @override
  void initState() {
    _getProducts();
    super.initState();
  }

  void _getProducts() async {
    products = await productService.getProduct();
    // setState(() {
    //   data = products;
    // });
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 400),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Future searchBook(String query) async => debounce(() async {
        final books = await ProductSearch.getProductSearch(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.products = books;
        });
      });

  Widget buildSearch() => Search(
        text: query,
        hintText: 'Tìm kiếm',
        onChanged: searchBook,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(child: buildSearch()),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        color: Palette.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    // child: ProductContainer(product: product),
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
                          builder: (BuildContext context) => ProductDetail(
                            product: product, valueSetter: (Product value) {  },
                          ),
                        ),
                      },
                      child: ProductContainer(product: product),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
