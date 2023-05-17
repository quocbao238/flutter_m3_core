import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_progress_indicator/m3_progress_enum.dart';

class M3LinearProgressIndicator extends LinearProgressIndicator {
  final bool enable;
  final M3ProgressType _type;
  const M3LinearProgressIndicator({
    super.key,
    super.value,
    super.backgroundColor,
    super.color,
    this.enable = true,
    super.valueColor,
    super.minHeight,
    super.semanticsLabel,
    super.semanticsValue,
  }) : _type = M3ProgressType.surface;

  const M3LinearProgressIndicator.primary({
    super.key,
    super.value,
    super.backgroundColor,
    super.color,
    this.enable = true,
    super.valueColor,
    super.minHeight,
    super.semanticsLabel,
    super.semanticsValue,
  }) : _type = M3ProgressType.primary;

  const M3LinearProgressIndicator.secondary({
    super.key,
    super.value,
    super.backgroundColor,
    super.color,
    this.enable = true,
    super.valueColor,
    super.minHeight,
    super.semanticsLabel,
    super.semanticsValue,
  }) : _type = M3ProgressType.secondary;

  const M3LinearProgressIndicator.tertiary({
    super.key,
    super.value,
    super.backgroundColor,
    super.color,
    this.enable = true,
    super.valueColor,
    super.minHeight,
    super.semanticsLabel,
    super.semanticsValue,
  }) : _type = M3ProgressType.tertiary;

  @override
  State<M3LinearProgressIndicator> createState() =>
      _M3LinearProgressIndicatorState();
}

class _M3LinearProgressIndicatorState extends State<M3LinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return const SizedBox();

    final color = widget._type.getColor(Theme.of(context).colorScheme);
    return LinearProgressIndicator(
      key: widget.key,
      value: widget.value,
      backgroundColor: widget.backgroundColor,
      color: color,
      valueColor: widget.valueColor,
      minHeight: widget.minHeight,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
    );
  }
}
