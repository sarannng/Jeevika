import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevika/customer/customer_postbid.dart';
import 'package:jeevika/customer/prebid_wait.dart';

class Sbidscreen extends StatefulWidget {
  final String id;

  const Sbidscreen({Key key, this.id}) : super(key: key);

  @override
  _SbidscreenState createState() => _SbidscreenState();
}

class _SbidscreenState extends State<Sbidscreen> {
  //TextEditingController gettext = new TextEditingController();
  final gettext = TextEditingController();
  String _hr;
  String _min;
  int min;
  String _jobimage;
  String _jobdescription;
  String _bidid;

  String _id;
  String _idd;
  String _anderwalibidid;
  bool _toggler;
  @override
  void initState() {
    getjobdata();
    setid();
    getcounter();
    super.initState();
  }

  setid() {
    setState(() {
      String bidid = widget.id;
      _bidid = bidid;
    });
  }

  // void getcount(){
  //   var count=Firestore.instance.collection('countdown').document('test').get();

  //   count.then((onValue){
  //     var hr = onValue.data['hr'];
  //     var min= onValue.data['min'];

  //     setState(() {
  //       _hr=hr;
  //       _min=min;
  //     });
  //   });
  // }

  void getjobdata() {
    print('=================================================================');
    var idd = widget.id;
    setState(() {
      _idd = idd;
    });
    print(idd);
    var fdata =
        Firestore.instance.collection('worker_leads').document('$idd').get();

    fdata.then((onValue) {
      var jobimage = onValue.data['photu'];
      var jobdescription = onValue.data['description'];
      print(
          '_________________________________________________________________________________');
      print(jobdescription);

      setState(() {
        _jobimage = jobimage;
        _jobdescription = jobdescription;
      });
    });
  }

  docidforworkerbid() {
    var anderwalibidid = Firestore.instance
        .collection('/worker_leads/$_bidid/bids')
        .document()
        .documentID;
    setState(() {
      _anderwalibidid = anderwalibidid;

      print('this is $anderwalibidid');
    });
  }

