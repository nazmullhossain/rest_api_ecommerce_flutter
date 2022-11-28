import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_ecommerce/consts/global_colors.dart';
import 'package:rest_api_ecommerce/models/user_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final userModel=Provider.of<UserModel>(context);

    return ListTile(
      trailing: Text("User role",style: TextStyle(
        color: lightIconsColor,
        fontWeight: FontWeight.bold
      ),) ,
      title: Text(userModel.name.toString()),
      subtitle: Text(userModel.email.toString()),
      leading:   FancyShimmerImage(
        // color: Colors.red,
        height: size.height * 0.15,
        width: size.height * 0.15,
        // width: double.infinity,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
        ),
        imageUrl: userModel.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
    );
  }
}
