import 'package:flutter/material.dart';

class ParallaxButton extends StatefulWidget {

  final String text;
  final GestureTapCallback onTap;

  ParallaxButton({
    Key key,
    this.text = '',
    this.onTap
  }): super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _ParallaxButtonState();
  }
}

class _ParallaxButtonState extends State<ParallaxButton> {
  double _width = 0;
  double _height = 0;

  bool _panning = false;
  double _currX = 0.0;
  double _currY = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    double xRatio = _currX / _width;
    double yRatio = _currY / _height;

    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_panning ? (0.3 * yRatio * 2 - 0.3) : 0)
          ..rotateY(_panning ? -(0.3 * xRatio * 2 - 0.3) : 0),
        alignment: FractionalOffset.center,
        child: GestureDetector(
            onTap: widget.onTap,
            onPanCancel: () => setState(() => _panning = false),
            onPanDown: (details) => setState(() => _panning = true),
            onPanUpdate: _updatePanningPosition,
            onPanEnd: (details) => setState(() => _panning = false),
            child: Stack(
              children: <Widget>[
                Container(),
                Text(widget.text)
              ],
            )
        )
    );
  }

  void _updatePanningPosition(DragUpdateDetails details) {

    double x = details.localPosition.dx;
    double y = details.localPosition.dy;

    if (x > 0 && x < _width && y > 0 && y < _height) {
      setState(() {
        _currX = x;
        _currY = y;
      });
    }

  }
}
