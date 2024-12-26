// other_page.dart
import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Services"),
        backgroundColor: Color(0xff40dedf),
      ),
      body: Center(
        child: Text(
          "Welcome to the Other Services page!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
