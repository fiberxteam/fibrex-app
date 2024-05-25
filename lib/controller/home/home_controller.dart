import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/models/user_model.dart';
import 'package:get/get.dart';

import '../../main.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool loadUser = false.obs;
  Rx<ServiceModel> serviceInfo = ServiceModel().obs;
  Rx<UserModel> userInfo = UserModel().obs;

  getServiceInfo() async {
    var token = prefs.getString('token');

    if (token != null) {
      isLoading.value = true;
      final response = await SasClient.get(api: '/api/service');
      serviceInfo.value = serviceModelFromJson(jsonEncode(response["data"]));
      isLoading.value = false;
    }
  }

  getUserInfo() async {
    var token = prefs.getString('token');

    if (token != null) {
      loadUser.value = true;
      final response = await SasClient.get(api: '/api/user');
      userInfo.value = userModelFromJson(jsonEncode(response["data"]));
      loadUser.value = false;
    }
  }

  @override
  void onInit() {
    getServiceInfo();
    getUserInfo();
    super.onInit();
  }
}
