import 'package:flutter/material.dart';

class Services {
  final String name;
  final String imageUrl;

  Services({required this.name, required this.imageUrl});
}

class OtherservicesPage extends StatefulWidget {
  const OtherservicesPage({super.key});

  static final List<Services> services = [
    Services(
      name: 'Driving license',
      imageUrl: 'assets/images/otherservices/categories/drivinglicense.jpg',
    ),
    Services(
      name: 'Barber/Salon/Spa',
      imageUrl: 'assets/images/otherservices/categories/barber.jpg',
    ),
    Services(
      name: 'ID Card/Passport',
      imageUrl: 'assets/images/otherservices/categories/governmentoffice.jpg',
    ),
    Services(
      name: 'Car Repair',
      imageUrl: 'assets/images/otherservices/categories/carrepair.jpg',
    ),
    Services(
      name: 'Phone Repair',
      imageUrl: 'assets/images/otherservices/categories/phonerepair.jpg',
    ),
    Services(
      name: 'Stadium/Fitness',
      imageUrl: 'assets/images/otherservices/categories/fitness.jpg',
    ),
  ];

  @override
  State<OtherservicesPage> createState() => _OtherservicesPageState();
}

class _OtherservicesPageState extends State<OtherservicesPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double itemHeight = screenHeight / 5.5;
    double itemWidth = screenWidth / 2.2;

    return Scaffold(
      appBar: AppBar(title: const Text("Other Services")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: screenWidth * 0.9,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: itemWidth / itemHeight,
              ),
              itemCount: OtherservicesPage.services.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print((context, index));
                    if (index == 0) {
                      Navigator.pushNamed(context, '/drivinglicense');
                    } else if (index == 1) {
                      Navigator.pushNamed(context, '/barbersalonspa');
                    } else if (index == 2) {
                      Navigator.pushNamed(context, '/idcardpassport');
                    } else if (index == 3) {
                      Navigator.pushNamed(context, '/carrepair');
                    } else if (index == 4) {
                      Navigator.pushNamed(context, '/phonerepair');
                    } else if (index == 5) {
                      Navigator.pushNamed(context, '/stadiumfitness');
                    } else {
                      print('No such service');
                    }
                    // Navigator.pushNamed(context, '');

                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          OtherservicesPage.services[index].imageUrl,
                          fit: BoxFit.cover,
                          width: itemWidth,
                          height: itemHeight,
                        ),
                      ),
                      Container(
                        width: itemWidth,
                        height: itemHeight,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            OtherservicesPage.services[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                            textAlign:
                                TextAlign.center, // Ensuring text is centered
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