  getcounter() {
    var getcount =
        Firestore.instance.collection('countdown').document('test').snapshots();
    getcount.listen((onData) {
      setState(() async {
        var hr = onData.data['hr'];
        _hr = hr.toString();
        min = onData.data['min'];
        _min = min.toString();

        if (min == 1) {
          print('in if $min');
          var dataholder = Firestore.instance
              .collection('worker_leads')
              .document('$_idd')
              .collection('bids')
              .document('$_anderwalibidid')
              .snapshots();
          
///////////////----FLUTTER QUESTION OF THE WEEKEND//////////////////////////
          // sleep(const Duration(seconds: 4));

                        //OR            
          print('Delay started');
        await Future.delayed(const Duration(seconds: 2));
      // sleep(const Duration(seconds: 10 ));
             print('Delay ended');
             dataholder.listen((onValue) {
            setState(() async {
              _toggler = await onValue.data['bidstatus'];
              print('this is toggeler');
              print(_toggler);
              
              if (_toggler == false) {
            print('at bid lost');
            Navigator.pushReplacementNamed(context, '/sbidlost');
          } else if (_toggler == true) {
            print('at bid wom');
            Navigator.pushReplacementNamed(context, '/sbidwon');
          } else {
            print('roggler ka else');
          }
              print('this is toggeler');


            });
          });
////////////////////////////////////////////////////////////////////////////             
              print('this is toggeler after delay');
              print(_toggler);
              print('tthis is toggeler after delay');
          //    if (_toggler == false) {
          //   print('at bid lost');
          //   Navigator.pushReplacementNamed(context, '/sbidlost');
          // } else if (_toggler == true) {
          //   print('at bid wom');
          //   Navigator.pushReplacementNamed(context, '/sbidwon');
          // } else {
          //   print('roggler ka else');
          // }
        } else {
          print('at else');
          print(min);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_jobimage != null && _min != null) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
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

                          //if bracket close
                          // else {
                          //   var dataholder = Firestore.instance
                          //       .collection('worker_leads')
                          //       .document('$_idd')
                          //       .collection('bids')
                          //       .document('$_anderwalibidid')
                          //       .get();
                          //   dataholder.then((onValue) {
                          //     _toggler = onValue.data['bidstatus'];
                          //   });
                          //   if (_toggler == false) {
                          //     Navigator.pushReplacementNamed(
                          //         context, '/sbidlost');
                          //   } else {
                          //     Navigator.pushReplacementNamed(
                          //         context, '/sbidwon');
                          //   }
                          // }
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

                            _jobimage,

                            height: 100,
                            width: 100,
                          ),
                        )),
                    Expanded(
                      flex: 7,
                      child: Container(
                          child: Text(
                        //'Lorem ipsum dolor sit amet,   consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.  ',
                        // widget.id,
                        _jobdescription,
                        style: GoogleFonts.lato(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(53, 161, 81, 1),
                          Color.fromRGBO(26, 130, 53, 1)
                        ],
                      )),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Enter Your Price',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      child: TextField(
                                        controller: gettext,
                                        decoration: InputDecoration(
                                          hintText: 'Enter amount',
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.orange[440],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      child: RaisedButton(
                                        onPressed: () async {
                                          // Navigator.pushReplacementNamed(
                                          //     context, '/sleads');
                                          print('button tap');
                                          docidforworkerbid();

                                          Firestore.instance
                                              .collection(
                                                  '/worker_leads/$_bidid/bids')
                                              .document('$_anderwalibidid')
                                              .setData({
                                            'name': 'Sarang ',
                                            'bidamt': gettext.text,
                                            'photu':
                                                'https://firebasestorage.googleapis.com/v0/b/jeevika-2532066.appspot.com/o/passport.jpg?alt=media&token=497001c9-0364-4699-a196-cf00807f1451',
                                            'bidstatus': false,
                                            'bidid': _anderwalibidid,
                                            'wid': '7u4uGk14SaJEa8h6iBX8'
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.purple,
                                                  Colors.redAccent
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 150.0,
                                                minHeight: 50.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              " Place the bid",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
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
              Expanded(
                flex: 5,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: StreamBuilder<QuerySnapshot>(
                                              stream: Firestore.instance
                                                  .collection(
                                                      '/worker_leads/$_bidid/bids')
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      'Error aaya ye wala ${snapshot.error}');
                                                }

                                                switch (
                                                    snapshot.connectionState) {
                                                  // case ConnectionState.waiting:
                                                  //   return CircularProgressIndicator();
                                                  case ConnectionState.none:
                                                    // return CircularProgressIndicator();
                                                    return Text('none');

                                                  default:
                                                    if (snapshot.data == null) {
                                                      return Expanded(
                                                          child: Container(
                                                        child: Column(
                                                          children: <Widget>[
                                                            CircularProgressIndicator(),
                                                            Text(
                                                                ' Please wait for workers to bid'),
                                                          ],
                                                        ),
                                                      ));
                                                    } else {
                                                      return ListView(
                                                          children: snapshot
                                                              .data.documents
                                                              .map((DocumentSnapshot
                                                                  document) {
                                                        return ListTile(
                                                          title: Text(
                                                              document['bidamt']
                                                                  .toString()),
                                                          subtitle: Text(
                                                              document['name']),
                                                          trailing:
                                                              Image.network(
                                                            document['photu'],
                                                            loadingBuilder:
                                                                (BuildContext
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
                                                                    value: loadingProgress.expectedTotalBytes !=
                                                                            null
                                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                                            loadingProgress.expectedTotalBytes
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
      );
    } else {
      // return  Prebidwait();
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[CircularProgressIndicator()],
              )
            ],
          ),
        ),
      );
    }
  }
}
