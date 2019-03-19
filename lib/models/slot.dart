import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:intl/intl.dart';

part 'slot.g.dart';

abstract class Slot implements Built<Slot, SlotBuilder> {
  static Serializer<Slot> get serializer => _$slotSerializer;

  int get id;
  DateTime get date;
  DateTime get from;
  DateTime get to;
  String get description;

  Slot._();

  factory Slot({
    int id,
    DateTime date,
    DateTime from,
    DateTime to,
    String description,
  }) {
    return Slot._fromBuilder(
      (b) => b
        ..id = id ?? DateTime.now().millisecondsSinceEpoch
        ..date = date
        ..from = from
        ..to = to
        ..description = description,
    );
  }

  Slot toUTC() {
    return Slot(
      id: id,
      date: date.toUtc(),
      from: from.toUtc(),
      to: to.toUtc(),
      description: description,
    );
  }

  Slot toLocal() {
    return Slot(
      id: id,
      date: date.toLocal(),
      from: from.toLocal(),
      to: to.toLocal(),
      description: description,
    );
  }

  factory Slot._fromBuilder([updates(SlotBuilder b)]) = _$Slot;

  num get hours => to.difference(from).inMinutes / TimeOfDay.minutesPerHour;

  String get roundedHours =>
      hours.truncate() == hours ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1);

  String get formattedDate =>
      "Ngày ${dateFormatter.format(date)}\n" +
      "Từ ${timeFormatter.format(from)} đến ${timeFormatter.format(to)}";
}

final dateFormatter = DateFormat("dd/MM/yyyy");
final timeFormatter = DateFormat("HH:mm");
