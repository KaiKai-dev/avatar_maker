import 'package:avatar_maker/cubit/avatar_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tabs extends StatelessWidget {
  AvatarData state;
  Function(String action) changeState;
  Tabs({
    required this.state,
    required this.changeState,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // state.copyThis(action: 'NameChange');
                changeState('NameChange');
                debugPrint(state.action);
              },
              child: const Text('Name'),
            ),
            GestureDetector(
              onTap: () {
                changeState('ShapeChange');
                debugPrint(state.action);

              },
              child: const Text('Shape'),
            ),
            GestureDetector(
              onTap: () {
                changeState('ColorChange');
                debugPrint(state.action);
              },
              child: const Text('Color'),
            ),
          ]
      ),
    );
  }
}