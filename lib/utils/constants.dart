import 'package:flutter/material.dart';

class Constants {
  static String appName = 'Mensa Links';

  static double pageTitle = 0.063;
  static double radius = 50;
  static double bottomSize = 0.33;
  static double buttonTextSize = 18;
  static double title = 30;
  static double heading = 25;
  static double subHeading = 22;
  static double heading20 = 20;
  static double heading18 = 18;
  static double regularText = 16;
  static double smallText = 14;
  static double extraSmallText = 12;
  static double textFieldRadius = 11.0;

  static Locale currentLocale = const Locale('en', 'US');

  static ScrollPhysics scrollPhysics = const BouncingScrollPhysics();

  static List<String> tableHeaders = ['No', 'Name', 'EID No', 'DOB', 'Contact No.'];
  static List<int> tableCellValues = [1, 2, 2, 3, 3];
  static List<String> tabs = ["WPS", "NonWps"];

  static List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
}
