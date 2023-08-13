import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tdd/domain/model/user_model.dart';

class UserService {
  Future<Either<String, String>> signUp(Map<String, dynamic> userModel) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return right("YOU REGISTERED SUCCESSFULLY!");
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }

  Future<Either<String, List<UserModel>>> getUsers() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200) {
        var res = (response.data as List)
            .map((e) => UserModel.fromJson(jsonEncode(e)))
            .toList();
        return right((res));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }
}
