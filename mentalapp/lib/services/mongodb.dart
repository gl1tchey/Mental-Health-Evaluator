import 'dart:developer';

import 'package:mentalapp/services/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, user_collection;
  static connect() async {
    db = Db.create(MONGO_CONNECTION_URL);
    await db.open();
    inspect(db);
    user_collection = db.collection(USER_COLLECTION);
  }
}