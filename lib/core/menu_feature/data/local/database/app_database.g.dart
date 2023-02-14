// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoryEntityTable extends CategoryEntity
    with TableInfo<$CategoryEntityTable, CategoryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive =
      GeneratedColumn<bool>('is_active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _restaurantIdMeta =
      const VerificationMeta('restaurantId');
  @override
  late final GeneratedColumn<int> restaurantId = GeneratedColumn<int>(
      'restaurant_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isActive, restaurantId, sort];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('restaurant_id')) {
      context.handle(
          _restaurantIdMeta,
          restaurantId.isAcceptableOrUnknown(
              data['restaurant_id']!, _restaurantIdMeta));
    } else if (isInserting) {
      context.missing(_restaurantIdMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategoryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      restaurantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}restaurant_id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
    );
  }

  @override
  $CategoryEntityTable createAlias(String alias) {
    return $CategoryEntityTable(attachedDatabase, alias);
  }
}

class CategoryEntityData extends DataClass
    implements Insertable<CategoryEntityData> {
  final int id;
  final String name;
  final bool isActive;
  final int restaurantId;
  final int sort;
  const CategoryEntityData(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.restaurantId,
      required this.sort});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    map['restaurant_id'] = Variable<int>(restaurantId);
    map['sort'] = Variable<int>(sort);
    return map;
  }

  CategoryEntityCompanion toCompanion(bool nullToAbsent) {
    return CategoryEntityCompanion(
      id: Value(id),
      name: Value(name),
      isActive: Value(isActive),
      restaurantId: Value(restaurantId),
      sort: Value(sort),
    );
  }

  factory CategoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      restaurantId: serializer.fromJson<int>(json['restaurantId']),
      sort: serializer.fromJson<int>(json['sort']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'restaurantId': serializer.toJson<int>(restaurantId),
      'sort': serializer.toJson<int>(sort),
    };
  }

  CategoryEntityData copyWith(
          {int? id,
          String? name,
          bool? isActive,
          int? restaurantId,
          int? sort}) =>
      CategoryEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        restaurantId: restaurantId ?? this.restaurantId,
        sort: sort ?? this.sort,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isActive, restaurantId, sort);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.restaurantId == this.restaurantId &&
          other.sort == this.sort);
}

class CategoryEntityCompanion extends UpdateCompanion<CategoryEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<int> restaurantId;
  final Value<int> sort;
  const CategoryEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.restaurantId = const Value.absent(),
    this.sort = const Value.absent(),
  });
  CategoryEntityCompanion.insert({
    required int id,
    required String name,
    required bool isActive,
    required int restaurantId,
    required int sort,
  })  : id = Value(id),
        name = Value(name),
        isActive = Value(isActive),
        restaurantId = Value(restaurantId),
        sort = Value(sort);
  static Insertable<CategoryEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<int>? restaurantId,
    Expression<int>? sort,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (restaurantId != null) 'restaurant_id': restaurantId,
      if (sort != null) 'sort': sort,
    });
  }

  CategoryEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isActive,
      Value<int>? restaurantId,
      Value<int>? sort}) {
    return CategoryEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      restaurantId: restaurantId ?? this.restaurantId,
      sort: sort ?? this.sort,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (restaurantId.present) {
      map['restaurant_id'] = Variable<int>(restaurantId.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }
}

class $SubCategoryEntityTable extends SubCategoryEntity
    with TableInfo<$SubCategoryEntityTable, SubCategoryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubCategoryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive =
      GeneratedColumn<bool>('is_active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _restaurantIdMeta =
      const VerificationMeta('restaurantId');
  @override
  late final GeneratedColumn<int> restaurantId = GeneratedColumn<int>(
      'restaurant_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isActive, parentId, restaurantId, sort];
  @override
  String get aliasedName => _alias ?? 'sub_category_entity';
  @override
  String get actualTableName => 'sub_category_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<SubCategoryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('restaurant_id')) {
      context.handle(
          _restaurantIdMeta,
          restaurantId.isAcceptableOrUnknown(
              data['restaurant_id']!, _restaurantIdMeta));
    } else if (isInserting) {
      context.missing(_restaurantIdMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SubCategoryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubCategoryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      restaurantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}restaurant_id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
    );
  }

  @override
  $SubCategoryEntityTable createAlias(String alias) {
    return $SubCategoryEntityTable(attachedDatabase, alias);
  }
}

