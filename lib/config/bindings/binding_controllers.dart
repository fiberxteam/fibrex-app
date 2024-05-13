// ignore_for_file: unused_local_variable

import 'package:erp/config/interceptor/dio_interceptor.dart';
import 'package:erp/controller/auth/auth_controller.dart';
import 'package:erp/controller/file_controller.dart';
import 'package:erp/controller/notification/notification_controller.dart';
import 'package:erp/controller/set_data_controller.dart';
import 'package:get/get.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    DioHttp dioHttp = Get.put(DioHttp());
    SetDataController dataController = Get.put(SetDataController());
    AuthController authController = Get.put(AuthController());
    FileController fileController = Get.put(FileController());
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
