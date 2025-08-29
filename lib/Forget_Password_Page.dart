import 'package:e_commerce_app/Register_Account_Page.dart';
import 'package:e_commerce_app/Welcome_Back_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context, MaterialPageRoute(
            builder:
                (context) => const welcomeBack(),
          ),);}, icon: Icon( Icons.arrow_back )),
        ),
        body:
        Center(
          child: Column( children: [
            SizedBox(height: 100,),
            Text("Forget Password ", style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
            Text("Please enter your email and we will send \n  you a link to return to your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(decoration: InputDecoration(
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter your email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                suffixIcon: Icon(Icons.email),
              ),),
            ),

            SizedBox(height: 100,),
            Container(
              height: 65,
              width: 400,
              child: ElevatedButton(onPressed: (){}, child: Text("continue",
                style:
                TextStyle(
                    color: Colors.white,
                    fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[400],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),),
            ),
            SizedBox(height: 150),

            Row(
              children: [
                SizedBox(width: 100,),
                Text("Don't have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),),
                TextButton(onPressed: (){Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const registerAccount(),
                  ),
                      (route) => false, // Remove all previous routes
                );}, child: Text("Sign Up", style: TextStyle(color: Colors.deepOrange[400],fontSize: 16),))
              ],
            )
          ], ),
        ),),
    );
  }
}
