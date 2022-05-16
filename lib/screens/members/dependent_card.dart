import 'package:flutter/material.dart';

import '../../widgets/simple_default_layout.dart';

class DependentCard extends StatelessWidget {
  const DependentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Cancel Dependent Card',
      child: body(),
    );
  }

  Widget body() {
    return Container();
  }
}
