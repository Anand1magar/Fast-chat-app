import 'package:fast_chat/component/rounded_button.dart';
import 'package:fast_chat/screens/login_screen.dart';
import 'package:fast_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  //crating static variable so that we can access with className
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // Mixins are a way of reusing a class’s code in multiple classhierarchies.

  //creating variable which type is animationController
  AnimationController controller;
  Animation animation;

  @override

  /*initState will call  when _WelcomeScreenState get created 
  and init state will call when page or screen will render for first time
  so we have to hot restat our application to call init state*/
  void initState() {
    super.initState();

    //Initilizing controller by creating AnimationContoller constructor
    controller = AnimationController(
      //how long do you want a animation to go
      duration: Duration(seconds: 1),

      /*  where we provide ticker provider by adding with
       SingleTickerProviderStateMixin to our _WelcomeScreenState 
       class  so our welcome class will act as a singleTickerProvider and 
        Mixin will provide different ability to our _WelcomeScreenState class 
       or we can say by  adding this with  singleTickerProvider
        we enable our _WelcomeScreenState to act as a ticker  */
      vsync: this,
      // upperBound: 100.0,
      /* 1 to 100 in a second 
    Note:- donot use upperBound while using curved animation */
    );

    //controller is the existing animation
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    /*after providing the color value we call .animate(controller) which will returne 
    Animation and store that in animation variable */
    animation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);

    /*this forward our animation  and in  1 second ther is
    //  60 controller.reverse(from: 1.0);ticks  in which our controller animate in 60 steps  */
    controller.forward();

    /* we can listen when animation is finished , and if it is forward it will be completed
       if it is reversed it will be dismissed */
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    //we can listener the value came from  controller
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  // @override
  // //if welcome screen will distroyed this dispose method will call
  // void dispose() {
  //   super.dispose();x
  //   controller.dispose(); // animation will stop
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 1000),
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "Login",
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: "Registration",
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
