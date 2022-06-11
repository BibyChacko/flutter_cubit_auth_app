import 'package:auth_cubit/src/features/authentication/cubit/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> login(String username, String password) async {
      emit(AuthenticationLoading());
      bool status = await AuthenticationRepository().login(username, password);
      if(status){
        emit(AuthenticationSuccess());
      }else{
        emit(AuthenticationError());
      }
  }

}
