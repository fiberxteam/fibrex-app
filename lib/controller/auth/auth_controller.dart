import 'dart:convert';
import 'package:fiber/client/sas_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/main.dart';
import 'package:fiber/view/auth/login_page.dart';
import 'package:tuple/tuple.dart';

import '../../client/encrypt.dart';
import '../../view/navigation/navigation_page.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isShow = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<Tuple2<bool, dynamic>> login(
      {required String email, required String password}) async {
    isLoading.value = true;
    var data = {"username": email, "password": password, "language": "en"};

    final passphrase = 'abcdefghijuklmno0123456789012345';

    final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

    Tuple2<bool, dynamic> response = await SasClient.post(
      api: '/api/auth/login',
      data: {
        "payload": encryptedData,
      },
    );

    print(response.item2);
    if (response.item1) {
      prefs.setString('token', response.item2['token']);
      Get.offAll(() => NavigationPage(), transition: Transition.fadeIn);
    }
    isLoading.value = false;
    return response;
  }

  autoLogin() async {
    var request = await SasClient.get(api: '/api/auth/autoLogin');
    prefs.setString("token", request["token"]);
    Get.offAll(() => NavigationPage(), transition: Transition.fadeIn);
  }

  Future logout() async {
    prefs.remove('token');
    prefs.remove('role');
    SetDataController dataController = Get.find();
    dataController.page.value = 0;
    Get.offAll(() => const LoginPage(), transition: Transition.fadeIn);
  }
}
