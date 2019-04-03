import 'package:starter/models/sort_type.dart';
import 'package:starter/models/slot.dart';

abstract class SlotsEvent {}

abstract class SingleSlotEvent extends SlotsEvent {
  final Slot slot;

  SingleSlotEvent(this.slot);
}

class LoadSlots extends SlotsEvent {}

class AddSlot extends SingleSlotEvent {
  AddSlot(Slot slot) : super(slot);
}

class UpdateSlot extends SingleSlotEvent {
  UpdateSlot(Slot slot) : super(slot);
}

class RemoveSlot extends SingleSlotEvent {
  RemoveSlot(Slot slot) : super(slot);
}

class ApplySort extends SlotsEvent {
  final SortType filter;

  ApplySort(this.filter);
}
