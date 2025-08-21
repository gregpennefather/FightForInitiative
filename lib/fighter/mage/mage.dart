import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/mage/mote.dart';

class MageFighter extends Fighter {
  MageFighter(super.position, super.paint, super.radius, super.key);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(MageMote(0));
    add(MageMote(1));
    add(MageMote(2));
  }
}
