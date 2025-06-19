import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  bool isLoggedIn;

  AuthCubit(this.isLoggedIn) : super(AuthInitialState());

  void login(String email, String password) async {
    emit(AuthLoginLoadingState());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      isLoggedIn = true;
      prefs.setBool(AppConstants.loginkey, isLoggedIn);
      emit(AuthLoginSuccessState());
    } catch (e) {
      emit(AuthLoginErrorState(e.toString()));
    }
  }

  void register(String email, String password) async {
    emit(AuthRegisterLoadingState());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoggedIn = true;
      prefs.setBool(AppConstants.loginkey, isLoggedIn);

      emit(AuthRegisterSuccessState());
    } catch (e) {
      emit(AuthRegisterErrorState(e.toString()));
    }
  }
}
