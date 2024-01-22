import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  static final ResponsiveUtils _singleton = ResponsiveUtils._internal();
  static const Size _baseScreenSize = Size(375, 812);
  BuildContext? _context;

  factory ResponsiveUtils() => _singleton;

  ResponsiveUtils._internal();

  static void initialize(BuildContext context) {
    _singleton._context = context;
  }

  double get _deviceScreenHeight =>
      MediaQuery.of(_singleton._context!).size.height;

  double get _scaleRatio => _deviceScreenHeight / _baseScreenSize.height;

  double scaleValue(num value) => value * _scaleRatio;
}

extension ResponsiveExtension on num {
  double get responsive => ResponsiveUtils().scaleValue(this);
}
