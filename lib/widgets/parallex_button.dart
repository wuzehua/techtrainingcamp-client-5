import 'package:flutter/material.dart';

class ParallaxButton extends StatefulWidget {

  final String text;
  final GestureTapCallback onTap;
  final Size backgroundSize;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double cornerRadius;

  ParallaxButton({
    Key key,
    this.text = '',
    this.onTap,
    this.backgroundSize = Size.zero,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.cornerRadius = 10
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
    _width = widget.backgroundSize.width;
    _height = widget.backgroundSize.height;
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
            child: Container(
              width: widget.backgroundSize.width,
              height: widget.backgroundSize.height,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(
                      _panning ? (8 * xRatio * 2 - 8) : 0.0,
                      _panning ? (8 * yRatio * 2 - 8) : 0.0,
                      0.0),
                alignment: FractionalOffset.center,
                child: Center(
                    child: Text(
                      widget.text,
                      style: widget.textStyle,
                    )
                ),
              ),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.cornerRadius)
              ),
            )
        )
    );
  }

  void _updatePanningPosition(DragUpdateDetails details) {

    double x = details.localPosition.dx;
    double y = details.localPosition.dy;

    double newX = _currX;
    double newY = _currY;

    if (x > 0 && x < _width) {
      newX = x;
    }

    if (y > 0 && y < _height) {
      newY = y;
    }

    setState(() {
      _currX = newX;
      _currY = newY;
    });

  }
}
