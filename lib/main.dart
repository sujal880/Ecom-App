import 'package:ecomapp/Routes/ongeneratedroutes.dart';
import 'package:ecomapp/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:ecomapp/Screens/SignUp/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SignUpBloc())
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        onGenerateRoute: OnGeneratedRoutes().route,
        initialRoute: "/",
        routes: {
          "/":(context)=>const SignUpScreen()
        },
      ),
    );
  }
}
