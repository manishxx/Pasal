import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  ProductCounterState createState() => ProductCounterState();
}

class ProductCounterState extends State<ProductCounter> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  void _decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Quantity: $count',
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.kPrimaryColor),
                  onPressed: _decrement,
                  child: const Center(child: Icon(Icons.remove)),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.kPrimaryColor),
                  onPressed: _increment,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
