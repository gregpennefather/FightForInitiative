enum FighterFlag with BitFlags {
  archer,
  mage
}

mixin BitFlags on Enum {
  int get value => 1 << index;

  int operator |(other) => value | other.value;
}