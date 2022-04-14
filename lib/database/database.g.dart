// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TxtDataTableData extends DataClass
    implements Insertable<TxtDataTableData> {
  final int id;
  final String name;
  TxtDataTableData({required this.id, required this.name});
  factory TxtDataTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TxtDataTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TxtDataTableCompanion toCompanion(bool nullToAbsent) {
    return TxtDataTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory TxtDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TxtDataTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TxtDataTableData copyWith({int? id, String? name}) => TxtDataTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TxtDataTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TxtDataTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class TxtDataTableCompanion extends UpdateCompanion<TxtDataTableData> {
  final Value<int> id;
  final Value<String> name;
  const TxtDataTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TxtDataTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TxtDataTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TxtDataTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TxtDataTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TxtDataTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TxtDataTableTable extends TxtDataTable
    with TableInfo<$TxtDataTableTable, TxtDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TxtDataTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'txt_data_table';
  @override
  String get actualTableName => 'txt_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<TxtDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TxtDataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TxtDataTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TxtDataTableTable createAlias(String alias) {
    return $TxtDataTableTable(attachedDatabase, alias);
  }
}

class PngDataTableData extends DataClass
    implements Insertable<PngDataTableData> {
  final int id;
  final String raw;
  final String name;
  final String uploader;
  final String qq;
  final String type;
  final String players;
  final String size;
  final String time;
  final String bv;
  PngDataTableData(
      {required this.id,
      required this.raw,
      required this.name,
      required this.uploader,
      required this.qq,
      required this.type,
      required this.players,
      required this.size,
      required this.time,
      required this.bv});
  factory PngDataTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PngDataTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      raw: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}raw'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      uploader: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uploader'])!,
      qq: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qq'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      players: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}players'])!,
      size: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}size'])!,
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      bv: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bv'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['raw'] = Variable<String>(raw);
    map['name'] = Variable<String>(name);
    map['uploader'] = Variable<String>(uploader);
    map['qq'] = Variable<String>(qq);
    map['type'] = Variable<String>(type);
    map['players'] = Variable<String>(players);
    map['size'] = Variable<String>(size);
    map['time'] = Variable<String>(time);
    map['bv'] = Variable<String>(bv);
    return map;
  }

  PngDataTableCompanion toCompanion(bool nullToAbsent) {
    return PngDataTableCompanion(
      id: Value(id),
      raw: Value(raw),
      name: Value(name),
      uploader: Value(uploader),
      qq: Value(qq),
      type: Value(type),
      players: Value(players),
      size: Value(size),
      time: Value(time),
      bv: Value(bv),
    );
  }

  factory PngDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PngDataTableData(
      id: serializer.fromJson<int>(json['id']),
      raw: serializer.fromJson<String>(json['raw']),
      name: serializer.fromJson<String>(json['name']),
      uploader: serializer.fromJson<String>(json['uploader']),
      qq: serializer.fromJson<String>(json['qq']),
      type: serializer.fromJson<String>(json['type']),
      players: serializer.fromJson<String>(json['players']),
      size: serializer.fromJson<String>(json['size']),
      time: serializer.fromJson<String>(json['time']),
      bv: serializer.fromJson<String>(json['bv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'raw': serializer.toJson<String>(raw),
      'name': serializer.toJson<String>(name),
      'uploader': serializer.toJson<String>(uploader),
      'qq': serializer.toJson<String>(qq),
      'type': serializer.toJson<String>(type),
      'players': serializer.toJson<String>(players),
      'size': serializer.toJson<String>(size),
      'time': serializer.toJson<String>(time),
      'bv': serializer.toJson<String>(bv),
    };
  }

  PngDataTableData copyWith(
          {int? id,
          String? raw,
          String? name,
          String? uploader,
          String? qq,
          String? type,
          String? players,
          String? size,
          String? time,
          String? bv}) =>
      PngDataTableData(
        id: id ?? this.id,
        raw: raw ?? this.raw,
        name: name ?? this.name,
        uploader: uploader ?? this.uploader,
        qq: qq ?? this.qq,
        type: type ?? this.type,
        players: players ?? this.players,
        size: size ?? this.size,
        time: time ?? this.time,
        bv: bv ?? this.bv,
      );
  @override
  String toString() {
    return (StringBuffer('PngDataTableData(')
          ..write('id: $id, ')
          ..write('raw: $raw, ')
          ..write('name: $name, ')
          ..write('uploader: $uploader, ')
          ..write('qq: $qq, ')
          ..write('type: $type, ')
          ..write('players: $players, ')
          ..write('size: $size, ')
          ..write('time: $time, ')
          ..write('bv: $bv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, raw, name, uploader, qq, type, players, size, time, bv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PngDataTableData &&
          other.id == this.id &&
          other.raw == this.raw &&
          other.name == this.name &&
          other.uploader == this.uploader &&
          other.qq == this.qq &&
          other.type == this.type &&
          other.players == this.players &&
          other.size == this.size &&
          other.time == this.time &&
          other.bv == this.bv);
}

class PngDataTableCompanion extends UpdateCompanion<PngDataTableData> {
  final Value<int> id;
  final Value<String> raw;
  final Value<String> name;
  final Value<String> uploader;
  final Value<String> qq;
  final Value<String> type;
  final Value<String> players;
  final Value<String> size;
  final Value<String> time;
  final Value<String> bv;
  const PngDataTableCompanion({
    this.id = const Value.absent(),
    this.raw = const Value.absent(),
    this.name = const Value.absent(),
    this.uploader = const Value.absent(),
    this.qq = const Value.absent(),
    this.type = const Value.absent(),
    this.players = const Value.absent(),
    this.size = const Value.absent(),
    this.time = const Value.absent(),
    this.bv = const Value.absent(),
  });
  PngDataTableCompanion.insert({
    this.id = const Value.absent(),
    required String raw,
    required String name,
    required String uploader,
    required String qq,
    required String type,
    required String players,
    required String size,
    required String time,
    required String bv,
  })  : raw = Value(raw),
        name = Value(name),
        uploader = Value(uploader),
        qq = Value(qq),
        type = Value(type),
        players = Value(players),
        size = Value(size),
        time = Value(time),
        bv = Value(bv);
  static Insertable<PngDataTableData> custom({
    Expression<int>? id,
    Expression<String>? raw,
    Expression<String>? name,
    Expression<String>? uploader,
    Expression<String>? qq,
    Expression<String>? type,
    Expression<String>? players,
    Expression<String>? size,
    Expression<String>? time,
    Expression<String>? bv,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (raw != null) 'raw': raw,
      if (name != null) 'name': name,
      if (uploader != null) 'uploader': uploader,
      if (qq != null) 'qq': qq,
      if (type != null) 'type': type,
      if (players != null) 'players': players,
      if (size != null) 'size': size,
      if (time != null) 'time': time,
      if (bv != null) 'bv': bv,
    });
  }

  PngDataTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? raw,
      Value<String>? name,
      Value<String>? uploader,
      Value<String>? qq,
      Value<String>? type,
      Value<String>? players,
      Value<String>? size,
      Value<String>? time,
      Value<String>? bv}) {
    return PngDataTableCompanion(
      id: id ?? this.id,
      raw: raw ?? this.raw,
      name: name ?? this.name,
      uploader: uploader ?? this.uploader,
      qq: qq ?? this.qq,
      type: type ?? this.type,
      players: players ?? this.players,
      size: size ?? this.size,
      time: time ?? this.time,
      bv: bv ?? this.bv,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (raw.present) {
      map['raw'] = Variable<String>(raw.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (uploader.present) {
      map['uploader'] = Variable<String>(uploader.value);
    }
    if (qq.present) {
      map['qq'] = Variable<String>(qq.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (players.present) {
      map['players'] = Variable<String>(players.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (bv.present) {
      map['bv'] = Variable<String>(bv.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PngDataTableCompanion(')
          ..write('id: $id, ')
          ..write('raw: $raw, ')
          ..write('name: $name, ')
          ..write('uploader: $uploader, ')
          ..write('qq: $qq, ')
          ..write('type: $type, ')
          ..write('players: $players, ')
          ..write('size: $size, ')
          ..write('time: $time, ')
          ..write('bv: $bv')
          ..write(')'))
        .toString();
  }
}

class $PngDataTableTable extends PngDataTable
    with TableInfo<$PngDataTableTable, PngDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PngDataTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _rawMeta = const VerificationMeta('raw');
  @override
  late final GeneratedColumn<String?> raw = GeneratedColumn<String?>(
      'raw', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _uploaderMeta = const VerificationMeta('uploader');
  @override
  late final GeneratedColumn<String?> uploader = GeneratedColumn<String?>(
      'uploader', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _qqMeta = const VerificationMeta('qq');
  @override
  late final GeneratedColumn<String?> qq = GeneratedColumn<String?>(
      'qq', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _playersMeta = const VerificationMeta('players');
  @override
  late final GeneratedColumn<String?> players = GeneratedColumn<String?>(
      'players', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String?> size = GeneratedColumn<String?>(
      'size', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String?> time = GeneratedColumn<String?>(
      'time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bvMeta = const VerificationMeta('bv');
  @override
  late final GeneratedColumn<String?> bv = GeneratedColumn<String?>(
      'bv', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, raw, name, uploader, qq, type, players, size, time, bv];
  @override
  String get aliasedName => _alias ?? 'png_data_table';
  @override
  String get actualTableName => 'png_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<PngDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('raw')) {
      context.handle(
          _rawMeta, raw.isAcceptableOrUnknown(data['raw']!, _rawMeta));
    } else if (isInserting) {
      context.missing(_rawMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('uploader')) {
      context.handle(_uploaderMeta,
          uploader.isAcceptableOrUnknown(data['uploader']!, _uploaderMeta));
    } else if (isInserting) {
      context.missing(_uploaderMeta);
    }
    if (data.containsKey('qq')) {
      context.handle(_qqMeta, qq.isAcceptableOrUnknown(data['qq']!, _qqMeta));
    } else if (isInserting) {
      context.missing(_qqMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('players')) {
      context.handle(_playersMeta,
          players.isAcceptableOrUnknown(data['players']!, _playersMeta));
    } else if (isInserting) {
      context.missing(_playersMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('bv')) {
      context.handle(_bvMeta, bv.isAcceptableOrUnknown(data['bv']!, _bvMeta));
    } else if (isInserting) {
      context.missing(_bvMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PngDataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PngDataTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PngDataTableTable createAlias(String alias) {
    return $PngDataTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TxtDataTableTable txtDataTable = $TxtDataTableTable(this);
  late final $PngDataTableTable pngDataTable = $PngDataTableTable(this);
  late final TxtDataDao txtDataDao = TxtDataDao(this as AppDataBase);
  late final PngDataDao pngDataDao = PngDataDao(this as AppDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [txtDataTable, pngDataTable];
}
