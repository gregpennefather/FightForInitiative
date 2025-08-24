import 'package:fight_for_initiative/fighter/archer/arrow.dart';
import 'package:fight_for_initiative/fighter/dead.state.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/idle.state.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class ArcherFighter extends Fighter with TapCallbacks {
  ArcherFighter(
    Vector2 position,
    double radius,
    ComponentKey? key,
  ) : super(
        position,
        radius,
        IdleState(FighterPalettes.green),
        DeadState(),
        key,
      );

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    beginAttack(ComponentKey.named("MageFighter"));
  }

  void beginAttack(ComponentKey target) {
    var targetComponent = game.findByKey<Fighter>(target);
    world.add(ArrowProjectile(position, targetComponent!, targetComponent.position));
  }
}
