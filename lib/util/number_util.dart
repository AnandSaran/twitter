import 'dart:math';

class NumberUtil {
  static final NumberUtil _navigation = NumberUtil._internal();

  factory NumberUtil() {
    return _navigation;
  }

  NumberUtil._internal();

  String generateRandomNumber() {
    return new Random().nextInt(1000).toString();
  }
}
