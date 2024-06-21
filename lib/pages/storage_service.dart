import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';

class StorageService {
  Future<List<User>> readUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final String? usersJson = prefs.getString('users');
    if (usersJson != null) {
      List<dynamic> usersList = json.decode(usersJson);
      return usersList.map((user) => User.fromJson(user)).toList();
    }
    return [];
  }

  Future<void> writeUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final String usersJson =
        json.encode(users.map((user) => user.toJson()).toList());
    await prefs.setString('users', usersJson);
  }

  Future<void> updateUser(User user) async {
    List<User> users = await readUsers();
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == user.username) {
        users[i] = user;
        break;
      }
    }
    await writeUsers(users);
  }
}
