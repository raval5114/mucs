import 'package:mucs/Data/model/data.dart';

class SiginRepo {
  Future<bool> sigin(String email, String password) async {
    try {
      // Simulate network/database delay
      await Future.delayed(Duration(seconds: 1));

      // Check credentials
      final matchedUser = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      // If user found, return true
      return matchedUser.isNotEmpty;
    } catch (e) {
      print('Sign-in error: $e');
      return false;
    }
  }
}
