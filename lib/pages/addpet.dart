import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import '../models/pet.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addName = TextEditingController();
    var addImage = TextEditingController();
    var addAge = TextEditingController();
    var addGender = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Pet"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: addName,
            // style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //       controller: addImage,
        //       // style: const TextStyle(fontSize: 12),
        //       decoration: InputDecoration(
        //         hintText: 'Add Image Path',
        //       )),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: addAge,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Age',
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: addGender,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Gender',
              )),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<PetsProvider>().addPetsProviders(Pet(
                  name: addName.text,
                  image:
                      "https://i.cbc.ca/1.5077459.1553886010!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/pets.jpg",
                  age: int.parse(addAge.text),
                  gender: addGender.text));
              context.pop();
            },
            child: const Text("Add New Pet"),
            style: ElevatedButton.styleFrom())
      ]),
    );
  }
}
