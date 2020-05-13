import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jeevika/auth.dart';
import 'package:jeevika/customer/customer_bidscreen.dart';
import 'package:jeevika/customer/customer_postbid.dart';
import 'package:jeevika/customer/description.dart';
import 'package:jeevika/customer/first.dart';
import 'package:jeevika/customer/prebid_wait.dart';
import 'package:jeevika/server/server_bidlost.dart';
import 'package:jeevika/server/server_bidscreen.dart';
import 'package:jeevika/server/server_bidwon.dart';
import 'package:jeevika/server/server_leads.dart';
import 'package:jeevika/server/server_signup2.dart';
import 'package:jeevika/server/server_signupdetails.dart';
import 'package:jeevika/signup.dart';
import 'package:jeevika/user_modal.dart';

import 'customer/cwait&cbid_switch.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
//  return StreamProvider<User>.value(
//     value: AuthService().user,


//    child:  MaterialApp(

     return MaterialApp(
      // home: MyHomePage(),

      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/signup': (context) => Signup(),
        '/ssignupdetails': (context) => ServerSignupDetails(),
        '/ssignupdetails2': (context) => SsignupDetails2(),


        '/first': (context) => First(),
        '/description': (context) => Description(),
        '/waiting': (context) => Prebidwait(),
        '/cbid': (context) => Cbidscreen(),
        '/cpostbid': (context) => Cpostbid(),
        '/sleads': (context) => Sleads(),
        '/sbid': (context) => Sbidscreen(),
        '/cwaitbid': (context) => Cswitchwaittobid(),
        '/sbidlost': (context) => Sbidlost(),
        '/sbidwon': (context) => Sbidwon(),
      },
    );
//  );     comment for closing the strean provider
  
  
  
  
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    


  final _email = TextEditingController();
  final _pass = TextEditingController();

  //firestore auth
//final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;



//firestore auth
Future<FirebaseUser> _handleSignIn() async {
  // final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   accessToken: googleAuth.accessToken,
  //   idToken: googleAuth.idToken,
  // );

  // final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  // print("signed in " + user.displayName);
  // return user; 

 Future<AuthResult> result= _auth.createUserWithEmailAndPassword(email: _email.text, password: _pass.text);
   
}

Future<FirebaseUser> signin() async{
  _auth.signInWithEmailAndPassword(email: _email.text, password: _pass.text);

  print('aragn');
 
}



  @override
  Widget build(BuildContext context) {
    
  // final user = Provider.of<User>((context));
  //   print('+++++++++++++++++++++++++++++++++++++++++++++');
  //   print(user);
  //   print('+++++++++++++++++++++++++++++++++++++++++++++');
  // commented provider
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],

              // Color.fromRGBO(0, 0, 0, 1),
              // Color.fromRGBO(20, 19, 19, 1),
              // Color.fromRGBO(41, 39, 39, 1),
            ],
          ),
        ),

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // Text(
            //   'Jeevika',
            //   style: TextStyle(
            //       fontSize: 40,
            //       color: Colors.white,
            //       fontWeight: FontWeight.w500),
            // ),

            Image.asset(
              'assets/images/logo3.png',
              width: 150,
              height: 150,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color:  Color.fromRGBO(115, 101, 101,  1),
                    // gradient: LinearGradient(
                    //     colors: [Colors.orange[200], Colors.orange[100]]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      // bottomLeft: Radius.circular(60),
                      // bottomRight: Radius.circular(60)
                    )),
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Login here!',
                        style: TextStyle(
                            fontFamily: 'lato',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(225, 97, 27, 0.3),
                              blurRadius: 5,
                              offset: Offset(10, 10),
                            )
                          ],
                        ),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                //padding: EdgeInsets.all(4),

                                child: TextField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    hintText: 'Enter email or phone',
                                    border: InputBorder.none,
                                    filled: true,

                                    // fillColor: Color.fromRGBO(199, 193, 193, 1),
                                    fillColor:
                                        Color.fromRGBO(255, 199, 115, 0.2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 97, 27, 0.3),
                                offset: Offset(10, 10),
                                blurRadius: 5)
                          ],
                        ),
                        child: Container(
                          //padding: EdgeInsets.only(left: 12),
                          child: TextField(
                            controller: _pass,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter password',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(context, '/first');
                                   Navigator.pushReplacement(context,  MaterialPageRoute(builder: (BuildContext context) => First()));
                                // String keyid = _email.text;
                                // print(_email.text);
                                // print(_pass.text);
                                // // _handleSignIn();
                                // signin();



                        
                                 
                                  // var check = Firestore.instance
                                  //     .collection('workers')
                                  //     .where(
                                  //       'email',
                                  //       isEqualTo: '$keyid',
                                  //     )
                                  //     .getDocuments();
                                  // check.then((onData) {
                                  // if(onData.documents.first.exists){
                                  //    print(onData.documents.first.data);
                                  // }
                                  // else{
                                  //   print('notfound');
                                  // }
                                      
                                   
                               
                                  // });
                                  
                               

                                  //Navigator.pushReplacement(context,  MaterialPageRoute(builder: (BuildContext context) => First()));
                              
                              
                              //_auth.verifyPhoneNumber(phoneNumber: _email.text, timeout:null, verificationCompleted: null, verificationFailed: null, codeSent: null, codeAutoRetrievalTimeout: null);
                            
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 150.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Customer Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/sleads');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.red, Colors.redAccent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Server Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, '/sbidlost');
                            Navigator.pushNamed(context, '/signup');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.black26],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Signup",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
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
        ),
      ),
    );
 
 
  }
}
