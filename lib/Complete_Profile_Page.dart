import 'package:e_commerce_app/OTP_Verification_Page.dart';
import 'package:e_commerce_app/Register_Account_Page.dart';
import 'package:e_commerce_app/Welcome_Back_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class completeProfile extends StatefulWidget {

  final String? email;
  final String? password;


  const completeProfile({super.key,this.email,
    this.password,});

  @override
  State<completeProfile> createState() => _completeProfileState();
}

class _completeProfileState extends State<completeProfile> {
  final firstNameCount = TextEditingController();
  final lastNameCount = TextEditingController();
  final PhoneNumberCount = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  void _continue() {
    if (_formkey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  otpverification(
            email: widget.email ?? "",
            password: widget.password ?? "",),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
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
              Text("Complete Profile ", style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              Text("Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: firstNameCount,
                  validator: (v) => v == null || v.length > 10 ? "Enter name less than 10 character" : null,
                  decoration: InputDecoration(
                  labelText: "First Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your first name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                  suffixIcon: Icon(Icons.person),
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: lastNameCount,
                  validator: (v) => v == null || v.length > 10 ? "Enter name less than 10 character" : null,
                  decoration: InputDecoration(
                  labelText: "Last Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Enter your last name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                  suffixIcon: Icon(Icons.person),
                ),),
              ),
              Padding(padding: const EdgeInsets.all(20.0),
                child:
                TextFormField(
                  controller: PhoneNumberCount,
                  validator: (v) => v == null || v.length < 10 ? "Enter valid number" : null,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter your phone number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(Icons.phone_android),
                  ),
                ),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter your Address",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
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
              SizedBox(height: 100),
              Text("By continuing your confirm that you agree \n with our Term and Condition",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),)
            ], ),
          ),),
      ),
    );
  }
}


