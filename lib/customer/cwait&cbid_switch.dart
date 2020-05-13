import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jeevika/customer/customer_bidscreen.dart';
import 'package:jeevika/customer/prebid_wait.dart';

class Cswitchwaittobid extends StatefulWidget {
  final String jobid;

  const Cswitchwaittobid({Key key, this.jobid}) : super(key: key);
  @override
  _CswitchwaittobidState createState() => _CswitchwaittobidState();
}

int _doccount;

int _doccoun = 2;
String _jobid;

class _CswitchwaittobidState extends State<Cswitchwaittobid> {
  @override
  void initState() {
    waitscreen();
    startTimer();
    setjobid();
    super.initState();
  }

  setjobid() {
    setState(() {
      var temp = widget.jobid;
      _jobid = temp;
    });
  }

  Timer _timer;
  int _start = 10;
  int _hr;
  int _min;
  int _doccount;
  int doccount;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            _start = 10;
          } else {
            var tem = _start;
            var hr = (tem / 60).floor();
            var min = ((tem % 60));

            _hr = hr;
            _min = min;
            // print(hr);
            // print(  min);
            _start = _start - 1;
            // print(_start);

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

  void waitscreen() {
    setState(() {
      var doccount = Firestore.instance
          // .collection('/worker_leads/4yIZ6AZgos9Bc45SrUs0/bids/')
          .collection('/worker_leads/$_jobid/bids/')
          .snapshots();
      //       print(doccount);
      //       print(_doccount);
      //   _doccount= doccount as int  ;
      // });

      doccount.listen((onValue) {
      
        setState(() {
            _doccount = onValue.documents.length;
        print('Here---------------------------------------------------');
        print(_doccount);
        print('Here---------------------------------------------------');
      
        });
      });
    });
  }

  //code for sync document counts
  // return FutureBuilder(
  //   future: Firestore.instance.collection('/worker_leads/4yIZ6AZgos9Bc45SrUs0/bids/').snapshots().length ,
  //   builder: (context, snapshot ){
  //      if (snapshot.hasError)
  //     return new Text('Error: ${snapshot.error}');
  //   switch (snapshot.connectionState) {
  //      case ConnectionState.waiting: return new Text('Loading...');
  //      case ConnectionState.active : return new Text('State activr');
  //      case ConnectionState.none : return new Text('State none');
  //      case ConnectionState.done  : return new Text('State  d');

  //     default:
  //     var count= snapshot.data;

  //   }
  //   });

  @override
  Widget build(BuildContext context) {
    if (_doccount != null ) {
      return Cbidscreen(jobid: _jobid);
    } else {
      return Prebidwait(doc: _doccount);
    }
  }
}
