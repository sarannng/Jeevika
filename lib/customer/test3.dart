import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  Timer _timer;
  int _start = 62;
  int _hr;
  int _min;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            _start=5;
          } else {
            
            var tem= _start;
            var hr = (tem/ 60).floor();
            var min = ((tem % 60));

            _hr=hr;
            _min=min;
            print(hr); 
            print(  min);
            _start = _start - 1;
            // print(_start);

            Firestore.instance.collection('countdown').document('test').setData({
              'hr' : hr,
              'min' : min,
            });


          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Timer test")),
    body: Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            startTimer();
          },
          child: Text("start"),
        ),
        Text("$_start"),

        Text("$_hr : $_min" ),


      ],
    ),
  );
  }
}
