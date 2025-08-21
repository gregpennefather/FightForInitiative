import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class FighterPalette {
  final PaletteEntry base;
  final PaletteEntry accent;

  const FighterPalette(this.base, this.accent);
}

class FighterPalettes {
  static const FighterPalette purple = FighterPalette(
    PaletteEntry(Colors.deepPurple),
    PaletteEntry(Colors.deepPurpleAccent),
  );
  static const FighterPalette green = FighterPalette(
    PaletteEntry(Colors.green),
    PaletteEntry(Colors.greenAccent),
  );
}