class SubCategoryEntityData extends DataClass
    implements Insertable<SubCategoryEntityData> {
  final int id;
  final String name;
  final bool isActive;
  final int parentId;
  final int restaurantId;
  final int sort;
  const SubCategoryEntityData(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.parentId,
      required this.restaurantId,
      required this.sort});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    map['parent_id'] = Variable<int>(parentId);
    map['restaurant_id'] = Variable<int>(restaurantId);
    map['sort'] = Variable<int>(sort);
    return map;
  }

  SubCategoryEntityCompanion toCompanion(bool nullToAbsent) {
    return SubCategoryEntityCompanion(
      id: Value(id),
      name: Value(name),
      isActive: Value(isActive),
      parentId: Value(parentId),
      restaurantId: Value(restaurantId),
      sort: Value(sort),
    );
  }

  factory SubCategoryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubCategoryEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      parentId: serializer.fromJson<int>(json['parentId']),
      restaurantId: serializer.fromJson<int>(json['restaurantId']),
      sort: serializer.fromJson<int>(json['sort']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'parentId': serializer.toJson<int>(parentId),
      'restaurantId': serializer.toJson<int>(restaurantId),
      'sort': serializer.toJson<int>(sort),
    };
  }

  SubCategoryEntityData copyWith(
          {int? id,
          String? name,
          bool? isActive,
          int? parentId,
          int? restaurantId,
          int? sort}) =>
      SubCategoryEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        parentId: parentId ?? this.parentId,
        restaurantId: restaurantId ?? this.restaurantId,
        sort: sort ?? this.sort,
      );
  @override
  String toString() {
    return (StringBuffer('SubCategoryEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, isActive, parentId, restaurantId, sort);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubCategoryEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.parentId == this.parentId &&
          other.restaurantId == this.restaurantId &&
          other.sort == this.sort);
}

class SubCategoryEntityCompanion
    extends UpdateCompanion<SubCategoryEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<int> parentId;
  final Value<int> restaurantId;
  final Value<int> sort;
  const SubCategoryEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.parentId = const Value.absent(),
    this.restaurantId = const Value.absent(),
    this.sort = const Value.absent(),
  });
  SubCategoryEntityCompanion.insert({
    required int id,
    required String name,
    required bool isActive,
    required int parentId,
    required int restaurantId,
    required int sort,
  })  : id = Value(id),
        name = Value(name),
        isActive = Value(isActive),
        parentId = Value(parentId),
        restaurantId = Value(restaurantId),
        sort = Value(sort);
  static Insertable<SubCategoryEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<int>? parentId,
    Expression<int>? restaurantId,
    Expression<int>? sort,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (parentId != null) 'parent_id': parentId,
      if (restaurantId != null) 'restaurant_id': restaurantId,
      if (sort != null) 'sort': sort,
    });
  }

  SubCategoryEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isActive,
      Value<int>? parentId,
      Value<int>? restaurantId,
      Value<int>? sort}) {
    return SubCategoryEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      parentId: parentId ?? this.parentId,
      restaurantId: restaurantId ?? this.restaurantId,
      sort: sort ?? this.sort,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (restaurantId.present) {
      map['restaurant_id'] = Variable<int>(restaurantId.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubCategoryEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('sort: $sort')
          ..write(')'))
        .toString();
  }
}

