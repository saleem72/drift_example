// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//

class Subcategory {
  final int id;
  final bool isActive;
  final String name;
  final int parentId;
  final int restaurantId;
  final int sort;

  Subcategory({
    required this.id,
    required this.isActive,
    required this.name,
    required this.parentId,
    required this.restaurantId,
    required this.sort,
  });

  Subcategory copyWith({
    int? id,
    bool? isActive,
    String? name,
    int? parentId,
    int? restaurantId,
    int? sort,
  }) {
    return Subcategory(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      restaurantId: restaurantId ?? this.restaurantId,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'name': name,
      'parentId': parentId,
      'restaurantId': restaurantId,
      'sort': sort,
    };
  }

  factory Subcategory.fromMap(Map<String, dynamic> map) {
    return Subcategory(
      id: map['id'] as int,
      isActive: map['isActive'] as bool,
      name: map['name'] as String,
      parentId: map['parentId'] as int,
      restaurantId: map['restaurantId'] as int,
      sort: map['sort'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subcategory.fromJson(String source) =>
      Subcategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Subcategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(covariant Subcategory other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isActive.hashCode ^
        name.hashCode ^
        parentId.hashCode ^
        restaurantId.hashCode ^
        sort.hashCode;
  }
}
