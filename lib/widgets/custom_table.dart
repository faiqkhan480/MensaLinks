import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/screen_properties.dart';

class CustomTable extends StatelessWidget {
  final bool isPayRoll;
  const CustomTable({Key? key, this.isPayRoll = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          tableHeader(),
          tableBody(),
        ],
      ),
    );
  }

  Widget tableHeader() {
    List tableHeaders = isPayRoll ? Constants.payRollTableHeaders : Constants.tableHeaders;
    List tableCells = isPayRoll ? Constants.payRollTableCellValues : Constants.tableCellValues;
    return Container(
      decoration: UIStyleProperties.roundedRadiusDecoration(backgroundColor: AppColors.primaryColor, radius: 10),
      // height: 30,
      // padding: UIStyleProperties.insetsVrt15Hzt15,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Get.width * (isPayRoll ? 0.020 : 0.070)),
      // width: double.infinity,
      child: Row(
        children: List.generate(tableHeaders.length, (index) => Expanded(
          flex: tableCells.elementAt(index),
          child: Text(
            tableHeaders.elementAt(index),
            maxLines: 1,
            textAlign: isPayRoll ? TextAlign.center : null,
            style: TextStyle(
                color: AppColors.white,
                fontSize: Constants.extraSmallText,
                fontWeight: FontWeight.w500
            ),
          ),
        ),),
      ),
    );
  }

  Widget tableBody() {
    List tableHeaders = isPayRoll ? Constants.payRollTableHeaders : Constants.tableHeaders;
    List tableCells = isPayRoll ? Constants.payRollTableCellValues : Constants.tableCellValues;
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: Get.width * (isPayRoll ? 0.020 : 0.070)),
          child: Row(
            children: List.generate(tableHeaders.length, (i) => Expanded(
              flex: tableCells.elementAt(i),
              child: Text(
                i == 0 ?
                (index + 1).toString() :
                i == 1 ?
                Constants.reviewMembers.elementAt(index) :
                i == 2 ?
                (isPayRoll ? "MAR" : "784-xx"):
                i == 3 ?
                (isPayRoll ? "5,000" : "24-01-1985") :
                i == 5 ?
                "Annual leave" :
                "+971500000000",
                maxLines: 1,
                textAlign: isPayRoll ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: Constants.extraSmallText,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),),
          ),
        ),
        itemCount: 4,
        physics: Constants.scrollPhysics,
      ),
    );
  }
}