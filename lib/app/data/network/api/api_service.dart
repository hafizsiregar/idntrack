import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:idn_track/app/common/sources/api.dart';
import 'package:idn_track/app/data/models/class/class_response.dart';
import 'package:idn_track/app/data/models/jurnal/diniyyah/jurnal_diniyyah_response.dart';
import 'package:idn_track/app/data/models/jurnal/english/jurnal_english_response.dart';
import 'package:idn_track/app/data/models/jurnal/it/jurnal_it_response.dart';
import 'package:idn_track/app/data/models/skl/skl7_response.dart';
import 'package:idn_track/app/data/models/skl/skl8_response.dart';
import 'package:idn_track/app/data/models/skl/skl9_response.dart';
import 'package:idn_track/app/data/models/students/student_response.dart';
import 'package:idn_track/app/data/models/user/user_response.dart';
import 'package:idn_track/app/data/network/api/api_result.dart';
import 'package:idn_track/app/data/network/dio_client.dart';
import 'package:idn_track/app/data/network/dio_exception.dart';

class ApiService {
  final dioClient = DioClient(Dio());
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserResponse user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'nama': user.nama,
        'kelas': user.kelas,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserResponse> register({
    required String name,
    required String email,
    required String password,
    required String kelas,
  }) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'nama': name,
        'email': email,
        'kelas': kelas,
      });

      UserResponse userResponse = UserResponse(
        email: email,
        nama: name,
        kelas: kelas,
        id: userCredential.user!.uid,
      );
      await setUser(userResponse);
      return userResponse;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'Password terlalu lemah';
      } else if (e.code == 'email-already-in-use') {
        throw 'Akun sudah terdaftar';
      } else if (e.code == 'invalid-email') {
        throw 'Email tidak valid';
      }
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserResponse> getUserById(String id) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await _userReference.doc(id).get();
        return UserResponse(
          email: snapshot['email'],
          nama: snapshot['nama'],
          kelas: snapshot['kelas'],
          id: id,
        );
      }
      throw 'User not found';
    } catch (e) {
      rethrow;
    }
  }

  Future<UserResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserResponse user = await getUserById(userCredential.user!.uid);
      // print(user.nama ?? "nama di api service gaada");
      // print(user.kelas ?? "kelas di api service gaada");
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        throw 'Email tidak valid';
      }
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResult<List<Datasiswa>>> getDataStudent(String name) async {
    const baseUrl = API.baseURL;
    try {
      const url = '$baseUrl/datasiswa';
      final response = await dioClient.get(url);
      final dataList = response['datasiswa'] as List<dynamic>;
      final filteredData =
          dataList.where((data) => data['nama'] == name).toList();
      final result =
          filteredData.map((data) => Datasiswa.fromJson(data)).toList();
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<Datakelas>>> getDataClass(String kelas) async {
    const baseUrl = API.baseURL;
    try {
      const url = '$baseUrl/datakelas';
      final response = await dioClient.get(url);
      final dataList = response['datakelas'] as List<dynamic>;
      final filteredData =
          dataList.where((data) => data['kelas'] == kelas).toList();
      final result =
          filteredData.map((data) => Datakelas.fromJson(data)).toList();
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<Dataskl7>>> getDataSkl7(
      String kelas, String nama) async {
    const baseUrl = API.baseURL;
    try {
      String url = '$baseUrl/dataskl7';
      final response = await dioClient.get(url);
      final dataList = response['dataskl7'] as List<dynamic>;
      final filteredData = dataList
          .where((data) => data['kelas'] == kelas && data['nama'] == nama)
          .toList();
      final result =
          filteredData.map((data) => Dataskl7.fromJson(data)).toList();
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<Dataskl8>>> getDataSkl8(
      String kelas, String nama) async {
    const baseUrl = API.baseURL;
    try {
      String url = '$baseUrl/dataskl8';
      final response = await dioClient.get(url);
      final dataList = response['dataskl8'] as List<dynamic>;
      final filteredData = dataList
          .where((data) => data['kelas'] == kelas && data['nama'] == nama)
          .toList();
      final result =
          filteredData.map((data) => Dataskl8.fromJson(data)).toList();
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<Dataskl9>>> getDataSkl9(
      String kelas, String nama) async {
    const baseUrl = API.baseURL;
    try {
      String url = '$baseUrl/dataskl9';
      final response = await dioClient.get(url);
      final dataList = response['dataskl9'] as List<dynamic>;
      final filteredData = dataList
          .where((data) => data['kelas'] == kelas && data['nama'] == nama)
          .toList();
      final result =
          filteredData.map((data) => Dataskl9.fromJson(data)).toList();
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<JurnalITResponse>>> getJurnalIT(String kelas) async {
    const baseUrl = API.urlJurnalIT;
    try {
      String url = '$baseUrl/$kelas';
      final response = await dioClient.get(url);
      final dataList = response[kelas] as List<dynamic>;
      final result =
          dataList.map((data) => JurnalITResponse.fromJson(data)).toList();
      // print(dataList);
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<JurnalEnglishResponse>>> getJurnalEnglish(
      String kelas) async {
    const baseUrl = API.urlJurnalEnglish;
    try {
      String url = '$baseUrl/$kelas';
      final response = await dioClient.get(url);
      final dataList = response[kelas] as List<dynamic>;
      final result =
          dataList.map((data) => JurnalEnglishResponse.fromJson(data)).toList();
      // print(dataList);
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }

  Future<ApiResult<List<JurnalDiniyyahResponse>>> getJurnalDiniyyah(
      String kelas) async {
    const baseUrl = API.urlJurnalDiniyyah;
    try {
      String url = '$baseUrl/$kelas';
      final response = await dioClient.get(url);
      final dataList = response[kelas] as List<dynamic>;
      final result = dataList
          .map((data) => JurnalDiniyyahResponse.fromJson(data))
          .toList();
      // print(dataList);
      return ApiResult.success(result);
    } on DioException catch (e, stackTrace) {
      return ApiResult.failure(DioExceptions.fromDioError(e), stackTrace);
    }
  }
}
