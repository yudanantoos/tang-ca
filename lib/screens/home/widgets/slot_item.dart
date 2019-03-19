import 'package:flutter/material.dart';
import 'package:starter/configs/styles.dart';
import 'package:starter/models/slot.dart';

class SlotItem extends ListTile {
  SlotItem({Slot slot, Function onTap})
      : super(
          contentPadding: const EdgeInsets.only(left: 16, top: 20),
          leading: CircleAvatar(
            backgroundColor: Color(0xFF151B1E),
            child: Text("${slot.roundedHours}"),
          ),
          title: Text(
            slot.description,
            style: TextStyle(
              color: Color(0xFF4CAF50),
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            slot.formattedDate,
            style: TextStyle(height: 1.4),
          ),
          onTap: onTap,
        );
}
