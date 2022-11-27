part of 'welcome_cubit.dart';

@immutable
class WelcomeState {
  final bool startCourseButton;
  final bool hasPopedUp;
  final bool dontHaveAccount;
  final bool annonymousUser;
  final bool dismissedSignUp;
    final bool dismissedSignIn;


  const WelcomeState({
    required this.startCourseButton,
    required this.hasPopedUp,
    required this.dontHaveAccount,
    required this.annonymousUser,
    required this.dismissedSignUp,
        required this.dismissedSignIn,

  });

  factory WelcomeState.initial() {
    return const WelcomeState(
      startCourseButton: false,
      hasPopedUp: false,
      dontHaveAccount: false,
      annonymousUser: false,
      dismissedSignUp: false,
            dismissedSignIn: false,

    );
  }

/*   @Override
  List<Object> props => [startCourseButton, dontHaveAccount]; */

  WelcomeState copyWith(
      {bool? startCourseButton,
      bool? hasPopedUp,
      bool? dontHaveAccount,
      bool? annonymousUser, bool? dismissedSignUp,  bool? dismissedSignIn,}) {
    return WelcomeState(
      startCourseButton: startCourseButton ?? this.startCourseButton,
      hasPopedUp: hasPopedUp ?? this.hasPopedUp,
      dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
      annonymousUser: annonymousUser ?? this.annonymousUser,
      dismissedSignUp: dismissedSignUp ?? this.dismissedSignUp,
            dismissedSignIn: dismissedSignIn ?? this.dismissedSignIn,

    );
  }
}
