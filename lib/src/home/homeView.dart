import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mh_logistik/core/shared_widgets/app_bar.dart';
import 'package:mh_logistik/core/shared_widgets/button.dart';
import 'package:mh_logistik/src/home/homeViewController.dart';
import 'package:mh_logistik/src/injection.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: getIt<HomeViewController>(),
      builder: (controller) {
        return Scaffold(
          appBar: const AppBarCustom(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  RaisedButtonCustom(
                    btnText: "Scan",
                    onPressed: () async {
                      controller.getText();
                    },
                  ),
                  Obx(() => Text(controller.text.value)),
                ],
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}
