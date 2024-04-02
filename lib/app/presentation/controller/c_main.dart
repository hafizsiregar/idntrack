import 'package:get/get.dart';
import 'package:idn_track/app/data/models/class/class_response.dart';
import 'package:idn_track/app/data/models/jurnal/diniyyah/jurnal_diniyyah_response.dart';
import 'package:idn_track/app/data/models/jurnal/english/jurnal_english_response.dart';
import 'package:idn_track/app/data/models/jurnal/it/jurnal_it_response.dart';
import 'package:idn_track/app/data/models/skl/skl7_response.dart';
import 'package:idn_track/app/data/models/skl/skl8_response.dart';
import 'package:idn_track/app/data/models/skl/skl9_response.dart';
import 'package:idn_track/app/data/models/students/student_response.dart';
import 'package:idn_track/app/data/network/api/api_service.dart';
import 'package:idn_track/app/presentation/controller/c_common.dart';

class CMain extends CCommon {
  final ApiService apiService = ApiService();

  final RxList<Datasiswa> _listDataSiswa = <Datasiswa>[].obs;
  List<Datasiswa> get listDataSiswa => _listDataSiswa;
  set listDataSiswa(List<Datasiswa> newValue) {
    _listDataSiswa.value = newValue;
  }

  final RxList<Datakelas> _listDataKelas = <Datakelas>[].obs;
  List<Datakelas> get listDataKelas => _listDataKelas;
  set listDataKelas(List<Datakelas> newValue) {
    _listDataKelas.value = newValue;
  }

  final RxList<Dataskl7> _listDataSkl7 = <Dataskl7>[].obs;
  List<Dataskl7> get listDataSkl7 => _listDataSkl7;
  set listDataSkl7(List<Dataskl7> newValue) {
    _listDataSkl7.value = newValue;
  }

  final RxList<Dataskl8> _listDataSkl8 = <Dataskl8>[].obs;
  List<Dataskl8> get listDataSkl8 => _listDataSkl8;
  set listDataSkl8(List<Dataskl8> newValue) {
    _listDataSkl8.value = newValue;
  }

  final RxList<Dataskl9> _listDataSkl9 = <Dataskl9>[].obs;
  List<Dataskl9> get listDataSkl9 => _listDataSkl9;
  set listDataSkl9(List<Dataskl9> newValue) {
    _listDataSkl9.value = newValue;
  }

  final RxList<JurnalITResponse> _jurnalIT = <JurnalITResponse>[].obs;
  List<JurnalITResponse> get jurnalIT => _jurnalIT;
  set jurnalIT(List<JurnalITResponse> newValue) {
    _jurnalIT.value = newValue;
  }

  final RxList<JurnalEnglishResponse> _jurnalEnglish =
      <JurnalEnglishResponse>[].obs;
  List<JurnalEnglishResponse> get jurnalEnglish => _jurnalEnglish;
  set jurnalEnglish(List<JurnalEnglishResponse> newValue) {
    _jurnalEnglish.value = newValue;
  }

  final RxList<JurnalDiniyyahResponse> _jurnalDiniyah =
      <JurnalDiniyyahResponse>[].obs;
  List<JurnalDiniyyahResponse> get jurnalDiniyah => _jurnalDiniyah;
  set jurnalDiniyah(List<JurnalDiniyyahResponse> newValue) {
    _jurnalDiniyah.value = newValue;
  }

  Future getDataStudent(String name) async {
    isFetching = true;
    final response = await apiService.getDataStudent(name);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _listDataSiswa.value = data;
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getDataClass(String kelas) async {
    isFetching = true;
    final response = await apiService.getDataClass(kelas);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _listDataKelas.value = data;
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getDataSkl7(String kelas, String nama) async {
    isFetching = true;
    final response = await apiService.getDataSkl7(kelas, nama);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _listDataSkl7.value = data;
        print(_listDataSkl7.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getDataSkl8(String kelas, String nama) async {
    isFetching = true;
    final response = await apiService.getDataSkl8(kelas, nama);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _listDataSkl8.value = data;
        print(_listDataSkl8.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getDataSkl9(String kelas, String nama) async {
    isFetching = true;
    final response = await apiService.getDataSkl9(kelas, nama);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _listDataSkl9.value = data;
        print(_listDataSkl9.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getJurnalIT(String kelas) async {
    isFetching = true;
    final response = await apiService.getJurnalIT(kelas);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _jurnalIT.value = data;
        print(_jurnalIT.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getJurnalEnglish(String kelas) async {
    isFetching = true;
    final response = await apiService.getJurnalEnglish(kelas);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _jurnalEnglish.value = data;
        print(_jurnalEnglish.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }

  Future getJurnalDiniyah(String kelas) async {
    isFetching = true;
    final response = await apiService.getJurnalDiniyyah(kelas);
    response.when(
      success: (data) {
        isSuccessfull = true;
        isFetching = false;
        _jurnalDiniyah.value = data;
        print(_jurnalDiniyah.last.toJson());
      },
      failure: (error, stackTrace) {
        isSuccessfull = true;
        isFetching = false;
        message = error.message;
      },
    );
  }
}
