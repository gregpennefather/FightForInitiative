import 'dart:ui';
import 'package:fight_for_initiative/fighter/dead.state.dart';
import 'package:fight_for_initiative/fighter/idle.state.dart';
import 'package:flame/components.dart';
import 'package:flame_state_machine/flame_state_machine.dart';
import 'package:flutter/material.dart' hide State;
import 'package:fight_for_initiative/fighter/palettes.dart';

class Fighter extends CircleComponent
    with HasStates<Fighter>, HasWorldReference, HasGameReference {
  @override
  late final StateMachine<Fighter> stateMachine;
  late Paint outlinePaint;
  bool isAlive = true;

  Fighter(
    Vector2 position,
    double radius,
    State<Fighter> idleState,
    State<Fighter> deadState,
    ComponentKey? key,
  ) : super(
        radius: radius,
        position: position,
        anchor: Anchor.center,
        paint: Paint(),
        priority: 5,
        key: key,
      ) {
    stateMachine = StateMachine<Fighter>(owner: this, initialState: idleState);
    stateMachine.register(
      to: (deadState),
      guard: (fighter) => !fighter.isAlive,
      priority: 100,
    );
  }

  registerStates(IdleState idle, DeadState dead) {}

  @override
  Future<void> render(Canvas canvas) async {
    super.render(canvas);
    canvas.drawCircle(Offset(radius, radius), radius, outlinePaint);
  }

  void killed() async {
    isAlive = false;
  }
}
