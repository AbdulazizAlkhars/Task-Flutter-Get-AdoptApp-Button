import 'package:adopt_app/models/user.dart';
import 'package:dio/dio.dart';

class AuthServices {
  final _dio = Dio();

  Future<void> signup(User user) async {
    late String token;
    try {
      Response res = await _dio.post(
          "https://coded-pets-api-auth.herokuapp.com/signup",
          data: user.toJson());
      print(res.data["token"]);
    } on DioError catch (error) {
      print("error");
    }
  }
}
