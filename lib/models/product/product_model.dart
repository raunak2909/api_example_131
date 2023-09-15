class ProductModel{
  String? brand;
  String? category;
  String? description;
  String? thumbnail;
  String? title;
  num? discountPercentage;
  int? id;
  List<dynamic>? images;
  num? price;
  num? rating;
  int? stock;

  ProductModel({
    this.brand,
    this.category,
    this.description,
    this.thumbnail,
    this.title,
    this.discountPercentage,
    this.id,
    this.images,
    this.price,
    this.rating,
    this.stock
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
        brand: json['brand'],
        category: json['brand'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        title: json['title'],
        discountPercentage: json['discountPercentage'],
        id: json['id'],
        images: json['images'],
        price: json['price'],
        rating: json['rating'],
        stock: json['stock']
    );
  }
}