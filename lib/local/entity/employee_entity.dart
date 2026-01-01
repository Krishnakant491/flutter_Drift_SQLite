//Create Database Table
import 'package:drift/drift.dart';

class Employee extends Table{
  IntColumn get id  => integer().autoIncrement()();
  TextColumn get userName => text().named('user_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get address => text().named('address')();
  TextColumn get number => text().named('number')();
  DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth')();
}