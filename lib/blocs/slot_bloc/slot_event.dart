import 'package:starter/models/slot.dart';

abstract class SlotEvent {}

abstract class SingleSlotEvent extends SlotEvent {
  final Slot slot;

  SingleSlotEvent(this.slot);
}

class LoadSlots extends SlotEvent {}

class AddSlot extends SingleSlotEvent {
  AddSlot(Slot slot) : super(slot);
}

class UpdateSlot extends SingleSlotEvent {
  UpdateSlot(Slot slot) : super(slot);
}

class RemoveSlot extends SingleSlotEvent {
  RemoveSlot(Slot slot) : super(slot);
}
