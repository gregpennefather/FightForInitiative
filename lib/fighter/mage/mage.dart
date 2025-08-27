import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/idle.state.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dead.state.dart';
import 'package:fight_for_initiative/fighter/mage/mote.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';
import 'package:flame/components.dart';

class MageFighter extends Fighter {
  MageFighter(Vector2 position, double radius)
    : super(
        position,
        radius,
        IdleState(FighterPalettes.mage),
        MageDeadState(),
        ComponentKey.named("MageFighter"),
      );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(MageMote(0));
    add(MageMote(1));
    add(MageMote(2));
  }

  killMotes() {
    print("KillMotes called");
  }
}
