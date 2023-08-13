import 'package:dartz/dartz.dart';
import 'package:tdd/domain/db/user_db_service.dart';
import 'package:tdd/domain/model/user_model.dart';
import 'package:tdd/domain/services/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();
  final UserDBService _userDbService = UserDBService();

  Future<Either<String, List<UserModel>>> getUsers() async {
    var response = await _userService.getUsers();
    return response.fold((err) => left(err), (users) async {
      await _userDbService.writeToBox(users);
      return right(users);
    });
  }

  Future<Either<String, List<UserModel>>> getUsersFromDB() async {
    if (await _userDbService.boxIsEmpty()) {
      return left("HOZIRCHA USERLAR YO'Q");
    } else {
      return right(await _userDbService.getUsers());
    }
  }

  Future<Either<String, List<UserModel>>> getUsersFromRemote() async {
    var response = await _userService.getUsers();
    return response.fold((err) => left(err), (users) => right(users));
  }
}
