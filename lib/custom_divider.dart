import 'package:flutter/material.dart';

class AddingADivider extends StatelessWidget {
  const AddingADivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      // color: Color.fromARGB(46, 123, 123, 123),
      color: Colors.grey.shade800,
      // height: 0,
    );
  }
}
