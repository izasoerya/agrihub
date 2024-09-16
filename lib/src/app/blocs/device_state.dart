import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DeviceEvent {}

class ToggleDeviceEvent extends DeviceEvent {
  final EntitiesDevice device;

  ToggleDeviceEvent({required this.device});
}

class DeviceState {
  final EntitiesDevice? device;

  DeviceState({required this.device});
}

class DeviceStateBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceStateBloc() : super(DeviceState(device: null)) {
    on<ToggleDeviceEvent>((event, emit) {
      emit(DeviceState(device: event.device));
    });
  }
}
