import 'package:flutter/material.dart';

class M3LinearProgressIndicator extends LinearProgressIndicator {
  final bool enable;
  const M3LinearProgressIndicator(
      {super.key,
      super.value,
      super.backgroundColor,
      super.color,
      this.enable = true,
      super.valueColor,
      super.minHeight,
      super.semanticsLabel,
      super.semanticsValue,
      super.borderRadius});

  @override
  State<M3LinearProgressIndicator> createState() =>
      _M3LinearProgressIndicatorState();
}

class _M3LinearProgressIndicatorState extends State<M3LinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return const SizedBox();
    return LinearProgressIndicator(
      key: widget.key,
      value: widget.value,
      backgroundColor: widget.backgroundColor,
      color: widget.color,
      valueColor: widget.valueColor,
      minHeight: widget.minHeight,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      borderRadius: widget.borderRadius,
    );
  }
}
