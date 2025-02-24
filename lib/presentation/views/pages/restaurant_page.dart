import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageUrl;
  
  Category({
    required this.name, 
    required this.imageUrl
  });
}

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  static final List<Category> categories = [
    Category(
      name: 'Fried chicken',
      imageUrl: 'assets/images/restaurant/categories/friedchicken.png',
    ),
    Category(
      name: 'Fast food',
      imageUrl: 'assets/images/restaurant/categories/fastfood.png',
    ),
    Category(
      name: 'Noodles',
      imageUrl: 'assets/images/restaurant/categories/noodle.png',
    ),
    Category(
      name: 'Yakiniku',
      imageUrl: 'assets/images/restaurant/categories/yakiniku.png',
    ),
    Category(
      name: 'Pizza',
      imageUrl: 'assets/images/restaurant/categories/pizza.png',
    ),
    Category(
      name: 'Shabu',
      imageUrl: 'assets/images/restaurant/categories/shabu.png',
    ),
    Category(
      name: 'Dessert',
      imageUrl: 'assets/images/restaurant/categories/pizza.png',
    ),
    Category(
      name: 'Asian',
      imageUrl: 'assets/images/restaurant/categories/pizza.png',
    ),
    Category(
      name: 'Mexican',
      imageUrl: 'assets/images/restaurant/categories/pizza.png',
    ),
    Category(
      name: 'Indian',
      imageUrl: 'assets/images/restaurant/categories/pizza.png',
    ),
  ];

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
 
  final Set<int> _selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: 'Search for restaurant',
                  backgroundColor: WidgetStateProperty.all(Colors.grey[50]),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),  
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: RestaurantPage.categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedCategories.contains(index);
                  
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 18.0 : 8.0, top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedCategories.remove(index);
                          } else {
                            _selectedCategories.add(index);
                          }
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Color(0xFF6B9080) : Colors.transparent,
                                width: 5,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                RestaurantPage.categories[index].imageUrl
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            RestaurantPage.categories[index].name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter'
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Recently use',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      'see all',
                      style: TextStyle(
                        color: Color(0xFFA4C3B2),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 18),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Restaurant near you',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 1,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: 3,
              itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
                ),
              );
              },
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Out of Area',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 1,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: 8,
              itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
                ),
              );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ],
        ),
      )
    );
  }
}