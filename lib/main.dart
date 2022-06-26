import 'package:adopt_app/pages/addpet.dart';
import 'package:adopt_app/pages/adduser.dart';
import 'package:adopt_app/pages/home_page.dart';
import 'package:adopt_app/pages/signin.dart';
import 'package:adopt_app/providers/authprovider.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider()),
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/w',
        builder: (context, state) => const AddPet(),
      ),
      GoRoute(
        path: '/user',
        builder: (context, state) => const AddUser(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignIn(),
      ),
    ],
  );
}
