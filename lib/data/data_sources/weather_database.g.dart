// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_database.dart';

// ignore_for_file: type=lint
class $DbLocationTable extends DbLocation
    with TableInfo<$DbLocationTable, DbLocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $DbLocationTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
      'lon', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [lat, lon, city];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'db_location';

  @override
  VerificationContext validateIntegrity(Insertable<DbLocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon']!, _lonMeta));
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};

  @override
  DbLocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbLocationData(
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lon: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lon'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
    );
  }

  @override
  $DbLocationTable createAlias(String alias) {
    return $DbLocationTable(attachedDatabase, alias);
  }
}

class DbLocationData extends DataClass implements Insertable<DbLocationData> {
  final double lat;
  final double lon;
  final String city;

  const DbLocationData(
      {required this.lat, required this.lon, required this.city});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['city'] = Variable<String>(city);
    return map;
  }

  DbLocationCompanion toCompanion(bool nullToAbsent) {
    return DbLocationCompanion(
      lat: Value(lat),
      lon: Value(lon),
      city: Value(city),
    );
  }

  factory DbLocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbLocationData(
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      city: serializer.fromJson<String>(json['city']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'city': serializer.toJson<String>(city),
    };
  }

  DbLocationData copyWith({double? lat, double? lon, String? city}) =>
      DbLocationData(
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        city: city ?? this.city,
      );

  DbLocationData copyWithCompanion(DbLocationCompanion data) {
    return DbLocationData(
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      city: data.city.present ? data.city.value : this.city,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbLocationData(')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lat, lon, city);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbLocationData &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.city == this.city);
}

class DbLocationCompanion extends UpdateCompanion<DbLocationData> {
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> city;
  final Value<int> rowid;

  const DbLocationCompanion({
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  });

  DbLocationCompanion.insert({
    required double lat,
    required double lon,
    required String city,
    this.rowid = const Value.absent(),
  })  : lat = Value(lat),
        lon = Value(lon),
        city = Value(city);

  static Insertable<DbLocationData> custom({
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<String>? city,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (city != null) 'city': city,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbLocationCompanion copyWith(
      {Value<double>? lat,
      Value<double>? lon,
      Value<String>? city,
      Value<int>? rowid}) {
    return DbLocationCompanion(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      city: city ?? this.city,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbLocationCompanion(')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('city: $city, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$WeatherDatabase extends GeneratedDatabase {
  _$WeatherDatabase(QueryExecutor e) : super(e);

  $WeatherDatabaseManager get managers => $WeatherDatabaseManager(this);
  late final $DbLocationTable dbLocation = $DbLocationTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbLocation];
}

typedef $$DbLocationTableCreateCompanionBuilder = DbLocationCompanion Function({
  required double lat,
  required double lon,
  required String city,
  Value<int> rowid,
});
typedef $$DbLocationTableUpdateCompanionBuilder = DbLocationCompanion Function({
  Value<double> lat,
  Value<double> lon,
  Value<String> city,
  Value<int> rowid,
});

class $$DbLocationTableFilterComposer
    extends Composer<_$WeatherDatabase, $DbLocationTable> {
  $$DbLocationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));
}

class $$DbLocationTableOrderingComposer
    extends Composer<_$WeatherDatabase, $DbLocationTable> {
  $$DbLocationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lon => $composableBuilder(
      column: $table.lon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));
}

class $$DbLocationTableAnnotationComposer
    extends Composer<_$WeatherDatabase, $DbLocationTable> {
  $$DbLocationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);
}

class $$DbLocationTableTableManager extends RootTableManager<
    _$WeatherDatabase,
    $DbLocationTable,
    DbLocationData,
    $$DbLocationTableFilterComposer,
    $$DbLocationTableOrderingComposer,
    $$DbLocationTableAnnotationComposer,
    $$DbLocationTableCreateCompanionBuilder,
    $$DbLocationTableUpdateCompanionBuilder,
    (
      DbLocationData,
      BaseReferences<_$WeatherDatabase, $DbLocationTable, DbLocationData>
    ),
    DbLocationData,
    PrefetchHooks Function()> {
  $$DbLocationTableTableManager(_$WeatherDatabase db, $DbLocationTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbLocationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbLocationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbLocationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<double> lat = const Value.absent(),
            Value<double> lon = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DbLocationCompanion(
            lat: lat,
            lon: lon,
            city: city,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required double lat,
            required double lon,
            required String city,
            Value<int> rowid = const Value.absent(),
          }) =>
              DbLocationCompanion.insert(
            lat: lat,
            lon: lon,
            city: city,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbLocationTableProcessedTableManager = ProcessedTableManager<
    _$WeatherDatabase,
    $DbLocationTable,
    DbLocationData,
    $$DbLocationTableFilterComposer,
    $$DbLocationTableOrderingComposer,
    $$DbLocationTableAnnotationComposer,
    $$DbLocationTableCreateCompanionBuilder,
    $$DbLocationTableUpdateCompanionBuilder,
    (
      DbLocationData,
      BaseReferences<_$WeatherDatabase, $DbLocationTable, DbLocationData>
    ),
    DbLocationData,
    PrefetchHooks Function()>;

class $WeatherDatabaseManager {
  final _$WeatherDatabase _db;

  $WeatherDatabaseManager(this._db);

  $$DbLocationTableTableManager get dbLocation =>
      $$DbLocationTableTableManager(_db, _db.dbLocation);
}
