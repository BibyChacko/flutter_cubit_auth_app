import 'dart:convert';

import 'package:authentication_cubit/src/constants/storage_keys.dart';
import 'package:authentication_cubit/src/cubit/authentication/authentication_repository.dart';
import 'package:authentication_cubit/src/helpers/storage_helper.dart';
import 'package:authentication_cubit/src/models/user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _repository =
      AuthenticationRepository(); // private
  AuthenticationCubit() : super(AuthenticationInitial());

  login(String username, String password) async {
    // We are going to start the authentication procedure
    emit(AuthenticationLoading()); // emit() the states
    try {
      List<UserData> userList =
          await _repository.readUserDataFile(); // biby@gmail.com --12345
      UserData loggedUserData = userList.firstWhere((element) =>
          element.email == username && element.password == password);
      await Future.delayed(Duration(seconds: 15));
      if (loggedUserData != null) {
        StorageHelper.writeData(StorageKey.userData.name,
            jsonEncode(loggedUserData.toJson())); // Instance of UserData
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailure());
      }
    } catch (ex) {
      emit(AuthenticationFailure());
    }
  }
}
