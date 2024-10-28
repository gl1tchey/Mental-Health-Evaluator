import 'package:mongo_dart/mongo_dart.dart';
import 'package:mentalapp/services/constant.dart';
import 'package:mentalapp/services/mongodb.dart';

class UserService {
  Future<void> insertUser({
    required String email,
    required String password,
    required String fullName,
    required String address,
    required String sex,
    required int score,
  }) async {
    final userData = {
      'email': email,
      'password': password, 
      'fullName': fullName,
      'address': address,
      'sex': sex,
      'score': score,
    };

    try {
      await MongoDatabase.connect();

      // Insert the user data into the collection
      await MongoDatabase.user_collection.insertOne(userData);
      print('User inserted successfully');
    } catch (e) {
      print('Error inserting user: $e');
    }
  }
}
