import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

part 'modeling_state.dart';

class ModelingCubit extends Cubit<ModelingState> {
  ModelingCubit() : super(ModelingState.initial());

  void setAge({required int age}) {
    emit(state.copyWith(
      age: age,
      status: ModelingStatus.initial,
    ));
  }

  void setSysBP({required int sysBP}) {
    emit(state.copyWith(
      sysBP: sysBP,
      status: ModelingStatus.initial,
    ));
  }

  void setDiaBP({required int diaBP}) {
    emit(state.copyWith(
      diaBP: diaBP,
      status: ModelingStatus.initial,
    ));
  }

  void setBMI({required int bmi}) {
    emit(state.copyWith(
      bmi: bmi,
      status: ModelingStatus.initial,
    ));
  }

  void setGlucose({required int glucose}) {
    emit(state.copyWith(
      glucose: glucose,
      status: ModelingStatus.initial,
    ));
  }

  void setTotChol({required int totChol}) {
    emit(state.copyWith(
      totChol: totChol,
      status: ModelingStatus.initial,
    ));
  }

  void setHeartRate({required int heartRate}) {
    emit(state.copyWith(
      age: heartRate,
      status: ModelingStatus.initial,
    ));
  }

  Future<void> getPredictions() async {
    final userData = {
      'age': state.age,
      'sysBP': state.sysBP,
      'diaBP': state.diaBP,
      'BMI': state.bmi,
      'glucose': state.glucose,
      'totChol': state.totChol,
      'heartRate': state.heartRate,
    };

    emit(state.copyWith(status: ModelingStatus.requesting));
    final response = await http.post(
      Uri.parse("http://127.0.0.1:5000/user/sibulele"),
      headers: {
        "Accept": "application/json",
        "ContentType": "application/x-www-form-urlencoded"
      },
      body: userData,
    );

    final responseDecoder = jsonDecode(response.body);

    emit(
      state.copyWith(
          results: responseDecoder["prediction"],
          message: responseDecoder["message"]),
    );
  }

  void clearStates() {
    emit(ModelingState.initial());
  }
}
