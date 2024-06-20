import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';

class ExpandedIcon extends StatelessWidget {
  final bool isExpanded; 
  const ExpandedIcon({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: isExpanded
          ? const AlwaysStoppedAnimation(90 / 360)
          : const AlwaysStoppedAnimation(1),
      child: Icon(
        Icons.chevron_right_sharp,
        color: AppColorsEnum.darkBlue.color,
        size: MediaQuery.sizeOf(context).width * 0.06,
      ),
    );
  }
}
