import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Child(),)),
        child: Text("str"));
  }
}


class Child extends StatelessWidget {
   Child({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
