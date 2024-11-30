import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'loading.dart';

T? _ambiguate<T>(T? value) => value;

class LoadingContainer extends StatefulWidget {
  final Widget? indicator;
  // final String? status;
  final bool? dismissOnTap;
  final Completer<void>? completer;
  final bool animation;

  const LoadingContainer({
    Key? key,
    this.indicator,
    // this.status,
    this.dismissOnTap,
    this.completer,
    this.animation = true,
  }) : super(key: key);

  @override
  LoadingContainerState createState() => LoadingContainerState();
}

class LoadingContainerState extends State<LoadingContainer>
    with SingleTickerProviderStateMixin {
  String? _status;
  Color? _maskColor;
  late AnimationController _animationController;
  late AlignmentGeometry _alignment;
  late bool _dismissOnTap, _ignoring;

  bool get isPersistentCallbacks =>
      _ambiguate(SchedulerBinding.instance)!.schedulerPhase ==
          SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    // _status = widget.status;
    // _alignment = (widget.indicator == null && widget.status?.isNotEmpty == true)
    //     ? EasyLoadingTheme.alignment(widget.toastPosition)
    //     : AlignmentDirectional.center;
    _alignment = AlignmentDirectional.center;
    // _dismissOnTap =
    //     widget.dismissOnTap ?? (EasyLoadingTheme.dismissOnTap ?? false);
    _dismissOnTap = widget.dismissOnTap ?? false;
    // _ignoring = _dismissOnTap ? false : EasyLoadingTheme.ignoring(widget.maskType);
    _ignoring = false;
    // _maskColor = EasyLoadingTheme.maskColor(widget.maskType);
    _maskColor = Colors.white.withOpacity(0.4);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addStatusListener((status) {
      bool isCompleted = widget.completer?.isCompleted ?? false;
      if (status == AnimationStatus.completed && !isCompleted) {
        widget.completer?.complete();
      }
    });
    show(widget.animation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> show(bool animation) {
    if (isPersistentCallbacks) {
      Completer<void> completer = Completer<void>();
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) =>
          completer
              .complete(_animationController.forward(from: animation ? 0 : 1)));
      return completer.future;
    } else {
      return _animationController.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      Completer<void> completer = Completer<void>();
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) =>
          completer
              .complete(_animationController.reverse(from: animation ? 1 : 0)));
      return completer.future;
    } else {
      return _animationController.reverse(from: animation ? 1 : 0);
    }
  }

  void updateStatus(String status) {
    if (_status == status) return;
    setState(() {
      _status = status;
    });
  }

  void _onTap() async {
    if (_dismissOnTap) await Loading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _alignment,
      children: <Widget>[
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _animationController.value,
              child: IgnorePointer(
                ignoring: _ignoring,
                child: _dismissOnTap
                    ? GestureDetector(
                  onTap: _onTap,
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: _maskColor,
                  ),
                )
                    : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: _maskColor,
                ),
              ),
            );
          },
        ),
        const Center(
          child: SizedBox(
            child: CircularProgressIndicator(
              color: Color(0xFF466FFF),
            ),
          ),
        ),
      ],
    );
  }
}