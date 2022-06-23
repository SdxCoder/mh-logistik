import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../injection.dart';
import '../search/search_view.dart';
import 'destored_package_view_controller.dart';

class DestoredPackagesView extends StatelessWidget {
  const DestoredPackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DestoredPackageViewController>(
        init: getIt<DestoredPackageViewController>(),
        builder: (controller) {
          return SearchPackage(
            packageList: controller.packageList.value,
            filter: controller.filter,
            obxListBuilder: (context, list, isModSearch) {
              if (list.isEmpty) {
                return const Center(
                    child: Text(
                  'NO PACKAGES',
                  style: TextStyle(fontSize: 14),
                ));
              }

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          final package = list[index];

                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 4),
                                  // CircleAvatar(
                                  //   radius: 25,
                                  //   child: Text(
                                  //     ' ${list[index].rackLocation.name}',
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .titleMedium
                                  //         ?.copyWith(color: Colors.white),
                                  //   ),
                                  // ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(package.details,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(width: 16),

                                  Expanded(child: Image.memory(package.image!)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
