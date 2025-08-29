import 'package:e_commerce_app/Complete_Profile_Page.dart';
import 'package:e_commerce_app/Home_Screen_Page.dart';
import 'package:e_commerce_app/Welcome_Back_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registerAccount extends StatefulWidget {
  const registerAccount({super.key});

  @override
  State<registerAccount> createState() => _registerAccountState();
}

class _registerAccountState extends State<registerAccount> {
  final emailcount = TextEditingController();
  final passwordcount = TextEditingController();
  final confarimemailcount = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void _continue() {
    if (_formkey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => completeProfile(
            email: emailcount.text,
            password: passwordcount.text,
          ),
        ),
      );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const homeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Register Account ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Complete your details or continue \n with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    validator: (v) =>
                    v == null || !v.contains("@") ? "Enter valid email" : null,
                    controller: emailcount,
                    decoration: InputDecoration(
                      labelText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passwordcount,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(Icons.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: confarimemailcount,
                    obscureText: true,
                    validator: (v) => v != passwordcount.text
                        ? "Passwords do not match"
                        : null,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Re-enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 65,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: _continue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset("Asset/image1/google.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () {},
                      child: Image.asset("Asset/image1/facebook.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () {},
                      child: Image.asset("Asset/image1/twitter.png",
                          width: 20, height: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "By continuing you confirm that you agree",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
