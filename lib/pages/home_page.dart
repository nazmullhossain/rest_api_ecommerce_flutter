import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rest_api_ecommerce/consts/global_colors.dart';
import 'package:rest_api_ecommerce/pages/user_page.dart';

import '../models/product_model.dart';
import '../services/api_hnadler.dart';
import '../widgets/appbar_icons_widgets.dart';
import '../widgets/feed_grid_widgets.dart';
import '../widgets/feed_widgets.dart';
import '../widgets/sale_widget.dart';
import 'catagory_screen.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController? _searchTextController;
  // List<ProductModel>productList=[];

  @override
  void initState() {
    // TODO: implement initState
    _searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController!.dispose();
    super.dispose();
  }
//another way data is comming
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   getProducts();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void>getProducts()async{
  //   productList= await ApiHandler.getAllProduct();
  // setState(()  {
  //
  // });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: AppBarIconsWidgets(
            icon: IconlyBold.category,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CatagoryPage(), type: PageTransitionType.fade));
            },
          ),
          actions: [
            AppBarIconsWidgets(
              icon: IconlyBold.user3,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: UserPage(), type: PageTransitionType.fade));
              },
            )
          ],
          title: const Text("Home Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _searchTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Theme.of(context).cardColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary)),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SaleWidgets(),
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
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Latest Products",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      AppBarIconsWidgets(
                          icon: IconlyBold.arrowRight2,
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));

                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: DetailsPage()));
                          })
                    ],
                  ),
                ),

                FutureBuilder<List<ProductModel>>(
                    future: ApiHandler.getAllProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else if (snapshot.hasError) {
                        return  Center(
                          child: Text("an error ouccered  ${snapshot.error}"),
                        );
                      }

                      else if (snapshot.data==null) {
                        return const Center(
                          child: Text("No Product hass been added yet "),
                        );
                      }


                      return FeedGridWidget(productList: snapshot.data!);
                    })

                //data i willb by future
                // productList.isEmpty?Center(
                //   child: CircularProgressIndicator(),
                // ) :FeedGridWidget(productList: productList,)
              ],
            ),
          ),
        ));
  }
}
