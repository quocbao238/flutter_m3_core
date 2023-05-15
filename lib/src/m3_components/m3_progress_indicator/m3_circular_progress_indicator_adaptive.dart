import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_progress_indicator/m3_progress_enum.dart';

base class M3CircularProgressIndicatorAdaptive
    extends CircularProgressIndicator {
  final bool enable;
  final M3ProgressType _type;

  const M3CircularProgressIndicatorAdaptive(
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

  const M3CircularProgressIndicatorAdaptive.primary(
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

  const M3CircularProgressIndicatorAdaptive.secondary(
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

  const M3CircularProgressIndicatorAdaptive.tertiary(
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
  State<M3CircularProgressIndicatorAdaptive> createState() =>
      _M3CircularProgressIndicatorAdaptiveState();
}

class _M3CircularProgressIndicatorAdaptiveState
    extends State<M3CircularProgressIndicatorAdaptive> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return const SizedBox();
    return CircularProgressIndicator.adaptive(
        key: widget.key,
        value: widget.value,
        backgroundColor: widget._type.getColor(Theme.of(context).colorScheme),
        valueColor: widget.valueColor,
        strokeWidth: widget.strokeWidth,
        semanticsLabel: widget.semanticsLabel,
        semanticsValue: widget.semanticsValue,
        strokeCap: widget.strokeCap);
  }
}
