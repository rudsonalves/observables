import 'package:flutter/material.dart';
import 'package:observables/controllers/state_observable.dart';

class ObservableBuilderState<T> extends StatefulWidget {
  final StateObservable<T> stateObservable;
  final Widget Function(BuildContext context, T state, Widget? child) builder;
  final bool Function(T oldState, T newState)? buildWhen;
  final void Function(BuildContext context, T state)? listener;
  final Widget? child;

  const ObservableBuilderState({
    super.key,
    required this.stateObservable,
    required this.builder,
    this.buildWhen,
    this.listener,
    this.child,
  });

  @override
  State<ObservableBuilderState<T>> createState() =>
      _ObservableBuilderStateState<T>();
}

class _ObservableBuilderStateState<T> extends State<ObservableBuilderState<T>> {
  late T state;
  @override
  void initState() {
    widget.stateObservable.addListener(rebuild);
    state = widget.stateObservable.state;
    super.initState();
  }

  void rebuild() {
    if (shouldRebuild()) {
      state = widget.stateObservable.state;
      if (widget.listener != null) {
        widget.listener!(context, state);
      }
      setState(() {});
    }
  }

  bool shouldRebuild() {
    if (widget.buildWhen == null) return true;

    return widget.buildWhen!(state, widget.stateObservable.state);
  }

  @override
  void dispose() {
    widget.stateObservable.removeListener(rebuild);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, state, widget.child);
  }
}