class $ProductEntityTable extends ProductEntity
    with TableInfo<$ProductEntityTable, ProductEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
      'discount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expectedTimeMeta =
      const VerificationMeta('expectedTime');
  @override
  late final GeneratedColumn<String> expectedTime = GeneratedColumn<String>(
      'expected_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<bool> isAvailable =
      GeneratedColumn<bool>('is_available', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_available" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _offerIdMeta =
      const VerificationMeta('offerId');
  @override
  late final GeneratedColumn<int> offerId = GeneratedColumn<int>(
      'offer_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _restaurantIdMeta =
      const VerificationMeta('restaurantId');
  @override
  late final GeneratedColumn<int> restaurantId = GeneratedColumn<int>(
      'restaurant_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sliderImageMeta =
      const VerificationMeta('sliderImage');
  @override
  late final GeneratedColumn<String> sliderImage = GeneratedColumn<String>(
      'slider_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cartCountMeta =
      const VerificationMeta('cartCount');
  @override
  late final GeneratedColumn<int> cartCount = GeneratedColumn<int>(
      'cart_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        productId,
        barcode,
        categoryId,
        code,
        description,
        discount,
        expectedTime,
        image,
        isAvailable,
        name,
        offerId,
        price,
        restaurantId,
        size,
        sliderImage,
        sort,
        cartCount
      ];
  @override
  String get aliasedName => _alias ?? 'product_entity';
  @override
  String get actualTableName => 'product_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    if (data.containsKey('expected_time')) {
      context.handle(
          _expectedTimeMeta,
          expectedTime.isAcceptableOrUnknown(
              data['expected_time']!, _expectedTimeMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    } else if (isInserting) {
      context.missing(_isAvailableMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('offer_id')) {
      context.handle(_offerIdMeta,
          offerId.isAcceptableOrUnknown(data['offer_id']!, _offerIdMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('restaurant_id')) {
      context.handle(
          _restaurantIdMeta,
          restaurantId.isAcceptableOrUnknown(
              data['restaurant_id']!, _restaurantIdMeta));
    } else if (isInserting) {
      context.missing(_restaurantIdMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('slider_image')) {
      context.handle(
          _sliderImageMeta,
          sliderImage.isAcceptableOrUnknown(
              data['slider_image']!, _sliderImageMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('cart_count')) {
      context.handle(_cartCountMeta,
          cartCount.isAcceptableOrUnknown(data['cart_count']!, _cartCountMeta));
    } else if (isInserting) {
      context.missing(_cartCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  ProductEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntityData(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discount'])!,
      expectedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expected_time']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_available'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      offerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}offer_id']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      restaurantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}restaurant_id'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size'])!,
      sliderImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slider_image']),
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      cartCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cart_count'])!,
    );
  }

  @override
  $ProductEntityTable createAlias(String alias) {
    return $ProductEntityTable(attachedDatabase, alias);
  }
}

class ProductEntityData extends DataClass
    implements Insertable<ProductEntityData> {
  final int productId;
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
  const ProductEntityData(
      {required this.productId,
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
      required this.cartCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['barcode'] = Variable<String>(barcode);
    map['category_id'] = Variable<int>(categoryId);
    map['code'] = Variable<String>(code);
    map['description'] = Variable<String>(description);
    map['discount'] = Variable<int>(discount);
    if (!nullToAbsent || expectedTime != null) {
      map['expected_time'] = Variable<String>(expectedTime);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || offerId != null) {
      map['offer_id'] = Variable<int>(offerId);
    }
    map['price'] = Variable<double>(price);
    map['restaurant_id'] = Variable<int>(restaurantId);
    map['size'] = Variable<String>(size);
    if (!nullToAbsent || sliderImage != null) {
      map['slider_image'] = Variable<String>(sliderImage);
    }
    map['sort'] = Variable<int>(sort);
    map['cart_count'] = Variable<int>(cartCount);
    return map;
  }

  ProductEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductEntityCompanion(
      productId: Value(productId),
      barcode: Value(barcode),
      categoryId: Value(categoryId),
      code: Value(code),
      description: Value(description),
      discount: Value(discount),
      expectedTime: expectedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedTime),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      isAvailable: Value(isAvailable),
      name: Value(name),
      offerId: offerId == null && nullToAbsent
          ? const Value.absent()
          : Value(offerId),
      price: Value(price),
      restaurantId: Value(restaurantId),
      size: Value(size),
      sliderImage: sliderImage == null && nullToAbsent
          ? const Value.absent()
          : Value(sliderImage),
      sort: Value(sort),
      cartCount: Value(cartCount),
    );
  }

  factory ProductEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductEntityData(
      productId: serializer.fromJson<int>(json['productId']),
      barcode: serializer.fromJson<String>(json['barcode']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String>(json['description']),
      discount: serializer.fromJson<int>(json['discount']),
      expectedTime: serializer.fromJson<String?>(json['expectedTime']),
      image: serializer.fromJson<String?>(json['image']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      name: serializer.fromJson<String>(json['name']),
      offerId: serializer.fromJson<int?>(json['offerId']),
      price: serializer.fromJson<double>(json['price']),
      restaurantId: serializer.fromJson<int>(json['restaurantId']),
      size: serializer.fromJson<String>(json['size']),
      sliderImage: serializer.fromJson<String?>(json['sliderImage']),
      sort: serializer.fromJson<int>(json['sort']),
      cartCount: serializer.fromJson<int>(json['cartCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'barcode': serializer.toJson<String>(barcode),
      'categoryId': serializer.toJson<int>(categoryId),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String>(description),
      'discount': serializer.toJson<int>(discount),
      'expectedTime': serializer.toJson<String?>(expectedTime),
      'image': serializer.toJson<String?>(image),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'name': serializer.toJson<String>(name),
      'offerId': serializer.toJson<int?>(offerId),
      'price': serializer.toJson<double>(price),
      'restaurantId': serializer.toJson<int>(restaurantId),
      'size': serializer.toJson<String>(size),
      'sliderImage': serializer.toJson<String?>(sliderImage),
      'sort': serializer.toJson<int>(sort),
      'cartCount': serializer.toJson<int>(cartCount),
    };
  }

  ProductEntityData copyWith(
          {int? productId,
          String? barcode,
          int? categoryId,
          String? code,
          String? description,
          int? discount,
          Value<String?> expectedTime = const Value.absent(),
          Value<String?> image = const Value.absent(),
          bool? isAvailable,
          String? name,
          Value<int?> offerId = const Value.absent(),
          double? price,
          int? restaurantId,
          String? size,
          Value<String?> sliderImage = const Value.absent(),
          int? sort,
          int? cartCount}) =>
      ProductEntityData(
        productId: productId ?? this.productId,
        barcode: barcode ?? this.barcode,
        categoryId: categoryId ?? this.categoryId,
        code: code ?? this.code,
        description: description ?? this.description,
        discount: discount ?? this.discount,
        expectedTime:
            expectedTime.present ? expectedTime.value : this.expectedTime,
        image: image.present ? image.value : this.image,
        isAvailable: isAvailable ?? this.isAvailable,
        name: name ?? this.name,
        offerId: offerId.present ? offerId.value : this.offerId,
        price: price ?? this.price,
        restaurantId: restaurantId ?? this.restaurantId,
        size: size ?? this.size,
        sliderImage: sliderImage.present ? sliderImage.value : this.sliderImage,
        sort: sort ?? this.sort,
        cartCount: cartCount ?? this.cartCount,
      );
  @override
  String toString() {
    return (StringBuffer('ProductEntityData(')
          ..write('productId: $productId, ')
          ..write('barcode: $barcode, ')
          ..write('categoryId: $categoryId, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('discount: $discount, ')
          ..write('expectedTime: $expectedTime, ')
          ..write('image: $image, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('name: $name, ')
          ..write('offerId: $offerId, ')
          ..write('price: $price, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('size: $size, ')
          ..write('sliderImage: $sliderImage, ')
          ..write('sort: $sort, ')
          ..write('cartCount: $cartCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      productId,
      barcode,
      categoryId,
      code,
      description,
      discount,
      expectedTime,
      image,
      isAvailable,
      name,
      offerId,
      price,
      restaurantId,
      size,
      sliderImage,
      sort,
      cartCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntityData &&
          other.productId == this.productId &&
          other.barcode == this.barcode &&
          other.categoryId == this.categoryId &&
          other.code == this.code &&
          other.description == this.description &&
          other.discount == this.discount &&
          other.expectedTime == this.expectedTime &&
          other.image == this.image &&
          other.isAvailable == this.isAvailable &&
          other.name == this.name &&
          other.offerId == this.offerId &&
          other.price == this.price &&
          other.restaurantId == this.restaurantId &&
          other.size == this.size &&
          other.sliderImage == this.sliderImage &&
          other.sort == this.sort &&
          other.cartCount == this.cartCount);
}

class ProductEntityCompanion extends UpdateCompanion<ProductEntityData> {
  final Value<int> productId;
  final Value<String> barcode;
  final Value<int> categoryId;
  final Value<String> code;
  final Value<String> description;
  final Value<int> discount;
  final Value<String?> expectedTime;
  final Value<String?> image;
  final Value<bool> isAvailable;
  final Value<String> name;
  final Value<int?> offerId;
  final Value<double> price;
  final Value<int> restaurantId;
  final Value<String> size;
  final Value<String?> sliderImage;
  final Value<int> sort;
  final Value<int> cartCount;
  const ProductEntityCompanion({
    this.productId = const Value.absent(),
    this.barcode = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.discount = const Value.absent(),
    this.expectedTime = const Value.absent(),
    this.image = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.name = const Value.absent(),
    this.offerId = const Value.absent(),
    this.price = const Value.absent(),
    this.restaurantId = const Value.absent(),
    this.size = const Value.absent(),
    this.sliderImage = const Value.absent(),
    this.sort = const Value.absent(),
    this.cartCount = const Value.absent(),
  });
  ProductEntityCompanion.insert({
    this.productId = const Value.absent(),
    required String barcode,
    required int categoryId,
    required String code,
    required String description,
    required int discount,
    this.expectedTime = const Value.absent(),
    this.image = const Value.absent(),
    required bool isAvailable,
    required String name,
    this.offerId = const Value.absent(),
    required double price,
    required int restaurantId,
    required String size,
    this.sliderImage = const Value.absent(),
    required int sort,
    required int cartCount,
  })  : barcode = Value(barcode),
        categoryId = Value(categoryId),
        code = Value(code),
        description = Value(description),
        discount = Value(discount),
        isAvailable = Value(isAvailable),
        name = Value(name),
        price = Value(price),
        restaurantId = Value(restaurantId),
        size = Value(size),
        sort = Value(sort),
        cartCount = Value(cartCount);
  static Insertable<ProductEntityData> custom({
    Expression<int>? productId,
    Expression<String>? barcode,
    Expression<int>? categoryId,
    Expression<String>? code,
    Expression<String>? description,
    Expression<int>? discount,
    Expression<String>? expectedTime,
    Expression<String>? image,
    Expression<bool>? isAvailable,
    Expression<String>? name,
    Expression<int>? offerId,
    Expression<double>? price,
    Expression<int>? restaurantId,
    Expression<String>? size,
    Expression<String>? sliderImage,
    Expression<int>? sort,
    Expression<int>? cartCount,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (barcode != null) 'barcode': barcode,
      if (categoryId != null) 'category_id': categoryId,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (discount != null) 'discount': discount,
      if (expectedTime != null) 'expected_time': expectedTime,
      if (image != null) 'image': image,
      if (isAvailable != null) 'is_available': isAvailable,
      if (name != null) 'name': name,
      if (offerId != null) 'offer_id': offerId,
      if (price != null) 'price': price,
      if (restaurantId != null) 'restaurant_id': restaurantId,
      if (size != null) 'size': size,
      if (sliderImage != null) 'slider_image': sliderImage,
      if (sort != null) 'sort': sort,
      if (cartCount != null) 'cart_count': cartCount,
    });
  }

  ProductEntityCompanion copyWith(
      {Value<int>? productId,
      Value<String>? barcode,
      Value<int>? categoryId,
      Value<String>? code,
      Value<String>? description,
      Value<int>? discount,
      Value<String?>? expectedTime,
      Value<String?>? image,
      Value<bool>? isAvailable,
      Value<String>? name,
      Value<int?>? offerId,
      Value<double>? price,
      Value<int>? restaurantId,
      Value<String>? size,
      Value<String?>? sliderImage,
      Value<int>? sort,
      Value<int>? cartCount}) {
    return ProductEntityCompanion(
      productId: productId ?? this.productId,
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (expectedTime.present) {
      map['expected_time'] = Variable<String>(expectedTime.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (offerId.present) {
      map['offer_id'] = Variable<int>(offerId.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (restaurantId.present) {
      map['restaurant_id'] = Variable<int>(restaurantId.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (sliderImage.present) {
      map['slider_image'] = Variable<String>(sliderImage.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (cartCount.present) {
      map['cart_count'] = Variable<int>(cartCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductEntityCompanion(')
          ..write('productId: $productId, ')
          ..write('barcode: $barcode, ')
          ..write('categoryId: $categoryId, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('discount: $discount, ')
          ..write('expectedTime: $expectedTime, ')
          ..write('image: $image, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('name: $name, ')
          ..write('offerId: $offerId, ')
          ..write('price: $price, ')
          ..write('restaurantId: $restaurantId, ')
          ..write('size: $size, ')
          ..write('sliderImage: $sliderImage, ')
          ..write('sort: $sort, ')
          ..write('cartCount: $cartCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CategoryEntityTable categoryEntity = $CategoryEntityTable(this);
  late final $SubCategoryEntityTable subCategoryEntity =
      $SubCategoryEntityTable(this);
  late final $ProductEntityTable productEntity = $ProductEntityTable(this);
  late final OperationDAO operationDAO = OperationDAO(this as AppDatabase);
  late final QueriesDAO queriesDAO = QueriesDAO(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryEntity, subCategoryEntity, productEntity];
}
