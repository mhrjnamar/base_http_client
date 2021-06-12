import 'package:base_http_client/test_page.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  /// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TestPage(),
    );
  }
}
