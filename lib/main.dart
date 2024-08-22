import 'package:ch3_lec8/screen/fristtask.dart';
import 'package:ch3_lec8/screen/homepage.dart';
import 'package:ch3_lec8/screen/secondtask.dart';
import 'package:ch3_lec8/screen/thirdtask.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
       "/":(context){
         return HomePage();
       },
       "firsttask":(context){
         return FristTask();
       },
       "secondtask":(context){
         return SecondTask();
       },
       "thirdtask":(context){
         return ThirdTask();
       },
     },
   ),
  );
}