import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_progress_indicator/m3_progress_enum.dart';

base class M3CircularProgressIndicator extends CircularProgressIndicator {
  final bool enable;
  final M3ProgressType _type;

  const M3CircularProgressIndicator(
      {this.enable = true,
      super.key,
      super.value,
      super.backgroundColor,
      super.color,
      super.valueColor,
      super.strokeWidth,
      super.semanticsLabel,
      super.semanticsValue,
      super.strokeCap})
      : _type = M3ProgressType.surface;

  const M3CircularProgressIndicator.primary(
      {this.enable = true,
      super.key,
      super.value,
      super.backgroundColor,
      super.color,
      super.valueColor,
      super.strokeWidth,
      super.semanticsLabel,
      super.semanticsValue,
      super.strokeCap})
      : _type = M3ProgressType.primary;

  const M3CircularProgressIndicator.secondary(
      {this.enable = true,
      super.key,
      super.value,
      super.backgroundColor,
      super.color,
      super.valueColor,
      super.strokeWidth,
      super.semanticsLabel,
      super.semanticsValue,
      super.strokeCap})
      : _type = M3ProgressType.secondary;

  const M3CircularProgressIndicator.tertiary(
      {this.enable = true,
      super.key,
      super.value,
      super.backgroundColor,
      super.color,
      super.valueColor,
      super.strokeWidth,
      super.semanticsLabel,
      super.semanticsValue,
      super.strokeCap})
      : _type = M3ProgressType.tertiary;

  @override
  State<M3CircularProgressIndicator> createState() =>
      _M3CircularProgressIndicatorState();
}

class _M3CircularProgressIndicatorState
    extends State<M3CircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return const SizedBox();
    return CircularProgressIndicator(
        key: widget.key,
        value: widget.value,
        backgroundColor: widget.backgroundColor,
        color: widget._type.getColor(Theme.of(context).colorScheme),
        valueColor: widget.valueColor,
        strokeWidth: widget.strokeWidth,
        semanticsLabel: widget.semanticsLabel,
        semanticsValue: widget.semanticsValue,
        strokeCap: widget.strokeCap);
  }
}
