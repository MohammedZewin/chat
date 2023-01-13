import 'package:firebase_auth/firebase_auth.dart';
import 'package:newchat/screen/loginScreen/login_navigator.dart';
import 'package:newchat/shared/base.dart';

class LoginViawModel extends baseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;
  String message = '';

  void LogintWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = 'Successfully Logged ';
    } on FirebaseAuthException catch (e) {
      message = 'Wrong Email or Password';
    } catch (e) {
      message = 'Wrong $e';
    }

    if (message != '') {
      navigator!.hideLoading();
      navigator!.showLoading(message: message);
    }
  }
}
