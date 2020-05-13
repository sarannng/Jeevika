import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:jeevika/customer/cwait&cbid_switch.dart';
import 'package:jeevika/customer/prebid_wait.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  File _image;
 TextEditingController desc = new TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
requestworkerbutton() async{
  // Navigator.pushReplacementNamed(context, '/waiting');
                    // Navigator.pushReplacementNamed(context, '/cwaitbid');
                  // Navigator.pushReplacementNamed(context, '/cbid');
                  //Navigator.pushReplacementNamed(context, '/cpostbid');
                  print(new DateTime.now().millisecondsSinceEpoch);
                  //description();
                  //                       Navigator
                  // .of(context)
                  // .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Prebidwait()));
                      var timestamp= new DateTime.now().millisecondsSinceEpoch;
                  final StorageReference storageReference =
                      FirebaseStorage.instance.ref().child('$timestamp');

                  final StorageUploadTask uploadTask =
                      storageReference.putFile(_image);

                  // StorageTaskSnapshot storageTaskSnapshot =
                  //     await uploadTask.onComplete;
                  // String downloadUrl =
                  //     await storageTaskSnapshot.ref.getDownloadURL();
                  //     print(downloadUrl);
                  //print(uploadTask.onComplete);
              if(await uploadTask.onComplete != null) {
               
                print(uploadTask.onComplete);
                    String url =
                        (await storageReference.getDownloadURL()).toString();
                    print(url);
 print('===========================================');
                print('===========================================');
                print('===========================================');
                    String jobid=   Firestore.instance.collection('workers_leads').document().documentID.toString();
                      print('===========================================');
                                print(jobid);
                      print('===========================================');
                    Firestore.instance
                        .collection("worker_leads")
                        .document('$jobid')
                        .setData({
                      'description': desc.text,
                      'photu': url,
                      
                    });
 //Navigator.pushReplacementNamed(context, '/cwaitbid');
//Navigator.push(context, MaterialPageRoute(builder: (context) =>  Cswitchwaittobid(jobid: jobid)));
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Cswitchwaittobid(jobid: jobid)));



                    // Firestore.instance.collection('worker_leads').document('$jobid').collection('bids').document().setData({
                    //   'name':'null',
                    //   'photu': 'null',
                    //   'bidamt': 'null',
                    // });          
                              }

                             
                          // else if(await uploadTask.isInProgress==true){
                          //  print('saa re ga ma pa dha ni sa');
                          // }  
}




  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Describe your issue!',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,

                    //fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Write a few lines about the problem",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black54),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: desc,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Start writing here',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Tap on the button to upload image",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Center(
                          child: _image == null
                              ? Text('No image selected.')
                              : Image.file(
                                  _image,
                                  height: 250,
                                  width: 250,
                                ),
                        ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              getImage();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.orange, Colors.amber],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 150.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Upload image",
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
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: ()   {
                   print('sarang');
                                 CupertinoActivityIndicator();
                  requestworkerbutton();
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
                    constraints:
                        BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Request worker",
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
    
    
    
    );
  }
}
