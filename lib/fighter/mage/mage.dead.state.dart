import 'package:fight_for_initiative/fighter/dead.state.dart';
import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/mage/mage.dart';
import 'package:flame_state_machine/src/state.dart';

class MageDeadState extends DeadState<MageFighter> {
  MageDeadState();

  @override
  void onEnter(MageFighter owner, [State<Fighter>? from]) {
    super.onEnter(owner);
    owner.killMotes();
  }
}
