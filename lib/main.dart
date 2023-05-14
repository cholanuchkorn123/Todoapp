import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/ui/screen/Home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/ui/screen/PinScreen.dart';
import 'package:todo_app/ui/screen/UsernameScreen.dart';

import 'data/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  var todoStore = await Hive.openBox('boxtodo');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TodoDataBase db = TodoDataBase();
    bool isEmpty = db.isUsernameEmpty();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !isEmpty ? const PincodeScreen() : const UsernameScree(),
    );
  }
}
