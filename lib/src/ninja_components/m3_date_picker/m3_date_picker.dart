import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class M3DatePicker {
  static Future<DateTime?> showModalDatePicker(
    BuildContext ctx, {
    required Function(DateTime) onDateSelected,
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    bool use24HourDials = false,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
  }) async {
    return await showDatePicker(
      context: ctx,
      initialDatePickerMode: initialDatePickerMode,
      initialEntryMode: initialEntryMode,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? initialDate.add(const Duration(days: 365)),
      initialDate: initialDate,
      builder: (BuildContext context, Widget? child) =>
          MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: use24HourDials), child: child!),
    );
  }

  static Future<DateTimeRange?> showModalDateRangePicker(
    BuildContext ctx, {
    required Function(DateTimeRange) onDateSelected,
    DateTimeRange? initialDateRange,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    String? helpText,
    String? cancelText,
    String? confirmText,
    String? saveText,
    String? errorFormatText,
    String? errorInvalidText,
    String? errorInvalidRangeText,
    String? fieldStartHintText,
    String? fieldEndHintText,
    String? fieldStartLabelText,
    String? fieldEndLabelText,
    DateTime? firstDate,
    DateTime? lastDate,
    bool use24HourDials = false,
  }) async {
    final themeData = Theme.of(ctx);
    return await showDateRangePicker(
      context: ctx,
      initialEntryMode: initialEntryMode,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
      initialDateRange: initialDateRange,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      saveText: saveText,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      errorInvalidRangeText: errorInvalidRangeText,
      fieldStartHintText: fieldStartHintText,
      fieldEndHintText: fieldEndHintText,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.colorScheme.brightness == Brightness.dark
              ? themeData
              : themeData.copyWith(
                  appBarTheme: themeData.appBarTheme.copyWith(
                    backgroundColor: themeData.colorScheme.primary,
                    foregroundColor: themeData.colorScheme.onPrimary,
                    // iconTheme: themeData.appBarTheme.iconTheme?.copyWith(color: Colors.white)
                  ),
                  // colorScheme: themeData.colorScheme.brightness == Brightness.dark
                  //     ? themeData.colorScheme
                  //     : themeData.colorScheme.copyWith(),
                  // scaffoldBackgroundColor: themeData.colorScheme.secondaryContainer.withOpacity(0.5),
                  // backgroundColor: themeData.colorScheme.secondaryContainer.withOpacity(0.5),
                  //
                  // ColorScheme.light(onPrimary: Colors.white, primary: Colors.red)
                ),
          child:
              // child,
              SafeArea(
            child: NJPadding.regular(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: use24HourDials),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 560, maxHeight: MediaQuery.of(context).size.height * 0.6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<TimeOfDay?> showModalTimePicker(BuildContext ctx,
      {required Function(DateTime) onDateSelected,
      required TimeOfDay initialTime,
      String? cancelText,
      String? confirmText,
      String? helpText,
      String? errorInvalidText,
      String? hourLabelText,
      bool use24HourDials = false,
      TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dialOnly,
      String? minuteLabelText}) async {
    final themeData = Theme.of(ctx).copyWith(
      timePickerTheme: Theme.of(ctx).timePickerTheme.copyWith(
            hourMinuteShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
          ),
    );

    // return show

    return showTimePicker(
        context: ctx,
        initialEntryMode: initialEntryMode,
        initialTime: initialTime,
        cancelText: cancelText,
        confirmText: confirmText,
        helpText: helpText,
        errorInvalidText: errorInvalidText,
        hourLabelText: hourLabelText,
        minuteLabelText: minuteLabelText,
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: themeData.colorScheme.brightness == Brightness.dark
                  ? themeData
                  : themeData.copyWith(
                      appBarTheme: themeData.appBarTheme.copyWith(
                          backgroundColor: themeData.colorScheme.primary,
                          foregroundColor: themeData.colorScheme.onPrimary),
                      scaffoldBackgroundColor: themeData.colorScheme.secondaryContainer,
                    ),
              child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: use24HourDials),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: NJPadding.regular(
                            child: ClipRRect(borderRadius: BorderRadius.circular(32.0), child: child)),
                      )
                    ],
                  )));
        });
  }
}
