import 'dart:async';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevika/customer/customer_postbid.dart';
import 'package:jeevika/customer/prebid_wait.dart';
import 'package:jeevika/customer/cwait&cbid_switch.dart';

class Cbidscreen extends StatefulWidget {
  final String jobid;

  const Cbidscreen({Key key, this.jobid}) : super(key: key);
  @override
  _CbidscreenState createState() => _CbidscreenState();
}

class _CbidscreenState extends State<Cbidscreen> {
  String jobid1;
  @override
  void initState() {
    getjobdesforcustomer();
    getjobid();
    //waitscreen();
    startTimer();
  }

  getjobid() {
    String temp = widget.jobid;
    setState(() {
      jobid1 = temp;
      print('????????????????????????????????????????/');
      print(jobid1);
    });
 
  }

  Timer _timer;
  int _start = 30;
  int _hr;
  int _min;
  int _doccount;
  int doccount;
  String _img;
  String _des;
  bool _status;
  String _lbidamt;
  String _lphotu;
  String _lname;
  String _lwid;
  String _bidid;
  String did;

  // settrue() {
  //   print('query true================================================');
  //   Firestore.instance
  //       .collection('worker_leads')
  //       .document('/$jobid1/bids/$_bidid/')
  //       .updateData({
  //     'bidstatus': true,
  //   });
  //   print('query true================================================');
  // }

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            // for(_start=6; _start<=1; _start=_start - 1){
            //code for changing the toggle of the worker with the least bidamount
            var tog = Firestore.instance
                .collection('worker_leads')
                .document('$jobid1')
                .collection('bids')
                .orderBy('bidamt')
                .limit(1).getDocuments();
                 
            //  StreamBuilder(
            //    stream:  Firestore.instance.collection('worker_leads').document('$jobid1').collection('bids').orderBy('bidamt').limit(1).snapshots(),
            //    builder: (context, snapshot){
            //    //var status=  snapshot.data['status'];
            //    var lowestbidid=snapshot.data.document.documentID;

            //    print('&&&&&&&&&&&&&&&&&&&&&HERE&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
            //   print(lowestbidid);
            //    print('&&&&&&&&&&&&&&&&&&&&&HERE&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
            //     // setState(() {
            //     //   _status= status;
            //     // });

            //    } );
            tog.then((onData) async {
              var datum = onData.documents.first;
              setState(() async {
                //String did;

                _lbidamt = datum.data['bidamt'].toString();
                _lphotu = datum.data['photu'];
                _lname = datum.data['name'];
                did = datum.data['bidid'];

                // _lwid= datum.data['bidamt'];
                print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                 print('query true================================================');
            Firestore.instance
                .collection('/worker_leads/$jobid1/bids')
                .document('$did')
                .updateData({
              'bidstatus': true, 
            });
            print('query true================================================');
           
                print('chl na beeee');
                print(_lname);
                print(_lbidamt);
                 print(did);
              });
            });
               // if(_start< 1){
                   timer.cancel();
            _start = 35;

