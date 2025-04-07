// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// ignore_for_file: type=lint
class $WorkoutItemsTable extends WorkoutItems
    with TableInfo<$WorkoutItemsTable, WorkoutItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, reps, duration, sets, date, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_items';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    } else if (isInserting) {
      context.missing(_setsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $WorkoutItemsTable createAlias(String alias) {
    return $WorkoutItemsTable(attachedDatabase, alias);
  }
}

class WorkoutItem extends DataClass implements Insertable<WorkoutItem> {
  final int id;
  final String title;
  final int reps;
  final int duration;
  final int sets;
  final DateTime date;
  final String type;
  const WorkoutItem(
      {required this.id,
      required this.title,
      required this.reps,
      required this.duration,
      required this.sets,
      required this.date,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['reps'] = Variable<int>(reps);
    map['duration'] = Variable<int>(duration);
    map['sets'] = Variable<int>(sets);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    return map;
  }

  WorkoutItemsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutItemsCompanion(
      id: Value(id),
      title: Value(title),
      reps: Value(reps),
      duration: Value(duration),
      sets: Value(sets),
      date: Value(date),
      type: Value(type),
    );
  }

  factory WorkoutItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      reps: serializer.fromJson<int>(json['reps']),
      duration: serializer.fromJson<int>(json['duration']),
      sets: serializer.fromJson<int>(json['sets']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'reps': serializer.toJson<int>(reps),
      'duration': serializer.toJson<int>(duration),
      'sets': serializer.toJson<int>(sets),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
    };
  }

  WorkoutItem copyWith(
          {int? id,
          String? title,
          int? reps,
          int? duration,
          int? sets,
          DateTime? date,
          String? type}) =>
      WorkoutItem(
        id: id ?? this.id,
        title: title ?? this.title,
        reps: reps ?? this.reps,
        duration: duration ?? this.duration,
        sets: sets ?? this.sets,
        date: date ?? this.date,
        type: type ?? this.type,
      );
  WorkoutItem copyWithCompanion(WorkoutItemsCompanion data) {
    return WorkoutItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      reps: data.reps.present ? data.reps.value : this.reps,
      duration: data.duration.present ? data.duration.value : this.duration,
      sets: data.sets.present ? data.sets.value : this.sets,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('reps: $reps, ')
          ..write('duration: $duration, ')
          ..write('sets: $sets, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, reps, duration, sets, date, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.reps == this.reps &&
          other.duration == this.duration &&
          other.sets == this.sets &&
          other.date == this.date &&
          other.type == this.type);
}

class WorkoutItemsCompanion extends UpdateCompanion<WorkoutItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> reps;
  final Value<int> duration;
  final Value<int> sets;
  final Value<DateTime> date;
  final Value<String> type;
  const WorkoutItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.reps = const Value.absent(),
    this.duration = const Value.absent(),
    this.sets = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
  });
  WorkoutItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int reps,
    required int duration,
    required int sets,
    required DateTime date,
    required String type,
  })  : title = Value(title),
        reps = Value(reps),
        duration = Value(duration),
        sets = Value(sets),
        date = Value(date),
        type = Value(type);
  static Insertable<WorkoutItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? reps,
    Expression<int>? duration,
    Expression<int>? sets,
    Expression<DateTime>? date,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (reps != null) 'reps': reps,
      if (duration != null) 'duration': duration,
      if (sets != null) 'sets': sets,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
    });
  }

  WorkoutItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? reps,
      Value<int>? duration,
      Value<int>? sets,
      Value<DateTime>? date,
      Value<String>? type}) {
    return WorkoutItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      reps: reps ?? this.reps,
      duration: duration ?? this.duration,
      sets: sets ?? this.sets,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('reps: $reps, ')
          ..write('duration: $duration, ')
          ..write('sets: $sets, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkoutItemsTable workoutItems = $WorkoutItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [workoutItems];
}

typedef $$WorkoutItemsTableCreateCompanionBuilder = WorkoutItemsCompanion
    Function({
  Value<int> id,
  required String title,
  required int reps,
  required int duration,
  required int sets,
  required DateTime date,
  required String type,
});
typedef $$WorkoutItemsTableUpdateCompanionBuilder = WorkoutItemsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<int> reps,
  Value<int> duration,
  Value<int> sets,
  Value<DateTime> date,
  Value<String> type,
});

class $$WorkoutItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutItemsTable> {
  $$WorkoutItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sets => $composableBuilder(
      column: $table.sets, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));
}

class $$WorkoutItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutItemsTable> {
  $$WorkoutItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sets => $composableBuilder(
      column: $table.sets, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutItemsTable> {
  $$WorkoutItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$WorkoutItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutItemsTable,
    WorkoutItem,
    $$WorkoutItemsTableFilterComposer,
    $$WorkoutItemsTableOrderingComposer,
    $$WorkoutItemsTableAnnotationComposer,
    $$WorkoutItemsTableCreateCompanionBuilder,
    $$WorkoutItemsTableUpdateCompanionBuilder,
    (
      WorkoutItem,
      BaseReferences<_$AppDatabase, $WorkoutItemsTable, WorkoutItem>
    ),
    WorkoutItem,
    PrefetchHooks Function()> {
  $$WorkoutItemsTableTableManager(_$AppDatabase db, $WorkoutItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> reps = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<int> sets = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> type = const Value.absent(),
          }) =>
              WorkoutItemsCompanion(
            id: id,
            title: title,
            reps: reps,
            duration: duration,
            sets: sets,
            date: date,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required int reps,
            required int duration,
            required int sets,
            required DateTime date,
            required String type,
          }) =>
              WorkoutItemsCompanion.insert(
            id: id,
            title: title,
            reps: reps,
            duration: duration,
            sets: sets,
            date: date,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WorkoutItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutItemsTable,
    WorkoutItem,
    $$WorkoutItemsTableFilterComposer,
    $$WorkoutItemsTableOrderingComposer,
    $$WorkoutItemsTableAnnotationComposer,
    $$WorkoutItemsTableCreateCompanionBuilder,
    $$WorkoutItemsTableUpdateCompanionBuilder,
    (
      WorkoutItem,
      BaseReferences<_$AppDatabase, $WorkoutItemsTable, WorkoutItem>
    ),
    WorkoutItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkoutItemsTableTableManager get workoutItems =>
      $$WorkoutItemsTableTableManager(_db, _db.workoutItems);
}
