import 'dart:math';

import 'package:flutter/material.dart';

class ColorSelection extends StatelessWidget {
  final Function(Color color) callback;
  ColorSelection({
    required this.callback,
    super.key
  });

  final List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
       child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: colorList.map(
            (value) => GestureDetector(
              onTap: () {
                callback(value);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: value
                ),
              ),
            )
          ).toList(),
        ),
           ),
     );  
  }
}