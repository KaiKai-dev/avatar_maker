import 'package:flutter/material.dart';

class ColorSelection extends StatelessWidget {
  final Function(Color color) callback;
  final Color currentColor;
  ColorSelection({
    required this.currentColor,
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: colorList.map(
            (value) => GestureDetector(
              onTap: () {
                callback(value);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                
                  decoration: BoxDecoration(
                    color: value,
                    border: Border.all(
                      
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5)
                    ),
                  ),
                ),
              ),
            )
          ).toList(),
        ),
           ),
     );  
  }
}