import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'states.dart'; // Your custom state classes

class SaveUserLoginCubit extends Cubit<SavedUserLoginStates> {
  SaveUserLoginCubit() : super(SplashScreenState()) {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    emit(SplashScreenState());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      emit(UserLoggedInState());
    } else {
      emit(UserLoggedOutState());
    }
  }
}
