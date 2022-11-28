import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

import '../services/api_hnadler.dart';
import '../widgets/feed_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late  List<ProductModel>productList=[];


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getProducts();
    super.didChangeDependencies();
  }

  Future<void>getProducts()async{
    productList= await ApiHandler.getAllProduct();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body:productList.isEmpty?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child:   GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: productList[index],
                  child: FeedWidgets());
            }),
      ),
    );
  }
}
