import 'package:draweranimationsample/screens/drawer_content_widget.dart';
import 'package:flutter/material.dart';

class ScaledDrawerPage extends StatefulWidget {
  @override
  _ScaledDrawerPageState createState() => _ScaledDrawerPageState();
}

class _ScaledDrawerPageState extends State<ScaledDrawerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController = null;
    super.dispose();
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
        .width * 80) / 100;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              MyDrawer(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.yellow,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 4 +
                            ((1 - _animationController.value) *
                                MediaQuery
                                    .of(context)
                                    .padding
                                    .top),
                        left: 8,
                        child: InkWell(
                            onTap: _toggle,
                            child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.list,
                                  size: 30,
                                  color: Colors.black,
                                ))),
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
                        child: Text("Drawer Animation Sample",
                            textAlign: TextAlign.center,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
