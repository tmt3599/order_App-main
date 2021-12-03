import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';
import 'package:order_app/data/data.dart';
import 'package:order_app/pages/voucher/redeem_offer_list.dart';
import 'package:order_app/widgets/widgets.dart';

class RedeemOffer extends StatelessWidget {
  const RedeemOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SeeAll(
              title: 'Từ AHA Coffee',
              // onPressed: () => print('see all'),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: RedeemOfferList(voucher: vouchers),
            ),
          ),
          const SliverToBoxAdapter(
            child: SeeAll(
              title: 'Từ đối tác',
              // onPressed: () => print('see all'),
              isDisible: true,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Chưa có ưu đãi từ đối tác',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => Container(
          //         padding: EdgeInsets.symmetric(vertical: 2),
          //         child: GestureDetector(
          //           onTap: () => {
          //             // showModalBottomSheet<void>(
          //             //   isScrollControlled: true,
          //             //   context: context,
          //             //   backgroundColor: Colors.black,
          //             //   shape: RoundedRectangleBorder(
          //             //     borderRadius: BorderRadius.only(
          //             //       topLeft: Radius.circular(20),
          //             //       topRight: Radius.circular(20),
          //             //     ),
          //             //   ),
          //             // builder: (BuildContext context) =>
          //             // StoreDetail(),
          //             // ),
          //           },
          //           // child: StoreContainer(product: products[index]),
          //           child: Text('data'),
          //         ),
          //       ),
          //       childCount: 5,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
