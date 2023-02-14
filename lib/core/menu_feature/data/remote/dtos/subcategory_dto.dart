// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

import 'package:drift_example/core/menu_feature/data/remote/dtos/product_dto.dart';

class SubcategoryDTO {
  final int? id;
  final int? isActive;
  final String? name;
  final int? parentId;
  final List<ProductDTO>? products;
  final int? restaurantId;
  final int? sort;

  SubcategoryDTO({
    this.id,
    this.isActive,
    this.name,
    this.parentId,
    required this.products,
    this.restaurantId,
    this.sort,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'is_active': isActive,
      'name': name,
      'parent_id': parentId,
      'products': products?.map((x) => x.toMap()).toList(),
      'restaurantId': restaurantId,
      'sort': sort,
    };
  }

  factory SubcategoryDTO.fromMap(Map<String, dynamic> map) {
    return SubcategoryDTO(
      id: map['id'] != null ? map['id'] as int : null,
      isActive: map['is_active'] != null ? map['is_active'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      parentId: map['parent_id'] != null ? map['parent_id'] as int : null,
      products: map['products'] != null
          ? List<ProductDTO>.from(
              (map['products'] as List<dynamic>).map<ProductDTO?>(
                (x) => ProductDTO.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      restaurantId:
          map['restaurantId'] != null ? map['restaurantId'] as int : null,
      sort: map['sort'] != null ? map['sort'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubcategoryDTO.fromJson(String source) =>
      SubcategoryDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}



  // @SerializedName("id")
  // @SerializedName("is_active")
  // @SerializedName("name")
  // @SerializedName("parent_id")
  // @SerializedName("products")
  // @SerializedName("restaurant_id")
  // @SerializedName("sort")
