// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userName,
    lastName,
    address,
    number,
    dateOfBirth,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmployeeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta),
      );
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      )!,
    );
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String userName;
  final String lastName;
  final String address;
  final String number;
  final DateTime dateOfBirth;
  const EmployeeData({
    required this.id,
    required this.userName,
    required this.lastName,
    required this.address,
    required this.number,
    required this.dateOfBirth,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['last_name'] = Variable<String>(lastName);
    map['address'] = Variable<String>(address);
    map['number'] = Variable<String>(number);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      userName: Value(userName),
      lastName: Value(lastName),
      address: Value(address),
      number: Value(number),
      dateOfBirth: Value(dateOfBirth),
    );
  }

  factory EmployeeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      address: serializer.fromJson<String>(json['address']),
      number: serializer.fromJson<String>(json['number']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'lastName': serializer.toJson<String>(lastName),
      'address': serializer.toJson<String>(address),
      'number': serializer.toJson<String>(number),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
    };
  }

  EmployeeData copyWith({
    int? id,
    String? userName,
    String? lastName,
    String? address,
    String? number,
    DateTime? dateOfBirth,
  }) => EmployeeData(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    lastName: lastName ?? this.lastName,
    address: address ?? this.address,
    number: number ?? this.number,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
  );
  EmployeeData copyWithCompanion(EmployeeCompanion data) {
    return EmployeeData(
      id: data.id.present ? data.id.value : this.id,
      userName: data.userName.present ? data.userName.value : this.userName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      address: data.address.present ? data.address.value : this.address,
      number: data.number.present ? data.number.value : this.number,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('lastName: $lastName, ')
          ..write('address: $address, ')
          ..write('number: $number, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userName, lastName, address, number, dateOfBirth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.lastName == this.lastName &&
          other.address == this.address &&
          other.number == this.number &&
          other.dateOfBirth == this.dateOfBirth);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> lastName;
  final Value<String> address;
  final Value<String> number;
  final Value<DateTime> dateOfBirth;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.address = const Value.absent(),
    this.number = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String lastName,
    required String address,
    required String number,
    required DateTime dateOfBirth,
  }) : userName = Value(userName),
       lastName = Value(lastName),
       address = Value(address),
       number = Value(number),
       dateOfBirth = Value(dateOfBirth);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? lastName,
    Expression<String>? address,
    Expression<String>? number,
    Expression<DateTime>? dateOfBirth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (lastName != null) 'last_name': lastName,
      if (address != null) 'address': address,
      if (number != null) 'number': number,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
    });
  }

  EmployeeCompanion copyWith({
    Value<int>? id,
    Value<String>? userName,
    Value<String>? lastName,
    Value<String>? address,
    Value<String>? number,
    Value<DateTime>? dateOfBirth,
  }) {
    return EmployeeCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      number: number ?? this.number,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('lastName: $lastName, ')
          ..write('address: $address, ')
          ..write('number: $number, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $EmployeeTable employee = $EmployeeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employee];
}

typedef $$EmployeeTableCreateCompanionBuilder =
    EmployeeCompanion Function({
      Value<int> id,
      required String userName,
      required String lastName,
      required String address,
      required String number,
      required DateTime dateOfBirth,
    });
typedef $$EmployeeTableUpdateCompanionBuilder =
    EmployeeCompanion Function({
      Value<int> id,
      Value<String> userName,
      Value<String> lastName,
      Value<String> address,
      Value<String> number,
      Value<DateTime> dateOfBirth,
    });

class $$EmployeeTableFilterComposer extends Composer<_$AppDb, $EmployeeTable> {
  $$EmployeeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmployeeTableOrderingComposer
    extends Composer<_$AppDb, $EmployeeTable> {
  $$EmployeeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmployeeTableAnnotationComposer
    extends Composer<_$AppDb, $EmployeeTable> {
  $$EmployeeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );
}

class $$EmployeeTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $EmployeeTable,
          EmployeeData,
          $$EmployeeTableFilterComposer,
          $$EmployeeTableOrderingComposer,
          $$EmployeeTableAnnotationComposer,
          $$EmployeeTableCreateCompanionBuilder,
          $$EmployeeTableUpdateCompanionBuilder,
          (EmployeeData, BaseReferences<_$AppDb, $EmployeeTable, EmployeeData>),
          EmployeeData,
          PrefetchHooks Function()
        > {
  $$EmployeeTableTableManager(_$AppDb db, $EmployeeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
              }) => EmployeeCompanion(
                id: id,
                userName: userName,
                lastName: lastName,
                address: address,
                number: number,
                dateOfBirth: dateOfBirth,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userName,
                required String lastName,
                required String address,
                required String number,
                required DateTime dateOfBirth,
              }) => EmployeeCompanion.insert(
                id: id,
                userName: userName,
                lastName: lastName,
                address: address,
                number: number,
                dateOfBirth: dateOfBirth,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmployeeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $EmployeeTable,
      EmployeeData,
      $$EmployeeTableFilterComposer,
      $$EmployeeTableOrderingComposer,
      $$EmployeeTableAnnotationComposer,
      $$EmployeeTableCreateCompanionBuilder,
      $$EmployeeTableUpdateCompanionBuilder,
      (EmployeeData, BaseReferences<_$AppDb, $EmployeeTable, EmployeeData>),
      EmployeeData,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db, _db.employee);
}
