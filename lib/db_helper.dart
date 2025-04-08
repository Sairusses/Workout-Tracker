import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_tracker/models/workout_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'workout_tracker.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        type TEXT,
        reps INTEGER,
        sets INTEGER,
        duration INTEGER,
        date TEXT
      )
    ''');
  }

  Future<void> insertWorkout(Workout workout) async {
    final db = await database;
    await db.insert(
      'workouts',
      workout.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Workout>> getWorkouts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('workouts');

    return List.generate(maps.length, (i) {
      return Workout(
        id: maps[i]['id'],
        title: maps[i]['title'],
        type: maps[i]['type'],
        reps: maps[i]['reps'],
        sets: maps[i]['sets'],
        duration: maps[i]['duration'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  
}