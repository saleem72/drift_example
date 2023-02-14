//

import 'package:drift/drift.dart';

/*
    int? id,
    String? name,
    bool? isActive,
    int? parentId,
    int? restaurantId,
    int? sort,
*/

class SubCategoryEntity extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean()();
  IntColumn get parentId => integer()();
  IntColumn get restaurantId => integer()();
  IntColumn get sort => integer()();
}
