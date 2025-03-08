import 'dart:convert';
import 'package:fiber/client/base_client.dart';
import 'package:fiber/models/questions_model.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  RxBool isLoading = false.obs;

  // Update the type to RxList<Datum> since we're dealing with a list of questions
  RxList<Datum> questions = RxList<Datum>();

  // Fetch data
  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};

    try {
      // Assuming BaseClient.get() returns a valid response (a Map)
      var data = await BaseClient.get(api: "/Questions", queryParameters: query);

      // Check if data is not null, and parse it correctly
      if (data != null) {
        // Parse the data as QuestionsModel, then extract 'data' (List<Datum>)
        QuestionsModel questionsModel = questionsModelFromJson(json.encode(data));
        questions.value = questionsModel.data;  // Extract the list of 'Datum' items
      }
    } catch (e) {
      print("Error fetching data: $e");
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    // Fetch the data when the controller is initialized
    getData();
    super.onInit();
  }
}
