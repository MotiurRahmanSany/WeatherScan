import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  const SettingTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodySmall),
      subtitle: subtitle != null
          ? Text(subtitle!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ))
          : const Text(''),
      isThreeLine: true,
      dense: true,
    );
  }
}
