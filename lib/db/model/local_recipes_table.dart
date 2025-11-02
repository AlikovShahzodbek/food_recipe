import 'dart:convert';
import 'package:drift/drift.dart';

class LocalRecipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get area => text().nullable()();
  TextColumn get instruction => text().nullable()();
  // Drift не хранит List<String>, поэтому храним в JSON
  TextColumn get ingredients => text().map(const StringListConverter()).nullable()();
  TextColumn get measures => text().map(const StringListConverter()).nullable()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get videoUrl => text().nullable()();
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
