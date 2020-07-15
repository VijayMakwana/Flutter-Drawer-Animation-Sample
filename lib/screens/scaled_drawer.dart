import 'package:flutter/material.dart';

class ScaledDrawer extends StatefulWidget {
  @override
  _ScaledDrawerState createState() => _ScaledDrawerState();
}

class _ScaledDrawerState extends State<ScaledDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaled Drawer"),
      ),
      body: Center(
        child: Container(
          child: Text("Scaled Drawer"),
        ),
      ),
    );
  }
}
