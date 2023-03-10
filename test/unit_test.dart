import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mero_gahana/data_storage/remote_data_source/product_data_source.dart';
import 'package:mero_gahana/data_storage/remote_data_source/user_data_source.dart';
import 'package:mero_gahana/models/user.dart';


void main() {
  test('User should be able to login', () async {
    bool expectedResult = true;
    String username = "bibeka";
    String password = "password";
    bool actualResult =
        await UserRemoteDataSource().loginUser(username, password);
    expect(actualResult, expectedResult);
  });
 test('User should be able to register', () async {
  int expectedResult = 1;
  File file= File("assets/images/splashlogo.png");
  User user = User(
    fname: 'Renu',
    lname: 'Joshi',
    username: 'renu',
    password: 'password',
  );

  int actualResult = await UserRemoteDataSource().addUser(file, user);
  expect(actualResult, expectedResult);
});


}