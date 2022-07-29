part of 'welcome_cubit.dart';

@immutable
class WelcomeState {
  final bool startCourseButton;
  final bool dontHaveAccount;

  const WelcomeState({
    required this.startCourseButton,
    required this.dontHaveAccount,
  });

  factory WelcomeState.initial() {
    return const WelcomeState(
      startCourseButton: false,
      dontHaveAccount: false,
    );
  }

/*   @Override
  List<Object> props => [startCourseButton, dontHaveAccount]; */

  WelcomeState copyWith({
    bool? startCourseButton,
    bool? dontHaveAccount,
  }) {
    return WelcomeState(
      startCourseButton: startCourseButton ?? this.startCourseButton,
      dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
    );
  }
}
