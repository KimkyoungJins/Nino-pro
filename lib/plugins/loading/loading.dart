import 'dart:async';

import 'package:flutter/material.dart';

import 'container.dart';
import 'flutter_loading.dart';
import 'loading_overlay_entry.dart';

/// loading animation
enum EasyLoadingAnimationStyle {
  opacity,
  offset,
  scale,
  custom,
}

/// loading status
enum EasyLoadingStatus {
  show,
  dismiss,
}

typedef EasyLoadingStatusCallback = void Function(EasyLoadingStatus status);

class Loading {
  /// loading animationStyle, default [EasyLoadingAnimationStyle.opacity].
  late EasyLoadingAnimationStyle animationStyle;

  /// textAlign of status, default [TextAlign.center].
  late TextAlign textAlign;

  /// content padding of loading.
  late EdgeInsets contentPadding;

  /// padding of [status].
  late EdgeInsets textPadding;

  /// size of indicator, default 40.0.
  late double indicatorSize;

  /// radius of loading, default 5.0.
  late double radius;

  /// fontSize of loading, default 15.0.
  late double fontSize;

  /// width of progress indicator, default 2.0.
  late double progressWidth;

  /// width of indicator, default 4.0, only used for [EasyLoadingIndicatorType.ring, EasyLoadingIndicatorType.dualRing].
  late double lineWidth;

  /// display duration of [showSuccess] [showError] [showInfo] [showToast], default 2000ms.
  late Duration displayDuration;

  /// animation duration of indicator, default 200ms.
  late Duration animationDuration;

  /// loading custom animation, default null.
  // EasyLoadingAnimation? customAnimation;

  /// textStyle of status, default null.
  TextStyle? textStyle;

  /// color of loading status, only used for [EasyLoadingStyle.custom].
  Color? textColor;

  /// color of loading indicator, only used for [EasyLoadingStyle.custom].
  Color? indicatorColor;

  /// progress color of loading, only used for [EasyLoadingStyle.custom].
  Color? progressColor;

  /// background color of loading, only used for [EasyLoadingStyle.custom].
  Color? backgroundColor;

  /// boxShadow of loading, only used for [EasyLoadingStyle.custom].
  List<BoxShadow>? boxShadow;

  /// mask color of loading, only used for [EasyLoadingMaskType.custom].
  Color? maskColor;

  /// should allow user interactions while loading is displayed.
  bool? userInteractions;

  /// should dismiss on user tap.
  bool? dismissOnTap;

  /// indicator widget of loading
  Widget? indicatorWidget;

  /// success widget of loading
  Widget? successWidget;

  /// error widget of loading
  Widget? errorWidget;

  /// info widget of loading
  Widget? infoWidget;

  Widget? _w;

  LoadingOverlayEntry? overlayEntry;
  GlobalKey<LoadingContainerState>? _key;
  GlobalKey<LoadingContainerState>? _progressKey;
  Timer? _timer;

  Widget? get w => _w;
  GlobalKey<LoadingContainerState>? get key => _key;
  GlobalKey<LoadingContainerState>? get progressKey => _progressKey;

  final List<EasyLoadingStatusCallback> _statusCallbacks = <EasyLoadingStatusCallback>[];

  factory Loading() => _instance;
  static final Loading _instance = Loading._internal();

  Loading._internal() {
    animationStyle = EasyLoadingAnimationStyle.opacity;
    textAlign = TextAlign.center;
    indicatorSize = 40.0;
    radius = 5.0;
    fontSize = 15.0;
    progressWidth = 2.0;
    lineWidth = 4.0;
    displayDuration = const Duration(milliseconds: 2000);
    animationDuration = const Duration(milliseconds: 200);
    textPadding = const EdgeInsets.only(bottom: 10.0);
    contentPadding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 20.0,
    );
  }

  static Loading get instance => _instance;
  static bool get isShow => _instance.w != null;

  /// init EasyLoading
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, FlutterLoading(child: child));
      } else {
        return FlutterLoading(child: child);
      }
    };
  }

  /// show loading with [status] [indicator] [maskType]
  static Future<void> show({
    // String? status,
    // Widget? indicator,
    bool? dismissOnTap,
  }) {
    // Widget w = indicator ?? (_instance.indicatorWidget ?? LoadingIndicator());
    Widget w = Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
    return _instance._show(
      // status: status,
      dismissOnTap: dismissOnTap,
      // w: w,
    );
  }

  /// dismiss loading
  static Future<void> dismiss({
    bool animation = true,
  }) {
    // cancel timer
    _instance._cancelTimer();
    return _instance._dismiss(animation);
  }

  /// add loading status callback
  static void addStatusCallback(EasyLoadingStatusCallback callback) {
    if (!_instance._statusCallbacks.contains(callback)) {
      _instance._statusCallbacks.add(callback);
    }
  }

  /// remove single loading status callback
  static void removeCallback(EasyLoadingStatusCallback callback) {
    if (_instance._statusCallbacks.contains(callback)) {
      _instance._statusCallbacks.remove(callback);
    }
  }

  /// remove all loading status callback
  static void removeAllCallbacks() {
    _instance._statusCallbacks.clear();
  }

  /// show [status] [duration] [toastPosition] [maskType]
  Future<void> _show({
    // Widget? w,
    // String? status,
    Duration? duration,
    bool? dismissOnTap,
  }) async {
    assert(
      overlayEntry != null,
      'You should call Loading.init() in your MaterialApp',
    );

    bool animation = _w == null;
    _progressKey = null;
    if (_key != null) await dismiss(animation: false);

    Completer<void> completer = Completer<void>();
    _key = GlobalKey<LoadingContainerState>();
    _w = LoadingContainer(
      key: _key,
      // status: status,
      indicator: w,
      animation: animation,
      dismissOnTap: dismissOnTap,
      completer: completer,
    );
    completer.future.whenComplete(() {
      _callback(EasyLoadingStatus.show);
      if (duration != null) {
        _cancelTimer();
        _timer = Timer(duration, () async {
          await dismiss();
        });
      }
    });
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss(bool animation) async {
    if (key != null && key?.currentState == null) {
      _reset();
      return;
    }

    return key?.currentState?.dismiss(animation).whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _w = null;
    _key = null;
    _progressKey = null;
    _cancelTimer();
    _markNeedsBuild();
    _callback(EasyLoadingStatus.dismiss);
  }

  void _callback(EasyLoadingStatus status) {
    for (final EasyLoadingStatusCallback callback in _statusCallbacks) {
      callback(status);
    }
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
