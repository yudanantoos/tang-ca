import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starter/blocs/slot_bloc/slot.dart';
import 'package:starter/models/slot.dart';
import 'package:starter/routes.dart';
import 'package:starter/screens/home/widgets/spacing.dart';
import 'package:starter/widgets/button.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class SlotDetail extends StatefulWidget {
  final Slot slot;

  const SlotDetail(this.slot);

  @override
  State<StatefulWidget> createState() => _SlotDetailState();
}

class _SlotDetailState extends State<SlotDetail> {
  final _formKey = GlobalKey<FormState>();

  bool _isValid = false;
  String _description;
  DateTime _date;
  DateTime _fromTime;
  DateTime _toTime;

  Slot get _slot => widget.slot;
  bool get _isUpdate => widget.slot != null;

  @override
  void initState() {
    if (_isUpdate) {
      setState(() {
        _description = _slot.description;
        _date = _slot.date;
        _fromTime = _slot.from;
        _toTime = _slot.to;
        _isValid = true;
      });
    }

    super.initState();
  }

  void _submit() {
    _formKey.currentState.save();

    if (_formKey.currentState.validate()) {
      final slot = Slot(
        id: _isUpdate ? _slot.id : null,
        description: _description,
        date: _date,
        from: _fromTime,
        to: _toTime,
      );

      if (_isUpdate) {
        SlotBloc.of(context).dispatch(UpdateSlot(slot));
      } else {
        SlotBloc.of(context).dispatch(AddSlot(slot));
      }

      Router.of(context).pop();
    } else {
      setState(() {
        _isValid = false;
      });
    }
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () {
        setState(() {
          _isValid = _formKey.currentState.validate();
        });
      },
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Lí do",
            ),
            initialValue: _description ?? "",
            autofocus: true,
            onSaved: (text) => _description = text,
            validator: (String value) {
              if (value == null || value.trim().isEmpty) {
                return "Lí do không được để trống";
              }
            },
          ),
          Spacing(),
          DateTimePickerFormField(
            format: DateFormat("dd/MM/yyyy"),
            inputType: InputType.date,
            initialValue: _date ?? DateTime.now(),
            editable: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Ngày",
            ),
            onSaved: (DateTime date) => _date = date,
            validator: (DateTime date) {
              if (date == null) {
                return "Ngày không được để trống";
              }
            },
          ),
          Spacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: DateTimePickerFormField(
                  format: DateFormat("HH:mm"),
                  inputType: InputType.time,
                  initialValue: _fromTime ?? DateTime.now(),
                  editable: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Từ",
                  ),
                  onSaved: (DateTime date) => _fromTime = date,
                  validator: (DateTime time) {
                    if (time == null) {
                      return "Giờ không được trống";
                    }
                  },
                ),
              ),
              Spacing(),
              Expanded(
                child: DateTimePickerFormField(
                  format: DateFormat("HH:mm"),
                  inputType: InputType.time,
                  initialValue: _toTime ?? null,
                  editable: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Đến",
                  ),
                  onSaved: (DateTime time) {
                    if (_formKey.currentState.validate()) {
                      _toTime = time;
                    }
                  },
                  validator: (DateTime time) {
                    if (time == null) {
                      return "Giờ không được trống";
                    } else if (_fromTime != null && _fromTime.isAfter(time)) {
                      return "Giờ kết thúc < bắt đầu";
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: PrimaryButton(
        disabled: !_isValid,
        bottomFloat: true,
        text: _isUpdate ? "CẬP NHẬT" : "THÊM MỚI",
        onTap: _isValid ? _submit : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm"),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            _buildForm(),
            _buildButton(),
          ],
        ),
      ),
    );
  }
}
