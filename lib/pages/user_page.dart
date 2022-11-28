import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ecommerce/models/user_model.dart';
import 'package:rest_api_ecommerce/services/api_hnadler.dart';

import '../widgets/user_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<UserModel> userModelList = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getUserModel();
    super.didChangeDependencies();
  }

  Future<void> getUserModel() async {
    userModelList = await ApiHandler.getUserModel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: userModelList.isEmpty?Center(child: CircularProgressIndicator(),): FutureBuilder<List<UserModel>>(
        future: ApiHandler.getUserModel(),
        builder: (context,snapshot) {
          return ListView.builder(
              itemCount: userModelList.length,
              itemBuilder: (context,index){



                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return Center(child: Text("error occered"),);
                }
                else if(snapshot.data==null){
                  return Center(child: Text("not have any product"),);
                }




                // if(snapshot.connectionState==ConnectionState.waiting){
                //   const Center(child: CircularProgressIndicator(),);
                // }
                //  else if(snapshot.hasError){
                //   return const Center(child: Text("error occuredf"),);
                // }
                // else if(snapshot.data==null){
                //   const Center(child: Text("not have andy user"),);
                // }
            return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: UserWidget());
          });
        }
      )
    );
  }
}
