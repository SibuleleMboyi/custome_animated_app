import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'welcome__state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());

  void startCourseButton({required bool isClicked}) {
    emit(state.copyWith(startCourseButton: isClicked));
  }

  void dontHaveAccount({required bool isClicked}) {
    emit(state.copyWith(dontHaveAccount: isClicked));
  }

  void annonymousUser({required bool isClicked}) {
    emit(state.copyWith(annonymousUser: isClicked));
  }

  void clearStates() {
    emit(WelcomeState.initial());
  }
}
