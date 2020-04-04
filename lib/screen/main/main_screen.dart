import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/main/home_screen.dart';
import 'package:learnflutter/screen/main/main_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,MainScreenViewModel>(
      distinct: true,
      converter: MainScreenViewModel.fromStore,
      builder: (context,vm){
        if(vm.hasData){
          return HomeScreen();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('kkkk'),
          ),
        );
      },
    );
  }
}
