import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/core/cubit/auth/auth_cubit.dart';
import 'package:instagram/core/cubit/auth/auth_states.dart';

class SplashScreen extends StatelessWidget {
  final bool isloggedin;
  const SplashScreen({super.key, required this.isloggedin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(isloggedin),
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (BuildContext context, AuthStates state) {},
      ),
    );
  }
}
