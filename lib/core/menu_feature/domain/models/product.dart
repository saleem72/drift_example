// ignore_for_file: public_member_api_docs, sort_constructors_first
//

class Product {
  final int id;
  final String barcode;
  final int categoryId;
  final String code;
  final String description;
  final int discount;
  final String? expectedTime;
  final String? image;
  final bool isAvailable;
  final String name;
  final int? offerId;
  final double price;
  final int restaurantId;
  final String size;
  final String? sliderImage;
  final int sort;
  final int cartCount;

  Product({
    required this.id,
    required this.barcode,
    required this.categoryId,
    required this.code,
    required this.description,
    required this.discount,
    this.expectedTime,
    this.image,
    required this.isAvailable,
    required this.name,
    this.offerId,
    required this.price,
    required this.restaurantId,
    required this.size,
    this.sliderImage,
    required this.sort,
    required this.cartCount,
  });

  bool get hasOffer => offerId == null ? false : offerId! > 0;

  bool get hasDiscount => discount > 0;

  bool get showPercentage => hasOffer || hasDiscount;

  Product copyWith({
    int? id,
    String? barcode,
    int? categoryId,
    String? code,
    String? description,
    int? discount,
    String? expectedTime,
    String? image,
    bool? isAvailable,
    String? name,
    int? offerId,
    double? price,
    int? restaurantId,
    String? size,
    String? sliderImage,
    int? sort,
    int? cartCount,
  }) {
    return Product(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      categoryId: categoryId ?? this.categoryId,
      code: code ?? this.code,
      description: description ?? this.description,
      discount: discount ?? this.discount,
      expectedTime: expectedTime ?? this.expectedTime,
      image: image ?? this.image,
      isAvailable: isAvailable ?? this.isAvailable,
      name: name ?? this.name,
      offerId: offerId ?? this.offerId,
      price: price ?? this.price,
      restaurantId: restaurantId ?? this.restaurantId,
      size: size ?? this.size,
      sliderImage: sliderImage ?? this.sliderImage,
      sort: sort ?? this.sort,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name)';
  }
}
