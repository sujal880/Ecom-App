import 'dart:convert';
import 'package:ecomapp/Screens/SignUp/Blocs/signupevents.dart';
import 'package:ecomapp/Screens/SignUp/Blocs/signupstates.dart';
import 'package:ecomapp/Screens/SignUp/Models/signupmodel.dart';
import 'package:ecomapp/Utils/headers.dart';
import 'package:ecomapp/Utils/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class SignUpBloc extends Bloc<SignUpEvents,SignUpStates>{
  SignUpBloc():super(SignUpInitialStates());
  
  signup(String email,String password,String username)async{
    emit(SignUpLoadingStates());
    final response=await http.post(Uri.parse(BaseUrls.signup),
    headers: Headers.header,
      body: jsonEncode({
        "email":email,
        "password":password,
        "username":username
      })
    );
    if(response.statusCode==200){
      Map<String,dynamic>responsedata=jsonDecode(response.body);
      SignUpModel signUpModel=SignUpModel.fromJson(responsedata);
      emit(SignUpLoadedStates(signUpModel: signUpModel));
    }
    else{
      Map<String,dynamic>errormsg=jsonDecode(response.body);
      String error=errormsg['message'];
      emit(SignUpErrorStates(error: error));
    }
  }
}