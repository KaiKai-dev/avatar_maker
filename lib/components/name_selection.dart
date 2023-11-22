import 'package:avatar_maker/cubit/avatar_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NameSelection extends StatefulWidget {
  final String currentInput;
  final String? nameInput;
  final AvatarData state;
  final Function(String name) callback;

  const NameSelection({
    required this.currentInput,
    required this.nameInput,
    required this.callback,
    required this.state,
    super.key
  });

  @override
  State<NameSelection> createState() => _NameSelectionState();
}

class _NameSelectionState extends State<NameSelection> {
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    name.text = widget.currentInput;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: name,
        onChanged: (input){
          widget.callback(input);
          debugPrint('current state: ${widget.state.name}');
        },
      ),
    );  
  }
}