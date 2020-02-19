import 'package:flutter/material.dart';
import 'dart:math' as math;

const kScaleFactor = 1.1;
const kDisabledButtonTextColor = Color(0x80FFFFFF);
const kTextStyleSubhead1 = TextStyle(
  color: Colors.white,
  fontSize: 16 * kScaleFactor,
);
const kYellow = Color(0xFFffd530);

const kSecondaryDarkBlue = Color(0xFF012e47);
const kMidToneBlue = Color(0xFF0083cb);
final kMidToneBlue85 = kMidToneBlue.withOpacity(0.85);

enum MyButtonStyle {
  primary,
  secondary,
}

class MyButton extends StatefulWidget {
  const MyButton({
    Key key,
    this.title,
    @required this.onPressed,
    this.style = MyButtonStyle.primary,
    this.selected = false,
  }) : super(key: key);

  final String title;

  /// Touch callback
  final VoidCallback onPressed;
  final MyButtonStyle style;
  final bool selected;

  @override
  _MyButtonState createState() => _MyButtonState();
}

const kGradientAngleDeg = 45.0;
const kGradientAngleRadians = kGradientAngleDeg * (math.pi / 180.0);

class _MyButtonState extends State<MyButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradient = LinearGradient(
      colors: <Color>[
        Color(0xFF0083cb),
        Color(0xFF424cc4),
        Color(0xFF8314bd),
      ],
      transform: GradientRotation(kGradientAngleRadians),
    );

    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0 * kScaleFactor),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: _buttonBackgroundColor(),
            borderRadius: BorderRadius.circular(20.0 * kScaleFactor),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0 * kScaleFactor),
              ),
              onTap: widget.onPressed,
              onHighlightChanged: (woof) {
                setState(() => _pressed = woof);
              },
              child: Container(
                child: Text(
                  widget.title,
                  style: kTextStyleSubhead1.apply(color: _buttonTextColor()),
                ),
                alignment: Alignment.center,
                height: 36.0 * kScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _buttonTextColor() {
    return Colors.white;
  }

  Color _buttonBackgroundColor() {
    switch (widget.style) {
      case MyButtonStyle.primary:
        return Colors.transparent;
      case MyButtonStyle.secondary:
        return widget.selected ? kMidToneBlue85 : kSecondaryDarkBlue;
      default:
        throw 'Unknown button style: ${widget.style}';
    }
  }
}

class SolidPainter extends CustomPainter {
  const SolidPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint p = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
