import 'package:erp/client/base_client.dart';
import 'package:erp/config/constant.dart';
import 'package:erp/controller/set_data_controller.dart';
import 'package:erp/main.dart';
import 'package:erp/view/auth/login_page.dart';
import 'package:erp/view/home/home_page.dart';
import 'package:tuple/tuple.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isShow = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<Tuple2<bool, dynamic>> login(
      {required String email, required String password}) async {
    isLoading.value = true;
    Tuple2<bool, dynamic> response = await BaseClient.post(
      api: '/login',
      data: {
        "email": email,
        "password": password,
      },
    );
    if (response.item1) {
      Get.offAll(() => const HomePage(),
          transition: Transition.fadeIn);
    }
    isLoading.value = false;
    return response;
  }

  Future logout() async {
    prefs.remove('token');
    prefs.remove('role');
    SetDataController dataController = Get.find();
    dataController.page.value = 0;
    Get.offAll(() => const LoginPage(), transition: Transition.fadeIn);
  }
}
