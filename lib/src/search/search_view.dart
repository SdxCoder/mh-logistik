import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/router/router.gr.dart';
import 'package:mh_logistik/src/search/search_view_controller.dart';
import 'package:search_app_bar_page/search_app_bar_page.dart';

import '../../core/shared_widgets/app_bar.dart';
import '../../core/shared_widgets/slideable_tile.dart';
import '../injection.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SearchViewController>(
        init: getIt<SearchViewController>(),
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

                          return SlideableTile(
                            onPressDelete: (context) {
                              controller.delete(package.id);
                            },
                            onPressEdit: (context) {
                              appRouter.push(AddPackageViewRoute(
                                  package: package,
                                  scanResult: package.details));
                            },
                            onPressDestore: (context) {
                              appRouter
                                  .push(SignatureViewRoute(package: package));
                            },
                            child: Card(
                                elevation: 0,
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 4),
                                      CircleAvatar(
                                        radius: 25,
                                        child: Text(
                                          ' ${list[index].rackLocation.name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Text(package.details,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                )),
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

class SearchPackage extends StatelessWidget {
  final List<Package> packageList;
  final bool Function(Package p, String val) filter;
  final Widget Function(BuildContext, List<Package>, bool) obxListBuilder;

  const SearchPackage({
    Key? key,
    required this.packageList,
    required this.filter,
    required this.obxListBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAppBarPage<Package>(
        searchAppBarcenterTitle: true,
        searchAppBarhintText: 'Search by name, address, or location',
        searchAppBarbackgroundColor: Colors.white,
        searchAppBarElevation: 0,
        searchAppBartitle: const AppbarTitle(),
        listFull: packageList,
        filter: (package, val) {
          if (val != null) {
            return filter.call(package, val);
          }
          return true;
        },
        obxListBuilder: obxListBuilder);
  }
}


// class SearchPackage extends StatelessWidget {
//   final List<Package> packageList;
//   const SearchPackage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SearchAppBarPage<Package>(
//       searchAppBarcenterTitle: true,
//       searchAppBarhintText: 'Search by name, address, or location',
//       searchAppBarbackgroundColor: Colors.white,
//       searchAppBarElevation: 0,
//       searchAppBartitle: const AppbarTitle(),
//       listFull: controller.packageList.value,
//       filter: (package, val) {
//         if (val != null) {
//           return controller.filter(package, val);
//         }
//         return true;
//       },
//       obxListBuilder: (context, list, isModSearch) {
//         if (list.isEmpty) {
//           return const Center(
//               child: Text(
//             'NO PACKAGES',
//             style: TextStyle(fontSize: 14),
//           ));
//         }
//         return Padding(
//           padding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: list.length,
//                   itemBuilder: (_, index) {
//                     final package = list[index];
//                     return SlideableTile(
//                       onPressDelete: (context) {
//                         controller.delete(package.id);
//                       },
//                       onPressEdit: (context) {
//                         appRouter.push(AddPackageViewRoute(
//                             package: package,
//                             scanResult: package.details));
//                       },
//                       onPressDestore: (context) {
//                         appRouter
//                             .push(SignatureViewRoute(package: package));
//                       },
//                       child: Card(
//                           elevation: 0,
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               crossAxisAlignment:
//                                   CrossAxisAlignment.center,
//                               children: [
//                                 const SizedBox(width: 4),
//                                 CircleAvatar(
//                                   radius: 25,
//                                   child: Text(
//                                     ' ${list[index].rackLocation.name}',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleMedium
//                                         ?.copyWith(color: Colors.white),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 16,
//                                 ),
//                                 Expanded(
//                                   child: Text(package.details,
//                                       maxLines: 4,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyText2
//                                           ?.copyWith(
//                                               fontWeight:
//                                                   FontWeight.w500)),
//                                 ),
//                               ],
//                             ),
//                           )),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
