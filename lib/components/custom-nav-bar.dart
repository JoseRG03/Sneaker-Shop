import 'package:flutter/material.dart';
import 'package:untitled/const.dart';
import 'package:untitled/models/nav-bar-option.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar(
      {super.key,
      required this.selectedOption,
      required this.onSelectionChange,
      required this.options});

  final int selectedOption;
  final Function onSelectionChange;
  final List<NavBarOption> options;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        for (int i = 0; i < widget.options.length; i++)
          CustomNavBarItem(
            changeSelected: () {
              widget.onSelectionChange(i);
            },
            isSelected: i == widget.selectedOption,
            icon: widget.options[i].icon,
            label: widget.options[i].label,
          ),
      ]),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.isSelected,
    required this.label,
    required this.icon,
    required this.changeSelected,
  });

  final bool isSelected;
  final String label;
  final IconData icon;
  final Function changeSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          changeSelected();
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.grey : Colors.white,
              ),
              SizedBox(
                width: isSelected ? 5 : 0,
              ),
              isSelected
                  ? Text(
                      label,
                      style: TextStyle(
                          color: isSelected ? Colors.grey : Colors.white),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
