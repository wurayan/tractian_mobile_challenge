import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tractian_challenge_treeview/model/asset_model.dart';
import 'package:tractian_challenge_treeview/model/entity_model.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/expanded_icon.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/trailing_asset_icon.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/treeview_widget.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';
import 'package:tractian_challenge_treeview/utils/styles.dart';

class TreeViewItem extends StatefulWidget {
  final EntityModel item;
  final String? iconPath;
  final int level;
  const TreeViewItem(
      {super.key, required this.item, this.iconPath, this.level = 0});

  @override
  State<TreeViewItem> createState() => _TreeViewItemState();
}

class _TreeViewItemState extends State<TreeViewItem> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            widget.item.expanded = !widget.item.expanded;
            setState(() {});
          },
          child: SizedBox(
            height: height * 0.04,
            child: Row(
              children: [
                _indentation(widget.level, width),
                Visibility(
                  visible: widget.item.hasChildren,
                  child: ExpandedIcon(isExpanded: widget.item.expanded),
                ),
                Visibility(
                  visible: widget.level == 0 && !widget.item.hasChildren,
                  child: SizedBox(
                    width: width * 0.02,
                  ),
                ),
                Visibility(
                  visible: widget.iconPath != null,
                  child: Image.asset(
                    widget.iconPath!,
                    width: width * 0.06,
                    height: width * 0.06,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      widget.item.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.bodyText,
                    ),
                  ),
                ),
                if (widget.item is AssetModel)
                  TrailingAssetIcon(asset: widget.item as AssetModel),
              ],
            ),
          ),
        ),
        if (widget.item.expanded)
          TreeViewWidget(
            itens: widget.item.children,
            level: widget.level + 1,
          )
      ],
    );
  }
}

Widget _indentation(int level, double width) {
  List<Widget> lines = [];
  for (var i = 0; i < level; i++) {
    lines.add(
      SizedBox(
        width: width * 0.06,
        // height: width * 0.06,
        height: double.infinity,
        child: CustomPaint(
          painter: LinePainter(),
        ),
      ),
    );
  }
  return Row(children: lines);
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColorsEnum.darkBlue.color
      ..strokeWidth = 1;
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
