import 'package:drift/drift.dart';
import 'package:drift/native.dart'; //Android / iOS / Desktop
// import 'package:drift/web.dart'; //Web browser (IndexedDB)
import 'package:flutter_sqlite/local/entity/employee_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  //_openConnection() – Database ka engine
  // 👉 Database tab open hoga jab first query chalegi
  // 👉 App start pe load nahi hota → performance better

  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'employee.sqlite'));

    return NativeDatabase(file);
  });
  //   Kya ho raha hai?
  // App ka private documents folder liya
  // employee.sqlite file banayi
  // SQLite engine attach kiya
  // 📍 Actual location:
  // /data/data/<package_name>/com.example.flutter_sqlite/employee.sqlite

  //for web browser (InexedDB)
  // return LazyDatabase(() async {
  //   return WebDatabase('my_app_db');
  // });
}

@DriftDatabase(tables: [Employee])
class AppDb extends _$AppDb {
  // Drift ko bataya:
  // Kaunsa table hai → Employee
  // Generated class ka naam → _$AppDb

  AppDb() : super(_openConnection());
  // Constructor
  // 👉 AppDb ko database connection milta hai
  // 👉 LazyDatabase pass hota hai

  @override
  int get schemaVersion => 1;
  // Database versioning
  // Future me columns add karoge → version increment
  // int get schemaVersion => 2;

  // Get the rest of Employee
  // SELECT * FROM employee;
  Future<List<EmployeeData>> getEmployees() async {
    return await select(employee).get();
  }
  Stream<List<EmployeeData>> getEmployeesStream(){
    // await Future.delayed(Duration(microseconds: 10));
    return select(employee).watch();
  }

  // SELECT * FROM employee WHERE id = ?;
  Future<EmployeeData> getEmployee(int id) async {
    return await (select(employee)..where((e) => e.id.equals(id))).getSingle();
  }

  Future<bool> updateEmployee(EmployeeCompanion entity) async {
    return await update(employee).replace(entity);
    // ID match hua to update
    //  true / false return
  }

  Future<int> insertEmployee(EmployeeCompanion entity) async {
    return await into(employee).insert(entity);
    // Returns inserted row ID
  }

  Future<int> deleteEmployee(int id) async {
    return await (delete(employee)..where((e) => e.id.equals(id))).go();
    // Returns deleted rows count
  }
}
// flutter pub run build_runner build --delete-conflicting-outputs
// 🧠 Kya karta hai?
// app_db.g.dart generate karta hai
// Table, queries, schema ka code banata hai
// Drift ko kaam karne layak banata hai
// ⚠️ Ye command mandatory hai