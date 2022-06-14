import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/shared_widgets/app_bar.dart';
import 'package:mh_logistik/src/home/homeViewController.dart';
import 'package:mh_logistik/src/injection.dart';
import 'package:mh_logistik/src/package/add_package_view.dart';
import 'package:mh_logistik/src/rack_locations/rack_locations_view.dart';
import 'package:mh_logistik/src/search/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: getIt<HomeViewController>(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: (index) {
                    controller.currentIndex.value = index;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Locations', icon: Icon(AntDesign.edit)),
                    BottomNavigationBarItem(
                        label: 'Search', icon: Icon(AntDesign.search1)),
                    BottomNavigationBarItem(
                        label: 'Scan', icon: Icon(AntDesign.qrcode)),
                  ]),
              body: _buildPages(controller.currentIndex.value)),

          //
        );
      },
    );
  }

  Widget _buildPages(int index) {
    switch (index) {
      case 0:
        return const RackLocationsView();

      default:
        return const SearchView();
    }
  }
  
  Widget _card(
      {required BuildContext context,
      required String label,
      required void Function() onTap}) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
