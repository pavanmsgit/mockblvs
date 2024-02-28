import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}


///HIDES OR CLOSES KEYBOARD
closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}


showSpinner() {
  NavigationService.navigatorKey.currentContext?.loaderOverlay.show();
}


showSpinnerCustom({Widget? customWidget}) {
  NavigationService.navigatorKey.currentContext?.loaderOverlay.show(
    widget: customWidget
  );
}


hideSpinner() {
  NavigationService.navigatorKey.currentContext?.loaderOverlay.hide();
}
