import 'package:firebase_auth/firebase_auth.dart';
import 'package:jeevika/user_modal.dart';

class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;  
  // create a user object based on firebaseUser

  User _userFromFirebaseUser(FirebaseUser user){
        return user!= null ? User(uid:user.uid) : null;  
  }

   //auth change user stream ( basically it is the point 
  //  which will find that user is signedin or out)

  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }
 
  //signin anon
  Future signinanon() async{
    try{
      
      AuthResult result= await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);

    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in email. & password

   
 
  //register with email and password
 
  Future registerWithEmailAndPassword(String email, String password) async {
     try{
       AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user= result.user;
        return _userFromFirebaseUser(user);
     }catch(e){
       print(e.toString());
       return null;
     }
  }
  //signout
  Future signout() async{
    try{
        return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}

