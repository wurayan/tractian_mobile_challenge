import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/cubit/assets_cubit.dart';
import 'package:tractian_challenge_treeview/model/filter_model.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/filter_buttons.dart';
import 'package:tractian_challenge_treeview/utils/styles.dart';

class FilterWidget extends StatelessWidget {
  final AssetsCubit assetsCubit;
  final FilterModel filterModel;
  FilterWidget(
      {super.key, required this.assetsCubit, required this.filterModel});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.015, horizontal: width * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height * 0.045,
            child: TextFormField(
              controller: _controller,
              decoration: AppStyles.searchbarTextFormField,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus!.unfocus(),
              onChanged: (value) {
                filterModel.text = value;
                assetsCubit.filterItens(filterModel);
              },
              // style: AppStyles.bodyText.copyWith(height: 0.6),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: Row(
              children: [
                FilterButtons(
                    function: (bool value) {
                      filterModel.isEnergy = value;
                      assetsCubit.filterItens(filterModel);
                    },
                    icon: Icons.bolt_outlined,
                    text: "Sensor de Energia"),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: FilterButtons(
                      function: (bool value) {
                        filterModel.isCritic = value;
                        assetsCubit.filterItens(filterModel);
                      },
                      icon: Icons.info_outline,
                      text: "Crítico"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
