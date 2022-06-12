import 'package:flutter/material.dart';
import 'actionDialog.dart';

class StoragePermissionDeniedDialog extends StatelessWidget {
  final String permission;

  const StoragePermissionDeniedDialog({Key? key, required this.permission})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionDialog(
      children: [
        Text(
          "Grant Permission",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
       const SizedBox(height: 16.0),
        Text(
          "Permission denied, please go to Settings and grant permission to Access $permission",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
