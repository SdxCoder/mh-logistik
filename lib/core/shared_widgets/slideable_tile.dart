import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';

class SlideableTile extends StatelessWidget {
  final Function(BuildContext)? onPressEdit;
  final Function(BuildContext)? onPressDelete;
  final Function(BuildContext)? onPressDestore;
  final Widget child;
  const SlideableTile(
      {Key? key,
      this.onPressEdit,
      this.onPressDelete,
      required this.child,
      this.onPressDestore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: onPressEdit,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            icon: AntDesign.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: onPressDelete,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            icon: AntDesign.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: onPressDestore,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
            icon: AntDesign.export,
            label: 'Destore',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: child,
    );
  }
}
