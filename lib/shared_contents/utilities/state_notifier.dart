import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class CurrentState extends Equatable {
  const CurrentState();
  @override
  List<Object> get props => [];
}

class IdleState extends CurrentState {}

class LoadingState extends CurrentState {}

class ErrorState extends CurrentState {
  const ErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

/// Not the state notifier in Flutter :)
class StateNotifier extends GetxController {
  CurrentState _state = IdleState();

  CurrentState get state => _state;

  void setState(CurrentState state) {
    _state = state;
    update();
  }
}
