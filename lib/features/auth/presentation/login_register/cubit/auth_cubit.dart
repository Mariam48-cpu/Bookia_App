import 'package:bookia_app/features/auth/data/models/auth_response/auth_params.dart';
import 'package:bookia_app/features/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/features/auth/presentation/login_register/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();

  void login() async {
    emit(AuthLoading());
    var response = await AuthRepo().login(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(response?.message ?? "Login failed"));
    }
  }

  void register() async {
    emit(AuthLoading());
    var response = await AuthRepo().register(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmController.text,
        name: nameController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(response?.message ?? "Register failed"));
    }
  }
}
