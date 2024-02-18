import 'package:flutter/material.dart';

class CustomizeFloatingLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) =>
      const Offset(0, -50);
}
