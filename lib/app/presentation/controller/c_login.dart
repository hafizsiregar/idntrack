import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/data/models/user/user_response.dart';
import 'package:idn_track/app/data/network/api/api_service.dart';
import 'package:idn_track/app/presentation/controller/c_common.dart';

class CLogin extends GetxController {
  final ApiService apiService = ApiService();
  final cCommon = Get.put(CCommon());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  final Rx<UserResponse> _userData = UserResponse().obs;
  UserResponse get userData => _userData.value;
  set userData(UserResponse newValue) {
    _userData.value = newValue;
  }

  Future login() async {
    try {
      cCommon.isFetching = true;
      final response = await apiService.login(
        email: email.text,
        password: password.text,
      );
      cCommon.isFetching = false;
      cCommon.isSuccessfull = true;
      cCommon.message = "Login Successfull";
      _userData.value = response;
    } catch (e) {
      cCommon.isFetching = false;
      cCommon.isSuccessfull = false;
      cCommon.message = e.toString();
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserResponse userResponse = await ApiService().getUserById(id);
      cCommon.isFetching = false;
      cCommon.isSuccessfull = true;
      userData = userResponse;
    } catch (e) {
      cCommon.isFetching = true;
      cCommon.isSuccessfull = false;
      cCommon.message = e.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (user != null) {
      getCurrentUser(user!.uid);
    }
  }
}
