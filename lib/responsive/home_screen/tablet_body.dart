import 'package:flutter/material.dart';

class TabletHomeScreen extends  StatelessWidget {
  const TabletHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:
      Image(image: AssetImage("assets/images/bills.png"),)
      ),
    );
  }
}
