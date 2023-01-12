
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newchat/screen/loginScreen/login_navigator.dart';
import 'package:newchat/shared/base.dart';

import '../../componants/firebase_error.dart';

class LoginViawModel extends baseViewModel<LoginNavigator>{


  void LogintWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigator!.hideLoading();
      navigator!.Message('Successfully Logged ');
    } on FirebaseAuthException catch (e) {

        navigator!.hideLoading();
        navigator!.Message('Wrong Email or Password');

    } catch (e) {
      navigator!.hideLoading();
      navigator!.Message(e.toString());
    }
  }


}