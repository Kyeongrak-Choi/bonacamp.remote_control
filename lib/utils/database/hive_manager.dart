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

// init set token
Future<void> initKey(email) async {
  await Hive.box(LOCAL_DB).put(email, '');
}

Future<String> getKey(email) async {
  String key =
  await Hive.box(LOCAL_DB).get(email, defaultValue: 'fail');

  if (key == 'fail') {
    return 'GetKey() Failed';
  } else {
    return key;
  }
}