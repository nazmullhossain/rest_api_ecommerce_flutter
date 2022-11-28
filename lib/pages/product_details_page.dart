import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:rest_api_ecommerce/models/product_model.dart';
import 'package:rest_api_ecommerce/services/api_hnadler.dart';

import '../consts/global_colors.dart';
import '../widgets/sale_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key,required this.id}) : super(key: key);

  final String id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductModel ?productModel;


  Future<void>getProductId()async{
    productModel=await ApiHandler.getProductById(id: widget.id);
    setState(() {

    });
  }

@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  getProductId();
    super.didChangeDependencies();
  }

  final titleStyle=const TextStyle(fontSize: 24,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: productModel==null?Center(child: CircularProgressIndicator(),):  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 18,),
             Text(productModel!.category.toString(),style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                     Flexible(
                        flex: 3,
                        child: Text(productModel!.title.toString(),style: TextStyle(fontSize: 20),)),
                  Flexible(
                    flex: 1,
                      child:  RichText(
                    text: TextSpan(
                        text: "\$",
                        style: const TextStyle(
                          fontSize: 22,
                            color: Color.fromRGBO(33, 150, 243, 1)),
                        children: <TextSpan>[
                          TextSpan(
                              text: productModel!.price.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w600))
                        ]),
                  )),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: size.height* 0.3,
                  child:  Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return  Padding(
                        padding: EdgeInsets.all(4.0),
                        child: FancyShimmerImage(
                          // color: Colors.red,
                          height: size.height * 0.2,
                          width: double.infinity,
                          errorWidget: const Icon(
                            IconlyBold.danger,
                            color: Colors.red,
                          ),
                          imageUrl: productModel!.images![0],
                          boxFit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: 3,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.red),
                      alignment: Alignment.bottomCenter,
                    ),
                    // control: SwiperControl(),
                  ),
                ),
                SizedBox(height: 18,),
                Text("Descripton",style: titleStyle,),
                SizedBox(height: 18,),
                Text(productModel!.description.toString(), textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 15),)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
