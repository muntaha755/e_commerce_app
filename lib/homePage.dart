import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: SvgPicture.asset("Asset/icons/Bell.svg")),
              IconButton(onPressed: () {}, icon: SvgPicture.asset("Asset/icons/Cart Icon.svg")),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:  [
              BottomNavigationBarItem(
                icon:  SvgPicture.asset("Asset/icons/Shop Icon.svg"),
                label: "Store",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("Asset/icons/Heart Icon.svg"),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("Asset/icons/Chat bubble Icon.svg"),
                label: "messages",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("Asset/icons/User Icon.svg"),
                label: "Profile",
              ),
            ],
            currentIndex: 0,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            /* onTap: (index) {

            print('Selected index: $index');
          },*/
          ),

          body: Center(
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo[900],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "A Summer Surprise",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cashback 20%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildIconItem("Asset/icons/Flash Icon.svg", "Flash\nDeal"),
                          buildIconItem("Asset/icons/Bill Icon.svg", "Bill"),
                          buildIconItem("Asset/icons/Game Icon.svg", "Game"),
                          buildIconItem("Asset/icons/Gift Icon.svg", "Daily Gift"),
                          buildIconItem("Asset/icons/Plus Icon.svg", "More"),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(18),
                            child: Text("Special for you ", style: TextStyle(fontSize: 24,color: Colors.black, fontWeight: FontWeight.w400),)),
                        SizedBox(
                          width: 120,
                        ),
                        TextButton(onPressed: (){}, child: Text("See More",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),)),
                      ],
                    ),

                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          bannerCard("Asset/images/Image Banner 2.png","Smartphone","18 Brands"),
                          bannerCard("Asset/images/Image Banner 3.png","Fashion","24 Brands"),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(18),
                            child: Text("Popular Products ", style: TextStyle(fontSize: 23,color: Colors.black, fontWeight: FontWeight.w400),)),
                        SizedBox(
                          width: 120,
                        ),
                        TextButton(onPressed: (){}, child: Text("See More",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),)),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(12),
                        children: [
                          productItem(
                            "Asset/images/Image Popular Product 1.png","Wireless Controller for PS4™",
                            "\$64.99",),
                          productItem("Asset/images/Image Popular Product 2.png", "Nike Sport White - Man Pant",
                              "\$50.5"),
                          productItem("Asset/images/Image Popular Product 3.png", "Bicycle Helmet - Red Helmet",
                            "\$36.75",),

                        ],
                      ),
                    ),


                  ]
              ),
            ),


          ),
        )
    );
  }
}
Widget buildIconItem(String imagePath, String label) {
  return Container(
    width: 80,
    margin: const EdgeInsets.symmetric(horizontal: 6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12),
          ),

          child: SvgPicture.asset(
            imagePath,
            width: 28,
            height: 28,
            color: Colors.orange[800],
          ),
        ),

        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
Widget bannerCard(String imagePath, String title, String subtitle) {
  return Container(
    width: 300,
    margin: const EdgeInsets.only(left: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget productItem(String imagePath, String title, String price) {
  return Container(
    width: 150,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price,
              style: const TextStyle(color: Colors.orange, fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 18,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


