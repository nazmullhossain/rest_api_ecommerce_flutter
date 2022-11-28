import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ecommerce/consts/global_colors.dart';

import '../models/product_model.dart';
import '../pages/product_details_page.dart';

class FeedWidgets extends StatelessWidget {
   FeedWidgets({Key? key,}) : super(key: key);



   //data get from provider
  // final String title,imageUrl;
  // int price;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ProductModel productModelProvider=Provider.of<ProductModel>(context);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.push(context, PageTransition(
                child: ProductDetailsPage(id: productModelProvider.id.toString(),),
                type: PageTransitionType.fade));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: RichText(
                      text: TextSpan(
                          text: "\$",
                          style:  const TextStyle(
                              color: Color.fromRGBO(33, 150, 243, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: "${productModelProvider.price}",
                                style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600))
                          ]),
                    )),
                    Icon(IconlyBold.heart)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(

                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  // color: Colors.red,
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                  ),
                  imageUrl: productModelProvider.images![0],
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  productModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
