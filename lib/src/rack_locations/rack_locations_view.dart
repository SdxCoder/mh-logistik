import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';

import '../../core/shared_widgets/app_bar.dart';
import '../../core/shared_widgets/slideable_tile.dart';
import '../../core/shared_widgets/text_field.dart';
import '../injection.dart';
import 'rack_locations_view_controller.dart';

class RackLocationsView extends StatelessWidget {
  RackLocationsView({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RackLocationsViewController>(
      init: getIt<RackLocationsViewController>(),
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: const AppBarCustom(),
            body: GetX<RackLocationsViewController>(
              init: getIt<RackLocationsViewController>(),
              builder: (controller) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldCustom(
                              controller: _controller,
                              hintText: 'Enter location',
                              maxLines: 1,
                              onChanged: (String v) {
                                controller.locationName.value = v;
                              },
                              onFieldSubmit: (String v) {
                                controller.save();
                                _controller.clear();
                               
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.save();
                              _controller.clear();
                            
                            },
                            child: Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: AppTheme.primaryColor,
                                      fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: controller.locationsList.isEmpty
                            ? const Center(
                                child: Text(
                                'NO LOCATIONS',
                                style: TextStyle(fontSize: 14),
                              ))
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.locationsList.length,
                                itemBuilder: (_, index) {
                                  final rackLocation =
                                      controller.locationsList[index];
                                  return SlideableTile(
                                    onPressDelete: (context) {
                                      controller.delete(rackLocation.id);
                                    },
                                    onPressEdit: (context) {
                                      controller
                                          .updateRackloaction(rackLocation);
                                    },
                                    child: Card(
                                        elevation: 0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(rackLocation.name,
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
            ));
        ;
      },
    );
  }
}
