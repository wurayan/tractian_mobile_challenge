import 'package:flutter/material.dart';
import 'package:tractian_challenge_treeview/model/company_model.dart';
import 'package:tractian_challenge_treeview/screens/treeview/treeview_screen.dart';
import 'package:tractian_challenge_treeview/utils/colors.dart';
import 'package:tractian_challenge_treeview/utils/styles.dart';

class CompanyCard extends StatelessWidget {
  final double height;
  final double width;
  final CompanyModel company;
  const CompanyCard(
      {super.key,
      required this.height,
      required this.width,
      required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TreeViewScreen(companyModel: company),
            ),
          );
        },
        child: Container(
          height: height * 0.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorsEnum.blue.color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.08, right: width * 0.04),
                child: Image.asset(
                  "assets/icons/company.png",
                  width: width * 0.08,
                  height: width * 0.08,
                ),
              ),
              Text(company.name, style: AppStyles.titleText)
              // Text(width.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
