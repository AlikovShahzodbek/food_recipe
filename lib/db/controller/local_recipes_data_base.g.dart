// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_recipes_data_base.dart';

// ignore_for_file: type=lint
class $LocalRecipesTable extends LocalRecipes
    with TableInfo<$LocalRecipesTable, LocalRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalRecipesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionMeta = const VerificationMeta(
    'instruction',
  );
  @override
  late final GeneratedColumn<String> instruction = GeneratedColumn<String>(
    'instruction',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($LocalRecipesTable.$converteringredientsn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> measures =
      GeneratedColumn<String>(
        'measures',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($LocalRecipesTable.$convertermeasuresn);
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    area,
    instruction,
    ingredients,
    measures,
    imagePath,
    videoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalRecipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('instruction')) {
      context.handle(
        _instructionMeta,
        instruction.isAcceptableOrUnknown(
          data['instruction']!,
          _instructionMeta,
        ),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalRecipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      ),
      instruction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instruction'],
      ),
      ingredients: $LocalRecipesTable.$converteringredientsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ingredients'],
        ),
      ),
      measures: $LocalRecipesTable.$convertermeasuresn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}measures'],
        ),
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      ),
    );
  }

  @override
  $LocalRecipesTable createAlias(String alias) {
    return $LocalRecipesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteringredients =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converteringredientsn =
      NullAwareTypeConverter.wrap($converteringredients);
  static TypeConverter<List<String>, String> $convertermeasures =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertermeasuresn =
      NullAwareTypeConverter.wrap($convertermeasures);
}

class LocalRecipe extends DataClass implements Insertable<LocalRecipe> {
  final int id;
  final String? name;
  final String? category;
  final String? area;
  final String? instruction;
  final List<String>? ingredients;
  final List<String>? measures;
  final String? imagePath;
  final String? videoUrl;
  const LocalRecipe({
    required this.id,
    this.name,
    this.category,
    this.area,
    this.instruction,
    this.ingredients,
    this.measures,
    this.imagePath,
    this.videoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String>(area);
    }
    if (!nullToAbsent || instruction != null) {
      map['instruction'] = Variable<String>(instruction);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(
        $LocalRecipesTable.$converteringredientsn.toSql(ingredients),
      );
    }
    if (!nullToAbsent || measures != null) {
      map['measures'] = Variable<String>(
        $LocalRecipesTable.$convertermeasuresn.toSql(measures),
      );
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    return map;
  }

  LocalRecipesCompanion toCompanion(bool nullToAbsent) {
    return LocalRecipesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      instruction: instruction == null && nullToAbsent
          ? const Value.absent()
          : Value(instruction),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      measures: measures == null && nullToAbsent
          ? const Value.absent()
          : Value(measures),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
    );
  }

  factory LocalRecipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalRecipe(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      category: serializer.fromJson<String?>(json['category']),
      area: serializer.fromJson<String?>(json['area']),
      instruction: serializer.fromJson<String?>(json['instruction']),
      ingredients: serializer.fromJson<List<String>?>(json['ingredients']),
      measures: serializer.fromJson<List<String>?>(json['measures']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'category': serializer.toJson<String?>(category),
      'area': serializer.toJson<String?>(area),
      'instruction': serializer.toJson<String?>(instruction),
      'ingredients': serializer.toJson<List<String>?>(ingredients),
      'measures': serializer.toJson<List<String>?>(measures),
      'imagePath': serializer.toJson<String?>(imagePath),
      'videoUrl': serializer.toJson<String?>(videoUrl),
    };
  }

  LocalRecipe copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> area = const Value.absent(),
    Value<String?> instruction = const Value.absent(),
    Value<List<String>?> ingredients = const Value.absent(),
    Value<List<String>?> measures = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<String?> videoUrl = const Value.absent(),
  }) => LocalRecipe(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    category: category.present ? category.value : this.category,
    area: area.present ? area.value : this.area,
    instruction: instruction.present ? instruction.value : this.instruction,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
    measures: measures.present ? measures.value : this.measures,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
  );
  LocalRecipe copyWithCompanion(LocalRecipesCompanion data) {
    return LocalRecipe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      area: data.area.present ? data.area.value : this.area,
      instruction: data.instruction.present
          ? data.instruction.value
          : this.instruction,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      measures: data.measures.present ? data.measures.value : this.measures,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalRecipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('instruction: $instruction, ')
          ..write('ingredients: $ingredients, ')
          ..write('measures: $measures, ')
          ..write('imagePath: $imagePath, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    area,
    instruction,
    ingredients,
    measures,
    imagePath,
    videoUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalRecipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.area == this.area &&
          other.instruction == this.instruction &&
          other.ingredients == this.ingredients &&
          other.measures == this.measures &&
          other.imagePath == this.imagePath &&
          other.videoUrl == this.videoUrl);
}

