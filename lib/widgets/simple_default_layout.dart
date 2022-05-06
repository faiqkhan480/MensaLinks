import 'package:flutter/material.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/constants.dart';

class SimpleDefaultLayout extends StatelessWidget {
  const SimpleDefaultLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(Assets.miniLogo),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Constants.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Constants.radius,
                    ),
                    topRight: Radius.circular(
                      Constants.radius,
                    ),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
