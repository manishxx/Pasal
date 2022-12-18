import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pasal/orders/order_controller.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsewaEpay extends StatefulWidget {
  const EsewaEpay({super.key});

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<EsewaEpay> {
  late WebViewController _webViewController;
  final cartController = Get.put(CartController());
  final orderController = Get.put(OrderController());

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/html/epay_request.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  // ePay deatils
  double tAmt = 1000;
  double amt = 800;
  double txAmt = 100;
  double psc = 50;
  double pdc = 50;
  String scd = "EPAYTEST";
  String su = "https://www.linkedin.com/in/aabhash-rai-2a6912180/";
  String fu = "https://www.linkedin.com/in/aabhash-rai-2a6912180/";

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    placeAllOrders() {
      for (int i = 0; i < cartController.cartResponse!.length; i++) {
        Map map = {
          "productId": cartController.cartResponse![0].items[i].itemId,
          "quantity": cartController.cartResponse![0].items[i].quantity
        };
        orderController.orderProduct(map);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
      ),
      body: WebView(
        initialUrl: "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
            name: "message",
            onMessageReceived: (message) {},
          ),
        },
        onPageFinished: (data) {
          setState(() {
            String pid = UniqueKey().toString();
            _webViewController.evaluateJavascript(
                'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
          });
        },
        onWebViewCreated: (webViewController) {
          placeAllOrders();
          // _controller.complete(webViewController);
          _webViewController = webViewController;
          _loadHTMLfromAsset();
        },
      ),
    );
  }
}
