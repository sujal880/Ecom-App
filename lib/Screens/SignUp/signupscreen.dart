import 'package:ecomapp/Routes/appconsts.dart';
import 'package:ecomapp/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:ecomapp/Screens/SignUp/Blocs/signupstates.dart';
import 'package:ecomapp/Screens/SignUp/Controllers/signupcontroller.dart';
import 'package:ecomapp/Widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool tohide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up Screen"),
          centerTitle: true,
        ),
        body: BlocConsumer<SignUpBloc, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadedStates) {
              UiHelper.CustomSnakbar("Welcome ${state.signUpModel.data!.username.toString()}", context);
              Navigator.pushNamedAndRemoveUntil(context, AppConsts.Home, (route) => false);
            } else if (state is SignUpErrorStates) {
              UiHelper.CustomSnakbar(state.error, context);
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingStates) {
               const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomTextField(
                    emailController, "Enter Email", Icons.mail),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: TextField(
                    obscureText: tohide,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                tohide = !tohide;
                              });
                            },
                            icon: tohide
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(CupertinoIcons.eye_slash_fill)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                UiHelper.CustomTextField(
                    usernameController, "Enter Username", Icons.person),
                const SizedBox(
                  height: 30,
                ),
                UiHelper.CustomButton(() {
                  SignUpController.signup(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      usernameController.text.toString(),
                      context);
                }, "Sign Up")
              ],
            );
          },
        ));
  }
}
