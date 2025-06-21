import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  bool isLoggedIn;

  AuthCubit({this.isLoggedIn = false}) : super(AuthInitialState(isLoggedIn));

  Future<bool> login(String email, String password) async {
    emit(AuthLoginLoadingState());
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      isLoggedIn = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.loginkey, isLoggedIn);

      emit(AuthLoginSuccessState());
      return true;
    } catch (e) {
      emit(AuthLoginErrorState(e.toString()));
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    emit(AuthRegisterLoadingState());
    try {
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      isLoggedIn = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.loginkey, isLoggedIn);

      emit(AuthRegisterSuccessState());
      return true;
    } catch (e) {
      emit(AuthRegisterErrorState(e.toString()));
      return false;
    }
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool(AppConstants.loginkey) ?? false;
    emit(AuthInitialState(isLoggedIn));
  }

  Future<void> logout() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut();
    isLoggedIn = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.loginkey, false);

    emit(AuthInitialState(false));
  }
}
