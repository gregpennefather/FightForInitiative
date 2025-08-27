import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class FighterPalette {
  final PaletteEntry body;
  final PaletteEntry bodyOutline;
  final PaletteEntry deadBody;
  final PaletteEntry deadBodyOutline;

  const FighterPalette(this.body, this.bodyOutline, this.deadBody, this.deadBodyOutline);
}

class FighterPalettes {
  static const deadBody =  PaletteEntry(Color(0xFF9E9E9E));
  static const deadBodyOutline =  PaletteEntry(Color(0xFF424242));
  static const FighterPalette mage = FighterPalette(
    PaletteEntry(Colors.deepPurple),
    PaletteEntry(Color(0xFF512DA8)),
    deadBody,
    deadBodyOutline
  );
  static const FighterPalette archer = FighterPalette(
    PaletteEntry(Colors.green),
    PaletteEntry(Color(0xFF2E7D32)),
    deadBody,
    deadBodyOutline
  );
  static const FighterPalette warrior = FighterPalette(
    PaletteEntry(Colors.brown),
    PaletteEntry(Color(0xFF4E342E)),
    deadBody,
    deadBodyOutline
  );
}
