import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findPartialText(String text) {
  return find.byWidgetPredicate(
    (widget) => widget is Text && (widget).data!.contains(text),
    description: 'Text containing "$text"',
  );
}
