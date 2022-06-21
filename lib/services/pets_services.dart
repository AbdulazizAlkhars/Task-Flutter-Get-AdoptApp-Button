import 'package:dio/dio.dart';

import '../models/pet.dart';

class PetsServices {
  final _dio = Dio();
  List<Pet> pets = [];
  Future<List<Pet>> getPetsService() async {
    var res = await _dio.get("https://coded-pets-api-crud.herokuapp.com/pets");
    try {
      pets = (res.data as List).map((e) => Pet.fromJson(e)).toList();
    } on DioError catch (error) {
      print("Network Error");
    }
    return pets;
  }
}
