import 'package:fight_for_initiative/fighter/archer/arrow.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class ArcherFighter extends Fighter with TapCallbacks {
  ArcherFighter(super.position, super.paint, super.radius, super.key);

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    beginAttack(ComponentKey.named("MageFighter"));
  }

  void beginAttack(ComponentKey target) {
    var targetComponent = game.findByKey<PositionComponent>(target);
    world.add(ArrowProjectile(position, targetComponent!.position));
  }
}
