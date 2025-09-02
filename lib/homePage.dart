import 'package:e_commerce_app/Favorite_page.dart';
import 'package:e_commerce_app/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Favorite_data.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    const HomeContent(),
    const FavoritePage(),
    const Center(child: Text("Messages Page")),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("Asset/icons/Shop Icon.svg"),
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
      ),
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
class ProductItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool get isFavorite =>
      favoriteProducts.any((item) => item["title"] == widget.title);

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteProducts.removeWhere((item) => item["title"] == widget.title);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.title} removed from favorites")),
        );
      } else {
        favoriteProducts.add({
          "image": widget.imagePath,
          "title": widget.title,
          "price": widget.price,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.title} added to favorites")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.title,
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
                widget.price,
                style: const TextStyle(color: Colors.orange, fontSize: 16),
              ),
              GestureDetector(
                onTap: toggleFavorite,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("Asset/icons/Bell.svg")),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("Asset/icons/Cart Icon.svg")),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 110,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.indigo[900],
                ),
                padding: const EdgeInsets.all(16),
                child: const Column(
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
                    child: const Text(
                      "Special for you ",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    bannerCard("Asset/images/Image Banner 2.png", "Smartphone",
                        "18 Brands"),
                    bannerCard("Asset/images/Image Banner 3.png", "Fashion",
                        "24 Brands"),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    child: const Text(
                      "Popular Products ",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  children: [
                    ProductItem(
                      imagePath: "Asset/images/Image Popular Product 1.png",
                      title: "Wireless Controller for PS4™",
                      price: "\$64.99",
                    ),
                    ProductItem(
                      imagePath: "Asset/images/Image Popular Product 2.png",
                      title: "Nike Sport White - Man Pant",
                      price: "\$50.5",
                    ),
                    ProductItem(
                      imagePath: "Asset/images/Image Popular Product 3.png",
                      title: "Bicycle Helmet - Red Helmet",
                      price: "\$36.75",
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
