import 'dart:convert';

import 'package:fiber/client/base_client.dart';
import 'package:fiber/models/news_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<NewsModel> news = RxList();

  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};

    var data = await BaseClient.get(api: "/AllNews", queryParameters: query);

    if (data != null && data.isNotEmpty) {
      try {
        // Assuming the API returns a JSON response with the key "data"
        news.value = newsModelFromJson(json.encode(data));
      } catch (e) {
        print("Error parsing news data: $e");
      }
    } else {
      print("No data received from API.");
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
