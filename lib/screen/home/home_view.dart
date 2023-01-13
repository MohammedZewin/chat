import 'package:flutter/material.dart';
import 'package:newchat/screen/home/home_navigator.dart';
import 'package:newchat/screen/home/home_view_model.dart';
import 'package:newchat/shared/base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends baseView<HomeScreen,HomeViewModel>implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Container(),
    );
  }

  @override
  HomeViewModel initViewModel() {
   return HomeViewModel();
  }


}
