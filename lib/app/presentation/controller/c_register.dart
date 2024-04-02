import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/data/models/user/user_response.dart';
import 'package:idn_track/app/data/network/api/api_service.dart';
import 'package:idn_track/app/presentation/controller/c_common.dart';

class CRegister extends GetxController {
  final ApiService apiService = ApiService();
  final cCommon = Get.put(CCommon());

  UserResponse? userResponse;

  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController kelas = TextEditingController();

  Future register() async {
    try {
      cCommon.isFetching = true;
      final response = await apiService.register(
        email: email.text,
        password: password.text,
        name: nama.text,
        kelas: kelas.text,
      );
      cCommon.isFetching = false;
      cCommon.isSuccessfull = true;
      cCommon.message = "Register Successfull";
      userResponse = response;
    } catch (e) {
      cCommon.isFetching = false;
      cCommon.isSuccessfull = false;
      cCommon.message = e.toString();
    }
  }
}
