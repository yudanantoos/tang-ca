// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Slot> _$slotSerializer = new _$SlotSerializer();

class _$SlotSerializer implements StructuredSerializer<Slot> {
  @override
  final Iterable<Type> types = const [Slot, _$Slot];
  @override
  final String wireName = 'Slot';

  @override
  Iterable serialize(Serializers serializers, Slot object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'from',
      serializers.serialize(object.from,
          specifiedType: const FullType(DateTime)),
      'to',
      serializers.serialize(object.to, specifiedType: const FullType(DateTime)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Slot deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SlotBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Slot extends Slot {
  @override
  final int id;
  @override
  final DateTime date;
  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  final String description;

  factory _$Slot([void updates(SlotBuilder b)]) =>
      (new SlotBuilder()..update(updates)).build();

  _$Slot._({this.id, this.date, this.from, this.to, this.description})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Slot', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('Slot', 'date');
    }
    if (from == null) {
      throw new BuiltValueNullFieldError('Slot', 'from');
    }
    if (to == null) {
      throw new BuiltValueNullFieldError('Slot', 'to');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Slot', 'description');
    }
  }

  @override
  Slot rebuild(void updates(SlotBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SlotBuilder toBuilder() => new SlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Slot &&
        id == other.id &&
        date == other.date &&
        from == other.from &&
        to == other.to &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), date.hashCode), from.hashCode),
            to.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Slot')
          ..add('id', id)
          ..add('date', date)
          ..add('from', from)
          ..add('to', to)
          ..add('description', description))
        .toString();
  }
}

class SlotBuilder implements Builder<Slot, SlotBuilder> {
  _$Slot _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DateTime _from;
  DateTime get from => _$this._from;
  set from(DateTime from) => _$this._from = from;

  DateTime _to;
  DateTime get to => _$this._to;
  set to(DateTime to) => _$this._to = to;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  SlotBuilder();

  SlotBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _from = _$v.from;
      _to = _$v.to;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Slot other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Slot;
  }

  @override
  void update(void updates(SlotBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Slot build() {
    final _$result = _$v ??
        new _$Slot._(
            id: id, date: date, from: from, to: to, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
