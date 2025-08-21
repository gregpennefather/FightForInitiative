import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:fight_for_initiative/game.dart';

void main() {
  final game = FightForInitiativeGame(FFIWorld());

  runApp(GameWidget(game: game));
}