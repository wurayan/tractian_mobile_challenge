import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String loadingString;
  const LoadingWidget({super.key, required this.loadingString});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.3),
            child: LinearProgressIndicator(
              color: AppColorsEnum.blue.color,
              backgroundColor: AppColorsEnum.gray.color,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.05,
            ),
            child: Text(loadingString),
          )
        ],
      ),
    );
  }
}
