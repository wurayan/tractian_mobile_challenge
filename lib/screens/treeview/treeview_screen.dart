import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/cubit/assets_cubit.dart';
import 'package:tractian_challenge_treeview/model/company_model.dart';
import 'package:tractian_challenge_treeview/model/filter_model.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/filter_widget.dart';
import 'package:tractian_challenge_treeview/screens/treeview/widget/treeview_widget.dart';
import 'package:tractian_challenge_treeview/screens/widgets/loading_widget.dart';
import 'package:tractian_challenge_treeview/screens/widgets/msg_widget.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';
import 'package:tractian_challenge_treeview/utils/styles.dart';

class TreeViewScreen extends StatelessWidget {
  final CompanyModel companyModel;
  TreeViewScreen({super.key, required this.companyModel});
  final AssetsCubit assetsCubit = AssetsCubit();
  final FilterModel filterModel = FilterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Assets",
          style: AppStyles.titleText,
        ),
        backgroundColor: AppColorsEnum.darkBlue.color,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColorsEnum.white.color,
              size: MediaQuery.sizeOf(context).width * 0.08,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          FilterWidget(assetsCubit: assetsCubit, filterModel: filterModel),
          Divider(
            color: AppColorsEnum.gray.color,
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<AssetsCubit, AssetState>(
                bloc: assetsCubit,
                builder: (context, state) {
                  if (state is AssetsEmpty) {
                    return MsgWidget(msg: state.msg);
                  } else if (state is AssetsError) {
                    return MsgWidget(msg: state.msg);
                  } else if (state is AssetsSuccess) {
                    return TreeViewWidget(itens: state.assets);
                  } else {
                    assetsCubit.getItens(companyModel.id);
                    return const LoadingWidget(
                      loadingString: "Loading Assets...",
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
