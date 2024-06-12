import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextField(TextEditingController controller,String text,IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
      ),
    );
  }

  static CustomButton(VoidCallback callback,String text){
    return GestureDetector(
      onTap: (){
        callback();
      },
      child: Container(
        height: 45,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blue
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15),),),
      ),
    );
  }

  static CustomSnakbar(String title,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title),backgroundColor: Colors.blue,));
  }
}