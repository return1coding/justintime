import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class ListItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemName => text().withLength(min: 1, max: 50)();
  TextColumn get itemDay => text().withLength(min: 1, max: 50)();
  TextColumn get itemLocation => text().withLength(min: 1, max: 50)();
  TextColumn get itemTime => text().withLength(min: 1, max: 50)();
  TextColumn get itemColor => text().withLength(min: 1, max: 50)();
}

@UseMoor(tables: [ListItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<ListItem>> getAllListItems() => select(listItems).get();
  Stream<List<ListItem>> watchAllListItems() => select(listItems).watch();
  Stream<List<ListItem>> watchAllListItemsSort() {
    return (select(listItems)
          ..orderBy([(t) => OrderingTerm(expression: t.itemTime)]))
        .watch();
  }

  Future insertListItems(ListItem listItem) => into(listItems).insert(listItem);
  Future updateListItems(ListItem listItem) =>
      update(listItems).replace(listItem);
  Future deleteListItems(ListItem listItem) =>
      delete(listItems).delete(listItem);
}
