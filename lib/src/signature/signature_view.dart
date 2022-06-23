import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/utils/snack_msg.dart';
import 'package:mh_logistik/src/search/search_view_controller.dart';
import 'package:signature/signature.dart';

class SignatureView extends StatefulWidget {
  final Package package;
  const SignatureView({Key? key, required this.package}) : super(key: key);

  @override
  State<SignatureView> createState() => _SignatureViewState();
}

class _SignatureViewState extends State<SignatureView> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.white,
    exportPenColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  final controller = Get.find<SearchViewController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Signature(
          controller: _controller,
          height: 300,
          backgroundColor: Colors.grey[300]!,
        ),
        const SizedBox(
          height: 16,
        ),
        ButtonBar(
          children: [
            TextButton(
                onPressed: () {
                  _controller.clear();
                },
                child: const Text('Reset')),
            TextButton(
                onPressed: () {
                  _controller.undo();
                },
                child: const Text('Undo')),
            ElevatedButton(
                onPressed: () async {
                  final bytes = await _controller.toPngBytes();

                  if(bytes != null) {
                     controller.updatePackage(widget.package.id,
                      widget.package.copyWith(image: bytes, destored: true));
                  }
                  else {
                    SnackMsg.err("Something went wrong. Try again!");
                  }

                 
                },
                child: const Text('Save')),
          ],
        ),
      ],
    );
  }
}
