import 'dart:convert';

import 'package:api_example_131/models/product/data_product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<DataProductModel> dataModel;

  @override
  void initState() {
    super.initState();
    dataModel = getProducts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: FutureBuilder<DataProductModel>(
        future: dataModel,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data != null &&
                  snapshot.data!.products != null &&
                  snapshot.data!.products!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data!.products!.length,
                    itemBuilder: (_, index) {
                      var eachProduct = snapshot.data!.products![index];

                      return SizedBox(
                        height: 300,
                        child: Card(
                          elevation: 7,
                          child: Column(
                            children: [
                              ListTile(
                                leading: eachProduct.thumbnail!=null ? Image.network(eachProduct.thumbnail!) : Image.asset('name'),
                                title: Text('${eachProduct.title}'),
                                subtitle: Text('${eachProduct.description}'),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                    itemCount: eachProduct.images!.length,
                                    itemBuilder: (_, subIndex){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(eachProduct.images![subIndex]),
                                    );
                                }),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Container(child: Text('No Data'),);
              }
            }
            return Container();
          }
        },
      ),
    );
  }

  Future<DataProductModel> getProducts() async {
    String url = "https://dummyjson.com/products";

    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return DataProductModel.fromJson(data);
    } else {
      return DataProductModel();
    }
  }
}
