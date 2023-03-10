import 'dart:io';

import 'package:mero_gahana/helper/objectbox.dart';
import 'package:mero_gahana/models/user.dart';
import 'package:mero_gahana/state/objectbox_state.dart';

class UserDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  //OR
  ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(File? file, User user) async {
    try {
      return objectBoxInstance.addUser(user);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<User>> getUsers() {
    try {
      return Future.value(objectBoxInstance.getAllUser());
    } catch (e) {
      throw Exception('Error in getting all Users');
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      if (objectBoxInstance.loginUser(username, password) != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error occured : ${e.toString()}');
    }
  }
}

