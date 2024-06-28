import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/utils/extension/extension.dart';


class ContainerSelector extends StatefulWidget {
  @override
  _ContainerSelectorState createState() => _ContainerSelectorState();
}

class _ContainerSelectorState extends State<ContainerSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              height: 80.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.green.shade300
                    :null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  _getTextForIndex(index),
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.grey,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String _getTextForIndex(int index) {
    switch (index) {
      case 0:
        return 'Popular';
      case 1:
        return 'Sort';
      case 2:
        return 'New';
      case 3:
        return 'Best Selling';
      case 4:
        return 'Future';
      default:
        return '';
    }
  }
}
