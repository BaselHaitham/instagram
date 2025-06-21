abstract class AuthStates {}

class AuthInitialState extends AuthStates {
  final bool isLoggedIn;
  AuthInitialState(this.isLoggedIn);
}

class AuthLoginLoadingState extends AuthStates {}

class AuthLoginSuccessState extends AuthStates {}

class AuthLoginErrorState extends AuthStates {
  final String error;
  AuthLoginErrorState(this.error);
}

class AuthRegisterLoadingState extends AuthStates {}

class AuthRegisterSuccessState extends AuthStates {}

class AuthRegisterErrorState extends AuthStates {
  final String error;
  AuthRegisterErrorState(this.error);
}
