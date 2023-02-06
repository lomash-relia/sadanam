import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelbellevue/auth/login_screen.dart';
import 'breakfastscreen/BreakfastScreen.dart';
import 'homescreen/HomeScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  Widget currentscreen = const HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  setBottomBarIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
              ),
              title: const Text('Log Out'),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Hotel Bellevue",
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageStorage(bucket: bucket, child: currentscreen),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Colors.black,
              width: size.width,
              height: 60,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 30,
                            color: _currentIndex == 0
                                ? Colors.white
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setState(() {
                              currentscreen = const HomeScreen();
                              _currentIndex = 0;
                            });
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.emoji_food_beverage_outlined,
                              size: 30,
                              color: _currentIndex == 1
                                  ? Colors.white
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                currentscreen = const BreakfastScreen();
                                _currentIndex = 1;
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
