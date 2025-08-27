import 'package:fight_for_initiative/fighter/dead.state.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/idle.state.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';
import 'package:flame/components.dart';

class WarriorFighter extends Fighter {
  WarriorFighter(Vector2 position, double radius)
    : super(
        position,
        radius,
        IdleState(FighterPalettes.warrior),
        DeadState(),
        ComponentKey.named("WarriorFighter"),
      );

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }
}
