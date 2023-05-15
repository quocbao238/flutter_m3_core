import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

enum Calendar {
  day('Day', Icons.calendar_view_day),
  week('Week', Icons.calendar_view_week),
  month('Month', Icons.calendar_view_month),
  year('year', Icons.calendar_today);

  final String label;
  final IconData iconData;
  const Calendar(this.label, this.iconData);
}

enum Sizes {
  extraSmall('XS'),
  small('S'),
  medium('M'),
  large('L'),
  extraLarge('XL');

  final String label;
  const Sizes(this.label);
}

class SegmentedScreen extends StatelessWidget {
  const SegmentedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Segmented Button'),
      body: M3Padding.medium(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            M3Card(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  children: [
                    M3Text.titleLarge(
                        text: 'Single choice', fontWeight: FontWeight.bold),
                    M3Space.medium(),
                    SingleChoice()
                  ],
                )),
            const M3Space.medium(),
            M3Card(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  M3Text.titleLarge(
                      text: 'Multiple choice', fontWeight: FontWeight.bold),
                  M3Space.medium(),
                  MultipleChoice()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: <ButtonSegment<Calendar>>[
        ...Calendar.values
            .map((e) => ButtonSegment<Calendar>(
                value: e,
                label: M3Text.bodySmall(
                  text: e.label,
                  isFlexible: false,
                  fontWeight: e == calendarView ? FontWeight.bold : null,
                ),
                icon: Icon(e.iconData)))
            .toList()
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) =>
          setState(() => calendarView = newSelection.first),
    );
  }
}

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: <ButtonSegment<Sizes>>[
        ...Sizes.values
            .map((e) => ButtonSegment<Sizes>(
                value: e,
                label: M3Text.bodySmall(
                  text: e.label,
                  fontWeight: !selection.contains(e) ? null : FontWeight.bold,
                  isFlexible: false,
                )))
            .toList()
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) =>
          setState(() => selection = newSelection),
      multiSelectionEnabled: true,
    );
  }
}
