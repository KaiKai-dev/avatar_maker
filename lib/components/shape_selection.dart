import 'package:flutter/material.dart';

class ShapeSelection extends StatelessWidget {
  final Function(IconData icon) callback;
  final IconData currentIcon;
  ShapeSelection({
    required this.currentIcon,
    required this.callback,
    super.key
  });

  final List<IconData> iconList = [
    Icons.headphones,
    Icons.heart_broken,
    Icons.warning,
    Icons.rotate_left,
    Icons.safety_check,
    Icons.medical_services,
    Icons.shield
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: iconList.map(
          (value) => Container(
            margin: EdgeInsets.all(currentIcon == value ? 0 : 1),
            decoration:  currentIcon == value ? BoxDecoration(
                border: Border.all(
                  width: 1
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
            ) : const BoxDecoration(),
            child: GestureDetector(
              onTap: () {
                callback(value);
              },
              child: Icon(value),
            ),
          )
        ).toList(),
      ),
    );   
  }
}