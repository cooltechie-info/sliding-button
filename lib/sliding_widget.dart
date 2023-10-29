library sliding_button;

import 'package:flutter/material.dart';

class SlidingWidget extends StatefulWidget {
  /// This is the height of the widget - [double]
  final double height;

  /// This is the width of the widget - [double]
  final double width;

  /// This is the background color of the sliding widget - [Color]
  final Color backgroundColor;

  /// This is the background color of the widget when slided - [Color]
  final Color? backgroundColorEnd;

  /// This is the foreground color of the widget - [Color]
  final Color foregroundColor;

  /// This is the icon color of the widget - [Color]
  final Color iconColor;

  /// This is the child widget for the sliding widget - [Widget]
  final Widget child;

  /// This is the shadow effect of the widget - [BoxShadow]
  final BoxShadow? shadow;

  /// This is the display text for the widget - [String]
  final String label;

  /// This is the text style for the display / button text of the sliding widget - [TextStyle]
  final TextStyle? labelStyle;

  /// This is the callback function of the widget when tapped - [VoidCallback]
  final VoidCallback action;

  /// This is the callback function of the widget when tapped down - [VoidCallback]
  final VoidCallback? onTapDown;

  /// This is the callback function of the widget when tapped up- [VoidCallback]
  final VoidCallback? onTapUp;

  /// This is the foreground shape / border of the widget - [BorderRadius]
  final BorderRadius? foregroundShape;

  /// This is the background shape / border of the widget - [BorderRadius]
  final BorderRadius? backgroundShape;

  /// This is the condtion check for sticking to the end on completion of the widget - [bool]
  final bool stickToEnd;

  const SlidingWidget({
    super.key,
    this.height = 70,
    this.width = 300,
    this.backgroundColor = Colors.white,
    this.backgroundColorEnd,
    this.foregroundColor = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.shadow,
    this.child = const Icon(
      Icons.chevron_right,
      color: Colors.white,
      size: 35,
    ),
    this.label = "Slide to proceed",
    this.labelStyle,
    required this.action,
    this.onTapDown,
    this.onTapUp,
    this.foregroundShape,
    this.backgroundShape,
    this.stickToEnd = false,
  }) : assert(height >= 25 && width >= 250);

  @override
  State<StatefulWidget> createState() {
    return SlidingWidgetState();
  }
}

class SlidingWidgetState extends State<SlidingWidget> {
  /// This is to hold the current position when dragged
  double _position = 0;

  /// This is the duration value for sliding animation
  int _duration = 0;

  /// This method is to determine the position of the widget when dragged
  double getPosition() {
    if (_position < 0) {
      return 0;
    } else if (_position > widget.width - widget.height) {
      return widget.width - widget.height;
    } else {
      return _position;
    }
  }

  /// This method is to update the position of the widget when dragged
  void updatePosition(details) {
    if (details is DragEndDetails) {
      setState(() {
        _duration = 600;
        if (widget.stickToEnd && _position > widget.width - widget.height) {
          _position = widget.width - widget.height;
        } else {
          _position = 0;
        }
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _duration = 0;
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  /// This method indicates the button gesture input details
  void sliderReleased(details) {
    if (_position > widget.width - widget.height) {
      widget.action();
    }
    updatePosition(details);
  }

  Color calculateBackground() {
    if (widget.backgroundColorEnd != null) {
      double percent;

      // calculates the percentage of the position of the slider
      if (_position > widget.width - widget.height) {
        percent = 1.0;
      } else if (_position / (widget.width - widget.height) > 0) {
        percent = _position / (widget.width - widget.height);
      } else {
        percent = 0.0;
      }

      int red = widget.backgroundColorEnd!.red;
      int green = widget.backgroundColorEnd!.green;
      int blue = widget.backgroundColorEnd!.blue;

      return Color.alphaBlend(
          Color.fromRGBO(red, green, blue, percent), widget.backgroundColor);
    } else {
      return widget.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxShadow shadow;
    if (widget.shadow == null) {
      shadow = const BoxShadow(
        color: Colors.black38,
        offset: Offset(0, 2),
        blurRadius: 2,
        spreadRadius: 0,
      );
    } else {
      shadow = widget.shadow!;
    }

    TextStyle style;
    if (widget.labelStyle == null) {
      style = const TextStyle(
        fontSize: 22,
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      );
    } else {
      style = widget.labelStyle!;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: _duration),
      curve: Curves.ease,
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: widget.backgroundShape ??
            BorderRadius.all(Radius.circular(widget.height)),
        color: widget.backgroundColorEnd != null
            ? calculateBackground()
            : widget.backgroundColor,
        boxShadow: <BoxShadow>[shadow],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              widget.label,
              style: style,
            ),
          ),
          Positioned(
            left: widget.height / 2,
            child: AnimatedContainer(
              height: widget.height - 10,
              width: getPosition(),
              duration: Duration(milliseconds: _duration),
              curve: Curves.ease,
              decoration: BoxDecoration(
                borderRadius: widget.backgroundShape ??
                    BorderRadius.all(Radius.circular(widget.height)),
                color: widget.backgroundColorEnd != null
                    ? calculateBackground()
                    : widget.backgroundColor,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: _duration),
            curve: Curves.bounceOut,
            left: getPosition(),
            top: 0,
            child: GestureDetector(
              onTapDown: (_) =>
                  widget.onTapDown != null ? widget.onTapDown!() : null,
              onTapUp: (_) => widget.onTapUp != null ? widget.onTapUp!() : null,
              onPanUpdate: (details) {
                updatePosition(details);
              },
              onPanEnd: (details) {
                if (widget.onTapUp != null) widget.onTapUp!();
                sliderReleased(details);
              },
              child: Container(
                height: widget.height - 10,
                width: widget.height - 10,
                decoration: BoxDecoration(
                  borderRadius: widget.foregroundShape ??
                      BorderRadius.all(Radius.circular(widget.height / 2)),
                  color: widget.foregroundColor,
                ),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
