class QuoteModel {
  int id;
  String quote;
  String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'],
        quote: json['quote'],
        author: json['author']);
  }

  /*static List<QuoteModel> getQuotes(List<Map<String, dynamic>> data){
    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachQuote in data){
      mQuotes.add(QuoteModel.fromJson(eachQuote));
    }

    return mQuotes;
  }*/
}
