import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/models/invoice_model.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/models/dashboard_model.dart';

import 'package:fiber/models/user_model.dart';
import 'package:fiber/models/zaincash_model.dart';
import 'package:fiber/view/home/components/zain_cash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../client/encrypt.dart';
import '../../main.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool loadUser = false.obs;
  RxBool loadZainCash = false.obs;
  RxBool loadMasterCard = false.obs;
  RxBool loadInvoice = false.obs;
  Rx<ServiceModel> serviceInfo = ServiceModel().obs;
  Rx<UserModel> userInfo = UserModel().obs;
  Rx<ZainCash> zainCash = ZainCash(status: 0, data: "").obs;  // Initialize with default values
  RxList<InvoiceModel> invoiceList = <InvoiceModel>[].obs;
  RxBool activePinLoading = false.obs;
  RxBool redeemLoading = false.obs;
  RxBool activeWithoutReedemLoading = false.obs;
  RxBool activeZainCashLoading = false.obs;
  Rx<DashboardModel> dashboardModel = DashboardModel().obs;

  // Fetching Service Info
  getServiceInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      isLoading.value = true;
      final response = await SasClient.get(api: '/api/service');
      serviceInfo.value = serviceModelFromJson(jsonEncode(response["data"]));
      isLoading.value = false;
    }
  }

  // Fetching User Info
  getUserInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadUser.value = true;
      final response = await SasClient.get(api: '/api/user');
      userInfo.value = userModelFromJson(jsonEncode(response["data"]));
      loadUser.value = false;
    }
  }


  //Fetch MasterCart Url
  getUrlMasterCard() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadMasterCard.value = true;

      // Fetch the ZainCash URL
      final response = await SasClient.get(api: '/api/user/payment/request/zaincash');
      if (response != null) {
        var data = response["data"]; // This should be the URL string

        if (data != null) {
          activeZainCashLoading.value = false;
          // Successfully parse the ZainCash data
          zainCash.value = ZainCash.fromJson({
            "status": response["status"], // Use the status from the response
            "data": data,  // Use the URL string directly
          });

          // Navigate to the ZainCash WebView screen

          Get.to(() => ZainCashWebView(url: data , token: token,));
        } else {
          print('ok 1');
          Get.snackbar("Error", "No MasterCard data found.");
        }
      } else {
        print('ok 2');
        Get.snackbar("Error", "Failed to fetch MasterCard info.");
      }
      loadMasterCard.value = false;
    }
  }


  // Fetching ZainCash URL
  getUrlZainCash() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadZainCash.value = true;

      // Fetch the ZainCash URL
      final response = await SasClient.get(api: '/api/user/payment/request/zaincash');
      if (response != null) {
        var data = response["data"]; // This should be the URL string

        if (data != null) {
          activeZainCashLoading.value = false;
          // Successfully parse the ZainCash data
          zainCash.value = ZainCash.fromJson({
            "status": response["status"], // Use the status from the response
            "data": data,  // Use the URL string directly
          });

          // Navigate to the ZainCash WebView screen

          Get.to(() => ZainCashWebView(url: data , token: token,));
        } else {
          print('ok 1');
          Get.snackbar("Error", "No ZainCash data found.");
        }
      } else {
        print('ok 2');
        Get.snackbar("Error", "Failed to fetch ZainCash info.");
      }
      loadZainCash.value = false;
    }
  }

  // Fetching Dashboard Info
  getDashboardInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      final response = await SasClient.get(api: "/api/dashboard");
      dashboardModel.value = dashboardModelFromJson(jsonEncode(response["data"]));
    }
  }

  // Activate without redeeming
  activeWithoutReedem() async {
    activeWithoutReedemLoading.value = true;
    var token = prefs.getString('token');

    if (token != null) {
      // Check if user has enough balance for active service
      if (userInfo.value.balance! < serviceInfo.value.price!) {
        Get.snackbar("عذرا", "رصيدك غير كافي",
            margin: EdgeInsets.all(Insets.margin),
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Colors.white);
        activeWithoutReedemLoading.value = false;
        return;
      }

      const passphrase = 'abcdefghijuklmno0123456789012345';
      var uuid = const Uuid();

      var secondData = {"uuid": uuid.v1(), "current_password": true};

      final encryptedData2 = encryptAESCryptoJS(jsonEncode(secondData), passphrase);

      SasClient.post(
        api: '/api/user/activate',
        data: {
          "payload": encryptedData2,
        },
      ).then((value) {
        if (value.item1) {
          if (value.item2["status"] == 200) {
            Get.back();
            Get.snackbar("تمت العملية", "تمت  عملية التفعيل بنجاح",
                margin: EdgeInsets.all(Insets.margin),
                backgroundColor: Get.theme.colorScheme.primary,
                colorText: Colors.white);
            getServiceInfo();
            getUserInfo();
          } else {
            Get.snackbar("خطأ", "حدث خطأ ما",
                margin: EdgeInsets.all(Insets.margin),
                backgroundColor: Get.theme.colorScheme.error,
                colorText: Colors.white);
          }
        }
      });
    }

    activeWithoutReedemLoading.value = false;
  }

  // Redeem process
  addReedem({required String pin}) async {
    var token = prefs.getString('token');
    if (token != null) {
      redeemLoading.value = true;
      var data = {"pin": pin};
      const passphrase = 'abcdefghijuklmno0123456789012345';
      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/redeem',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        if (response.item2["status"] == 200) {
          Get.back();

          Get.snackbar("تمت العملية", "تمت  عملية التعبئة بنجاح",
              margin: EdgeInsets.all(Insets.margin),
              backgroundColor: Get.theme.colorScheme.primary,
              colorText: Colors.white);
          getUserInfo();
        }
        redeemLoading.value = false;
      }
    }
  }

  // Activate with pin
  activePin({required String pin}) async {
    var token = prefs.getString('token');
    if (token != null) {
      activePinLoading.value = true;
      var data = {"pin": pin};
      const passphrase = 'abcdefghijuklmno0123456789012345';
      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/redeem',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        if (response.item2["status"] == 200) {
          Get.back();
          Get.snackbar("تمت العملية", "تمت  عملية التعبئة بنجاح",
              margin: EdgeInsets.all(Insets.margin),
              backgroundColor: Get.theme.colorScheme.primary,
              colorText: Colors.white);
          getServiceInfo();
          getUserInfo();
        }
        activePinLoading.value = false;
      }
    }
  }

  // Fetching Invoice List
  getInvoiceList() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadInvoice.value = true;
      var data = {"page": 1, "count": 10, "sortBy": "id", "direction": "desc"};

      const passphrase = 'abcdefghijuklmno0123456789012345';
      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/index/invoice',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        invoiceList.value = invoiceModelFromJson(jsonEncode(response.item2["data"]));
      }
      loadInvoice.value = false;
    }
  }

  @override
  void onInit() {
    getServiceInfo();
    getUserInfo();
    getDashboardInfo();
    super.onInit();
  }
}
