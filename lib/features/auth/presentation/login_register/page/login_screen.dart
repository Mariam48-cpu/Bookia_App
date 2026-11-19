import 'dart:developer';

import 'package:bookia_app/components/buttons/main_button.dart';
import 'package:bookia_app/components/custom_svg_image.dart';
import 'package:bookia_app/components/inputs/custom_password_field.dart';
import 'package:bookia_app/components/inputs/custom_text_field.dart';
import 'package:bookia_app/components/main_app_bar.dart';
import 'package:bookia_app/core/constants/app_design.dart';
import 'package:bookia_app/core/constants/app_images.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          pop(context);
          log('Login successful');
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
                    'Welcome back! Glad to see you, Again!',
                    style: TextStyles.headline1,
                  ),
                  const Gap(32),
                  CustomTextField(
                    controller: cubit.emailController,
                    hintText: 'Enter your email',
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
                    hintText: 'Enter your password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                  ),
                  const Gap(32),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                  const Gap(32),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'or',
                          style: TextStyles.body.copyWith(
                            color: LightPalette.greyColor,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const Gap(32),
                  MainButton(
                    borderColor: LightPalette.borderColor,
                    textColor: LightPalette.greyColor,
                    bgColor: LightPalette.whiteColor,
                    text: 'Login with Google',
                    icon: CustomSvgImage(path: AppImages.googleSvg),
                    onPressed: () {},
                  ),
                  const Gap(16),
                  MainButton(
                    borderColor: LightPalette.borderColor,
                    textColor: LightPalette.greyColor,
                    bgColor: LightPalette.whiteColor,
                    text: 'Login with Apple',
                    icon: CustomSvgImage(path: AppImages.appleSvg),
                    onPressed: () {},
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
              Text('Don\'t have an account? ', style: TextStyles.body),
              TextButton(
                onPressed: () {
                  pushReplacement(context, RouteNames.register);
                },
                child: Text(
                  'Sign Up',
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
