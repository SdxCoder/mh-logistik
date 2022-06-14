import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/src/search/search_view_controller.dart';
import 'package:search_app_bar_page/search_app_bar_page.dart';

import '../../core/shared_widgets/app_bar.dart';
import '../injection.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SearchViewController>(
        init: getIt<SearchViewController>(),
        builder: (controller) {
          // return Scaffold(
          //     appBar: const AppBarCustom(),
          //     body: Center(
          //       child: Column(
          //         children: [
          //           Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: TextFormField(

          //                   cursorColor: Colors.grey,
          //                   decoration: InputDecoration(
          //                     hintText: 'Search by name, address or location',
          //                     hintStyle: Theme.of(context)
          //                         .textTheme
          //                         .bodyText2
          //                         ?.copyWith(color: Colors.grey),
          //                     suffixIcon:   const Icon(AntDesign.search1),
          //                     contentPadding: const EdgeInsets.symmetric(
          //                         vertical: 2, horizontal: 20),
          //                     enabledBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(50),
          //                         borderSide: const BorderSide(width: 0.1)),
          //                     focusedBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(50),
          //                         borderSide: const BorderSide(width: 0.4)),
          //                   ),
          //                   onChanged: (val) {
          //                     controller.searchBy(val);
          //                   })),
          //           Obx(() => controller.filteredList.isEmpty
          //               ? Center(
          //                   child: Text('No Data.',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText2
          //                           ?.copyWith(
          //                             color: Colors.grey,
          //                           )),
          //                 )
          //               : Expanded(
          //                   child: ListView.builder(
          //                     shrinkWrap: true,
          //                     itemCount: controller.filteredList.length,
          //                     itemBuilder: (_, index) {
          //                       final Package package =
          //                           controller.packageList[index];
          //                       return Card(
          //                           margin: const EdgeInsets.symmetric(
          //                               horizontal: 16, vertical: 4),
          //                           shape: RoundedRectangleBorder(
          //                               borderRadius: BorderRadius.circular(4)),
          //                           // color: Theme.of(context).primaryColorDark,
          //                           child: Padding(
          //                             padding: const EdgeInsets.all(14.0),
          //                             child: Row(
          //                               children: [
          //                                 Expanded(
          //                                   child: Text(
          //                                     ' ${package.details}',
          //                                     style:
          //                                         const TextStyle(fontSize: 16),
          //                                   ),
          //                                 ),
          //                                 Expanded(
          //                                   child: Text(
          //                                     ' ${package.rackLocation.name}',
          //                                     style:
          //                                         const TextStyle(fontSize: 12),
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                           ));
          //                     },
          //                   ),
          //                 )),
          //         ],
          //       ),
          //     ));

          return  SearchAppBarPage<Package>(
                searchAppBarcenterTitle: false,
                searchAppBarhintText: 'Search by name, address, or location',
                searchAppBarbackgroundColor: Colors.white,
                searchAppBarElevation: 0,
                searchAppBartitle: const Center(child: AppbarTitle()),
                listFull: controller.packageList.value,
                filter: (package, val) {
                  if (val != null) {
                    return controller.filter(package, val);
                  }
                  return true;
                },
                obxListBuilder: (context, list, isModSearch) {
                  if (list.isEmpty) {
                    return const Center(
                        child: Text(
                      'NOTHING FOUND',
                      style: TextStyle(fontSize: 14),
                    ));
                  }
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      return Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    ' ${list[index].details}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    ' ${list[index].rackLocation.name}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
              );
        });
  }
}
