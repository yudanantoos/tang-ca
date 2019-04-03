import 'package:starter/models/sort_type.dart';
import 'package:starter/models/slot.dart';

abstract class SlotsState {}

class SlotsLoading extends SlotsState {}

class SlotsLoaded extends SlotsState {
  final List<Slot> slots;
  final SortType filter;

  SlotsLoaded._(this.slots, this.filter);

  factory SlotsLoaded(List<Slot> slots) => SlotsLoaded._(slots, SortType.oldToNew);

  factory SlotsLoaded.withSort(List<Slot> slots, SortType filter) {
    final sortedSlots = slots;

    switch (filter) {
      case SortType.oldToNew:
        sortedSlots.sort((a, b) => a.from.compareTo(b.from));
        break;

      case SortType.newToOld:
        sortedSlots.sort((a, b) => b.from.compareTo(a.from));
        break;

      case SortType.ascending:
        sortedSlots.sort((a, b) => a.hours.compareTo(b.hours));
        break;

      case SortType.descending:
        sortedSlots.sort((a, b) => b.hours.compareTo(a.hours));
        break;

      default:
    }

    return SlotsLoaded._(sortedSlots, filter);
  }
}

class SlotsNotLoaded extends SlotsState {}
