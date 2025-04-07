import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db_service.g.dart'; // Required for code generation

// Define the table
class WorkoutItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get reps => integer().nullable()();      // optional if using type = 'Duration'
  IntColumn get duration => integer().nullable()();  // optional if using type = 'Reps'
  IntColumn get sets => integer()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  TextColumn get type => text()(); // 'Reps' or 'Duration'
}

// The database class
@DriftDatabase(tables: [WorkoutItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // CRUD Operations

  Future<int> insertWorkout(WorkoutItemsCompanion entry) =>
      into(workoutItems).insert(entry);

  Future<List<WorkoutItem>> getAllWorkouts() =>
      select(workoutItems).get();

  Future<WorkoutItem?> getWorkoutById(int id) =>
      (select(workoutItems)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<bool> updateWorkout(WorkoutItem entry) =>
      update(workoutItems).replace(entry);

  Future<int> deleteWorkout(int id) =>
      (delete(workoutItems)..where((tbl) => tbl.id.equals(id))).go();
}

// Connection setup
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'workout_db.sqlite'));
    return NativeDatabase(file);
  });
}
