import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:io';

class CalendarSheet extends StatefulWidget {
  const CalendarSheet({super.key});

  @override
  State<CalendarSheet> createState() => _CalendarSheetState();
}

class _CalendarSheetState extends State<CalendarSheet> {
  String? startDate;
  String? dueDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value); // Print Values
  }

  @override
  Widget build(BuildContext context) {
    DateRangePickerController _datePickerController =
        DateRangePickerController();

    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.55,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Select Start Date and Due Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            SfDateRangePicker(
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ), // Setting Monday as the first day of the week
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              onSubmit: (Object? val) {
                Navigator.pop(context, val);
              },
              onCancel: () {
                _datePickerController.selectedRanges = null;
                Navigator.pop(context);
                  
              },
            ),
          ],
        ),
      ),
    );
  }
}
