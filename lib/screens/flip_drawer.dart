import 'package:flutter/material.dart';

class FlipDrawer extends StatefulWidget {
  @override
  _FlipDrawerState createState() => _FlipDrawerState();
}

class _FlipDrawerState extends State<FlipDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flip Drawer"),
      ),
      body: Center(
        child: Container(
          child: Text("Flip Drawer"),
        ),
      ),
    );
  }
}
