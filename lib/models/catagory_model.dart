import 'package:flutter/cupertino.dart';

class CatagoryModel with ChangeNotifier{
  int? id;
  String? name;
  String? image;

  CatagoryModel({this.id, this.name, this.image});

  CatagoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  // static List<CatagoryModel> cataGorySnapshot(List snapshot){
  //
  //   // print("hellow data ${snapshot[0]["images"]}");
  //   return snapshot.map((data) {
  //
  //     return CatagoryModel.fromJson(data);
  //   }).toList();
  // }

static List<CatagoryModel> catagorySnapshot(List snaphost){
    return snaphost.map((e) {
      return CatagoryModel.fromJson(e);
    }).toList();
}

}


