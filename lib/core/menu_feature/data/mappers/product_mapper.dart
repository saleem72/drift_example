//

import 'package:drift/drift.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/product_dto.dart';
import 'package:drift_example/core/menu_feature/domain/models/product.dart';

extension ProductDtoMapper on ProductDTO {
  // Product toProduct() {
  //   return Product(
  //     id: productId ?? 0,
  //     barcode: barcode ?? "",
  //     categoryId: categoryId ?? 0,
  //     code: code ?? "",
  //     description: description ?? "",
  //     discount: discount ?? 0,
  //     isAvailable: isAvailable == null ? false : isAvailable! == 1,
  //     name: name ?? "",
  //     price: price ?? 0,
  //     restaurantId: restaurantId ?? 0,
  //     size: size ?? "",
  //     sort: sort ?? 0,
  //     cartCount: 0,
  //   );
  // }

  ProductEntityCompanion toProductEntity() {
    return ProductEntityCompanion(
      productId: Value(productId ?? 0),
      barcode: Value(barcode ?? ""),
      categoryId: Value(categoryId ?? 0),
      code: Value(code ?? ""),
      description: Value(description ?? ""),
      discount: Value(discount ?? 0),
      isAvailable: Value(isAvailable == null ? false : isAvailable! == 1),
      name: Value(name ?? ""),
      image: Value(image),
      price: Value(price ?? 0),
      restaurantId: Value(restaurantId ?? 0),
      size: Value(size ?? ""),
      sort: Value(sort ?? 0),
      cartCount: const Value(0),
    );
  }

  ProductEntityData toProductEntityData() {
    return ProductEntityData(
      productId: productId ?? 0,
      barcode: barcode ?? "",
      categoryId: categoryId ?? 0,
      code: code ?? "",
      description: description ?? "",
      discount: discount ?? 0,
      isAvailable: isAvailable == null ? false : isAvailable! == 1,
      name: name ?? "",
      price: price ?? 0,
      restaurantId: restaurantId ?? 0,
      size: size ?? "",
      sort: sort ?? 0,
      cartCount: 0,
    );
  }
}

extension ProductEntityDataMapper on ProductEntityData {
  Product toProduct() {
    return Product(
      id: productId,
      barcode: barcode,
      categoryId: categoryId,
      code: code,
      description: description,
      discount: discount,
      isAvailable: isAvailable,
      name: name,
      price: price,
      restaurantId: restaurantId,
      size: size,
      sort: sort,
      cartCount: cartCount,
      image: image,
    );
  }
}

extension ProductMapper on Product {
  ProductEntityCompanion toProductEntity() {
    return ProductEntityCompanion(
      productId: Value(id),
      barcode: Value(barcode),
      categoryId: Value(categoryId),
      code: Value(code),
      description: Value(description),
      discount: Value(discount),
      isAvailable: Value(isAvailable),
      name: Value(name),
      image: Value(image),
      price: Value(price),
      restaurantId: Value(restaurantId),
      size: Value(size),
      sort: Value(sort),
      cartCount: Value(cartCount),
    );
  }
}
