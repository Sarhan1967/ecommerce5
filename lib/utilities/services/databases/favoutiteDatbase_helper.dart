// import 'dart:async';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../../../constants.dart';
// import '../../../models/favourite_product_model .dart';
//
// class FavouriteDatbaseHelper {
//   //single tone--------
//   FavouriteDatbaseHelper._();
//
//   //instance-------------
//   static final FavouriteDatbaseHelper db = FavouriteDatbaseHelper._();
//
//   //instance from sqflite db----------
//   static Database? _database;
//
//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await initDb();
//     return _database;
//   }
//
// //when -database=null create new one(initDb)---------
//   initDb() async {
//     //path of database'FavouriteProduct.db' in the mobile---
//     String path = join(await getDatabasesPath(), 'FavouriteProduct.db');
//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
//       CREATE TABLE $tableFavouriteProduct(
//       $columnName TEXT NOT NULL,
//       $columnImage TEXT NOT NULL,
//       $columnIsFavourite BOOL NOT NULL,
//       $columnPrice TEXT NOT NULL,
//       $columnProductId TEXT NOT NULL
//       )
//        ''');
//     });
//   }
//
//   Future<List<FavouriteModel>?> getAllProduct() async {
//     //var dbClient = await (database as FutureOr<Database>);
//     var dbClient = await database;
//     //List<Map> maps = (await dbClient?.query(tableCartProduct)).cast<Map>();
//     List<Map>? maps = (await dbClient?.query(tableFavouriteProduct))?.cast<Map>();
//     //List<CartProductModel>? list = maps?.isNotEmpty as List<CartProductModel>?;
//     List<FavouriteModel>? list = maps!.isNotEmpty
//         ? maps.map((product) => FavouriteModel.fromJson(product)).toList()
//         : [];
//     return list;
//   }
//
//   insert(FavouriteModel model) async {
//     //var dbClient = await ((database as FutureOr<Database?>) as FutureOr<Database>);
//     //var dbClient = await (database as FutureOr<Database>);
//     var dbClient = await database;
//     await dbClient?.insert(tableFavouriteProduct, model.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//   updateProduct(FavouriteModel model)async{
//     //var dbClient = await ((database as FutureOr<Database?>) as FutureOr<Database>);
//     //var dbClient = await (database as FutureOr<Database>);
//     var dbClient = await database;
//     return await dbClient?.update(tableFavouriteProduct,model.toJson(),
//     where:'$columnProductId=?',whereArgs:[model.productId]);
//   }
// }
