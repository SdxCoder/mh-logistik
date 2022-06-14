import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/shared_widgets/app_bar.dart';
import '../injection.dart';
import 'rack_locations_view_controller.dart';

class RackLocationsView extends StatelessWidget {
  const RackLocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RackLocationsViewController>(
      init: getIt<RackLocationsViewController>(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const AppBarCustom(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [],
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}
