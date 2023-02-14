//

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_example/core/menu_feature/data/local/database/daos/queries_dao/queries_dao.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/product_entity.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/sub_category_entity.dart';
import 'package:path/path.dart' as path;
import 'package:drift_example/core/menu_feature/data/local/database/entities/category_entity.dart';
import 'package:path_provider/path_provider.dart';

import 'daos/operation_dao/operation_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    CategoryEntity,
    SubCategoryEntity,
    ProductEntity,
  ],
  daos: [
    OperationDAO,
    QueriesDAO,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
