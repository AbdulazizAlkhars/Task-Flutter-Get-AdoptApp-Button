import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [
    Pet(
        name: "Lucifurr",
        image: "https://i.ibb.co/P6VJ4pZ/smile-cat-1.png",
        age: 2,
        gender: "male")
  ];

  void getPetsProviders() async {
    pets = await PetsServices().getPetsService();
    notifyListeners();
  }

  void addPetsProviders(Pet pet) async {
    pets = await PetsServices().addPetsService(
      pet
    );
    notifyListeners();
  }
}
