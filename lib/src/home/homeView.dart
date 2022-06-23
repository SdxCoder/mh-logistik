import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/shared_widgets/app_bar.dart';
import 'package:mh_logistik/src/destored_packages/destored_packages.dart';
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
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.black54,
                  showUnselectedLabels: true,
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Locations', icon: Icon(AntDesign.edit)),
                    BottomNavigationBarItem(
                        label: 'Search', icon: Icon(AntDesign.search1)),
                    BottomNavigationBarItem(
                        label: 'Destored', icon: Icon(AntDesign.export)),
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
        return RackLocationsView();
      case 2:
        return const DestoredPackagesView();

      default:
        return const SearchView();
    }
  }
}
