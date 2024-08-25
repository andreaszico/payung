import 'package:hive/hive.dart';
import 'package:payung_pribadi/core/model/biodata.dart';

class BiodataAdapter extends TypeAdapter<Biodata> {
  @override
  final int typeId = 1;

  @override
  Biodata read(BinaryReader reader) {
    return Biodata(
      name: reader.readString(),
      email: reader.readString(),
      phone: reader.readString(),
      gender: reader.readString(),
      education: reader.readString(),
      marriage: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Biodata obj) {
    writer.writeString(obj.name!);
    writer.writeString(obj.email!);
    writer.writeString(obj.phone!);
    writer.writeString(obj.gender!);
    writer.writeString(obj.education!);
    writer.writeString(obj.marriage!);
  }
}
