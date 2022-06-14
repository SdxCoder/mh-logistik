import 'package:flutter/material.dart';
import 'package:mh_logistik/core/shared_widgets/dialogs/appDialog.dart';

import '../../router/router.dart';
import '../text_field.dart';
import 'actionDialog.dart';

class UpdateRackLocationDialog extends StatelessWidget {
  UpdateRackLocationDialog({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        Text(
          "Update",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        TextFieldCustom(
          controller: _controller,
          hintText: 'Enter location',
          maxLines: 1,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Spacer(),
            TextButton(
                onPressed: () {
                  appRouter.pop(null);
                },
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  appRouter.pop(_controller.text.trim());
                },
                child: const Text('Update')),
          ],
        ),
      ],
    );
  }
}
