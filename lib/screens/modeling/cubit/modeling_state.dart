part of 'modeling_cubit.dart';

enum ModelingStatus { initial, requesting, sucess, error }

class ModelingState {
  final int age;
  final int sysBP;
  final int diaBP;
  final int bmi;
  final int glucose;
  final int totChol;
  final int heartRate;
  final int results;
  final String message;
  final ModelingStatus status;

  ModelingState({
    required this.age,
    required this.sysBP,
    required this.diaBP,
    required this.bmi,
    required this.glucose,
    required this.totChol,
    required this.heartRate,
    required this.results,
    required this.message,
    required this.status,
  });

  factory ModelingState.initial() {
    return ModelingState(
      age: 0,
      sysBP: 0,
      diaBP: 0,
      bmi: 0,
      glucose: 0,
      totChol: 0,
      heartRate: 0,
      results: 0,
      message: "",
      status: ModelingStatus.initial,
    );
  }

  ModelingState copyWith({
    int? age,
    int? sysBP,
    int? diaBP,
    int? bmi,
    int? glucose,
    int? totChol,
    int? heartRate,
    int? results,
    String? message,
    ModelingStatus ? status,
  }) {
    return ModelingState(
      age: age ?? this.age,
      sysBP: sysBP ?? this.sysBP,
      diaBP: diaBP ?? this.sysBP,
      bmi: bmi ?? this.bmi,
      glucose: glucose ?? this.glucose,
      totChol: totChol ?? this.totChol,
      heartRate: heartRate ?? this.heartRate,
      results: results ?? this.results,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
