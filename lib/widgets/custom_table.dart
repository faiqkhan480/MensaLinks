import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/screen_properties.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          tableHeader(),
          tableBody(),
          // ...List.generate(4, (index) => null),
        ],
      ),
    );
  }

  Widget tableHeader() {
    return Container(
      decoration: UIStyleProperties.roundedRadiusDecoration(backgroundColor: AppColors.primaryColor, radius: 10),
      // height: 30,
      // padding: UIStyleProperties.insetsVrt15Hzt15,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Get.width * 0.070),
      // width: double.infinity,
      child: Row(
        children: List.generate(Constants.tableHeaders.length, (index) => Expanded(
          flex: Constants.tableCellValues.elementAt(index),
          child: Text(
            Constants.tableHeaders.elementAt(index),
            maxLines: 1,
            // textAlign: TextAlign.center,
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
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: Get.width * 0.070),
          child: Row(
            children: List.generate(Constants.tableHeaders.length, (i) => Expanded(
              flex: Constants.tableCellValues.elementAt(i),
              child: Text(
                i == 0 ?
                (index + 1).toString() :
                i == 1 ?
                "Rahul Raj" :
                i == 2 ?
                "784-xx":
                i == 3 ?
                "24-01-1985" :
                "+971500000000",
                maxLines: 1,
                textAlign: TextAlign.start,
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