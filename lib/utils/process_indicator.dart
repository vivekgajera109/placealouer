import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:placealouer/constant/app_colors.dart';

class Circle {
  static final _instance = Circle.internal();

  factory Circle() => _instance;

  Circle.internal();

  static bool entry = false;
  static OverlayEntry viewEntry = OverlayEntry(builder: (BuildContext context) {
    return const ProcessIndicator();
  });

  // InternetError internetError = InternetError();

  show(context) async {
    return addOverlayEntry(context);
  }

  void hide(context) => removeOverlay();

  addOverlayEntry(context) async {
    if (entry == true) return;
    entry = true;
    return addOverlay(viewEntry, context);
  }

  addOverlay(OverlayEntry entry, context) async {
    try {
      return Overlay.of(context).insert(entry);
    } catch (e) {
      return Future.error(e);
    }
  }

  removeOverlay() async {
    try {
      if (entry == true) {
        entry = false;
        viewEntry.remove();
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class ProcessIndicator extends StatelessWidget {
  const ProcessIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(),
          // color: Colors.transparent,
          child: const CircularProgressIndicator(
            strokeWidth: 3,
            color: appBlackColor,
          ),
        ),
      ),
    );
  }
}
