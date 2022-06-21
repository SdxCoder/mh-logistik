import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureView extends StatefulWidget {
  const SignatureView({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Signature(
          controller: _controller,
          height: 300,
          backgroundColor: Colors.grey[300]!,
        ),
        const SizedBox(height: 16,),
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

                  log(bytes!.length.toString());
                },
                child: const Text('Save')),
          ],
        ),
      ],
    );
  }
}
