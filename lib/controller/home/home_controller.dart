import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/models/service_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<ServiceModel> serviceInfo = ServiceModel().obs;

  getServiceInfo() async {
    isLoading.value = true;
    final response = await SasClient.get(api: '/api/service');
    serviceInfo.value = serviceModelFromJson(jsonEncode(response["data"]));
    isLoading.value = false;
  }

  @override
  void onInit() {
    getServiceInfo();
    super.onInit();
  }
}
