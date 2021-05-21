import 'package:flutter/material.dart';
import 'package:goal_keeper/goal_board/board_4by4.dart';

class InitialSettingPage extends StatefulWidget {
  @override
  _InitialSettingPageState createState() => _InitialSettingPageState();
}

class _InitialSettingPageState extends State<InitialSettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BoardOf4x4(),
        ),
      ),
    );
  }

  Widget explanationScreen(){
    return Column(
      children: [
        Text('exp'),
        ElevatedButton(onPressed: (){
        },child: Text('next'),)
      ],
    );
  }
}
