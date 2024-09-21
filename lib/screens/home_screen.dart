import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> foodCategories = [
    'Burger',
    'Pizza',
    'Sushi',
    'Tacos',
    'Salad',
    'Pasta',
    'Drinks',
    'Dessert'
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategoryRow(),
              const SizedBox(height: 30),
              _buildPopularItems(context),
              const SizedBox(height: 30),
              _buildMenuSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF81A263),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 30, color: Color(0xFF81A263)),
        unselectedIconTheme: const IconThemeData(size: 24, color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for food...',
        hintStyle: const TextStyle(fontFamily: 'Playfair Display'),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: foodCategories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              label: Text(category),
              backgroundColor: const Color(0xFF81A263),
              labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Playfair Display'),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context) {
    final List<Map<String, String>> popularItems = [
      {'name': 'Cheeseburger', 'image': 'assets/images/cheeseburger.jpg', 'price': '\$5.99'},
      {'name': 'Pepperoni Pizza', 'image': 'assets/images/pizza.jpg', 'price': '\$8.99'},
      {'name': 'Sushi Platter', 'image': 'assets/images/sushi.jpg', 'price': '\$12.99'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Items',
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Playfair Display'),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: popularItems.map((item) {
              return GestureDetector(
                onTap: () {
                  _navigateToDetailScreen(context, item['name']!, item['image']!, item['price']!);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            item['image']!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item['price']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF81A263),
                            child: IconButton(
                              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _navigateToDetailScreen(
      BuildContext context, String itemName, String itemImage, String itemPrice) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(
          itemName: itemName,
          itemImage: itemImage,
          itemPrice: itemPrice,
          description:
              'Cheeseburger adalah varian burger yang diisi dengan daging sapi yang telah dibumbui dan dipanggang, kemudian ditambahkan keju leleh di atasnya. Roti burger yang empuk membungkus semua bahan ini, menciptakan kombinasi rasa yang kaya dan menggugah selera. Cheeseburger sering disajikan dengan sayuran segar seperti selada, tomat, dan bawang, serta saus pilihan seperti mayones, mustard, atau ketchup. Hidangan ini menjadi favorit banyak orang di seluruh dunia, baik untuk makan siang, makan malam, atau sebagai camilan.',
          ingredients: const [
            'Roti burger',
            'Daging sapi giling',
            'Keju',
            'Selada',
            'Tomat',
            'Bawang'
          ],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {'name': 'Cheeseburger', 'image': 'assets/images/cheeseburger.jpg', 'price': '\$5.99'},
      {'name': 'Pepperoni Pizza', 'image': 'assets/images/pizza.jpg', 'price': '\$8.99'},
      {'name': 'Sushi Platter', 'image': 'assets/images/sushi.jpg', 'price': '\$12.99'},
      {'name': 'Sushi Platter', 'image': 'assets/images/sushi.jpg', 'price': '\$12.99'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menu',
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Playfair Display'),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToDetailScreen(context, menuItems[index]['name']!,
                    menuItems[index]['image']!, menuItems[index]['price']!);
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        menuItems[index]['image']!,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menuItems[index]['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Playfair Display',
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              menuItems[index]['price']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF81A263),
                        child: IconButton(
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
