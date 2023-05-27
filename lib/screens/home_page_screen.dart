import 'package:flutter/material.dart';
import 'package:inherited_widget_example/state/state_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get our inherited widget
    //it is similar to provider
    final inheritedWidget = StateWidget.of(context).stateModel;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => inheritedWidget.increment(),
            child: const Icon(Icons.add)),
        appBar: AppBar(),
        body: Center(child: Text("${inheritedWidget.counter}")));
  }
}
