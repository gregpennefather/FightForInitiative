import 'dart:math';

import 'package:fight_for_initiative/fighter/archer/archer.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dart';
import 'package:fight_for_initiative/fighter/warrior/warrior.dart';
import 'package:fight_for_initiative/orchestrator/fighter_type.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Orchestrator extends Component with HasWorldReference {
  final double _radius = 30.0;
  late List<ComponentKey?> fighterKeys;

  Orchestrator() : super(key: ComponentKey.named("Orchestrator")) {
    fighterKeys = List<ComponentKey?>.filled(3, null);
  }

  int get unassignedFighters =>
      fighterKeys.where((element) => element == null).length;

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
    var keys = fighterKeys.indexed.where((e) => e.$2 == null).toList();
    var rnd = Random();
    FighterType selectedKey =
        FighterType.values[keys[keys.length > 1
                ? rnd.nextIntBetween(0, keys.length - 1)
                : 0]
            .$1];

    var newComponent = switch (selectedKey) {
      FighterType.archer => ArcherFighter(position, _radius),
      FighterType.mage => MageFighter(position, _radius),
      FighterType.warrior => WarriorFighter(position, _radius),
    };

    fighterKeys[selectedKey.index] = newComponent.key;
    return newComponent;
  }
}
