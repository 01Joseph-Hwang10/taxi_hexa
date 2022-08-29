import 'package:flutter/material.dart';

class AbsoluteAlign extends StatelessWidget {
  const AbsoluteAlign({
    Key? key,
    Alignment? alignment,
    required this.child,
    this.width,
    this.height,
  })  : alignment = alignment ?? Alignment.topLeft,
        super(key: key);

  final Alignment alignment;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final position = AbsoluteAlignPosition(
      context: context,
      alignment: alignment,
      horizontalMovement: 0,
      verticalMovement: 0,
      isActive: false,
    );
    return Positioned(
      top: position.top,
      left: position.left,
      bottom: position.bottom,
      right: position.right,
      width: width,
      height: height,
      child: child,
    );
  }
}

class AbsoluteAlignPosition {
  AbsoluteAlignPosition({
    Alignment? alignment,
    required this.context,
    required this.horizontalMovement,
    required this.verticalMovement,
    required this.isActive,
  }) : alignment = alignment ?? Alignment.topLeft;

  final BuildContext context;
  final Alignment alignment;
  final double horizontalMovement;
  final double verticalMovement;
  final bool isActive;

  double? get top => _top();
  double? get left => _left();
  double? get bottom => _bottom();
  double? get right => _right();

  double? _top() {
    double halfHeight = MediaQuery.of(context).size.height / 2;
    switch (alignment.toString()) {
      case 'Alignment.topLeft':
      case 'Alignment.topCenter':
      case 'Alignment.topRight':
        return isActive ? 0 + verticalMovement : 0;
      case 'Alignment.centerLeft':
      case 'Alignment.center':
      case 'Alignment.centerRight':
        return isActive ? halfHeight + verticalMovement : halfHeight;
      default:
        return null;
    }
  }

  double? _left() {
    double halfWidth = MediaQuery.of(context).size.width / 2;
    switch (alignment.toString()) {
      case 'Alignment.topLeft':
      case 'Alignment.centerLeft':
      case 'Alignment.bottomLeft':
        return isActive ? 0 + horizontalMovement : 0;
      case 'Alignment.topCenter':
      case 'Alignment.center':
      case 'Alignment.bottomCenter':
        return isActive ? halfWidth + horizontalMovement : halfWidth;
      default:
        return null;
    }
  }

  double? _bottom() {
    switch (alignment.toString()) {
      case 'Alignment.bottomLeft':
      case 'Alignment.bottomCenter':
      case 'Alignment.bottomRight':
        return isActive ? 0 - verticalMovement : 0;
      default:
        return null;
    }
  }

  double? _right() {
    switch (alignment.toString()) {
      case 'Alignment.topRight':
      case 'Alignment.centerRight':
      case 'Alignment.bottomRight':
        return isActive ? 0 - horizontalMovement : 0;
      default:
        return null;
    }
  }
}
