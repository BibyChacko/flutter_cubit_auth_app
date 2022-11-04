import 'package:authentication_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
          child: _buildLoginForm(context) // Build UI according to states
      ),
    );
  }

  _buildLoginForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _userNameController,
              ),
              TextFormField(
                controller: _passwordController,
              ),
             BlocBuilder<AuthenticationCubit,AuthenticationState>(
               builder: (context,state){
                 if(state is AuthenticationLoading){
                   return Center(child: CircularProgressIndicator());
                 }
                 return  ElevatedButton(onPressed: () {
                   context.read<AuthenticationCubit>().login(
                       _userNameController.text.trim(), _passwordController.text
                   );
                 }, child: Text("Login")
                 );
               },

             )
            ],
          ),
        ),
      ),
    );
  }
}
