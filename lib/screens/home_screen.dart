import 'package:flutter/material.dart';
import 'package:starter_app/app_state_container.dart';
import 'package:starter_app/models/app_state.dart';
import 'package:starter_app/screens/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  // new
  AppState appState;

  // new
  Widget get _pageToDisplay {
    if (appState.isLoading) {
      print("22222");
      return _loadingView;
    } else {
      print("33333");
      return _homeView;
    }
  }

  // new
  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  // new
  Widget get _homeView {
    if (appState.user == null) {
      print("7777");
      return new AuthScreen();
    } else {
      print("8888");
      return new Center(child: new Text(appState.user.displayName));
    }
  }

  @override
  Widget build(BuildContext context) {
    // This is the InheritedWidget in action.
    // You can reference the StatefulWidget that
    // wraps it like this, which allows you to access any
    // public method or property on it.
    var container = AppStateContainer.of(context);
    // For example, get grab its property called state!
    appState = container.state;
    // Everything this build method is called, which is when the state
    // changes, Flutter will 'get' the _pageToDisplay widget, which will
    // return the screen we want based on the appState.isLoading
    print("00000");
    Widget body = _pageToDisplay;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Suite'),
      ),
      // Replace the hardcoded widget
      // with our widget that switches.
      body: body,
    );
  }
}