// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ListItem extends DataClass implements Insertable<ListItem> {
  final int id;
  final String itemName;
  final String itemDay;
  final String itemLocation;
  final String itemTime;
  final String itemColor;
  ListItem(
      {@required this.id,
      @required this.itemName,
      @required this.itemDay,
      @required this.itemLocation,
      @required this.itemTime,
      @required this.itemColor});
  factory ListItem.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ListItem(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      itemName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_name']),
      itemDay: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_day']),
      itemLocation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_location']),
      itemTime: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_time']),
      itemColor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_color']),
    );
  }
  factory ListItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ListItem(
      id: serializer.fromJson<int>(json['id']),
      itemName: serializer.fromJson<String>(json['itemName']),
      itemDay: serializer.fromJson<String>(json['itemDay']),
      itemLocation: serializer.fromJson<String>(json['itemLocation']),
      itemTime: serializer.fromJson<String>(json['itemTime']),
      itemColor: serializer.fromJson<String>(json['itemColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemName': serializer.toJson<String>(itemName),
      'itemDay': serializer.toJson<String>(itemDay),
      'itemLocation': serializer.toJson<String>(itemLocation),
      'itemTime': serializer.toJson<String>(itemTime),
      'itemColor': serializer.toJson<String>(itemColor),
    };
  }

  @override
  ListItemsCompanion createCompanion(bool nullToAbsent) {
    return ListItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      itemName: itemName == null && nullToAbsent
          ? const Value.absent()
          : Value(itemName),
      itemDay: itemDay == null && nullToAbsent
          ? const Value.absent()
          : Value(itemDay),
      itemLocation: itemLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(itemLocation),
      itemTime: itemTime == null && nullToAbsent
          ? const Value.absent()
          : Value(itemTime),
      itemColor: itemColor == null && nullToAbsent
          ? const Value.absent()
          : Value(itemColor),
    );
  }

  ListItem copyWith(
          {int id,
          String itemName,
          String itemDay,
          String itemLocation,
          String itemTime,
          String itemColor}) =>
      ListItem(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        itemDay: itemDay ?? this.itemDay,
        itemLocation: itemLocation ?? this.itemLocation,
        itemTime: itemTime ?? this.itemTime,
        itemColor: itemColor ?? this.itemColor,
      );
  @override
  String toString() {
    return (StringBuffer('ListItem(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('itemDay: $itemDay, ')
          ..write('itemLocation: $itemLocation, ')
          ..write('itemTime: $itemTime, ')
          ..write('itemColor: $itemColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          itemName.hashCode,
          $mrjc(
              itemDay.hashCode,
              $mrjc(itemLocation.hashCode,
                  $mrjc(itemTime.hashCode, itemColor.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ListItem &&
          other.id == this.id &&
          other.itemName == this.itemName &&
          other.itemDay == this.itemDay &&
          other.itemLocation == this.itemLocation &&
          other.itemTime == this.itemTime &&
          other.itemColor == this.itemColor);
}

class ListItemsCompanion extends UpdateCompanion<ListItem> {
  final Value<int> id;
  final Value<String> itemName;
  final Value<String> itemDay;
  final Value<String> itemLocation;
  final Value<String> itemTime;
  final Value<String> itemColor;
  const ListItemsCompanion({
    this.id = const Value.absent(),
    this.itemName = const Value.absent(),
    this.itemDay = const Value.absent(),
    this.itemLocation = const Value.absent(),
    this.itemTime = const Value.absent(),
    this.itemColor = const Value.absent(),
  });
  ListItemsCompanion.insert({
    this.id = const Value.absent(),
    @required String itemName,
    @required String itemDay,
    @required String itemLocation,
    @required String itemTime,
    @required String itemColor,
  })  : itemName = Value(itemName),
        itemDay = Value(itemDay),
        itemLocation = Value(itemLocation),
        itemTime = Value(itemTime),
        itemColor = Value(itemColor);
  ListItemsCompanion copyWith(
      {Value<int> id,
      Value<String> itemName,
      Value<String> itemDay,
      Value<String> itemLocation,
      Value<String> itemTime,
      Value<String> itemColor}) {
    return ListItemsCompanion(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemDay: itemDay ?? this.itemDay,
      itemLocation: itemLocation ?? this.itemLocation,
      itemTime: itemTime ?? this.itemTime,
      itemColor: itemColor ?? this.itemColor,
    );
  }
}

class $ListItemsTable extends ListItems
    with TableInfo<$ListItemsTable, ListItem> {
  final GeneratedDatabase _db;
  final String _alias;
  $ListItemsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _itemNameMeta = const VerificationMeta('itemName');
  GeneratedTextColumn _itemName;
  @override
  GeneratedTextColumn get itemName => _itemName ??= _constructItemName();
  GeneratedTextColumn _constructItemName() {
    return GeneratedTextColumn('item_name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _itemDayMeta = const VerificationMeta('itemDay');
  GeneratedTextColumn _itemDay;
  @override
  GeneratedTextColumn get itemDay => _itemDay ??= _constructItemDay();
  GeneratedTextColumn _constructItemDay() {
    return GeneratedTextColumn('item_day', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _itemLocationMeta =
      const VerificationMeta('itemLocation');
  GeneratedTextColumn _itemLocation;
  @override
  GeneratedTextColumn get itemLocation =>
      _itemLocation ??= _constructItemLocation();
  GeneratedTextColumn _constructItemLocation() {
    return GeneratedTextColumn('item_location', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _itemTimeMeta = const VerificationMeta('itemTime');
  GeneratedTextColumn _itemTime;
  @override
  GeneratedTextColumn get itemTime => _itemTime ??= _constructItemTime();
  GeneratedTextColumn _constructItemTime() {
    return GeneratedTextColumn('item_time', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _itemColorMeta = const VerificationMeta('itemColor');
  GeneratedTextColumn _itemColor;
  @override
  GeneratedTextColumn get itemColor => _itemColor ??= _constructItemColor();
  GeneratedTextColumn _constructItemColor() {
    return GeneratedTextColumn('item_color', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, itemName, itemDay, itemLocation, itemTime, itemColor];
  @override
  $ListItemsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'list_items';
  @override
  final String actualTableName = 'list_items';
  @override
  VerificationContext validateIntegrity(ListItemsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.itemName.present) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableValue(d.itemName.value, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (d.itemDay.present) {
      context.handle(_itemDayMeta,
          itemDay.isAcceptableValue(d.itemDay.value, _itemDayMeta));
    } else if (isInserting) {
      context.missing(_itemDayMeta);
    }
    if (d.itemLocation.present) {
      context.handle(
          _itemLocationMeta,
          itemLocation.isAcceptableValue(
              d.itemLocation.value, _itemLocationMeta));
    } else if (isInserting) {
      context.missing(_itemLocationMeta);
    }
    if (d.itemTime.present) {
      context.handle(_itemTimeMeta,
          itemTime.isAcceptableValue(d.itemTime.value, _itemTimeMeta));
    } else if (isInserting) {
      context.missing(_itemTimeMeta);
    }
    if (d.itemColor.present) {
      context.handle(_itemColorMeta,
          itemColor.isAcceptableValue(d.itemColor.value, _itemColorMeta));
    } else if (isInserting) {
      context.missing(_itemColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListItem map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ListItem.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ListItemsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.itemName.present) {
      map['item_name'] = Variable<String, StringType>(d.itemName.value);
    }
    if (d.itemDay.present) {
      map['item_day'] = Variable<String, StringType>(d.itemDay.value);
    }
    if (d.itemLocation.present) {
      map['item_location'] = Variable<String, StringType>(d.itemLocation.value);
    }
    if (d.itemTime.present) {
      map['item_time'] = Variable<String, StringType>(d.itemTime.value);
    }
    if (d.itemColor.present) {
      map['item_color'] = Variable<String, StringType>(d.itemColor.value);
    }
    return map;
  }

  @override
  $ListItemsTable createAlias(String alias) {
    return $ListItemsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ListItemsTable _listItems;
  $ListItemsTable get listItems => _listItems ??= $ListItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [listItems];
}
