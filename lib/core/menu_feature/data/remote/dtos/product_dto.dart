// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';
import 'dart:core';

import 'package:drift_example/core/helpers/dynami_double.dart';

List<ProductDTO> productsListFromJson(String str) =>
    List<ProductDTO>.from(json.decode(str).map((x) => ProductDTO.fromJson(x)));

String productsListToJson(List<ProductDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDTO {
  final String? barcode;
  final int? categoryId;
  final String? code;
  final String? description;
  final int? discount;
  final String? expectedTime;
  final int? productId;
  final String? image;
  final int? isAvailable;
  final String? name;
//    @SerializedName("offer")
//    final offer: Offer,
  final int? offerId;
  final double? price;
  final int? restaurantId;
  final String? size;
  final String? sliderImage;
  final int? sort;

  ProductDTO({
    this.barcode,
    this.categoryId,
    this.code,
    this.description,
    this.discount,
    this.expectedTime,
    this.productId,
    this.image,
    this.isAvailable,
    this.name,
    this.offerId,
    this.price,
    required this.restaurantId,
    this.size,
    this.sliderImage,
    this.sort,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'barcode': barcode,
      'category_id': categoryId,
      'code': code,
      'description': description,
      'discount': discount,
      'expected_time': expectedTime,
      'id': productId,
      'image': image,
      'is_available': isAvailable,
      'name': name,
      'offer_id': offerId,
      'price': price,
      'restaurant_id': restaurantId,
      'size': size,
      'slider_image': sliderImage,
      'sort': sort,
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      barcode: map['barcode'] != null ? map['barcode'] as String : null,
      categoryId: map['category_id'] != null ? map['category_id'] as int : null,
      code: map['code'] != null ? map['code'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      discount: map['discount'] != null ? map['discount'] as int : null,
      expectedTime:
          map['expected_time'] != null ? map['expected_time'] as String : null,
      productId: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      isAvailable:
          map['is_available'] != null ? map['is_available'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      offerId: map['offer_id'] != null ? map['offer_id'] as int : null,
      price: map['price'] != null ? extractDoubleFrom(map['price']) : null,
      restaurantId:
          map['restaurant_id'] != null ? map['restaurant_id'] as int : null,
      size: map['size'] != null ? map['size'] as String : null,
      sliderImage:
          map['slider_image'] != null ? map['slider_image'] as String : null,
      sort: map['sort'] != null ? map['sort'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) =>
      ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}


  // @SerializedName("barcode")
  // @SerializedName("category_id")
  // @SerializedName("code")
  // @SerializedName("description")
  // @SerializedName("discount")
  // @SerializedName("expected_time")
  // @SerializedName("id")
  // @SerializedName("image")
  // @SerializedName("is_available")
  // @SerializedName("name")
  // @SerializedName("offer_id")
  // @SerializedName("price")
  // @SerializedName("restaurant_id")
  // @SerializedName("size")
  // @SerializedName("slider_image")
  // @SerializedName("sort")