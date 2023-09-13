import 'package:api_example_131/models/quote_model.dart';

class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel({required this.quotes,
    required this.limit,
    required this.skip,
    required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json){

    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachQuote in json['quotes']){
      mQuotes.add(QuoteModel.fromJson(eachQuote));
    }


    return DataModel(
        quotes: mQuotes,
        limit: json['limit'],
        skip: json['skip'],
        total: json['total']
    );
  }
}
