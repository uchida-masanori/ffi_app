import 'package:flutter/material.dart';

import 'native_add.dart';
import 'util/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Flavor を取得し Logging
  const flavor = String.fromEnvironment('FLAVOR');
  logger.i('FLAVOR : $flavor');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // アプリ内文字サイズを固定（本体設定の影響を受けない）
      builder: (context, child) => MediaQuery.withNoTextScaling(child: child!),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('1 + 2 == ${nativeAdd(1, 2)}'),
          ),
        ],
      ),
    );
  }
}
