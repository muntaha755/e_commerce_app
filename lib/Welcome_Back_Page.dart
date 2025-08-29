import 'package:e_commerce_app/Forget_Password_Page.dart';
import 'package:e_commerce_app/Register_Account_Page.dart';
import 'package:e_commerce_app/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcomeBack extends StatefulWidget {
  final String? email;
  final String? password;
  const welcomeBack({super.key,  this.email,
     this.password,});

  @override
  State<welcomeBack> createState() => _welcomeBackState();
}

class _welcomeBackState extends State<welcomeBack> {
  final emailCount = TextEditingController();
  final passwordCount = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isChecked = false;
  void _continue() {
    if (_formkey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => home(),
        ),
      );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){Navigator.pop(context, MaterialPageRoute(
              builder:
                  (context) => const registerAccount(),
            ),);}, icon: Icon( Icons.arrow_back )),
          ),
          body:
          Center(
            child: Column( children: [
              SizedBox(height: 100,),
              Text("Welcome Back ", style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              Text("Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: emailCount,
                  validator: (v) => v == null || v!= (widget.email) ? "Valid email" : null,
                  decoration: InputDecoration(
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                  suffixIcon: Icon(Icons.email),
                ),),
              ),
              Padding(padding: const EdgeInsets.all(15.0),
                child:
                TextFormField(
                  controller: passwordCount,
                  obscureText: true,
                  validator: (v) => v == null || v!= (widget.password) ? "Valid password" : null,
                  decoration: InputDecoration(
                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter your password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),),
              SizedBox(height: 30,),
              Row(children: [
                SizedBox(width: 30,),
                Checkbox(value: _isChecked, onChanged: (bool? newValue){setState(() {
                  _isChecked = newValue ?? false;
                });},), Text("Remember me",style: TextStyle(fontSize: 14 , color: Colors.grey),),
                SizedBox(width: 100,),
                TextButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const forgetpassword(),
                  ),
                );}, child: Text("Forget Password",style: TextStyle(color: Colors.grey , fontSize: 16),))
              ],),
              SizedBox(height: 30),
              Container(
                height: 65,
                width: 400,
                child: ElevatedButton(onPressed: _continue, child: Text("continue",
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
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: (){}, child: Image.asset("Asset/image1/google.png",width: 20, height: 20,)),
                  SizedBox(width: 30,),
                  InkWell(onTap: (){},child: Image.asset("Asset/image1/facebook.png",width: 20,height: 20,)),
                  SizedBox(width: 30,),
                  InkWell(onTap: (){},child: Image.asset("Asset/image1/twitter.png",width: 20,height: 20,)),
                ],),
              SizedBox(height: 30,),
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
                  TextButton(onPressed: (){}, child: Text("Sign Up", style: TextStyle(color: Colors.deepOrange[400],fontSize: 16),))
                ],
              )
            ], ),
          ),),
      ),
    );
  }
}
