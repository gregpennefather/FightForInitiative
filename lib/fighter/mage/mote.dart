import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class MageMote extends CircleComponent with HasGameReference, HasWorldReference {
  static const pathRadius = 60.0;
  static const pathAmplitude = 45.0;

  PositionComponent? parentPositionProvider;

  static final paths = [
    Path()
      ..relativeQuadraticBezierTo(pathRadius / 2, pathAmplitude, pathRadius, 0),
    Path()..relativeQuadraticBezierTo(
      -pathRadius / 2,
      -pathAmplitude,
      -pathRadius,
      0,
    ),
    Path()..relativeQuadraticBezierTo(
      -pathRadius / 2,
      pathAmplitude,
      -pathRadius,
      0,
    ),
    Path()..relativeQuadraticBezierTo(
      pathRadius / 2,
      -pathAmplitude,
      pathRadius,
      0,
    ),
  ];

  static final startPositions = [
    Vector2(50.0, 0),
    Vector2(100.0, 0),
    Vector2(50.0, 0),
  ];

  late SequenceEffect effect;
  MageMote(int startPosition)
    : super(
        radius: 5.0,
        position: startPositions[startPosition],
        anchor: Anchor.center,
        paint: Paint()..color = Colors.orange,
        priority: 10,
      ) {
    effect = SequenceEffect([
      MoveAlongPathEffect(
        paths[startPosition],
        CurvedEffectController(1, Curves.linear),
      ),
      MoveAlongPathEffect(
        paths[(startPosition + 1) % 4],
        CurvedEffectController(1, Curves.linear),
      ),
      MoveAlongPathEffect(
        paths[(startPosition + 2) % 4],
        CurvedEffectController(1, Curves.linear),
      ),
      MoveAlongPathEffect(
        paths[(startPosition + 3) % 4],
        CurvedEffectController(1, Curves.linear),
      ),
    ], infinite: true);

    switch (startPosition) {
      case (0):
        paint = Paint()..color = Colors.deepOrange;
      case (1):
        paint = Paint()..color = Colors.yellow;
      case (2):
        paint = Paint()..color = Colors.red;
      default:
        paint = Paint()..color = Colors.white;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(effect);
    parentPositionProvider = ancestors()
        .whereType<PositionComponent>()
        .firstOrNull;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (parentPositionProvider != null) {
      game.add(
        ParticleSystemComponent(
          particle: ScalingParticle(
            child: CircleParticle(paint: paint, radius: 5.0, lifespan: 0.5),
          ),
          position: (game.canvasSize/2) + absoluteCenter,
          priority: 5,
        ),
      );
    }
  }
}
