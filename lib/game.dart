import 'dart:ui';

import 'package:fight_for_initiative/orchestrator/orchestrator.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

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
      width: 1280,
      height: 720,
    );
  }

  @override
  Future<void> onLoad() async {}
}

class FFIWorld extends World with HasGameReference {
  Orchestrator? _orchestrator;

  Orchestrator get orchestrator => _orchestrator ??= _getOrchestrator();

  Field? _field;

  Field get field => _field ??= _getField();

  @override
  Future<void> onLoad() async {
    add(orchestrator);
    add(field);
  }

  Orchestrator _getOrchestrator() {
    final orchestrator = Orchestrator();
    return orchestrator;
  }

  Field _getField() {
    final field = Field(game.size);
    return field;
  }
}
