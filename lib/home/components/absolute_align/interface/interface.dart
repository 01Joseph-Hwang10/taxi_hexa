import 'package:flutter/material.dart';

class AbsoluteAlignAnimation {
  const AbsoluteAlignAnimation({
    required this.isActive,
    double? horizontalMovement,
    double? verticalMovement,
    this.alignment,
  })  : horizontalMovement = horizontalMovement ?? 0,
        verticalMovement = verticalMovement ?? 0;

  final Alignment? alignment;
  final double horizontalMovement;
  final double verticalMovement;
  final bool isActive;

  double? calculateAnimatedPosX(double? value) {
    if (value == null) return null;
    if (isActive) return value + horizontalMovement;
    return value;
  }

  double? calculateAnimatedPosY(double? value) {
    if (value == null) return null;
    if (isActive) return value + verticalMovement;
    return value;
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
