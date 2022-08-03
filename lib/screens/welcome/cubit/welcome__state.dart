part of 'welcome_cubit.dart';

@immutable
class WelcomeState {
  final bool startCourseButton;
  final bool dontHaveAccount;
  final bool annonymousUser;

  const WelcomeState({
    required this.startCourseButton,
    required this.dontHaveAccount,
    required this.annonymousUser,
  });

  factory WelcomeState.initial() {
    return const WelcomeState(
      startCourseButton: false,
      dontHaveAccount: false,
      annonymousUser: false,
    );
  }

/*   @Override
  List<Object> props => [startCourseButton, dontHaveAccount]; */

  WelcomeState copyWith(
      {bool? startCourseButton, bool? dontHaveAccount, bool? annonymousUser}) {
    return WelcomeState(
      startCourseButton: startCourseButton ?? this.startCourseButton,
      dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
      annonymousUser: annonymousUser ?? this.annonymousUser,
    );
  }
}
