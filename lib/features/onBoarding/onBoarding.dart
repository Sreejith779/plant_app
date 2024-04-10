import 'package:flutter/material.dart';
import 'package:plant_app/features/signUpPage/signUpPage.dart';
import 'package:plant_app/utils/colors.dart';

import '../loginPage/loginPage.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
           width: double.maxFinite,
           decoration: const BoxDecoration(
             image: DecorationImage(image: NetworkImage("https://ihaveadhd.com/wp-content/uploads/2021/01/high-angle-view-green-leaves-768x512.jpg"),
             fit: BoxFit.cover,
             opacity: 0.8)
           ) ,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 200,left: 40),
              child: Text("The best",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold
              ),),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0,left: 40),
              child: Text("app for",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold
              ),),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0,left: 40),
              child: Text("your plants",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold
              ),),
            ),

            Container(
              margin: const EdgeInsets.all(20),
               height: 50,
              width: double.maxFinite,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(18)  ,
               color: Colors.white.withOpacity(0.8)


        ),
            child:  Center(child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                const SignUpPage()));
              },
              child: const Text("Sign up",
              style: TextStyle(
                fontSize: 22,
                 
                fontWeight: FontWeight.w700
              ),),
            )),
            ) ,
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20,
             ),
               height: 50,
              width: double.maxFinite,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(18)  ,
               color:  MyColors.baseColor.withOpacity(0.95)


        ),
            child:  Center(child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                const LoginPage()));
              },
              child: const Text("Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),),
            )),
            ) ,
          ],
        )
      ),
    ) ;
  }
}
