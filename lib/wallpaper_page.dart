import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/wallpaper/data_photo_model.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  late Future<DataPhotoModel> photoDataModel;

  @override
  void initState() {
    super.initState();
    photoDataModel = getWallpaper("nature");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
      ),
      body: FutureBuilder<DataPhotoModel>(
        future: photoDataModel,
        builder: (_, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else { //done
            if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'),);
            } else if(snapshot.hasData){
              return GridView.builder(
                itemCount: snapshot.data!.photos!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                    childAspectRatio: 16/9
              ), itemBuilder: (_, index){
                var eachWallpaper = snapshot.data!.photos![index].src!.landscape!;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                      image: NetworkImage(eachWallpaper),fit: BoxFit.fill
                    )
                  ),
                );
              });
            }
          }
          return Container();
        },
      ),
    );
  }

  Future<DataPhotoModel> getWallpaper(String query) async{
    String url = "https://api.pexels.com/v1/search?query=$query&per_page=20";

    var res = await http.get(Uri.parse(url), headers: {"Authorization" : "nXWH9BLpCYtVtyjDTbJB3Hf20uneSxZcYisVLVmNDV4PamGm6EeVDgZm"});

    if(res.statusCode==200){
      var mData = jsonDecode(res.body);
      return DataPhotoModel.fromJson(mData);
    } else {
      return DataPhotoModel();
    }

  }
}
