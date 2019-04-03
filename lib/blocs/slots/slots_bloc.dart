import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/storages/slot_storage.dart';
import './slots_event.dart';
import './slots_state.dart';

class SlotsBloc extends Bloc<SlotsEvent, SlotsState> {
  SlotStorage _storage;

  static of(BuildContext context) => BlocProvider.of<SlotsBloc>(context);

  @override
  SlotsState get initialState => SlotsLoading();

  @override
  Stream<SlotsState> mapEventToState(SlotsState state, SlotsEvent event) async* {
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

      case ApplySort:
        yield* _applySort(state, event);
        break;

      default:
    }
  }

  Stream<SlotsState> _loadSlots() async* {
    try {
      _storage ??= await SlotStorage.getInstance();

      final slots = _storage.getSlots();
      yield SlotsLoaded(slots);
    } catch (error) {
      print(error);
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotsState> _addSlot(SlotsState state, AddSlot event) async* {
    if (state is SlotsLoaded) {
      final addedSlots = state.slots..add(event.slot);

      yield SlotsLoaded(addedSlots);
      _storage.saveSlots(addedSlots);
    } else {
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotsState> _updateSlot(SlotsState state, UpdateSlot event) async* {
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

  Stream<SlotsState> _removeSlot(SlotsState state, RemoveSlot event) async* {
    if (state is SlotsLoaded) {
      final removedSlots = state.slots..remove(event.slot);

      yield SlotsLoaded(removedSlots);
      _storage.saveSlots(removedSlots);
    } else {
      yield SlotsNotLoaded();
    }
  }

  Stream<SlotsState> _applySort(SlotsState state, ApplySort event) async* {
    if (state is SlotsLoaded) {
      yield SlotsLoaded.withSort(state.slots, event.filter);
    } else {
      yield SlotsNotLoaded();
    }
  }
}
