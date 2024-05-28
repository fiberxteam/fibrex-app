import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/models/invoice_model.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/models/user_model.dart';
import 'package:get/get.dart';

import '../../client/encrypt.dart';
import '../../main.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool loadUser = false.obs;
  RxBool loadInvoice = false.obs;
  Rx<ServiceModel> serviceInfo = ServiceModel().obs;
  Rx<UserModel> userInfo = UserModel().obs;
  RxList<InvoiceModel> invoiceList = <InvoiceModel>[].obs;

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

  getInvoiceList() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadInvoice.value = true;
      var data = {"page": 1, "count": 10, "sortBy": "id", "direction": "desc"};

      final passphrase = 'abcdefghijuklmno0123456789012345';

      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/index/invoice',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        print(response.item2["data"]);
        invoiceList.value =
            invoiceModelFromJson(jsonEncode(response.item2["data"]));
      }
      loadInvoice.value = false;
    }
  }

  @override
  void onInit() {
    getServiceInfo();
    getUserInfo();
    super.onInit();
  }
}
