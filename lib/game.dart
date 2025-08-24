import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:fight_for_initiative/fighter/archer/archer.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';

import 'field/field.dart';

class FightForInitiativeGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  // ignore: overridden_fields
  bool debugMode = false;

  FightForInitiativeGame(FFIWorld world) {
    super.world = world;
    super.camera = CameraComponent.withFixedResolution(
      world: world,
      width: 800,
      height: 600,
    );
  }

  @override
  Future<void> onLoad() async {}
}

class FFIWorld extends World with HasGameReference {
  @override
  Future<void> onLoad() async {
    add(Field(game.size));
    add(
      MageFighter(Vector2(-200, 00), 35.0, ComponentKey.named("MageFighter")),
    );
    add(
      ArcherFighter(
        Vector2(300, -50),
        35.0,
        ComponentKey.named("ArcherFighter"),
      ),
    );
  }
}
