import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'User Onboarding',
        home: LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeInOut);
    _iconAnimation.addListener(() {this.setState((){});});
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo, Input, Login, 
               
                FlutterLogo(
                  size: (_iconAnimation.value * 100)
                ), 
                
              ],
            )
          ],
        ));
  }
}
