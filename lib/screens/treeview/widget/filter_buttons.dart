import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';
import 'package:tractian_challenge_treeview/utils/styles.dart';

class FilterButtons extends StatefulWidget {
  final Function(bool) function;
  final IconData icon;
  final String text;

  const FilterButtons(
      {super.key,
      required this.function,
      required this.icon,
      required this.text});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  bool isClicked = false;

  Color changeColorText() =>
      isClicked ? AppColorsEnum.white.color : AppColorsEnum.darkGray.color;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.045,
      child: OutlinedButton(
        onPressed: () {
          setState(() => isClicked = !isClicked);
          widget.function(isClicked);
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: isClicked
              ? BorderSide.none
              : BorderSide(
                  color: AppColorsEnum.gray.color,
                  width: 1,
                  style: BorderStyle.solid,
                ),
          backgroundColor: isClicked ? AppColorsEnum.blue.color : null,
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: width * 0.04,
              color: changeColorText(),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Text(
                widget.text,
                style: AppStyles.buttonText.copyWith(
                  color: changeColorText(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
