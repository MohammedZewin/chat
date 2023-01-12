import 'package:flutter/material.dart';

abstract class baseNavigator {
  void showLoading({String message});

  void Message(String message);

  void hideLoading();
}

class baseViewModel <NAV extends baseNavigator >  extends ChangeNotifier  {
   NAV? navigator;



}


abstract class baseView<T extends StatefulWidget, VM extends baseViewModel>
    extends State<T> implements baseNavigator{
  late VM viewModel;
  VM  initViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=initViewModel();
  }

  @override
  void Message(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message='Loading...'}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Row(
          children: [
            Text(message),
            CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}
