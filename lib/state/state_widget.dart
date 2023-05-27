//ignore_for_file: non_constant_identifier_names
//ignore_for_file: prefer_final_fields
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:inherited_widget_example/screens/home_page_screen.dart';
import 'package:inherited_widget_example/state/state_widget.dart';
import 'package:inherited_widget_example/state_model/state_model.dart';

class StateWidget extends InheritedWidget {
  //the variables that can see every widget under the tree
  final StateModel stateModel;

  const StateWidget({Key? key, required Widget child, required this.stateModel})
      : super(key: key, child: child);

  static StateWidget of(BuildContext context) {
    final StateWidget? result =
        context.dependOnInheritedWidgetOfExactType<StateWidget>();
    assert(result != null, 'No StateWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(StateWidget oldWidget) =>
      stateModel != oldWidget.stateModel;
}

//some stateFull widget will create at first, because stateFull has setState method for updating state
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //state model that has all required methods and variables
  late StateModel stateModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initial our stateModel sending the method that calls "setState"
    stateModel = StateModel(setState: setStateModel);

    stateModel.increment();
  }

  //create a method of setState, then we will send this method to the stateModel
  //from there will change state
  void setStateModel() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StateWidget(
        //if you want that child widgets that implements inherited widget don't use "const"
        // otherwise they will not work
        stateModel: stateModel,
        //for example here below
        child: HomePageScreen());
    //Widget tree rebuilds everytime a certain widget changes state.
    // The consequence is that memory will be used a lot and some frames skipped.
    // If you're sure some widgets don't need to change, place then as const.
    // This way, they will not be refreshed and speed up the app in the process.
    // As a simple rule, set const all variables, fields, widgets that will not change values once assigned to them.
  }
}
