import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tdd/domain/model/user_model.dart';

class UserDBService {
  Box<UserModel>? _userDB;
  Box<UserModel>? get userDB => _userDB;

  Future<bool> boxIsEmpty() async {
    await _openBox();
    if (_userDB!.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static void registerAdapters() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }

  Future<void> _openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    _userDB = await Hive.openBox<UserModel>("users");
  }

  Future<void> writeToBox(List<UserModel> users) async {
    await _openBox();
    await _userDB!.clear();
    await _userDB!.addAll(users);
  }

  Future<List<UserModel>> getUsers() async {
    try {
      await _openBox();
      return _userDB!.values.toList();
    } on HiveError {
      rethrow;
    }
  }
}
