import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:fight_for_initiative/game.dart';

class Field extends RectangleComponent
    with TapCallbacks, HasWorldReference<FFIWorld> {
  Field(Vector2 parentSize)
    : super.relative(
        Vector2(1.0, 1.0),
        parentSize: parentSize,
        position: -parentSize / 2,
        paint: Paint()..color = const Color.fromRGBO(0, 0, 0, 0),
        priority: 0,
      );

  @override
  void onLongTapDown(TapDownEvent event) {
    // world.add(
    //   MageFighter(
    //     event.localPosition + position,
    //     Paint()..color = Colors.deepPurple,
    //     30.0
    //   ),
    // );
  }
}
