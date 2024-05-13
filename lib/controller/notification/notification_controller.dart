import 'package:erp/client/base_client.dart';
import 'package:erp/config/constant.dart';

class NotificationController extends GetxController {
  RxBool isLoading = false.obs;
  // Rx<NotificationModel> notifications = NotificationModel().obs;

  Future<void> getNotifications({String? title, int? page, int? limit}) async {
    isLoading.value = true;
    // var response =
    
     await BaseClient.get(
      api: '/notification',
      queryParameters: {
        'pageNumber': page,
        'pageSize': limit,
      },
    );
    // notifications.value = NotificationModel.fromJson(response);
    isLoading.value = false;
  }

}
