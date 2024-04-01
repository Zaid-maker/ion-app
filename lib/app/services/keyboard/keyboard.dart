import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

bool isKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 0;
}

void hideKeyboard(
  BuildContext context, {
  VoidCallback? callback,
}) {
  if (isKeyboardVisible(context)) {
    if (callback != null) {
      final Completer<void> completer = Completer<void>();
      final _KeyboardHiddenObserver observer =
          _KeyboardHiddenObserver(context, callback: completer.complete);
      WidgetsBinding.instance.addObserver(observer);
      FocusManager.instance.primaryFocus?.unfocus();
      completer.future.then((_) {
        WidgetsBinding.instance.removeObserver(observer);
        callback.call();
      });
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  } else {
    callback?.call();
  }
}

class _KeyboardHiddenObserver extends WidgetsBindingObserver {
  _KeyboardHiddenObserver(
    this.context, {
    required this.callback,
  });

  VoidCallback callback;

  BuildContext context;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!isKeyboardVisible(context)) {
      callback();
    }
  }
}
