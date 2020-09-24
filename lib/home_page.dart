import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/TimerInfo.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int initialValue = 60;

  @override
  void initState() {
    print('InitState');
    var timerInfo = Provider.of<TimerInfo>(context,
        listen: false); // listen: false is mandatory here
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer-initState');
      timerInfo.updateRemainingTime();
      // setState(() {
      //   initialValue--;
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Inside build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Remaining Time'),
            SizedBox(
              height: 32,
            ),
            Consumer<TimerInfo>(
              builder: (context, value, child) {
                return Text(
                  value.getRemainingTime().toString(),
                  style: TextStyle(color: Colors.black, fontSize: 24),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}