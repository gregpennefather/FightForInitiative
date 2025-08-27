import 'dart:ui';

import 'package:fight_for_initiative/field/spawn_point.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:fight_for_initiative/game.dart';

const double spawnTapDistanceThreshold = 100;

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

  int get spawnPointCount => children.query<SpawnPoint>().length;

  bool get canSpawnNewPoint => spawnPointCount < world.orchestrator.unassignedFighters;

  @override
  void onLongTapDown(TapDownEvent event) {
    if (canSpawnNewPoint && existingSpawnPoint(event.localPosition) == null) {
      add(SpawnPoint(event.localPosition));
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    if (children.isNotEmpty) {
      if (existingSpawnPoint(event.localPosition) case var spawnPoint?) {
        if (spawnPoint.confirmed) {
          world.orchestrator.trySpawn(position + spawnPoint.position);
        }
        remove(spawnPoint);
      }
    }
  }

  SpawnPoint? existingSpawnPoint(Vector2 position) {
    for (final child in children.query<SpawnPoint>()) {
      if (child.position.distanceTo(position) < spawnTapDistanceThreshold && !child.isRemoving) {
        return child;
      }
    }
    return null;
  }
}
