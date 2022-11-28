
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_ecommerce/models/user_model.dart';

import '../consts/api_const.dart';
import '../models/catagory_model.dart';
import '../models/product_model.dart';
class ApiHandler{

  // String url="https://api.escuelajs.co/api/v1/products";


  static Future<List<dynamic>>getData({required String target})async{
    var uri=Uri.https(Base_Url,"api/v1/$target");
    var response=await http.get(uri);
    print( "response ${jsonDecode(response.body)}");
    var data=jsonDecode(response.body);

    List tempList=[];
    for (var v in data){
      tempList.add(v);


      // print("nazmul $v \n\n");
    }
    return tempList;
  }





  static Future <List<ProductModel>>getAllProduct()async{
   List temp=await getData(target: "products");
   return ProductModel.productSnapshot(temp);

  }



  static Future <List<CatagoryModel>>getCagory()async{
    List temp=await getData(target: "categories");
    return CatagoryModel.catagorySnapshot(temp);

  }
  static Future <List<UserModel>>getUserModel()async{
    List temp=await getData(target: "users");
    return UserModel.userModelSnapshot(temp);

  }

  static Future<ProductModel>getProductById({required String id})async{
    var uri=Uri.http(Base_Url,"api/v1/products/$id");
    var response= await http.get(uri);
    var data=jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }

}