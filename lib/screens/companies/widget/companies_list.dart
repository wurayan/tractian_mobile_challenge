import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/model/company_model.dart';
import 'package:tractian_challenge_treeview/screens/companies/widget/company_card.dart';

class CompaniesList extends StatelessWidget {
  final List<CompanyModel> companies;
  const CompaniesList({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return ListView.builder(
      itemCount: companies.length,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.06),
          
      itemBuilder: (context, index) => CompanyCard(
        height: height,
        width: width,
        company: companies[index],
      ),
    );
  }
}
