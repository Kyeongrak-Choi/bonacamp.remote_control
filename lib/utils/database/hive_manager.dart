import 'package:hive/hive.dart';

import '../constants.dart';

void RegisterAdapter() {
  //Hive.registerAdapter(UserinfoModelAdapter());
}

// Hive DB Initialize
Future<void> BoxInit() async {
  await Hive.openBox(LOCAL_DB);
}

Future<void> BoxClear() async {
  await Hive.openBox(LOCAL_DB);
}

// return Bool Data
bool getHiveBool(bool data) {
  if (data == true) {
    return true;
  } else {
    return false;
  }
}