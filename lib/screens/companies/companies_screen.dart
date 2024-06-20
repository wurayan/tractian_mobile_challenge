import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/cubit/companies_cubit.dart';
import 'package:tractian_challenge_treeview/screens/companies/widget/companies_list.dart';
import 'package:tractian_challenge_treeview/screens/widgets/loading_widget.dart';
import 'package:tractian_challenge_treeview/screens/widgets/msg_widget.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.sizeOf(context).width;
    // final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColorsEnum.darkBlue.color,
        title: Image.asset(
          "assets/images/logo.png",
          height: 17,
        ),
      ),
      backgroundColor: AppColorsEnum.white.color,
      body: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          if (state is CompaniesEmpty) {
            return MsgWidget(msg: state.msg);
          } else if (state is CompaniesError) {
            return MsgWidget(msg: state.msg);
          } else if (state is CompaniesSuccess) {
            return CompaniesList(companies: state.companies);
          } else {
            context.read<CompaniesCubit>().getCompanies();
            return const LoadingWidget(
              loadingString: "Loading Companies...",
            );
          }
        },
      ),
    );
  }
}
