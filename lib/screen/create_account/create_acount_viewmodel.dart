import 'package:firebase_auth/firebase_auth.dart';
import 'package:newchat/componants/firebase_error.dart';
import 'package:newchat/screen/create_account/create_account_navigator.dart';
import 'package:newchat/shared/base.dart';


class CreateAccountViewModel extends baseViewModel<CreateAccountNavigator> {
  void CreatAccountWithFirbaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigator!.hideLoading();
      navigator!.Message('Create Account');
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        navigator!.hideLoading();
        navigator!.Message('The password provided is too weak.');
      } else if (e.code == FirebaseError.emailAlreadyInUse) {
        navigator!.hideLoading();
        navigator!.Message('The account already exists for that email.');
      }
    } catch (e) {
      navigator!.hideLoading();
      navigator!.Message(e.toString());
    }
  }
}
