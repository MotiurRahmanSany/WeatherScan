import 'package:flutter/material.dart';

class AddingADivider extends StatelessWidget {
  const AddingADivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Color.fromARGB(46, 123, 123, 123),
      // indent: 19,
      // endIndent: 40,
      height: 0,
    );
  }
}
