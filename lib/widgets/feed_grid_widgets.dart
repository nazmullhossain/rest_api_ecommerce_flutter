import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import 'feed_widgets.dart';

class FeedGridWidget extends StatelessWidget {
  FeedGridWidget({Key? key, required this.productList}) : super(key: key);
  List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: productList[index],
            child: FeedWidgets(
                // imageUrl: productList[index].images![0],
                // title: productList[index].title.toString(),
                // price: productList[index].price!.toInt(),

                ),
          );
        });
  }
}
