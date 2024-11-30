import 'package:flutter/material.dart';

import 'loading.dart';
import 'loading_overlay_entry.dart';

class FlutterLoading extends StatefulWidget {
  final Widget? child;

  const FlutterLoading({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  _FlutterLoadingState createState() => _FlutterLoadingState();
}

class _FlutterLoadingState extends State<FlutterLoading> {
  late LoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = LoadingOverlayEntry(
      builder: (BuildContext context) => Loading.instance.w ?? Container(),
    );
    Loading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          LoadingOverlayEntry(
            builder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
