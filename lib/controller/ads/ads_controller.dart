import 'dart:convert';
import 'package:fiber/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../client/base_client.dart';

class AdsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<AdsModel> ads = RxList();

  // Fetch data from the API
  getData() async {
    isLoading.value = true;
    var query = {"pageSize": "10", "pageNumber": "1"};

    try {
      var data = await BaseClient.get(api: "/get-ads", queryParameters: query);

      if (data != null) {
        ads.value = adsModelFromJson(jsonEncode(data));
      }
    } catch (e) {
      // Handle the error (show message, etc.)
      print("Error fetching ads: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData(); // Fetch ads data when the controller is initialized
  }
}
