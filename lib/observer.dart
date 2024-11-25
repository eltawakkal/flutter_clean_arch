import 'package:bloc/bloc.dart';
import 'dart:developer';

class MyStateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("Bloc : $bloc ---> $change");
  }
}