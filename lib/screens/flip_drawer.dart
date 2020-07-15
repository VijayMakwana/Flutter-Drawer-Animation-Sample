import 'dart:math' as math;

import 'package:flutter/material.dart';


class FlipDrawerPage extends StatefulWidget {
  @override
  _FlipDrawerPageState createState() => _FlipDrawerPageState();
}

class _FlipDrawerPageState extends State<FlipDrawerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    super.initState();
  }

  void _toggle() =>
      _animationController.isDismissed
          ? _animationController.forward()
          : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    double maxSlide = (MediaQuery
        .of(context)
        .size
        .width * 85) / 100;
    double screenWidth = (MediaQuery
        .of(context)
        .size
        .width * 85) / 100;
    var greyContainer = Container(
      color: Colors.grey,
    );

    var yellowContainer = Container(
      color: Colors.yellow,
    );

    var blueContainer = Container(
      width: maxSlide,
      color: Colors.blue,
    );

    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return Stack(
              children: <Widget>[
                greyContainer,
                Transform.translate(
                  offset:
                  Offset(screenWidth * (_animationController.value - 1), 0),
                  child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                          (math.pi / 2 * (1 - _animationController.value)),
                        ),
                      alignment: Alignment.centerRight,
                      child: blueContainer),
                ),
                Transform.translate(
                  offset: Offset(_animationController.value * maxSlide, 0),
                  child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_animationController.value * -(math.pi / 2)),
                      alignment: Alignment.centerLeft,
                      child: yellowContainer),
                ),
                Positioned(
                  top: 4 + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  left: (8 * (1 - _animationController.value)) +
                      _animationController.value * maxSlide,
                  child: IconButton(
                    iconSize: 32,
                    color: Colors.black,
                    onPressed: () {
                      _toggle();
                    },
                    icon: Icon(Icons.list),
                  ),
                ),
                Positioned(
                  top: 10 + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  left: _animationController.value *
                      MediaQuery
                          .of(context)
                          .size
                          .width,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text("Animation Sample",
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6),
                ),
              ],
            );
          }),
    );
  }
}
