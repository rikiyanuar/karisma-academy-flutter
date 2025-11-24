import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.all(20),
      child: Image.asset("assets/logo-nav.png"),
    );
  }
}
