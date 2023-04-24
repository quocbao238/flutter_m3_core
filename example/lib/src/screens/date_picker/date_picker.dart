import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Ninja Date Picker'),
        body: NJPadding.medium(
            child: SingleChildScrollView(
          child: Wrap(
            spacing: NJGapSize.regular.size,
            runSpacing: NJGapSize.regular.size,
            children: const [DatePickerCard()],
          ),
        )));
  }
}

class DatePickerCard extends StatefulWidget {
  const DatePickerCard({Key? key}) : super(key: key);

  @override
  State<DatePickerCard> createState() => _DatePickerCardState();
}

class _DatePickerCardState extends State<DatePickerCard> {
  DateTime dateTime = DateTime.now();
  final String selectedDate = '';
  final String dateRange = '';
  final String time = '';

  _onChangeDateTime(DateTime newDateTime) => setState(() => dateTime = newDateTime);

  @override
  Widget build(BuildContext context) {
    return NJCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NJText.titleMedium(text: 'DateTime Picker'),
              NJText.bodyLarge(text: _formatDateTime(dateTime)),
            ],
          ),
          const NJGap.medium(),
          Wrap(
            children: [
              NJButtonWithIcon(
                text: 'Day Picker Calendar Only',
                icon: Icons.calendar_today_outlined,
                onPressed: () async {
                  final result = await M3DatePicker.showModalDatePicker(context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      onDateSelected: _onChangeDateTime,
                      initialDate: dateTime);
                  if (result != null) {
                    _onChangeDateTime(result);
                  }
                },
              ),
              NJButtonWithIcon.filledTonal(
                text: 'Year Picker Calendar Only',
                icon: Icons.calendar_month_outlined,
                onPressed: () async {
                  final result = await M3DatePicker.showModalDatePicker(context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.year,
                      onDateSelected: _onChangeDateTime,
                      initialDate: dateTime);
                  if (result != null) {
                    _onChangeDateTime(result);
                  }
                },
              ),
              NJButtonWithIcon.filled(
                text: 'M3 Picker Input Only ',
                icon: Icons.calendar_today_outlined,
                onPressed: () async {
                  final result = await M3DatePicker.showModalDatePicker(context,
                      initialEntryMode: DatePickerEntryMode.inputOnly,
                      onDateSelected: _onChangeDateTime,
                      initialDate: dateTime);
                  if (result != null) {
                    _onChangeDateTime(result);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

String _formatTimeOfDay(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute}';
}
