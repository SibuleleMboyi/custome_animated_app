part of 'welcome_cubit.dart';

@immutable
class WelcomeState {
  final bool startCourseButton;
  final bool hasPopedUp;
  final bool dontHaveAccount;
  final bool annonymousUser;
  final bool dismissed;

  const WelcomeState({
    required this.startCourseButton,
    required this.hasPopedUp,
    required this.dontHaveAccount,
    required this.annonymousUser,
    required this.dismissed,
  });

  factory WelcomeState.initial() {
    return const WelcomeState(
      startCourseButton: false,
      hasPopedUp: false,
      dontHaveAccount: false,
      annonymousUser: false,
      dismissed: false,
    );
  }

/*   @Override
  List<Object> props => [startCourseButton, dontHaveAccount]; */

  WelcomeState copyWith(
      {bool? startCourseButton,
      bool? hasPopedUp,
      bool? dontHaveAccount,
      bool? annonymousUser, bool? dismissed, }) {
    return WelcomeState(
      startCourseButton: startCourseButton ?? this.startCourseButton,
      hasPopedUp: hasPopedUp ?? this.hasPopedUp,
      dontHaveAccount: dontHaveAccount ?? this.dontHaveAccount,
      annonymousUser: annonymousUser ?? this.annonymousUser,
      dismissed: dismissed ?? this.dismissed,
    );
  }
}
