import 'package:avatar_maker/components/avatar_render.dart';
import 'package:avatar_maker/components/color_selection.dart';
import 'package:avatar_maker/components/name_selection.dart';
import 'package:avatar_maker/components/shape_selection.dart';
import 'package:avatar_maker/components/tabs.dart';
import 'package:avatar_maker/cubit/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Maker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AvatarCubit(), 
        child: const AvatarMaker(),
      ),
    );
  }
}

class AvatarMaker extends StatelessWidget {
  const AvatarMaker({super.key});

  @override
  Widget build(BuildContext context) {
    final avatarCubitContext = context.read<AvatarCubit>();
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context,state){
        if(state is AvatarData){

          void changeState(String action) {
            avatarCubitContext.updateStates(state.copyThis(action: action));
          }
          void changeName(String name) {
            debugPrint('input: $name');
            avatarCubitContext.updateStates(state.copyThis(name: name));
          }
          void changeIcon(IconData icon) {
            avatarCubitContext.updateStates(state.copyThis(shape: icon));
          }
          void changeColor(Color color) {
            debugPrint('function triggered: ${state.color.toString()}');
            avatarCubitContext.updateStates(state.copyThis(color: color));
          }
          // void changeName(String name) {
          //   debugPrint('input: $name');
          //   avatarCubitContext.updateStates(state.copyThis(name: name));
          // }
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 200,
              title: Center(
                child: Container(

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        state.shape,
                        size: 200,
                        color: state.color,
                      ),
                      Text(
                        state.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,

                        ),
                      )
                    ]
                  ),
                ),
            ),),
            bottomNavigationBar: BottomAppBar(
              height: 320,
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 64,
                  child: Tabs(
                    state: state,
                    changeState: changeState,
                  ),
                ),
                state.action == "NameChange" ? 
                  NameSelection(
                      currentInput: state.name,
                      nameInput: state.name,
                      callback: changeName,
                      state: state,
                  )
                :
                state.action == "ShapeChange" ?
                  ShapeSelection(
                    callback: changeIcon,
                  )
                :
                  ColorSelection(callback: changeColor,)
              ]
            ), 
              
            ),
          );
          
        }
        return Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: () {
                avatarCubitContext.startApp();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  )
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Start'),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}