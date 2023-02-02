import 'package:flutter/material.dart';
import 'package:carousel_images/carousel_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> listImages = [
    'assets/images/lobby.png',
    'assets/images/LiveKitchen.png',
    'assets/images/Suiteroombalcony.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white30,
      body: Column(
        children: [
          const SizedBox(height: 10),
          CarouselImages(
            scaleFactor: 0.6,
            listImages: listImages,
            height: 250.0,
            borderRadius: 15.0,
            cachedNetworkImage: true,
            verticalAlignment: Alignment.topCenter,
            onTap: (index) {
              print('Tapped on page $index');
            },
          ),
          Text("Our Rooms",style: TextStyle(fontFamily: "")),
        ],
      ),
    );
  }
}
