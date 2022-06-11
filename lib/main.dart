import 'package:auth_cubit/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:auth_cubit/src/features/authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_)=>AuthenticationCubit(),
          child: const LoginPage(),
      ),
    );
  }
}
