class AuthenticationRepository{

  Future<bool> login(String username,String password) async {
    await Future.delayed(const Duration(seconds: 10));// D
    if(username == "biby" && password == "12345"){
      return true;
    }
    return false;
  }
}