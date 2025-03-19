import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:observables/contracts/stream_notifier.dart';

class StreamNotifierBuilder<T> extends StatefulWidget {
  final IStreamNotifier<T> streamNotifier;
  final Widget Function(BuildContext context, T state) builder;
  final bool Function(T previous, T current)? buildWhen;
  final void Function(BuildContext context, T state)? listen;

  const StreamNotifierBuilder({
    super.key,
    required this.streamNotifier,
    required this.builder,
    this.buildWhen,
    this.listen,
  });

  @override
  State<StreamNotifierBuilder<T>> createState() =>
      _StreamNotifierBuilderState<T>();
}

class _StreamNotifierBuilderState<T> extends State<StreamNotifierBuilder<T>> {
  late StreamSubscription<T>? _subscription;
  late T _state;

  @override
  void initState() {
    _state = widget.streamNotifier.state;
    _subscription = widget.streamNotifier.stream.listen((newState) {
      if (shouldRebuild(_state, newState)) {
        if (mounted) widget.listen?.call(context, newState);
        setState(() {});
      }
      _state = newState;
    });

    super.initState();
  }

  bool shouldRebuild(T previous, T current) =>
      widget.buildWhen?.call(previous, current) ?? true;

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.streamNotifier.state);
  }
}