class LocalRecipesCompanion extends UpdateCompanion<LocalRecipe> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> category;
  final Value<String?> area;
  final Value<String?> instruction;
  final Value<List<String>?> ingredients;
  final Value<List<String>?> measures;
  final Value<String?> imagePath;
  final Value<String?> videoUrl;
  const LocalRecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
    this.instruction = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.measures = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.videoUrl = const Value.absent(),
  });
  LocalRecipesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
    this.instruction = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.measures = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.videoUrl = const Value.absent(),
  });
  static Insertable<LocalRecipe> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? area,
    Expression<String>? instruction,
    Expression<String>? ingredients,
    Expression<String>? measures,
    Expression<String>? imagePath,
    Expression<String>? videoUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (area != null) 'area': area,
      if (instruction != null) 'instruction': instruction,
      if (ingredients != null) 'ingredients': ingredients,
      if (measures != null) 'measures': measures,
      if (imagePath != null) 'image_path': imagePath,
      if (videoUrl != null) 'video_url': videoUrl,
    });
  }

  LocalRecipesCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<String?>? category,
    Value<String?>? area,
    Value<String?>? instruction,
    Value<List<String>?>? ingredients,
    Value<List<String>?>? measures,
    Value<String?>? imagePath,
    Value<String?>? videoUrl,
  }) {
    return LocalRecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      area: area ?? this.area,
      instruction: instruction ?? this.instruction,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
      imagePath: imagePath ?? this.imagePath,
      videoUrl: videoUrl ?? this.videoUrl,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (instruction.present) {
      map['instruction'] = Variable<String>(instruction.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(
        $LocalRecipesTable.$converteringredientsn.toSql(ingredients.value),
      );
    }
    if (measures.present) {
      map['measures'] = Variable<String>(
        $LocalRecipesTable.$convertermeasuresn.toSql(measures.value),
      );
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalRecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('instruction: $instruction, ')
          ..write('ingredients: $ingredients, ')
          ..write('measures: $measures, ')
          ..write('imagePath: $imagePath, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalRecipesDatabase extends GeneratedDatabase {
  _$LocalRecipesDatabase(QueryExecutor e) : super(e);
  $LocalRecipesDatabaseManager get managers =>
      $LocalRecipesDatabaseManager(this);
  late final $LocalRecipesTable localRecipes = $LocalRecipesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localRecipes];
}

typedef $$LocalRecipesTableCreateCompanionBuilder =
    LocalRecipesCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> category,
      Value<String?> area,
      Value<String?> instruction,
      Value<List<String>?> ingredients,
      Value<List<String>?> measures,
      Value<String?> imagePath,
      Value<String?> videoUrl,
    });
typedef $$LocalRecipesTableUpdateCompanionBuilder =
    LocalRecipesCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String?> category,
      Value<String?> area,
      Value<String?> instruction,
      Value<List<String>?> ingredients,
      Value<List<String>?> measures,
      Value<String?> imagePath,
      Value<String?> videoUrl,
    });

class $$LocalRecipesTableFilterComposer
    extends Composer<_$LocalRecipesDatabase, $LocalRecipesTable> {
  $$LocalRecipesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get measures => $composableBuilder(
    column: $table.measures,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalRecipesTableOrderingComposer
    extends Composer<_$LocalRecipesDatabase, $LocalRecipesTable> {
  $$LocalRecipesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measures => $composableBuilder(
    column: $table.measures,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalRecipesTableAnnotationComposer
    extends Composer<_$LocalRecipesDatabase, $LocalRecipesTable> {
  $$LocalRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get instruction => $composableBuilder(
    column: $table.instruction,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get ingredients =>
      $composableBuilder(
        column: $table.ingredients,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>?, String> get measures =>
      $composableBuilder(column: $table.measures, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);
}

class $$LocalRecipesTableTableManager
    extends
        RootTableManager<
          _$LocalRecipesDatabase,
          $LocalRecipesTable,
          LocalRecipe,
          $$LocalRecipesTableFilterComposer,
          $$LocalRecipesTableOrderingComposer,
          $$LocalRecipesTableAnnotationComposer,
          $$LocalRecipesTableCreateCompanionBuilder,
          $$LocalRecipesTableUpdateCompanionBuilder,
          (
            LocalRecipe,
            BaseReferences<
              _$LocalRecipesDatabase,
              $LocalRecipesTable,
              LocalRecipe
            >,
          ),
          LocalRecipe,
          PrefetchHooks Function()
        > {
  $$LocalRecipesTableTableManager(
    _$LocalRecipesDatabase db,
    $LocalRecipesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String?> instruction = const Value.absent(),
                Value<List<String>?> ingredients = const Value.absent(),
                Value<List<String>?> measures = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
              }) => LocalRecipesCompanion(
                id: id,
                name: name,
                category: category,
                area: area,
                instruction: instruction,
                ingredients: ingredients,
                measures: measures,
                imagePath: imagePath,
                videoUrl: videoUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String?> instruction = const Value.absent(),
                Value<List<String>?> ingredients = const Value.absent(),
                Value<List<String>?> measures = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> videoUrl = const Value.absent(),
              }) => LocalRecipesCompanion.insert(
                id: id,
                name: name,
                category: category,
                area: area,
                instruction: instruction,
                ingredients: ingredients,
                measures: measures,
                imagePath: imagePath,
                videoUrl: videoUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalRecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalRecipesDatabase,
      $LocalRecipesTable,
      LocalRecipe,
      $$LocalRecipesTableFilterComposer,
      $$LocalRecipesTableOrderingComposer,
      $$LocalRecipesTableAnnotationComposer,
      $$LocalRecipesTableCreateCompanionBuilder,
      $$LocalRecipesTableUpdateCompanionBuilder,
      (
        LocalRecipe,
        BaseReferences<_$LocalRecipesDatabase, $LocalRecipesTable, LocalRecipe>,
      ),
      LocalRecipe,
      PrefetchHooks Function()
    >;

class $LocalRecipesDatabaseManager {
  final _$LocalRecipesDatabase _db;
  $LocalRecipesDatabaseManager(this._db);
  $$LocalRecipesTableTableManager get localRecipes =>
      $$LocalRecipesTableTableManager(_db, _db.localRecipes);
}
