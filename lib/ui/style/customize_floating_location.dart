import 'package:flutter/material.dart';

class SimpleFloatingLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset offset =
        FloatingActionButtonLocation.endFloat.getOffset(scaffoldGeometry);
    return Offset(offset.dx + 0, offset.dy + (-50));
  }
}
