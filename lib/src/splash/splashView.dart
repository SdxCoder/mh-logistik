import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mh_logistik/core/constants/asset_names.dart';
import 'package:mh_logistik/src/splash/splashViewController.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewController>(
      init: SplashViewController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(AssetNames.appLogo),
                const Spacer(),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
