import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/storages/slot_storage.dart';
import './slot_event.dart';
import './slot_state.dart';

class SlotBloc extends Bloc<SlotEvent, SlotState> {
  SlotStorage _storage;

  static of(BuildContext context) => BlocProvider.of<SlotBloc>(context);

  @override
  SlotState get initialState => SlotsLoading();

  @override
  Stream<SlotState> mapEventToState(SlotState state, SlotEvent event) async* {
    switch (event.runtimeType) {
      case LoadSlots:
        yield* _loadSlots();
        break;

      case AddSlot:
        yield* _addSlot(state, event);
        break;

      case UpdateSlot:
        yield* _updateSlot(state, event);
        break;

      case RemoveSlot:
        yield* _removeSlot(state, event);
        break;

      default:
    }
  }

  Stream<SlotState> _loadSlots() async* {
    try {
      _storage ??= await SlotStorage.getInstance();

      final slots = _storage.getSlots();
      yield SlotsLoaded(slots);
    } catch (error) {
      print(error);
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotState> _addSlot(SlotState state, AddSlot event) async* {
    if (state is SlotsLoaded) {
      final addedSlots = state.slots..add(event.slot);

      yield SlotsLoaded(addedSlots);
      _storage.saveSlots(addedSlots);
    } else {
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotState> _updateSlot(SlotState state, UpdateSlot event) async* {
    if (state is SlotsLoaded) {
      final index = state.slots.indexWhere((slot) => event.slot.id == slot.id);
      final removedSlots = state.slots
        ..removeAt(index)
        ..insert(index, event.slot);

      yield SlotsLoaded(removedSlots);
      _storage.saveSlots(removedSlots);
    } else {
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotState> _removeSlot(SlotState state, RemoveSlot event) async* {
    if (state is SlotsLoaded) {
      final removedSlots = state.slots..remove(event.slot);

      yield SlotsLoaded(removedSlots);
      _storage.saveSlots(removedSlots);
    } else {
      yield SlotsNotLoaded();
    }
  }
}
