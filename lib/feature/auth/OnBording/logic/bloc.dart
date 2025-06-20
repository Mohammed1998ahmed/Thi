import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class W1Cubitt extends Cubit<AppStates> {
  W1Cubitt() : super(InitW1());

  static W1Cubitt get(context) => BlocProvider.of(context);
  // bool isbutton = true;
  int currentindex = 0;

  final controller = PageController();
  final controller1 = PageController();

  int currentPage = 0;
  int currentPage1 = 0;
  bool isbutton = false;

  void changButton(bool button) {
    this.isbutton = button;
    emit(Chaingbutton());
  }
}
