import 'package:flutter/material.dart';

class IGeneralProvider extends ChangeNotifier {
  IGeneralProvider(BuildContext context, {init = true}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (init) {}
    });
  }
}
