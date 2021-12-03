import 'dart:async';

import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/models/models.dart';
import 'package:order_app/pages/store/store_detail.dart';
import 'package:order_app/services/store_service.dart';
import 'package:order_app/widgets/search.dart';
import 'package:order_app/widgets/widgets.dart';

class SearchStore extends StatefulWidget {
  const SearchStore({Key? key}) : super(key: key);

  @override
  _SearchStoreState createState() => _SearchStoreState();
}

class _SearchStoreState extends State<SearchStore> {
  final storeService = StoreService();
  List<Store> stores = [];
  List<Store> data = [];
  String query = '';
  Timer? debouncer;
  @override
  void initState() {
    _getStores();
    super.initState();
  }

  void _getStores() async {
    stores = await storeService.getStores();
    // setState(() {
    //   data = products;
    // });
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 600),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Future searchBook(String query) async => debounce(() async {
        final books = await StoreSearch.getStoreSearch(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.stores = books;
        });
      });

  Widget buildSearch() => Search(
        text: query,
        hintText: 'Tìm kiếm cửa hàng',
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
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                          builder: (BuildContext context) =>
                              StoreDetail(store: store),
                        ),
                      },
                      child: StoreContainer(store: store),
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