            //Navigator.pushReplacementNamed(context, '/cpostbid');

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Cpostbid(did:did, jobid1:jobid1)));
               // }
                
            //}
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

            Firestore.instance
                .collection('countdown')
                .document('test')
                .setData({
              'hr': hr,
              'min': min,
            });
          }
        },
      ),
    );
  }

  void getjobdesforcustomer() async {
    String jddd = widget.jobid;
    var datatemp =
        Firestore.instance.collection('worker_leads').document('$jddd').get();

    datatemp.then((onValue) {
      var img = onValue.data['photu'];
      var des = onValue.data['description'];
      setState(() {
        _img = img;
        _des = des;
        print('=====================');
        print(_img);
        print(_des);
        print('=====================');
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  //  void waitscreen() {

  //   setState(() {

  //      var doccount=Firestore.instance.collection('/worker_leads/4yIZ6AZgos9Bc45SrUs0/bids/').getDocuments() ;
  //   //       print(doccount);
  //   //       print(_doccount);
  //   //   _doccount= doccount as int  ;
  //   // });

  //    doccount.then((onValue){
  //     _doccount =  onValue.documents.length;
  //     print('Here---------------------------------------------------');
  //     print(_doccount);
  //     print('Here---------------------------------------------------');
  //    });
  //  });

  //  }

  Future<bool> _backbuttonpressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('This will cancel the bid'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, true),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

    //  if(  _doccount == 2){

    if (_img != null && _des != null) {
      return WillPopScope(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "$_hr:$_min",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Image.network(
                                // 'https://image.shutterstock.com/image-photo/old-rusty-tap-leaking-water-260nw-540421612.jpg',
                                _img,
                                height: 100,
                                width: 100,

                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;

                                  return Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )),
                        Expanded(
                          flex: 7,
                          child: Container(
                              child: Text(
                            //'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.  ',

                            _des,
                            // _lname,
                            style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(22, 26, 145, 1),
                            Color.fromRGBO(34, 79, 201, 1)
                          ])),
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Current bid stream',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // padding: EdgeInsets.all(50),
                                child: Expanded(
                                  //flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.white),
                                    //yaha par list view aaega sidhe database se ye to bas ek dipictin he ki kesa dikhega

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        // Container(
                                        //   padding: EdgeInsets.only(
                                        //     top: 9,
                                        //   ),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceAround,
                                        //     children: <Widget>[
                                        //       CircularProfileAvatar(
                                        //         'https://image.shutterstock.com/image-photo/old-rusty-tap-leaking-water-260nw-540421612.jpg',
                                        //         radius: 20,
                                        //       ),
                                        //       Text(
                                        //         'Ramesh Turrani',
                                        //       ),
                                        //       Text(
                                        //         ' Rs.560',
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                color: Colors.white),
                                            //yaha par list view aaega sidhe database se ye to bas ek dipictin he ki kesa dikhega

                                            child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: StreamBuilder<
                                                        QuerySnapshot>(
                                                    stream: Firestore.instance
                                                        .collection(
                                                            '/worker_leads/$jobid1/bids')
                                                        .snapshots(),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                QuerySnapshot>
                                                            snapshot) {
                                                      if (snapshot.hasError) {
                                                        return Text(
                                                            'Error aaya ye wala ${snapshot.error}');
                                                      }

                                                      switch (snapshot
                                                          .connectionState) {
                                                        // case ConnectionState.waiting:
                                                        //   return CircularProgressIndicator();
                                                        case ConnectionState
                                                            .none:
                                                          // return CircularProgressIndicator();
                                                          return Text('none');

                                                        default:
                                                          if (snapshot.data ==
                                                              null) {
                                                            return Expanded(
                                                                child:
                                                                    Container(
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  CircularProgressIndicator(),
                                                                  Text(
                                                                      ' Please wait for workers to bid'),
                                                                ],
                                                              ),
                                                            ));
                                                          } else {
                                                            return ListView(
                                                                children: snapshot
                                                                    .data
                                                                    .documents
                                                                    .map((DocumentSnapshot
                                                                        document) {
                                                              return ListTile(
                                                                title: Text(document[
                                                                        'bidamt']
                                                                    .toString()),
                                                                subtitle: Text(
                                                                    document[
                                                                        'name']),
                                                                trailing: Image
                                                                    .network(
                                                                  document[
                                                                      'photu'],
                                                                  loadingBuilder: (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null)
                                                                      return child;

                                                                    return Row(
                                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: <
                                                                          Widget>[
                                                                        CircularProgressIndicator(
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                                                              : null,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }).toList());
                                                          }
                                                      }
                                                    })),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: _backbuttonpressed);
    } else {
      return Prebidwait();
    }
    // }

    // else{

    //     return Prebidwait();

    // }
  }
}
