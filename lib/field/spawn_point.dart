import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class SpawnPoint extends CircleComponent {
  bool confirmed = false;
  late Effect effect;

  SpawnPoint(Vector2 position)
    : super(
        radius: 10,
        position: position,
        anchor: Anchor.center,
        paint: Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke,
      ) {
    effect = SequenceEffect([
      SizeEffect.to(
        Vector2(80, 80),
        EffectController(
          duration: 1,
          curve: Curves.linear,
          onMax: () => confirmed = true,
        ),
      ),
      RotateEffect.by(
        2 * pi,
        InfiniteEffectController(LinearEffectController(1)),
      ),
    ]);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(effect);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset(0, size.y / 2), 3, Paint()..color = Colors.white);
  }
}
