// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

import 'package:drift_example/core/menu_feature/data/remote/dtos/subcategory_dto.dart';

List<CategoryDTO> categoriesListFromJson(String str) => List<CategoryDTO>.from(
    json.decode(str).map((x) => CategoryDTO.fromJson(x)));

String categoriesListToJson(List<CategoryDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryDTO {
  final int? id;
  final int? isActive;
  final String? name;
  final int? parentId;
  final int? restaurantId;
  final int? sort;
  final List<SubcategoryDTO>? subcategories;

  CategoryDTO({
    this.id,
    this.isActive,
    this.name,
    this.parentId,
    this.restaurantId,
    this.sort,
    this.subcategories,
  });

  // @SerializedName("id")
  // @SerializedName("is_active")
  // @SerializedName("name")
  // @SerializedName("parent_id")
  // @SerializedName("restaurant_id")
  // @SerializedName("sort")
  // @SerializedName("subcategories")
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'is_active': isActive,
      'name': name,
      'parent_id': parentId,
      'restaurantId': restaurantId,
      'sort': sort,
      'subcategories': subcategories?.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryDTO.fromMap(Map<String, dynamic> map) {
    return CategoryDTO(
      id: map['id'] != null ? map['id'] as int : null,
      isActive: map['is_active'] != null ? map['is_active'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      parentId: map['parent_id'] != null ? map['parent_id'] as int : null,
      restaurantId:
          map['restaurant_id'] != null ? map['restaurant_id'] as int : null,
      sort: map['sort'] != null ? map['sort'] as int : null,
      subcategories: map['subcategories'] != null
          ? List<SubcategoryDTO>.from(
              (map['subcategories'] as List<dynamic>).map<SubcategoryDTO?>(
                (x) => SubcategoryDTO.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDTO.fromJson(String source) =>
      CategoryDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
