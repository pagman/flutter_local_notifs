import 'package:http/http.dart' as http;
import 'Users.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
