import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/shared_widgets/text_field.dart';

import '../../core/shared_widgets/app_bar.dart';
import '../../core/shared_widgets/button.dart';
import '../injection.dart';
import 'add_package_view_controller.dart';

class AddPackageView extends StatefulWidget {
  final Package? package;
  final String scanResult;
  const AddPackageView({Key? key, required this.scanResult, this.package})
      : super(key: key);

  @override
  State<AddPackageView> createState() => _AddPackageViewState();
}

class _AddPackageViewState extends State<AddPackageView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPackageViewController>(
      init: getIt<AddPackageViewController>()
        ..scanResult.value =
            widget.package != null ? widget.package!.details : widget.scanResult
        ..rackLocation.value = widget.package != null
            ? widget.package!.rackLocation
            : RackLocation.empty(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const AppBarCustom(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                          child: Obx(() => DropdownSearch<RackLocation>(
                                popupProps: const PopupProps.modalBottomSheet(
                                  showSelectedItems: true,
                                  showSearchBox: true,
                                  searchDelay: Duration(seconds: 0),
                                ),
                                itemAsString: (RackLocation u) => u.name,
                                compareFn: (r, u) => r == u,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      labelText: "Select location",
                                      errorText:
                                          controller.rackLocation.value ==
                                                  RackLocation.empty()
                                              ? 'Required'
                                              : null,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 2),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              const BorderSide(width: 0.3))),
                                ),
                                items: controller.rackLocationList,
                                onChanged: (v) {
                                  if (v != null) {
                                    controller.rackLocation.value = v;
                                  }
                                },
                                selectedItem: controller.rackLocation.value,
                              ))),
                    ]),
                    const SizedBox(height: 24),
                    Obx(() => TextFieldCustom(
                          hintText: 'Edit Result',
                          maxLines: 5,
                          initialValue: controller.scanResult.value,
                          onChanged: (v) {
                            controller.scanResult.value = v;
                          },
                        )),
                    const SizedBox(height: 8),
                    Obx(() => controller.scanResult.value.isEmpty
                        ? const Offstage()
                        : Text("Scan Result",
                            style: Theme.of(context).textTheme.titleMedium)),
                    const SizedBox(height: 8),
                    Obx(() => controller.scanResult.value.isEmpty
                        ? const Offstage()
                        : Card(
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(controller.scanResult.value),
                            ))),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: RaisedButtonCustom(
                        btnText: widget.package != null ? 'Update' : 'Save',
                        elevation: 2,
                        isUpdate: widget.package != null,
                        onUpdate: () {
                          controller.updatePackage(widget.package!);
                        },
                        onPressed: () {
                          controller.save();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}
