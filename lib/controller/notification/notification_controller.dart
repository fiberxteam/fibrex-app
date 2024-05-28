import 'package:fiber/client/base_client.dart';
import 'package:fiber/config/constant.dart';

import 'package:fiber/models/notification_model.dart';

class NotificationController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<NotificationModel> notifications = RxList();

  getNotifications({String? title, int? page = 1, int? limit = 10}) async {
    isLoading.value = true;
    // var response =

    await BaseClient.get(
      api: '/notifications',
      queryParameters: {
        'pageNumber': page,
        'pageSize': limit,
      },
    );
    // notifications.value = NotificationModel.fromJson(response);
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getNotifications();
    super.onInit();
  }
}
