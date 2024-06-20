import 'package:flutter/material.dart';

class MsgWidget extends StatelessWidget {
  final String msg;
  const MsgWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg),
    );
  }
}
