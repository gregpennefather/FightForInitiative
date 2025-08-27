import 'package:fight_for_initiative/fighter/fighter.dart';
import 'package:fight_for_initiative/fighter/palettes.dart';
import 'package:flame_state_machine/flame_state_machine.dart';
import 'package:flutter/rendering.dart';

class IdleState<T extends Fighter> extends State<T> {
  late Paint bodyPaint;
  late Paint outlinePaint;

  IdleState(FighterPalette palette) {
    bodyPaint = palette.body.paint();
    outlinePaint = palette.bodyOutline.paint();
  }

  @override
  void onEnter(T owner, [State<T>? from]) {
    owner.outlinePaint = outlinePaint..strokeWidth = 3..style=PaintingStyle.stroke;
    owner.paint = bodyPaint;
  }
}
