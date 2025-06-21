import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/core/cubit/save_userlogin/cubit.dart';
import 'package:instagram/core/cubit/save_userlogin/states.dart';
import 'package:instagram/presentation/views/register/login_screen.dart';
import 'package:instagram/presentation/views/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveUserLoginCubit(),
      child: BlocBuilder<SaveUserLoginCubit, SavedUserLoginStates>(
        builder: (context, state) {
          if (state is SplashScreenState) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/images/insta_spalsh.png')],
                ),
              ),
            );
          } else if (state is UserLoggedInState) {
            return const RegisterScreen();
          } else if (state is UserLoggedOutState) {
            return const RegisterScreen();
          } else {
            return const Scaffold(body: Center(child: Text("Unknown state")));
          }
        },
      ),
    );
  }
}
