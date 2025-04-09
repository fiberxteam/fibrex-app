import 'package:fiber/client/sas_client.dart';
import 'package:fiber/view/home/components/zain_cash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../navigation/navigation_page.dart';

// Controller to manage payment status using GetX
class PaymentController extends GetxController {
  var isPaymentSuccessful = false.obs;

  // Function to set the payment status
  void setPaymentStatus(bool status) {
    isPaymentSuccessful.value = status;
  }

  void restartApp() {
    Get.offAll(() => const NavigationPage(), transition: Transition.fadeIn);
  }
}

class WebViewScreenPayment extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreenPayment> {
  late InAppWebViewController controller; // WebView controller
  bool isLoading = true;
  final PaymentController paymentController = Get.put(PaymentController());
  var token = prefs.getString('token');
  String baseUrl = "${SasClient.dioHttp.url}/user/api/index.php/api/user/payment/request/hyperpay";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterCard Payment'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(baseUrl),
              headers: {
                "Authorization": "Bearer $token", // Sending token in headers
              },
            ),
            onWebViewCreated: (InAppWebViewController webViewController) {
              controller = webViewController;
            },
            onLoadStart: (controller, url) {
              print("Loading started: $url");
              print("${SasClient.dioHttp.url}/user/api/index.php/api/user/payment/request/hyperpay");
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              print("Page loaded: $url");
              setState(() {
                isLoading = false;
              });
              String? pageContent = await controller.evaluateJavascript(source: "document.body.innerText");

              if (url != null && url.toString().contains("php/api/payment/process/hyperpay")) {
                String? pageContent = await controller.evaluateJavascript(source: "document.body.innerText");

                if (pageContent != null && pageContent.contains('{"status":200,"message":"rsp_success"}')) {
                  _showSuccessDialog();
                }
              }
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                isLoading = progress < 100;
              });
            },
            onReceivedError: (controller, request, error) {
              print("Web resource error: ${error.description}");
            },
            onConsoleMessage: (controller, consoleMessage) {
              print("Console Message: ${consoleMessage.message}");
            },
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED,
              );
            },
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
  void _showSuccessDialog() {
    Get.defaultDialog(
      title: "تم بنجاح",
      middleText: "تمت عملية الدفع بنجاح",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
      middleTextStyle: const TextStyle(fontSize: 16, color: Colors.black54),
      radius: 10, // جعل الزوايا دائرية
      contentPadding: const EdgeInsets.all(20),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green, // لون النص
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // حواف دائرية
            ),
          ),
          onPressed: () {
            paymentController.restartApp(); // إعادة تشغيل التطبيق
          },
          child: const Text("حسنا", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
