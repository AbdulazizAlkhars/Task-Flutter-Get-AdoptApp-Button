import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/providers/authprovider.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Consumer<UserProvider>(
              builder: (context, auth, child) => auth.isAuth
                  ? ListView(
                      children: [
                        ListTile(
                          title: Text("Hello ${auth.user?.username}"),
                          trailing: Icon(Icons.logout),
                          onTap: () {
                            auth.logOut();
                          },
                        ),
                      ],
                    )
                  : ListView(
                      children: [
                        ListTile(
                          title: Text("SignUp"),
                          trailing: Icon(Icons.login),
                          onTap: () {
                            context.push('/user');
                          },
                        ),
                        ListTile(
                          title: Text("SignIn"),
                          trailing: Icon(Icons.how_to_reg),
                          onTap: () {
                            context.push('/signin');
                          },
                        ),
                      ],
                    ))),
      appBar: AppBar(
        title: const Text("Pet Adopt"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       context.read<PetsProvider>().getPetsProviders();
            //     },
            //     child: const Padding(
            //       padding: EdgeInsets.all(12.0),
            //       child: Text("Get All pets"),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context.push("/w");
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Pet"),
                ),
              ),
            ),
            FutureBuilder(
                future: context.read<PetsProvider>().getPetsProvidersonOpen(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Network Error");
                  } else {
                    List<Pet> pets =
                        Provider.of<PetsProvider>(context, listen: true).pets;
                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height),
                        ),
                        physics:
                            const NeverScrollableScrollPhysics(), // <- Here
                        itemCount: pets.length,
                        itemBuilder: (context, index) =>
                            PetCard(pet: pets[index]));
                  }
                })),
          ],
        ),
      ),
    );
  }
}
