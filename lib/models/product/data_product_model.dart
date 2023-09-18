import 'package:api_example_131/models/product/product_model.dart';

class DataProductModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  DataProductModel({
    this.limit,
    this.skip,
    this.total,
    this.products});

  factory DataProductModel.fromJson(Map<String, dynamic> json){

    List<ProductModel> mProducts = [];

    /*json['products'].forEach((element) {
      mProducts.add(ProductModel.fromJson(element));
    });*/

    for(Map<String, dynamic> eachMap in json['products']){
      mProducts.add(ProductModel.fromJson(eachMap));
    }

    return DataProductModel(
        limit : json['limit'],
        skip : json['skip'],
        total : json['total'],
        products : mProducts
    );
  }
}
