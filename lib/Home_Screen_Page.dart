
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Register_Account_Page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  final List<String> splashImages = [
    'Asset/image1/splash_1.png',
    'Asset/image1/splash_2.png',
    'Asset/image1/splash_3.png',
  ];

  int _currentIndex = 0;


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
            CarouselSlider.builder(
              itemCount: splashImages.length,
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    splashImages[index],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: splashImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.orangeAccent
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 200,),
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
