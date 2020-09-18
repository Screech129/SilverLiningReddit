import 'package:reflectable/reflectable.dart';
import 'package:silverliningsreddit/src/helpers/reflector.dart';
import 'package:silverliningsreddit/src/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  Database _db;
  String createTableQuery = '';

  Future<void> init() async {
    if (_db != null) {
      return;
    }
    String path = await getDatabasesPath() + 'localData.db';

    _db = await openDatabase(
      path,
      version: 3,
      onCreate: (Database newDb, int version) {
        List<Type> tableList = [
          User
        ]; //List of tables to be created in local DB
        _buildTables(tableList);
        newDb.execute(createTableQuery);
      },
    );
  }

  void _buildTables(List<Type> types) {
    types.forEach((type) {
      ClassMirror classMirror = reflector.reflectType(type);

      var fields = classMirror.declarations.values
          .where(
            (x) =>
                !x.simpleName.contains(classMirror.simpleName) &&
                x.metadata.length == 0,
          )
          .toList();

      var className = classMirror.simpleName;

      createTableQuery = "CREATE TABLE $className (";

      for (var i = 0; i < fields.length; i++) {
        VariableMirror variableMirror = fields[i];
        Type type = variableMirror.dynamicReflectedType;
        var columnString =
            _buildColumn(variableMirror.simpleName, type.toString());

        if (i != fields.length - 1) {
          createTableQuery += columnString + ",";
        } else {
          createTableQuery += columnString;
        }
      }

      createTableQuery += ")";
    });
  }

  String _buildColumn(String simpleName, String type) {
    if (simpleName == 'id') {
      return "id INTEGER PRIMARY KEY";
    }
    switch (type) {
      case "int":
      case "bool":
        return "$simpleName INTEGER";
        break;
      case "String":
        return "$simpleName TEXT";
        break;
      default:
        return "$simpleName BLOB";
    }
  }

  Future<List<Map<String, dynamic>>> getAll<T>(List<String> columns) async {
    ClassMirror classMirror = reflector.reflectType(T);
    final data = await _db.query(
      classMirror.simpleName,
      columns: columns,
    );
    return data;
  }

  Future<List<Map<String, dynamic>>> getAllWhere<T>(List<String> returnColumns,
      List<String> whereColumns, List<dynamic> whereValues) async {
    ClassMirror classMirror = reflector.reflectType(T);
    final data = await _db.query(
      classMirror.simpleName,
      columns: returnColumns,
      where: _buildWhereClause(whereColumns),
      whereArgs: whereValues,
    );
    return data;
  }

  Future<List<Map<String, dynamic>>> getSingle<T>(
      List<String> columns, int id) async {
    ClassMirror classMirror = reflector.reflectType(T);
    final data = await _db.query(
      classMirror.simpleName,
      columns: columns,
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> insert<T>(List<dynamic> data) async {
    ClassMirror classMirror = reflector.reflectType(T);
    var results = 0;
    data.forEach((item) async {
      results = await _db.insert(classMirror.simpleName, item);
    });
    return results;
  }

  String _buildWhereClause(List<String> whereColumns) {
    if (whereColumns.length == 1) {
      return whereColumns[0] + " = ?";
    }

    whereColumns.last = whereColumns.last + " = ?";
    var whereColumnsString = whereColumns.join(" = ? AND ");
    return whereColumnsString;
  }
}

DbProvider dbProvider = DbProvider();
