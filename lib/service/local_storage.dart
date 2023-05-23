import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  ///Use this to [saveToken] to local storage
  static saveToken(String tokenValue) {
    return GetStorage().write("token", tokenValue);
  }

  ///Use this to [getToken] to local storage
  static getToken() {
    return GetStorage().read("token");
  }

  ///Use this to [deleteToken] to local storage
  deleteToken() {
    return GetStorage().remove("token");
  }

  ///Use this to [saveUsername] to local storage
  static saveUsername(String userName) {
    return GetStorage().write('name', userName);
  }

  ///Use this to [getUsername] to local storage
  static getUsername() {
    return GetStorage().read('name');
  }
}
