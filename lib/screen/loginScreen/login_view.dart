import 'package:flutter/material.dart';
import 'package:newchat/screen/loginScreen/login_navigator.dart';
import 'package:newchat/screen/loginScreen/login_view_model.dart';
import 'package:newchat/shared/base.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';

class Login_Screen_View extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<Login_Screen_View> createState() => _Login_Screen_ViewState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _Login_Screen_ViewState
    extends baseView<Login_Screen_View, LoginViawModel>
    implements LoginNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            Assets.imageHome,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            // resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 200,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'Chat ',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.trim() == '') {
                            return 'Enter Email';
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'correct email format example ->  abcd123@gmail.com';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value!.trim() == '') {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: LoginAccount,
                        child: Text(
                          'Login ',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViawModel initViewModel() {
    return LoginViawModel();
  }

  void LoginAccount() async {
    if (formKey.currentState!.validate()) {
      viewModel.LogintWithFirebaseAuth(
          emailController.text, passwordController.text);
    }
  }
}
