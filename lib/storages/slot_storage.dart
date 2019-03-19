import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/models/slot.dart';
import 'package:starter/models/serializers.dart';
import 'local_storage.dart';

class SlotStorage extends LocalStorage {
  const SlotStorage(SharedPreferences sharedPreferences) : super(sharedPreferences);

  static Future<SlotStorage> getInstance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return SlotStorage(sharedPreferences);
  }

  List<Slot> getSlots() {
    final rawSlots = getField<String>("slots", defaultValue: "");

    if (rawSlots.isNotEmpty) {
      final jsonSlots = json.decode(rawSlots);
      return jsonSlots
          .map<Slot>((jsonSlot) => serializers.deserializeWith(Slot.serializer, jsonSlot).toLocal())
          .toList();
    }

    return [];
  }

  void saveSlots(List<Slot> slots) {
    final jsonSlots = slots
        .map((slot) => slot.toUTC())
        .map((slot) => serializers.serializeWith(Slot.serializer, slot))
        .toList();

    setField("slots", json.encode(jsonSlots));
  }
}
