import 'package:flutter/cupertino.dart';

extension SizedBoxHeightExtension on Widget {
  Widget sizedHeight(double value) {
    return SizedBox(
      height: value,
      child: this,
    );
  }
}

extension SizedBoxWidthExtension on Widget {
  Widget sizedWidth(double value) {
    return SizedBox(
      width: value,
      child: this,
    );
  }
}
