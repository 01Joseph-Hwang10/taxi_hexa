import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/absolute_align/interface/interface.dart';

class AbsoluteAlign extends StatelessWidget {
  const AbsoluteAlign({
    Key? key,
    Alignment? alignment,
    bool? safearea,
    required this.child,
    this.width,
    this.height,
    this.animation,
  })  : alignment = alignment ?? Alignment.topLeft,
        safearea = safearea ?? false,
        super(key: key);

  final Alignment alignment;
  final Widget child;
  final double? width;
  final double? height;
  final bool safearea;
  final AbsoluteAlignAnimation? animation;

  @override
  Widget build(BuildContext context) {
    if (animation != null) {
      final position = calculatePosition(
        context,
        animation!.alignment ?? alignment,
      );
      return AnimatedPositioned(
        top: animation!.calculateAnimatedPosY(position.top),
        left: animation!.calculateAnimatedPosX(position.left),
        bottom: animation!.calculateAnimatedPosY(position.bottom),
        right: animation!.calculateAnimatedPosX(position.right),
        width: width,
        height: height,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: buildInner(context),
      );
    } else {
      final position = calculatePosition(context, alignment);
      return Positioned(
        top: position.top,
        left: position.left,
        bottom: position.bottom,
        right: position.right,
        width: width,
        height: height,
        child: buildInner(context),
      );
    }
  }

  Widget buildInner(BuildContext context) {
    if (safearea) {
      return SafeArea(
        child: child,
      );
    } else {
      return child;
    }
  }

  AbsoluteAlignPosition calculatePosition(
    BuildContext context,
    Alignment alignment,
  ) {
    final position = AbsoluteAlignPosition(
      context: context,
      alignment: alignment,
      horizontalMovement: 0,
      verticalMovement: 0,
      isActive: false,
    );
    return position;
  }
}
