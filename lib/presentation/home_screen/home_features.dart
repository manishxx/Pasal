import 'package:flutter/cupertino.dart';

import '../resources/assets_manager.dart';
import '../widgets/home_features_widget.dart.dart';

class HomeFeatures extends StatefulWidget {
  const HomeFeatures({super.key});

  @override
  State<HomeFeatures> get createState => _HomeFeaturesState();
}

class _HomeFeaturesState extends State<HomeFeatures> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'Flash Deal',
            cardIcon: ImageAssets.flashIcon,
          ),
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'Bill',
            cardIcon: ImageAssets.billIcon,
          ),
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'Game',
            cardIcon: ImageAssets.gameIcon,
          ),
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'Daily Gifts',
            cardIcon: ImageAssets.giftIcon,
          ),
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'More',
            cardIcon: ImageAssets.discoverIcon,
          ),
          SizedBox(width: 10),
          HomeFeaturesWidget(
            cardTitle: 'Bill',
            cardIcon: ImageAssets.billIcon,
          ),
        ],
      ),
    );
  }
}
