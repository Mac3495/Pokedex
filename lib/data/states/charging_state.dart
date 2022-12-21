import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'charging_state.freezed.dart';

@freezed
class ChargingState with _$ChargingState {
  const factory ChargingState.data(dynamic data) = _Data;
  const factory ChargingState.error(String error)= _Error;
  const factory ChargingState.loading() = _Loading; 
}

// flutter pub run build_runner build