// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//

class Category {
  final int id;
  final bool isActive;
  final String name;
  final int restaurantId;
  final int sort;

  Category({
    required this.id,
    required this.isActive,
    required this.name,
    required this.restaurantId,
    required this.sort,
  });

  Category copyWith({
    int? id,
    bool? isActive,
    String? name,
    int? restaurantId,
    int? sort,
  }) {
    return Category(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
      restaurantId: restaurantId ?? this.restaurantId,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isActive': isActive,
      'name': name,
      'restaurantId': restaurantId,
      'sort': sort,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      isActive: map['isActive'] as bool,
      name: map['name'] as String,
      restaurantId: map['restaurantId'] as int,
      sort: map['sort'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isActive.hashCode ^
        name.hashCode ^
        restaurantId.hashCode ^
        sort.hashCode;
  }
}
