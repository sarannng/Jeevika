import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevika/server/server_bidscreen.dart';

class Sleads extends StatefulWidget {
  @override
  _SleadsState createState() => _SleadsState();
}

class _SleadsState extends State<Sleads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Jeevika',
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
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Admin Panel',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 0, 0, 1),
                        Color.fromRGBO(255, 46, 46, 1)
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Pending Orders',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '28',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(39, 27, 207, 1),
                        Color.fromRGBO(86, 89, 252, 1)
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Completed Orders',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(15, 183, 255, 1),
                        Color.fromRGBO(29, 110, 145, 1)
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Average Price ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '360',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(59, 140, 53, 1),
                        Color.fromRGBO(56, 191, 33, 1)
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          '   Total Earnings   ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3200',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
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
                          'Leads Avialable',
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
                                  //  Container(
                                  //    padding: EdgeInsets.only( top: 9, ),
                                  //    child:  Row(
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
                                  //  ),

                                  //  Container(
                                  //    padding: EdgeInsets.only( top: 9, ),
                                  //    child:  Row(
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
                                  //  ),

                                  //   Container(
                                  //    padding: EdgeInsets.only( top: 9, ),
                                  //    child:  Row(
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
                                  //  ),

                                  //   Container(
                                  //    padding: EdgeInsets.only( top: 9, ),
                                  //    child:  Row(
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
                                  //  ),

                                  //   Container(
                                  //    padding: EdgeInsets.only( top: 9, ),
                                  //    child:  Row(
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
                                  //  ),

                                  Expanded(
                                    child: Container(
                                      // height: 300,
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: Firestore.instance
                                            .collection('worker_leads')
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError)
                                            return new Text(
                                                'Error: ${snapshot.error}');
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return new CircularProgressIndicator();
                                            default:
                                              return new ListView(
                                                children: snapshot
                                                    .data.documents
                                                    .map((DocumentSnapshot
                                                        document) {
                                                  return new ListTile(
                                                    onLongPress: (){
                                                      final String docid= document.documentID;
                                                      Firestore.instance.collection('worker_leads').document('$docid').delete();
                                                      print('document deleted');
                                                    },
                                                    onTap: () {
                                                      // Navigator.pushNamed(context, '/sbid');
                                                      final String id =
                                                          document.documentID;
                                                      print(id);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Sbidscreen(
                                                                      id: id)));

                                                      //Firestore.instance.collection('worker_leads').
                                                    },

                                                    title: Text('Plumber'),
                                                    subtitle: Text(document[
                                                        'description']),
                                                    // trailing: new Image.network(document['qr'],
                                                    // ),
                                                    trailing: Image.network(
                                                      document['photu'],
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) return child;

                                                        return Row(
                                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
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
                                                  );
                                                }).toList(),
                                              );
                                          }
                                        },
                                      ),
                                    ),
                                  )
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
  }
}
