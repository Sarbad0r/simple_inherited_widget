import 'package:flutter/material.dart';

class StateModel {
  int counter = 0;
  VoidCallback setState;

  StateModel({required this.setState});

  //"setState" is method that getting from stateFull widget
  void increment() {
    counter++;
    setState();
  }
}
