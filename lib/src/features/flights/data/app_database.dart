import 'package:flight/src/features/flights/data/models/itinerary/itinerary_model.dart';
import 'package:flight/src/features/flights/data/models/leg/leg_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('flights.db');
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 2, // updated version number
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Database schema creation
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE legs (
        id TEXT PRIMARY KEY,
        departure TEXT,
        arrival TEXT,
        stops INTEGER,
        airline_id TEXT,
        duration INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE itineraries (
        id TEXT PRIMARY KEY,
        price TEXT,
        agent TEXT,
        agent_rating REAL,  // added the agent_rating column
        leg_ids TEXT
      )
    ''');
  }

  // Database schema upgrade
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE itineraries ADD COLUMN agent_rating REAL;
      ''');
    }
  }

  // Insert a leg into the database
  Future<void> insertLeg(LegModel leg) async {
    final db = await database;
    await db.insert(
      'legs',
      leg.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert an itinerary into the database
  Future<void> insertItinerary(ItineraryModel itinerary) async {
    final db = await database;
    await db.insert(
      'itineraries',
      itinerary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Query legs from the database with optional filters
  Future<List<Map<String, dynamic>>> queryLegs({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;
    try {
      return await db.query(
        'legs',
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      print('Error querying legs: $e');
      return [];
    }
  }

  // Query all itineraries from the database
  Future<List<Map<String, dynamic>>> queryItineraries() async {
    final db = await database;
    try {
      return await db.query('itineraries');
    } catch (e) {
      print('Error querying itineraries: $e');
      return [];
    }
  }
}
