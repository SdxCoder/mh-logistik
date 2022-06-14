


import 'package:flutter/material.dart';

import 'actionDialog.dart';

class DeleteDialog extends StatelessWidget {

  const DeleteDialog({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionDialog(
      okButtonText: 'Yes',
      children: [
        Text(
          "Delete",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Are you sure you want to delete this?",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
