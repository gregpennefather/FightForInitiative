enum FighterType with BitFlags {
  archer,
  mage,
  warrior
}

mixin BitFlags on Enum {
  int get value => 1 << index;

  int operator |(other) => value | other.value;
}