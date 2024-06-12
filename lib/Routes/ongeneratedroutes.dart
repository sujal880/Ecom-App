import 'package:ecomapp/Routes/appconsts.dart';
import 'package:ecomapp/Screens/Homescreen/homescreen.dart';
import 'package:ecomapp/Screens/SignUp/signupscreen.dart';
import 'package:flutter/material.dart';

class OnGeneratedRoutes{
   Route<dynamic>route(RouteSettings routeSettings){
    final args=routeSettings.arguments;
    switch(routeSettings.name){
      case AppConsts.SignUp:{
        return materialBuilder(widget: const SignUpScreen());
      }
      case AppConsts.Home:{
        return materialBuilder(widget: const HomeScreen());
      }
      default: {
        return materialBuilder( widget: const ErrorPage());
      }
    }
  }

  MaterialPageRoute materialBuilder({required Widget widget}){
    return MaterialPageRoute(builder: (_)=>widget);
  }
}
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Oops an Error Occured!!"),
      ),
    );
  }
}