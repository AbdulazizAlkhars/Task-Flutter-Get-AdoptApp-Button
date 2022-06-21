import 'package:dio/dio.dart';

class PetsServices {
  final _dio = Dio();

  void getPetsService() async {
    var res = await _dio.get("https://coded-pets-api-crud.herokuapp.com/pets");
    print(res);
  }
}
