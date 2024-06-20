import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/model/asset_model.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';

class TrailingAssetIcon extends StatelessWidget {
  final AssetModel asset;
  const TrailingAssetIcon({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: asset.isEnergy,
          child: Icon(
            Icons.bolt,
            color: AppColorsEnum.green.color,
          ),
        ),
        Visibility(
          visible: asset.isCritic,
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.01),
            child: CircleAvatar(
              backgroundColor: AppColorsEnum.red.color,
              radius: MediaQuery.sizeOf(context).width * 0.01,
            ),
          ),
        ),
      ],
    );
  }
}
