import 'package:fight_for_initiative/fighter/archer/archer.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dart';
import 'package:fight_for_initiative/orchestrator/fighters.flag.dart';
import 'package:flame/components.dart';

class Orchestrator extends Component with HasWorldReference {
  final double _radius = 45.0;
  late List<ComponentKey?> fighterKeys;

  Orchestrator(): super(key: ComponentKey.named("Orchestrator")) {
    fighterKeys = List<ComponentKey?>.filled(2, null);
  }

  void trySpawn(Vector2 position) {
    if (fighterKeys.any((cKey) => cKey == null)) {
      spawnFighter(position);
    } else {
      print("Cannot spawn more fighters");
    }
  }

  Future<void> spawnFighter(Vector2 position) async {
    world.add(randomFighter(position));
  }

  Fighter randomFighter(Vector2 position) {
    if (fighterKeys[FighterFlag.archer.index] == null) {
      fighterKeys[FighterFlag.archer.index] = ComponentKey.named(
        "ArcherFighter",
      );

      return ArcherFighter(
        position,
        _radius,
        fighterKeys[FighterFlag.archer.index],
      );
    } else if (fighterKeys[FighterFlag.mage.index] == null) {
      fighterKeys[FighterFlag.mage.index] = ComponentKey.named("MageFighter");
      return MageFighter(
        position,
        _radius,
        fighterKeys[FighterFlag.mage.index],
      );
    }

    throw AssertionError("No fighter type available");
  }
}
