import 'package:flutter/material.dart';
import 'package:flutter_provider/TimerInfo.dart';
import 'package:provider/provider.dart';

import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      home: ChangeNotifierProvider(
          create: (ctx) => TimerInfo(), child: MyHomePage()),
    );
  }
}
