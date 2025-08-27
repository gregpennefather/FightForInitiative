import 'dart:ui';

import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';
import 'package:flame_state_machine/flame_state_machine.dart';

class DeadState<T extends Fighter> extends State<T> {
  late Paint bodyPaint;
  late Paint outlinePaint;

  DeadState() {
    bodyPaint = FighterPalettes.deadBody.paint();
    outlinePaint = FighterPalettes.deadBodyOutline.paint();
  }

  @override
  void onEnter(T owner, [State<T>? from]) {
    owner.outlinePaint = outlinePaint..strokeWidth = 3..style=PaintingStyle.stroke;
    owner.paint = bodyPaint;
  }
}