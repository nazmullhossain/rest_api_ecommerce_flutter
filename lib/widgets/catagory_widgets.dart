import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ecommerce/consts/global_colors.dart';

import '../models/catagory_model.dart';

class CatagoryWidgets extends StatelessWidget {
  const CatagoryWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final  catagoryModelProvider=Provider.of<CatagoryModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                // color: Colors.red,
                height: size.height * 0.45,
                width: size.height * 0.45,
                // width: double.infinity,
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                ),
                imageUrl: catagoryModelProvider.image.toString(),
                boxFit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                catagoryModelProvider.name.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    backgroundColor: lightCardColor.withOpacity(0.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
