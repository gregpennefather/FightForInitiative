import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class ArrowProjectile extends PositionComponent {
  late Vector2 target;
  late MoveToEffect effect;

  ArrowProjectile(Vector2 position, this.target) : super (position: position);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    lookAt(target);
    effect = MoveToEffect(target, LinearEffectController(0.75), onComplete: hit);
    add(effect);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(2, 0, 4, 50), Paint()..color=Colors.brown);
  }

  hit() {
    removeFromParent();
  }
}