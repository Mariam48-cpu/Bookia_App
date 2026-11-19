import 'dart:developer';

import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/inputs/custom_password_field.dart';
import 'package:bookia_app/components/inputs/custom_text_field.dart';
import 'package:bookia_app/components/main_app_bar.dart';
import 'package:bookia_app/core/constants/app_design.dart';
import 'package:bookia_app/core/functions/toast.dart';
import 'package:bookia_app/core/routes/naviagtions.dart';
import 'package:bookia_app/core/routes/route_names.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:bookia_app/features/auth/presentation/login_register/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/login_register/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          pop(context);
          log('Register successful');
        } else if (state is AuthError) {
          pop(context);
          showMyToast(context, state.message, isError: true);
        }
        if (state is AuthLoading) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: MainAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(AppDesign.contentPadding),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Text(
                    'Hello! Register to get started',
                    style: TextStyles.headline1,
                  ),
                  const Gap(32),
                  CustomTextField(
                    controller: cubit.nameController,
                    hintText: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    controller: cubit.emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomPasswordField(
                    controller: cubit.passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomPasswordField(
                    controller: cubit.passwordConfirmController,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const Gap(32),
                  MainButton(
                    text: 'Register',
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                  ),
                  const Gap(32),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppDesign.contentPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? ', style: TextStyles.body),
              TextButton(
                onPressed: () {
                  pushReplacement(context, RouteNames.login);
                },
                child: Text(
                  'Login',
                  style: TextStyles.body.copyWith(
                    color: LightPalette.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
