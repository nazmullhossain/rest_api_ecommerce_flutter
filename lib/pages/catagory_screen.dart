import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/catagory_model.dart';
import '../services/api_hnadler.dart';
import '../widgets/catagory_widgets.dart';
import '../widgets/feed_widgets.dart';

class CatagoryPage extends StatefulWidget {
  const CatagoryPage({Key? key}) : super(key: key);

  @override
  State<CatagoryPage> createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  late List<CatagoryModel> catagoryList = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    catagoryList = await ApiHandler.getCagory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catagory"),
        ),
        body: FutureBuilder <List<CatagoryModel>>(
          future: ApiHandler.getCagory(),
          builder: (context,snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Center(child: Text("error occered"),);
          }
else if(snapshot.data==null){
  return Center(child: Text("not have any product"),);
          }

            return GridView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: catagoryList[index],
                      child: CatagoryWidgets());
                });
          }
        ));
  }
}
