import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_state.dart';
import 'package:papdaew_client/logic/bloc/notification_event.dart';

class HomepagePage extends StatefulWidget {
  const HomepagePage({super.key});

  @override
  State<HomepagePage> createState() => _HomepagePageState();
}

final List<String> imagePaths = [
  'assets/images/restaurant.png',
  'assets/images/hospital.png',
  'assets/images/bank.png',
  'assets/images/other.png',
];

int _currentPage = 0;

final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

class _HomepagePageState extends State<HomepagePage> {
  late List<Widget> _pages = [];

  String getGreeting() {
    var hour = DateTime.now().hour;
    var minute = DateTime.now().minute;

    double currentTime = hour + (minute / 60); 

    // 5:00 AM - 11:59 AM
    if (currentTime >= 5.0 && currentTime < 12.0) {
      return 'Good morning';
    }
    // 12:00 PM - 5:59 PM
    else if (currentTime >= 12.0 && currentTime < 18.0) {
      return 'Good afternoon';
    }
    // 6:00 PM - 8:59 PM
    else if (currentTime >= 18.0 && currentTime < 21.0) {
      return 'Good evening';
    }
    // 9:00 PM - 4:59 AM
    else {
      return 'Good night';
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePaths.length,
      (index) => ImagePlaceHolder(imagePath: imagePaths[index]),
    );
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/papdaewlogo.png', height: 30),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFCCE3DE),
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  return Badge(
                    label: Text('${state.unreadCount}'),
                    isLabelVisible: state.unreadCount > 0,
                    child: IconButton(
                      icon: const Icon(Icons.notifications),
                      color: const Color(0xFF6B9080),
                      onPressed: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFCCE3DE),
              child: IconButton(
                icon: const Icon(Icons.person),
                color: const Color(0xFF6B9080),
                onPressed: () {},
              ),
            ),
          ),
        ],
        ),  
      body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    getGreeting() + ',',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'What can I do for you?',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search',
              backgroundColor: WidgetStateProperty.all(Colors.grey[50]),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: 372,
                    height: MediaQuery.of(context).size.height / 4,
                    child:
                        _pages.isNotEmpty
                            ? PageView.builder(
                              controller: _pageController,
                              itemCount: _pages.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _currentPage = value;
                                });
                              },
                              itemBuilder: (context, index) {
                                return _pages[index];
                              },
                            )
                            : const SizedBox(),
                  ),
                ),
              ),
              // for page indicator
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor:
                                _currentPage == index
                                    ? Colors.teal
                                    : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/restaurant');
                  },
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/restaurant.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32, left: 8),
                            child: Text(
                              'Restaurant',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/hospital');
                  },
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/hospital.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, left: 15),
                          child: Text(
                            'Hospital',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/bank');
                  },
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bank.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, left: 25),
                          child: Text(
                            'Bank',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/otherservices');
                  },
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/other.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, left: 19),
                          child: Text(
                            'Others',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Recommend for you',
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
        ],
      ),
    ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath!, fit: BoxFit.cover);
  }
}
