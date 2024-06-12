import 'dart:developer';
import 'package:ecomapp/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/signupbloc.dart';

class SignUpController{
 static signup(String email,String password,String username,BuildContext context  ){
    if(email=="" || password=="" || username==""){
      return UiHelper.CustomSnakbar("Enter Required Field's", context);
    }
    else{
      BlocProvider.of<SignUpBloc>(context).signup(email, password, username);
      //context.read<SignUpBloc>().signup(email, password, username);
      log("Success");
    }
  }
}