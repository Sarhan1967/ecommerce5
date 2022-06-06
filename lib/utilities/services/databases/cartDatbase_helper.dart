import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../constants.dart';
import '../../../models/cart_product_model.dart';

class CartDatbaseHelper {
  //single tone--------
  CartDatbaseHelper._();

  //instance-------------
  static final CartDatbaseHelper db = CartDatbaseHelper._();

  //instance from sqflite db----------
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

//when -database=null create new one(initDb)---------
  initDb() async {
    //path of database'CartProduct.db' in the mobile---
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnProductId TEXT NOT NULL)''');
      print(' $tableCartProduct table created.......');


    });
  }

  Future<List<CartProductModel>?> getAllProduct() async {
    //var dbClient = await (database as FutureOr<Database>);
    var dbClient = await database;
    //List<Map> maps = (await dbClient?.query(tableCartProduct)).cast<Map>();
    List<Map>? maps = (await dbClient?.query(tableCartProduct))?.cast<Map>();
    //List<CartProductModel>? list = maps?.isNotEmpty as List<CartProductModel>?;
    List<CartProductModel>? list = maps!.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    //var dbClient = await ((database as FutureOr<Database?>) as FutureOr<Database>);
    //var dbClient = await (database as FutureOr<Database>);
    var dbClient = await database;
    await dbClient?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  updateProduct(CartProductModel model)async{
    //var dbClient = await ((database as FutureOr<Database?>) as FutureOr<Database>);
    //var dbClient = await (database as FutureOr<Database>);
    var dbClient = await database;
    return await dbClient?.update(tableCartProduct,model.toJson(),
    where:'$columnProductId=?',whereArgs:[model.productId]);
  }
}
