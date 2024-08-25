import 'package:hive_flutter/hive_flutter.dart';
import 'package:payung_pribadi/core/storage/adapter/biodata_adapter.dart';

const profileBiodata = 'profile_biodata';

class Storage {
  static initStorage() async {
    Hive.registerAdapter(BiodataAdapter());
  }
}
