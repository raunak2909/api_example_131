import 'dart:convert';

import 'package:api_example_131/models/data_model.dart';
import 'package:api_example_131/product_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DataModel> data;

  @override
  void initState() {
    super.initState();
    data = getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder<DataModel>(
        future: data,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else {
            if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'),);
            } else if(snapshot.hasData){
              if(snapshot.data!=null){
                return ListView.builder(
                    itemCount: snapshot.data!.quotes!.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: Text('${index+1}'),
                        title: Text(snapshot.data!.quotes![index].quote),
                        subtitle: Text(snapshot.data!.quotes![index].author),
                      );
                    });
              } else {
                return Container(child: Text('No Data'),);
              }
            }
          }
          return Container();

        },
      ),
    );
  }

  Future<DataModel> getQuotes() async {
    Uri mUrl = Uri.parse("https://dummyjson.com/quotes");
    var res = await http.get(mUrl);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return DataModel.fromJson(json);
    } else {
      return DataModel();
    }
  }
}
