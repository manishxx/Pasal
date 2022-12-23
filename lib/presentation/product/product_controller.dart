import 'dart:developer';

import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/network/api_service_provider.dart';
import 'package:pasal/models/api_products.dart';
import 'package:pasal/models/products.dart';

import '../base_model/base_model.dart';

class ProductListController extends BaseController {
  final ApiServiceProvider _apiServiceProvider = ApiServiceProvider();
  List<Product> productsResult = List<Product>.empty(growable: true).obs;
  final count = 0.obs;
  var productAvailable = false.obs;
  List productResponse = [].obs;
  bool tokenNeeded = false;
  var productId = [].obs;
  @override
  void onInit() {
    super.onInit();
    log("message");
    fetchProducts();
  }

  void fetchProducts() async {
    setState(ViewState.busy);

    List<Products>? products = await _apiServiceProvider.getProduct();

    productResponse.assignAll(products!);
    if (products.isNotEmpty) {
      productAvailable.value = true;
    }

    setState(ViewState.retrieved);
  }
}
