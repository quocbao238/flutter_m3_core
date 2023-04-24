import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Ninja Date Time Picker'),
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

  bool use24HourFormat = false;

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
                      use24HourDials: use24HourFormat,
                      onDateSelected: _onChangeDateTime,
                      initialDate: dateTime);
                  if (result != null) {
                    _onChangeDateTime(result);
                  }
                },
              ),
              const NJDivider(),
              NJButtonWithIcon.outline(
                text: 'M3 Time Picker Dial ',
                icon: Icons.calendar_today_outlined,
                onPressed: () async {
                  final result = await M3DatePicker.showModalTimePicker(context,
                      use24HourDials: use24HourFormat,
                      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
                      onDateSelected: _onChangeDateTime);
                  if (result != null) {
                    final newDateTime =
                        DateTime(dateTime.year, dateTime.month, dateTime.day, result.hour, result.minute);
                    _onChangeDateTime(newDateTime);
                  }
                },
              ),
              NJButtonWithIcon.filled(
                text: 'M3 Time Picker Input ',
                icon: Icons.calendar_today_outlined,
                onPressed: () async {
                  final result = await M3DatePicker.showModalTimePicker(
                      initialEntryMode: TimePickerEntryMode.inputOnly,
                      context,
                      use24HourDials: use24HourFormat,
                      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
                      onDateSelected: _onChangeDateTime);
                  if (result != null) {
                    final newDateTime =
                        DateTime(dateTime.year, dateTime.month, dateTime.day, result.hour, result.minute);
                    _onChangeDateTime(newDateTime);
                  }
                },
              ),
              Row(
                children: [
                  NJCheckBox(
                    value: use24HourFormat,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) use24HourFormat = value;
                      });
                    },
                  ),
                  const NJPadding(child: NJText.bodyLarge(text: 'Use 24 hour format')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
}
