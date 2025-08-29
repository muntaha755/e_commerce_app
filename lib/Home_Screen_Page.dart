
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Register_Account_Page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Text("TOKOTO",style:
            TextStyle(
                fontSize: 36 ,
                color: Colors.deepOrange[400] ,
                fontWeight: FontWeight.bold),),
            Text("Welcome to Tokoto, Let's shop!", style:
            TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 50,),
            Image.asset("Asset/image1/splash_1.png", width: 250,height: 250,),
            SizedBox(height: 250,),
            Container(
              width: 400,
              height: 65,
              child: ElevatedButton(
                onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const registerAccount(),
                  ),
                );},
                child:
                Text("continue",
                  style:
                  TextStyle(
                      color: Colors.white,
                  fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[400],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
