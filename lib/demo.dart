import 'package:flutter/material.dart';

import 'widgets/simple_default_layout.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: '',
      child: body(),
    );
  }

  Widget body() {
    return Container();
  }
}