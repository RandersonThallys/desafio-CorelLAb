// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? description;
  double? price;
  String? category;
  double? promotion;
  String? imageProduct;
  DateTime? datePublication;
  Product({
    this.description,
    this.price,
    this.category,
    this.promotion,
    this.imageProduct,
    this.datePublication,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      price: json['price'],
      category: json['category'],
      promotion: json['promotion'],
      imageProduct: json['image_product'],
      datePublication: json['date_publication'],
    );
  }
}
