//

import 'package:drift/drift.dart';

/*
  final int id;
  final bool isActive;
  final String name;
  final int restaurantId;
  final int sort;


  IntColumn get parentId => integer()
      .nullable()
      .customConstraint('REFERENCES subjects(id) ON DELETE CASCADE')();
*/

class CategoryEntity extends Table {
  @override
  String get tableName => 'categories';

  IntColumn get id => integer()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean()();
  IntColumn get restaurantId => integer()();
  IntColumn get sort => integer()();
}
