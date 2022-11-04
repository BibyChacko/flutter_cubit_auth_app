import 'package:authentication_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:authentication_cubit/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>AuthenticationCubit()),
     ],
      child: MaterialApp(
          title: 'Authy',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage()
      ),
    );
  }
}