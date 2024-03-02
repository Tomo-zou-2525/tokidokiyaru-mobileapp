import 'dart:math';

bool getRandBool(double percentage) {
  return Random().nextInt(100) <= percentage;
}
