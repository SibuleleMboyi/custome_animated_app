import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());

  void startCourseButton({required bool isClicked}) {
    emit(state.copyWith(startCourseButton: isClicked));
  }

  void hasPopedUp({required bool isClicked}) {
    emit(state.copyWith(hasPopedUp: isClicked));
  }

  void dontHaveAccount({required bool isClicked}) {
    emit(state.copyWith(dontHaveAccount: isClicked));
  }

  void annonymousUser({required bool isClicked}) {
    emit(state.copyWith(annonymousUser: isClicked));
  }

  void isDismissedSignUp({required bool dismissedSignUp}) {
    emit(state.copyWith(dismissedSignUp: dismissedSignUp));
  }

   void isDismissedSignIn({required bool dismissedSignIn}) {
    emit(state.copyWith(dismissedSignIn: dismissedSignIn));
  }

  void clearStates() {
    emit(WelcomeState.initial());
  }
}
