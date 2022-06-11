import 'package:auth_cubit/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:auth_cubit/src/features/user_dashboard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationSuccess) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const HomePage()));
                  }
                  else if (state is AuthenticationError) {
                    Fluttertoast.showToast(
                        msg: "Invalid credentials",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              builder: (context, state) {
                  return Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(labelText: "Username"),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: "Password"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthenticationCubit>().login(
                                  _usernameController.text,
                                  _passwordController.text);
                            },
                            child: Text("Login"))
                      ],
                    ),
                  );
                }

            ),
          ),
        ),
    );
  }
}
