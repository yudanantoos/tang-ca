import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/models/slot.dart';

abstract class SlotState {}

class SlotsLoading extends SlotState {}

class SlotsLoaded extends SlotState {
  final List<Slot> slots;

  SlotsLoaded(this.slots);
}

class SlotsNotLoaded extends SlotState {}
