/*

Padding refers to the space between UI elements.
Padding can be measured vertically and horizontally and does not need to span
the entire height or width of a layout.
Padding is measured in increments of 4dp.
 */

enum M3Spacing {
  none(0.0),
  small(8.0),
  medium(12.0),
  regular(16.0),
  large(24.0),
  veryLarge(32.0);
  final double size;
  const M3Spacing(this.size);
}
