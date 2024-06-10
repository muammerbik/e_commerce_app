import 'package:equatable/equatable.dart';

class EcommerceApimodel extends Equatable {
  final String? name;
  final double? price;
  final String? imgUrl;
  final int? discount;
  final String? category;
  final String? brand;
  final double? rating;

  const EcommerceApimodel({
    this.name,
    this.price,
    this.imgUrl,
    this.discount,
    this.category,
    this.brand,
    this.rating,
  });

  @override
  List<Object?> get props =>
      [name, price, imgUrl, discount, category, brand, rating];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imgUrl,
      'discount': discount,
      'category': category,
      'brand': brand,
      'rating': rating,
    };
  }

  factory EcommerceApimodel.fromJson(Map<String, dynamic> json) {
    return EcommerceApimodel(
      name: json['name'],
      price: json['price'],
      imgUrl:
          "https://img.fruugo.com/product/3/79/620519793_max.jpg" //  API DEN GELEN RESİM URL 'İ ÇALIŞMIYOR  json['image'],,
      ,
      discount: json['discount'],
      category: json['category'],
      brand: json['brand'],
      rating: json['rating'],
    );
  }

  @override
  bool get stringify => true;

  EcommerceApimodel copyWith({
    String? name,
    double? price,
    String? imgUrl,
    int? discount,
    String? category,
    String? brand,
    double? rating,
  }) {
    return EcommerceApimodel(
        name: name ?? this.name,
        price: price ?? this.price,
        imgUrl: imgUrl ?? this.imgUrl,
        discount: discount ?? this.discount,
        category: category ?? this.category,
        brand: brand ?? this.brand,
        rating: rating ?? this.rating);
  }
}
