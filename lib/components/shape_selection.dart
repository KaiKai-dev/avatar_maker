import 'package:flutter/material.dart';

class ShapeSelection extends StatelessWidget {
  final Function(IconData icon) callback;
  ShapeSelection({
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
          (value) => GestureDetector(
            onTap: () {
              callback(value);
            },
            child: Icon(value),
          )
        ).toList(),
      ),
    );   
  }
}