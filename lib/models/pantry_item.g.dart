// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PantryItemAdapter extends TypeAdapter<PantryItem> {
  @override
  final int typeId = 0;

  @override
  PantryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PantryItem(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      expiryDate: fields[3] as DateTime,
      quantity: fields[4] == null ? 1 : fields[4] as int,
      purchaseDate: fields[5] as DateTime?,
      isConsumed: fields[6] == null ? false : fields[6] as bool,
      isWasted: fields[7] == null ? false : fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PantryItem obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.expiryDate)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.purchaseDate)
      ..writeByte(6)
      ..write(obj.isConsumed)
      ..writeByte(7)
      ..write(obj.isWasted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PantryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
