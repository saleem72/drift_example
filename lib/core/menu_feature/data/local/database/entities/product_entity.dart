//

import 'package:drift/drift.dart';

class ProductEntity extends Table {
  // IntColumn get rowId => integer().autoIncrement()();
  IntColumn get productId => integer()();
  TextColumn get barcode => text()();
  IntColumn get categoryId => integer()();
  TextColumn get code => text()();
  TextColumn get description => text()();
  IntColumn get discount => integer()();
  TextColumn get expectedTime => text().nullable()();
  TextColumn get image => text().nullable()();
  BoolColumn get isAvailable => boolean()();
  TextColumn get name => text()();
  IntColumn get offerId => integer().nullable()();
  RealColumn get price => real()();
  IntColumn get restaurantId => integer()();
  TextColumn get size => text()();
  TextColumn get sliderImage => text().nullable()();
  IntColumn get sort => integer()();
  IntColumn get cartCount => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {productId};
}
