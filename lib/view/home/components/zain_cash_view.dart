import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';  // Import the new package
import '../../navigation/navigation_page.dart';

// Controller لإدارة حالة الدفع باستخدام GetX
class PaymentZainCashController extends GetxController {
  var isPaymentSuccessful = false.obs;

  // دالة لتحديد ما إذا كانت عملية الدفع ناجحة
  void setPaymentStatus(bool status) {
    isPaymentSuccessful.value = status;
  }

  void restartApp() {
    Get.offAll(() => const NavigationPage(), transition: Transition.fadeIn);
  }
}

class ZainCashWebView extends StatefulWidget {
  final String url;
  final String token;

  ZainCashWebView({required this.url, required this.token});

  @override
  _ZainCashWebViewState createState() => _ZainCashWebViewState();
}

class _ZainCashWebViewState extends State<ZainCashWebView> {
  late InAppWebViewController controller;  // Declare the controller for InAppWebView
  bool isLoading = true;
  final PaymentZainCashController paymentController = Get.put(PaymentZainCashController());

  @override
  void initState() {
    super.initState();
    // Initialize InAppWebView, no need to initialize controller here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZainCash Payment'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onWebViewCreated: (InAppWebViewController webViewController) {
              // Set the controller when WebView is created
              controller = webViewController;
            },
            onLoadStart: (controller, url) {
              print("Loading started: $url");
              setState(() {
                isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              print("Page loaded: $url");
              setState(() {
                isLoading = false;
              });
              checkPageContent();
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                isLoading = progress < 100;
              });
            },
            onReceivedError: (controller, request, error) {
              print("Web resource error: ${error.description}");
              // Handle web resource errors (e.g., no internet, page not found)
            },
            onConsoleMessage: (controller, consoleMessage) {
              print("Console Message: ${consoleMessage.message}");
            },
            // SSL handling - Accept SSL errors
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              // Accept all SSL certificates (this is where SSL errors are ignored)
              return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED,  // Allow SSL errors
              );
            },
          ),
          if (isLoading) // Show loader if the page is still loading
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  // دالة للتحقق من محتوى الصفحة بعد تحميلها
  void checkPageContent() async {
    final result = await controller.evaluateJavascript(source: "document.body.innerText");
    String pageContent = result.toString();
    print("Page content: $pageContent");

    if (pageContent.contains("Thank you for your payment")) {
      paymentController.setPaymentStatus(true);
      _showSuccessDialog();
    } else {
      print("Payment not successful or page doesn't contain the expected content.");
    }
  }

  void _showSuccessDialog() {
    Get.defaultDialog(
      title: "تم بنجاح",
      middleText: "تمت عملية الدفع بنجاح",
      backgroundColor: Colors.white,
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
      middleTextStyle: TextStyle(fontSize: 16, color: Colors.black54),
      radius: 10, // جعل الزوايا دائرية
      contentPadding: EdgeInsets.all(20),
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
          child: Text("حسنا", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
