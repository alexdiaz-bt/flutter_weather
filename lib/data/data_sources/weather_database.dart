import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'weather_database.g.dart';

class DbLocation extends Table {
  RealColumn get lat => real()();

  RealColumn get lon => real()();

  TextColumn get city => text()();
}

@DriftDatabase(tables: [DbLocation])
class WeatherDatabase extends _$WeatherDatabase {
  WeatherDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'weather_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
