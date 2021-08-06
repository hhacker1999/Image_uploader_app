import 'dart:async';

import 'package:flutter/material.dart';

class StreamConsumer<T> extends StatefulWidget {
  final Widget Function(BuildContext, AsyncSnapshot) builder;
  final T? initialData;
  final Stream<T> stream;
  final void Function(T) listener;
  const StreamConsumer({
    Key? key,
    required this.builder,
    this.initialData,
    required this.stream,
    required this.listener,
  }) : super(key: key);

  @override
  _StreamConsumerState<T> createState() => _StreamConsumerState<T>();
}

class _StreamConsumerState<T> extends State<StreamConsumer<T>> {
  late StreamSubscription<T> _sub;

  @override
  void initState() {
    super.initState();
    _sub = widget.stream.listen((event) {
      widget.listener(event);
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      builder: widget.builder,
      initialData: widget.initialData,
      stream: widget.stream,
    );
  }
}