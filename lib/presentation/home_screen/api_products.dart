// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:pasal/models/api_products.dart';
// import 'package:http/http.dart' as http;
// import 'package:pasal/presentation/widgets/product_card.dart';
// import 'package:pasal/product/product_controller.dart';

// import '../../app/constants/app_constants.dart';

// class ApiProducts extends StatefulWidget {
//   const ApiProducts({super.key});

//   @override
//   State<ApiProducts> createState() => _ApiProductsState();
// }

// class _ApiProductsState extends State<ApiProducts> {
//   final ProductListController controller = Get.put(ProductListController());
//   @override
//   void initState() {
//     super.initState();
//   }

//   late Future<Products> products;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       width: double.infinity,
//       height: 250,
//       child: ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.productResponse.length,
//           itemBuilder: (context, index) {
//             return Obx(
//                 () => ProductCard(product: controller.productResponse[index]));
//           }),
//     );
//   }
// }
