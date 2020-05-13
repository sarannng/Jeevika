import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jeevika/customer/prebid_wait.dart';

class Cpostbid extends StatefulWidget {
  final String did;
  final String jobid1;

  const Cpostbid({Key key, this.did, this.jobid1}) : super(key: key);

  @override
  _CpostbidState createState() => _CpostbidState();
}

class _CpostbidState extends State<Cpostbid> {
  String wid;
  String worker_photo;
  String wprice;
  String jphoto;
  String jdes;
  String mobile;
  String experience;
  String name;

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

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  getserverdata() {
    //this did is the lowest workers bidid
    print(' in server ');
    print('${widget.jobid1}');
    print('${widget.did}');
    var data = Firestore.instance
        .collection('worker_leads')
        .document('${widget.jobid1}')
        .collection('bids')
        .document('${widget.did}')
        .snapshots();
    data.listen((onValue) {
      wid = onValue.data['wid'];
      print(wid);
      setState(() {
        print('this is setstate of wid');
        wid = onValue.data['wid'];
        print(wid);
        var data2 =
            Firestore.instance.collection('workers').document('$wid').get();
        data2.then((onValue) {
          name = onValue.data['name'];
          print(name);
        });
      });
    });
    // first we get the workers data id
    // and wi(th that fetch all the details required

    // name, photo, job description and etc.
  }

  @override
  void initState() {
    startTimer();
    getserverdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (name != null) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            ' Bidding Completed',
            style: TextStyle(
              fontFamily: 'montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400],
                ],
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Server details',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                  child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      //color: Color.fromRGBO(207, 240, 255, 0.5),
                      borderRadius: BorderRadius.circular(60),
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, colors: [
                        Color.fromRGBO(255, 173, 20, 0.3),
                        Color.fromRGBO(242, 246, 247, 0.3),
                        Color.fromRGBO(70, 176, 91, 0.3)
                      ])),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.orangeAccent),
                                  child: Image.asset(
                                    'assets/images/worker.jpg',
                                    height: 100,
                                    width: 100,
                                  )),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      '$name price 560',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Highest bid price  1100 ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Market avg price 900',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Job Description",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.network(
                                    'https://image.shutterstock.com/image-photo/old-rusty-tap-leaking-water-260nw-540421612.jpg',
                                    height: 100,
                                    width: 100,
                                  ),
                                )),
                            Expanded(
                              flex: 5,
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.  ',
                                    style: GoogleFonts.lato(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "More Information",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Contact number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '9865315466',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Experience',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '4 Years ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Ramesh's Ratings",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RatingBar(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/first');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(255, 82, 90, 1),
                                          Color.fromRGBO(240, 225, 14, 1)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 150.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Checkout",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    } else {
      return Prebidwait();
    }
  }
}
