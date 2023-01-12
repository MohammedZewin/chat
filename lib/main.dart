import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newchat/firebase_options.dart';
import 'package:newchat/screen/create_account/create_account.dart';
import 'package:newchat/screen/loginScreen/login_view.dart';
import 'package:newchat/shared/styles/myTheme.dart';



import 'layout/home_layout/home_layout.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login_Screen_View.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        Create_Account_Screen.routeName:(context) => Create_Account_Screen(),
        Login_Screen_View.routeName:(context) => Login_Screen_View(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
