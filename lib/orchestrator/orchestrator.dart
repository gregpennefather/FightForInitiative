import 'dart:async';
import 'dart:math';

import 'package:fight_for_initiative/fighter/archer/archer.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dart';
import 'package:fight_for_initiative/fighter/warrior/warrior.dart';
import 'package:fight_for_initiative/game.dart';
import 'package:fight_for_initiative/orchestrator/fighter_type.dart';
import 'package:fight_for_initiative/orchestrator/orchestrator_countdown.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Orchestrator extends Component with HasWorldReference<FFIWorld> {
  final double _radius = 30.0;
  late List<ComponentKey?> fighterKeys;
  late OrchestratorCountdown countdownComponent;

  Orchestrator() : super(key: ComponentKey.named("Orchestrator")) {
    fighterKeys = List<ComponentKey?>.filled(3, null);
  }

  int get fighterCount => fighterKeys.where((e) => e != null).length;

  int get unassignedFighters => fighterKeys.length - fighterCount;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    countdownComponent = OrchestratorCountdown(Vector2.zero(), 5);
    add(countdownComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    var readyToFight = fighterCount > 1 && world.field.spawnPointCount == 0;
    if (!countdownComponent.running && readyToFight) {
      countdownComponent.start();
    } else if (countdownComponent.running && !readyToFight) {
      countdownComponent.stop();
    }
  }

  void timerComplete() {
    print("timer complete");
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
