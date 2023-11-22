import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(AvatarInitial());

  void startApp() {
    emit(
      AvatarData(
        color: Colors.red, 
        shape: Icons.abc, 
        name: 'KaiKai', 
        action: 'NameChange',
      )
    );
  }

  void updateStates(
    AvatarData? state
  ){
    emit(state!);
  }

}
