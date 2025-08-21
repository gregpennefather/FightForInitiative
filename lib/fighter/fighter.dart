import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';

class Fighter extends CircleComponent with HasWorldReference, HasGameReference {
  final FighterPalette palette;
  Fighter(Vector2 position, this.palette, double radius, ComponentKey? key)
    : super(
        radius: radius,
        position: position,
        anchor: Anchor.center,
        paint: palette.base.paint(),
        priority: 5,
        key: key,
      );

  @override
  Future<void> render(Canvas canvas) async {
    super.render(canvas);
    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      Paint()
        ..color = palette.accent.color
        ..style = PaintingStyle.stroke,
    );
  }
}
