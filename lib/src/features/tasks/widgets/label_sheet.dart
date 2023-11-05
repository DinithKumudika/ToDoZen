import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/tasks/widgets/multi_select_chip.dart';

class LabelSheet extends StatefulWidget {
  final Function(String) onLabelSelected; // Callback function

  const LabelSheet({super.key, required this.onLabelSelected});

  @override
  State<LabelSheet> createState() => _LabelSheetState();
}

class _LabelSheetState extends State<LabelSheet> {
  int selectedLabel = -1; // Initialize with -1
  String selectedLabelName = 'not';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: COLOR_LIGHTGRAY,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select a Label",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: COLOR_DARK,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MultiSelectChip(
                  index: 1,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'Personal',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'Personal';
                      selectedLabel = index;
                    });
                  },
                ),
                const SizedBox(width: 20),
                MultiSelectChip(
                  index: 2,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'Work',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'Work';
                      selectedLabel = index;
                    });
                  },
                ),
                const SizedBox(width: 20),
                MultiSelectChip(
                  index: 3,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'School',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'School';
                      selectedLabel = index;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MultiSelectChip(
                  index: 4,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'Family',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'Family';
                      selectedLabel = index;
                    });
                  },
                ),
                const SizedBox(width: 20),
                MultiSelectChip(
                  index: 5,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'Projects',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'Projects';
                      selectedLabel = index;
                    });
                  },
                ),
                const SizedBox(width: 20),
                MultiSelectChip(
                  index: 6,
                  selectedIndex: selectedLabel,
                  priorityLevel: 'Social',
                  selectedColor: COLOR_SECONDARY,
                  onChipSelected: (index) {
                    setState(() {
                      selectedLabelName = 'Social';
                      selectedLabel = index;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(COLOR_PRIMARY),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5.0), // Adjust the border radius as needed
                    ),
                  ),
                ),
                onPressed: () {
                  widget.onLabelSelected(selectedLabelName);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save Label',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
