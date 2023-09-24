import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class MultiSelectChip extends StatefulWidget {
  final String priorityLevel;
  final Color selectedColor;
  final int index;
  final int selectedIndex;
  final Function(int) onChipSelected;

  const MultiSelectChip({
    super.key,
    required this.priorityLevel,
    required this.selectedColor,
    required this.index,
    required this.selectedIndex,
    required this.onChipSelected,
  });

  @override
  State<MultiSelectChip> createState() {
    return _MultiSelectChipState();
  }
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: ChoiceChip(
        label: Text(
          widget.priorityLevel,
          style: TextStyle(
            color: widget.index == widget.selectedIndex
                ? Colors.white
                : COLOR_GRAY,
          ),
        ),
        selected: widget.index == widget.selectedIndex,
        onSelected: (selected) {
          setState(() {
            widget.onChipSelected(widget.index);
          });
        },
        selectedColor: widget.selectedColor,
        backgroundColor: COLOR_LIGHTGRAY,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the border radius as needed
        ),
      ),
    );
  }
}
