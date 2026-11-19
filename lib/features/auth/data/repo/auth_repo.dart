import 'dart:developer';

import 'package:bookia_app/core/services/dio/apis.dart';
import 'package:bookia_app/core/services/dio/dio_provider.dart';
import 'package:bookia_app/features/auth/data/models/auth_response/auth_params.dart';
import 'package:bookia_app/features/auth/data/models/auth_response/auth_response.dart';

class AuthRepo {
  Future<AuthResponse?> login(AuthParams authParams) async {
    try {
      var response = await DioProvider.postApi(
        endPoint: Apis.login,
        data: authParams.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AuthResponse?> register(AuthParams authParams) async {
    try {
      var response = await DioProvider.postApi(
        endPoint: Apis.register,
        data: authParams.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

