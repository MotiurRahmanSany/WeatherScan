import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          PopupMenuItem(
            child: Text(
              'Help & feedback',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          )
        ];
      },
      onSelected: (value) {},
    );
  }
}
