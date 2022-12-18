import 'dart:developer';

import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/network/api_service_provider.dart';

import '../base_model/base_model.dart';

class CartController extends BaseController {
  final ApiServiceProvider _apiServiceProvider = ApiServiceProvider();

  var count = 0.obs;
  var productAvailable = false.obs;
  List? cartResponse = [].obs;

  // dynamic cart = Cart().obs;

  @override
  void onInit() {
    super.onInit();
    log("on start");
    fetchCart();
  }

  void addToCart(Map map) async {
    log("message");
    setState(ViewState.busy);
    bool success = await _apiServiceProvider.addToCart(map);
    if (success) {
      log("success");
      setState(ViewState.retrieved);
    } else {
      log("Failed");
      setState(ViewState.error);
    }
  }

  void fetchCart() async {
    setState(ViewState.busy);

    var value = await _apiServiceProvider.getCart();
    List cart = [];
    cart.add(value);
    cartResponse!.assignAll(cart);
    log("cart ${cartResponse![0].items.length}");
    setState(ViewState.retrieved);
  }

  void deleteCart(String id) async {
    setState(ViewState.busy);

    var value = await _apiServiceProvider.removeCart(id);
    log(value.toString());
    setState(ViewState.retrieved);
  }

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
