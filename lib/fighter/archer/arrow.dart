import 'dart:async';

import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class ArrowProjectile extends PositionComponent {
  late Fighter target;
  late Vector2 targetPosition;
  late MoveToEffect effect;

  ArrowProjectile(Vector2 position, this.target, this.targetPosition) : super (position: position);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    lookAt(targetPosition);
    effect = MoveToEffect(targetPosition, LinearEffectController(0.75), onComplete: hit);
    add(effect);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(2, 0, 4, 50), Paint()..color=Colors.brown);
  }

  hit() {
    target.killed();
    removeFromParent();
  }
}