import 'dart:developer';

import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/network/api_service_provider.dart';
import 'package:pasal/models/api_products.dart';
import 'package:pasal/models/products.dart';

import '../presentation/base_model/base_model.dart';

class ProductListController extends BaseController {
  final ApiServiceProvider _apiServiceProvider = ApiServiceProvider();
  List<Product> productsResult = List<Product>.empty(growable: true).obs;
  final count = 0.obs;
  var productAvailable = false.obs;
  List productResponse = [].obs;
  bool tokenNeeded = false;
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
    print(productResponse);
    productAvailable.value = products != null;
    setState(ViewState.retrieved);
  }
}
