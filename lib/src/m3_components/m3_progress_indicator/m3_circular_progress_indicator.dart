import 'package:flutter/material.dart';

enum _M3ActivityIndicatorType { material, adaptive }

base class M3CircularProgressIndicator extends CircularProgressIndicator {
  final bool enable;

  final _M3ActivityIndicatorType _type;

  /// The width of the line used to draw the circle.
  // final double strokeWidth;

  // /// The progress indicator's line ending.
  // ///
  // /// This determines the shape of the stroke ends of the progress indicator.
  // /// By default, [strokeCap] is null.
  // /// When [value] is null (indeterminate), the stroke ends are set to
  // /// [StrokeCap.square]. When [value] is not null, the stroke
  // /// ends are set to [StrokeCap.butt].
  // ///
  // /// Setting [strokeCap] to [StrokeCap.round] will result in a rounded end.
  // /// Setting [strokeCap] to [StrokeCap.butt] with [value] == null will result
  // /// in a slightly different indeterminate animation; the indicator completely
  // /// disappears and reappears on its minimum value.
  // /// Setting [strokeCap] to [StrokeCap.square] with [value] != null will
  // /// result in a different display of [value]. The indicator will start
  // /// drawing from slightly less than the start, and end slightly after
  // /// the end. This will produce an alternative result, as the
  // /// default behavior, for example, that a [value] of 0.5 starts at 90 degrees
  // /// and ends at 270 degrees. With [StrokeCap.square], it could start 85
  // /// degrees and end at 275 degrees.
  // final StrokeCap? strokeCap;

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
      : _type = _M3ActivityIndicatorType.material;

  const M3CircularProgressIndicator.adaptive(
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
      : _type = _M3ActivityIndicatorType.adaptive;

  @override
  State<M3CircularProgressIndicator> createState() =>
      _M3CircularProgressIndicatorState();
}

class _M3CircularProgressIndicatorState
    extends State<M3CircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    if (!widget.enable) return const SizedBox();
    return switch (widget._type) {
      _M3ActivityIndicatorType.material => CircularProgressIndicator(
          key: widget.key,
          value: widget.value,
          backgroundColor: widget.backgroundColor,
          color: widget.color,
          valueColor: widget.valueColor,
          strokeWidth: widget.strokeWidth,
          semanticsLabel: widget.semanticsLabel,
          semanticsValue: widget.semanticsValue,
          strokeCap: widget.strokeCap),
      _M3ActivityIndicatorType.adaptive => CircularProgressIndicator.adaptive(
          key: widget.key,
          value: widget.value,
          backgroundColor: widget.backgroundColor,
          valueColor: widget.valueColor,
          strokeWidth: widget.strokeWidth,
          semanticsLabel: widget.semanticsLabel,
          semanticsValue: widget.semanticsValue,
          strokeCap: widget.strokeCap),
    };
  }
}
