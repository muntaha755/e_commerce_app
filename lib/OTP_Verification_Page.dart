import 'package:e_commerce_app/Complete_Profile_Page.dart';
import 'package:e_commerce_app/Welcome_Back_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class otpverification extends StatefulWidget {
  final String? email;
  final String? password;
  const otpverification({super.key,this.email,
    this.password,});

  @override
  State<otpverification> createState() => _otpverificationState();
}

class _otpverificationState extends State<otpverification> {

  List<TextEditingController> controllers =
  List.generate(4, (index) => TextEditingController());


  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  Widget buildOtpField(int index) {
    return SizedBox(
      width: 55,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < controllers.length - 1) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  void verifyOtp() {
    String otp = controllers.map((c) => c.text).join();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Entered OTP: $otp")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context, MaterialPageRoute(
          builder:
              (context) => const completeProfile(),
        ),);}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We sent your code to +1 898 860 ***",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'This code will expire in ',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  '00:13',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.deepOrange[400],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),

            // OTP fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => buildOtpField(index)),
            ),

            const SizedBox(height: 100),
            SizedBox(
              height: 65,
              width: 400,
              child: ElevatedButton(
                onPressed: (){Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  welcomeBack(
                      email: widget.email ?? "",
                      password: widget.password ?? "",
                    ),
                  ),
                );},
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
            const Text(
              "Resend OTP Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
