import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/domain/model/user_model.dart';
import 'package:tdd/domain/services/user_service.dart';

void main() {
  
  group("USER MODELS TEST\n\n", () {
    test("should return failure when user not input data properly", () async {
      UserModel userModel = const UserModel(
          id: 1,
          name: "Flutter",
          username: "kjhkasd",
          email: "asdkhasd@gmail.com",
          address: Address(
            city: "Tashkent",
            street: "Asdlkjalskd",
            suite: "asodijhalsd",
            zipcode: "123123",
            geo: Geo(lat: "816723123", lng: "-123123123123"),
          ),
          company: Company(
              bs: "asdaksda", catchPhrase: "asdkajhsda", name: "Company"),
          phone: "998991112211",
          website: "www.uz");

      UserService userService = UserService();
      Either<String, String> response =
          await userService.signUp(userModel.toMap());
      
      expect(response.isRight(), true);
    });
  });
}
