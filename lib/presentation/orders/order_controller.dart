import 'dart:developer';

import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/network/api_service_provider.dart';

import '../base_model/base_model.dart';

class OrderController extends BaseController {
  final ApiServiceProvider _apiServiceProvider = ApiServiceProvider();

  var productId = [].obs;
  List? orderResponse = [].obs;

  @override
  void onInit() {
    super.onInit();
    log("on start");
    ordersFromApi();
  }

  Future<bool> orderProduct(Map map) async {
    log("message");
    setState(ViewState.busy);
    bool success = await _apiServiceProvider.createOrder(map);
    if (success) {
      log("success for orders");
      setState(ViewState.retrieved);
    } else {
      log("orderProduct function failed!");
      setState(ViewState.error);
    }
    return success;
  }

  void ordersFromApi() async {
    setState(ViewState.busy);
    var value = await _apiServiceProvider.getOrder();
    List order = [];
    order.add(value);
    orderResponse!.assignAll(order);
    log("list ${orderResponse![0].orders.length}");
    setState(ViewState.retrieved);
  }
}
