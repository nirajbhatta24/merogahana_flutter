import 'package:mero_gahana/app/network_connectivity.dart';
import 'package:mero_gahana/data_storage/local_data_storage/user_data_source.dart';
import 'package:mero_gahana/data_storage/remote_data_source/user_data_source.dart';
import 'package:mero_gahana/models/user.dart';
import 'dart:io';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<int> addUser(File? file, User user);
  Future<bool> loginUser(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(File? file, User user) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().addUser(file, user);
    } else {
      return UserDataSource().addUser(file, user);
    }
  // return UserRemoteDataSource().addUser(file, user);
  }

  @override
  Future<List<User>> getUsers() async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserDataSource().getUsers();
    } else {
      // Get from local database , for now send empty is there is no internet
      return [];
    }
  }

  @override
  Future<bool> loginUser(String username, String password) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().loginUser(username, password);
    } else {
      return UserDataSource().loginUser(username, password);
    }
  }
  //  return UserRemoteDataSource().loginUser(username, password);
// }
}