import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  const SettingTile({
    super.key,
    required this.title, 
    this.subtitle, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon) ,
      title: Text(title),
      subtitle: Text(subtitle!),
    );
  }
}
